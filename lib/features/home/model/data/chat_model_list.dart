import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/utils/app_images.dart';

var date = DateTime.now();
final now = Timestamp.fromDate(date);

List<ChatModel> model = [
  ChatModel(
    id: '1',
    name: 'Theresa Webb',
    lastMessage:
        'How are you today? I will go the work at 3 Pm Fuck to mid shoft I miss 5 Shift',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson3,
    unReadMessagsCount: 2,
  ),
  ChatModel(
    id: '2',
    name: 'Kathryn Murphy',
    lastMessage: 'Hey! Can you join the meeting?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson2,
  ),
  ChatModel(
    id: '3',
    name: 'Arlene McCoy',
    lastMessage: 'How are you today?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson5,
    unReadMessagsCount: 2,
  ),
  ChatModel(
    id: '4',
    name: 'Jerome Bell',
    lastMessage: 'Have a good day 🌸',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson4,
    unReadMessagsCount: 9,
  ),
  ChatModel(
    id: '1',
    name: 'Theresa Webb',
    lastMessage: 'How are you today?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson3,
    unReadMessagsCount: 2,
  ),
  ChatModel(
    id: '2',
    name: 'Kathryn Murphy',
    lastMessage: 'Hey! Can you join the meeting?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson2,
  ),
  ChatModel(
    id: '3',
    name: 'Arlene McCoy',
    lastMessage: 'How are you today?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson5,
    unReadMessagsCount: 2,
  ),
  ChatModel(
    id: '4',
    name: 'Jerome Bell',
    lastMessage: 'Have a good day 🌸',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson4,
    unReadMessagsCount: 9,
  ),
  ChatModel(
    id: '1',
    name: 'Theresa Webb',
    lastMessage: 'How are you today?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson3,
    unReadMessagsCount: 2,
  ),
  ChatModel(
    id: '2',
    name: 'Kathryn Murphy',
    lastMessage: 'Hey! Can you join the meeting?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson2,
  ),
  ChatModel(
    id: '3',
    name: 'Arlene McCoy',
    lastMessage: 'How are you today?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson5,
    unReadMessagsCount: 2,
  ),
  ChatModel(
    id: '4',
    name: 'Jerome Bell',
    lastMessage: 'Have a good day 🌸',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson4,
    unReadMessagsCount: 9,
  ),
  ChatModel(
    id: '1',
    name: 'Theresa Webb',
    lastMessage: 'How are you today?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson3,
    unReadMessagsCount: 2,
  ),
  ChatModel(
    id: '2',
    name: 'Kathryn Murphy',
    lastMessage: 'Hey! Can you join the meeting?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson2,
  ),
  ChatModel(
    id: '3',
    name: 'Arlene McCoy',
    lastMessage: 'How are you today?',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson5,
    unReadMessagsCount: 2,
  ),
  ChatModel(
    id: '4',
    name: 'Jerome Bell',
    lastMessage: 'Have a good day 🌸',
    lastMessageTime: now,
    image: Assets.assetsImagesPerson4,
    unReadMessagsCount: 9,
  ),
];
