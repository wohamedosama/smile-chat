// ignore_for_file: avoid_print
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_chat/features/home/model/data/story_model.dart';
import 'package:smile_chat/utils/constant.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(const StoryState());
  String? get currentUserId => FirebaseAuth.instance.currentUser?.uid;
  final firestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance;

  Future<void> loadStories() async {
    DateTime now = DateTime.now();

    try {
      emit(state.copyWith(storyLoading: true, errorMessage: ''));
      final query = await firestore
          .collection(storiesCollection)
          .where('expiredAt', isGreaterThan: Timestamp.fromDate(now))
          .orderBy('expiredAt')
          .orderBy('createdAt', descending: true)
          .get();
      // we there get all stories
      final stories =
          query.docs.map((story) => StoryModel.fromFireStore(story)).toList();
      // we there get all stories that belong to current user
      final userStory =
          stories.where((story) => story.userId == currentUserId).toList();
      // we there get all stories that not belong to current user

      final otherStories =
          stories.where((story) => story.userId != currentUserId).toList();

      final updatedStoreis = otherStories.map((story) {
        final isViewed = story.viewedBy.contains(currentUserId);
        return story.copyWith(isViewed: isViewed);
      }).toList();

      emit(state.copyWith(
        stories: updatedStoreis,
        userStoreis: userStory,
        storyLoaded: true,
        storyLoading: false,
      ));
    } catch (error) {
      print(error.toString());
      emit(state.copyWith(
        errorMessage: 'Failed to load story: $error.toString()',
        storyLoading: false,
      ));
    }
  }

  Future<void> addImageStory(File imageFile, {String? caption}) async {
    try {
      emit(state.copyWith(storyLoading: true));
      final fileName =
          '${storiesCollection + currentUserId!}${DateTime.now().microsecondsSinceEpoch}.jpg';
      final uploadTask = storageRef.ref().child(fileName).putFile(imageFile);
      final snapshot = await uploadTask;
      final imageUrl = await snapshot.ref.getDownloadURL();

      await createStory(storyType: StoryType.image, imageUrl: imageUrl);
      emit(state.copyWith(isUploading: false));
      await loadStories();
    } catch (error) {
      emit(state.copyWith(
          isUploading: false,
          errorMessage: 'Failed to upload story ${error.toString()}'));
      print(error.toString());
    }
  }

  Future<void> addTextStory(String text, {String? bacgroundColor}) async {
    try {
      await createStory(
        storyType: StoryType.text,
        text: text,
        backgroundColor: bacgroundColor,
      );
      await loadStories();
    } catch (error) {
      emit(state.copyWith(
          errorMessage: 'Failed to create text story ${error.toString()}'));
      print(error.toString());
    }
  }

  Future<void> createStory({
    required StoryType storyType,
    String? text,
    String? imageUrl,
    String? backgroundColor,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final DateTime now = DateTime.now();
    final expiredAt = now.add(const Duration(hours: 24));

    //! get User data
    final userDoc =
        await firestore.collection(storiesCollection).doc(user.uid).get();

    final userName = userDoc.data()?['name'] ?? 'unKnowen User';
    final userImage = userDoc.data()?['image'] ?? '';
    final story = StoryModel(
      storyType: storyType,
      storyId: '',
      userId: user.uid,
      name: userName,
      userImage: userImage,
      createdAt: now,
      expiredAt: expiredAt,
      backgroundColor: backgroundColor,
      imageUrl: imageUrl,
      text: text,
    );
    await firestore.collection(storiesCollection).add(story.toFireStore());
  }

  Future<void> viewStory(StoryModel story) async {
    try {
      if (currentUserId == null) return;
      if (story.userId != currentUserId &&
          story.viewedBy.contains(currentUserId!)) {
        await firestore.collection(storiesCollection).doc(story.userId).update(
          {
            'viewedBy': FieldValue.arrayUnion([currentUserId])
          },
        );
        emit(state.copyWith(currentViewingStory: story, isViewed: true));
      }
    } catch (error) {
      emit(state.copyWith(
          errorMessage: 'Failed to view story ${error.toString()}'));
      print(error.toString());
    }
  }

  Future<void> deleteStory(String userId) async {
    try {
      final storyDoc =
          await firestore.collection(storiesCollection).doc(userId).get();
      if (!storyDoc.exists) return;
      final story = StoryModel.fromFireStore(storyDoc);
      if (story.userId != currentUserId) {
        emit(state.copyWith(
            errorMessage: 'You can only delete your own stories'));
      }
      if (story.storyType == StoryType.image && story.imageUrl != null) {
        try {
          await storageRef.refFromURL(story.imageUrl!).delete();
        } catch (error) {
          //
        }
      }
      await firestore.collection(storiesCollection).doc(userId).delete();
      await loadStories();
    } catch (error) {
      emit(state.copyWith(
        errorMessage: 'Failed to delete story: ${error.toString()}',
      ));
      print(error.toString());
    }
  }

  Future<void> cleanAllExpiredStories() async {
    try {
      final now = DateTime.now();
      final expiredQuery = await firestore
          .collection(storiesCollection)
          .where('expriedAt', isLessThan: Timestamp.fromDate(now))
          .get();
      final btach = firestore.batch();

      for (var doc in expiredQuery.docs) {
        final story = StoryModel.fromFireStore(doc);
        if (story.storyType == StoryType.image && story.imageUrl != null) {
          try {
            await storageRef.refFromURL(story.imageUrl!).delete();
          } catch (error) {
            print(error.toString());
          }
        }
        btach.delete(doc.reference);
      }
      await btach.commit();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<List<String>> getStoriesViewers(String storyId) async {
    try {
      final storyDoc =
          await firestore.collection(storiesCollection).doc(storyId).get();
      if (!storyDoc.exists) return [];
      final story = StoryModel.fromFireStore(storyDoc);
      return story.viewedBy;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (error) {
      emit(state.copyWith(
          errorMessage: 'Failed to pick image ${error.toString()}'));
    }
    return null;
  }

  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (error) {
      emit(state.copyWith(
          errorMessage: 'Failed to pick image ${error.toString()}'));
      return null;
    }
  }

  void lestionToStories() {
    final now = DateTime.now();
    firestore
        .collection(storiesCollection)
        .where('expiredAt', isGreaterThan: Timestamp.fromDate(now))
        .orderBy('expiredAt')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      try {
        final stories = snapshot.docs
            .map((story) => StoryModel.fromFireStore(story))
            .toList();

        final userStories =
            stories.where((story) => story.userId == currentUserId).toList();
        final otherStories =
            stories.where((story) => story.userId != currentUserId).toList();

        final updatedStories = otherStories.map((story) {
          final isViewed = story.viewedBy.contains(currentUserId);
          return story.copyWith(isViewed: isViewed);
        }).toList();
        emit(
          state.copyWith(
              storyLoading: false,
              storyLoaded: true,
              stories: updatedStories,
              userStoreis: userStories),
        );
      } catch (error) {
        emit(state.copyWith(
            errorMessage: 'Failed to load stories ${error.toString()}'));
        print(error.toString());
      }
    });
  }
}
