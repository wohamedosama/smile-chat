import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_count_of_unread_messages.dart';
import 'package:smile_chat/features/home/presentation/widgets/custom_home_screen_app_bar.dart';
import 'package:smile_chat/features/home/presentation/widgets/customize_chat_image.dart';
import 'package:smile_chat/features/home/presentation/widgets/stories_list_view.dart';
import 'package:smile_chat/features/home/presentation/widgets/unraed_messages_and_the_time_of_chat.dart';
import 'package:smile_chat/utils/app_color.dart';
import 'package:smile_chat/utils/app_font_size.dart';
import 'package:smile_chat/utils/app_images.dart';
import 'package:smile_chat/utils/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<ChatModel> model = const [
    ChatModel(
      id: '1',
      name: 'Theresa Webb',
      lastMessage: 'How are you today?',
      lastMessageTime: '59 min ago',
      image: Assets.assetsImagesPerson3,
      unReadMessagsCount: 2,
    ),
    ChatModel(
      id: '2',
      name: 'Kathryn Murphy',
      lastMessage: 'Hey! Can you join the meeting?',
      lastMessageTime: '2 min ago',
      image: Assets.assetsImagesPerson2,
    ),
    ChatModel(
      id: '3',
      name: 'Arlene McCoy',
      lastMessage: 'How are you today?',
      lastMessageTime: '20 min ago',
      image: Assets.assetsImagesPerson5,
      unReadMessagsCount: 2,
    ),
    ChatModel(
      id: '4',
      name: 'Jerome Bell',
      lastMessage: 'Have a good day 🌸',
      lastMessageTime: '6 min ago',
      image: Assets.assetsImagesPerson4,
      unReadMessagsCount: 9,
    ),
    ChatModel(
      id: '1',
      name: 'Theresa Webb',
      lastMessage: 'How are you today?',
      lastMessageTime: '59 min ago',
      image: Assets.assetsImagesPerson3,
      unReadMessagsCount: 2,
    ),
    ChatModel(
      id: '2',
      name: 'Kathryn Murphy',
      lastMessage: 'Hey! Can you join the meeting?',
      lastMessageTime: '2 min ago',
      image: Assets.assetsImagesPerson2,
    ),
    ChatModel(
      id: '3',
      name: 'Arlene McCoy',
      lastMessage: 'How are you today?',
      lastMessageTime: '20 min ago',
      image: Assets.assetsImagesPerson5,
      unReadMessagsCount: 2,
    ),
    ChatModel(
      id: '4',
      name: 'Jerome Bell',
      lastMessage: 'Have a good day 🌸',
      lastMessageTime: '6 min ago',
      image: Assets.assetsImagesPerson4,
      unReadMessagsCount: 9,
    ),
    ChatModel(
      id: '1',
      name: 'Theresa Webb',
      lastMessage: 'How are you today?',
      lastMessageTime: '59 min ago',
      image: Assets.assetsImagesPerson3,
      unReadMessagsCount: 2,
    ),
    ChatModel(
      id: '2',
      name: 'Kathryn Murphy',
      lastMessage: 'Hey! Can you join the meeting?',
      lastMessageTime: '2 min ago',
      image: Assets.assetsImagesPerson2,
    ),
    ChatModel(
      id: '3',
      name: 'Arlene McCoy',
      lastMessage: 'How are you today?',
      lastMessageTime: '20 min ago',
      image: Assets.assetsImagesPerson5,
      unReadMessagsCount: 2,
    ),
    ChatModel(
      id: '4',
      name: 'Jerome Bell',
      lastMessage: 'Have a good day 🌸',
      lastMessageTime: '6 min ago',
      image: Assets.assetsImagesPerson4,
      unReadMessagsCount: 9,
    ),
    ChatModel(
      id: '1',
      name: 'Theresa Webb',
      lastMessage: 'How are you today?',
      lastMessageTime: '59 min ago',
      image: Assets.assetsImagesPerson3,
      unReadMessagsCount: 2,
    ),
    ChatModel(
      id: '2',
      name: 'Kathryn Murphy',
      lastMessage: 'Hey! Can you join the meeting?',
      lastMessageTime: '2 min ago',
      image: Assets.assetsImagesPerson2,
    ),
    ChatModel(
      id: '3',
      name: 'Arlene McCoy',
      lastMessage: 'How are you today?',
      lastMessageTime: '20 min ago',
      image: Assets.assetsImagesPerson5,
      unReadMessagsCount: 2,
    ),
    ChatModel(
      id: '4',
      name: 'Jerome Bell',
      lastMessage: 'Have a good day 🌸',
      lastMessageTime: '6 min ago',
      image: Assets.assetsImagesPerson4,
      unReadMessagsCount: 9,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomHomeScreenAppBar(
                onPressed: () => Navigator.pushNamed(context, searchScreen)),
            const SizedBox(height: 24),
            const StoriesListView(),
            const SizedBox(height: 20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: AppColor.whiteColor,
                  //  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            return ChatItem(
                              model: model[index],
                            );
                          },
                          itemCount: model.length,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.model,
  });
  final ChatModel model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomizeChatImage(model: model),
      title: Text(model.name, style: AppStyles.styleMedium20),
      subtitle: Text(model.lastMessage, style: AppStyles.styleBold12),
      trailing: UnreadMessagesAndTimeOfTheChat(model: model),
    );
  }
}
