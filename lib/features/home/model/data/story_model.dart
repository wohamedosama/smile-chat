// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoryModel {
  final String url;
  final MediaType mediaType;
  final Duration duration;
  const StoryModel({
    required this.url,
    required this.mediaType,
    required this.duration,
  });
}

enum MediaType { image, video }
