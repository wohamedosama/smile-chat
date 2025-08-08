// // Example ContactsBottomSheet implementation
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smile_chat/features/chats/cubit/chat_cubit.dart';
// import 'package:smile_chat/utils/constant.dart';

// class ContactsBottomSheet extends StatelessWidget {
//   const ContactsBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: BlocConsumer<ChatCubit, ChatState>(
//         listener: (context, state) {
//           // Listen for successful chat creation and navigate
//           if (state.selectedChat != null && state.isStartingNewChat == false) {
//             Navigator.of(context).pop(); // Close bottom sheet
//             // Navigate to chat screen
//             Navigator.of(context, rootNavigator: true)
//                 .pushNamed(chatsScreen, arguments: state.selectedChat);
//           }

//           // Show error message if there's an error
//           if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.errorMessage!),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Handle bar
//                 Container(
//                   width: 40,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Title
//                 const Text(
//                   'Select Contact',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Loading indicator for contacts
//                 if (state.areContactsLoading == true)
//                   const Padding(
//                     padding: EdgeInsets.all(32.0),
//                     child: CircularProgressIndicator(),
//                   )
//                 else if (state.contacts.isEmpty)
//                   const Padding(
//                     padding: EdgeInsets.all(32.0),
//                     child: Text('No contacts found'),
//                   )
//                 else
//                   // Contacts list
//                   Flexible(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: state.contacts.length,
//                       itemBuilder: (context, index) {
//                         final contact = state.contacts[index];
//                         final isStartingChatWithThisContact =
//                             state.isStartingNewChat == true;

//                         return ListTile(
//                           leading: CircleAvatar(
//                             backgroundImage: contact.image != null
//                                 ? NetworkImage(contact.image!)
//                                 : null,
//                             child: contact.image == null
//                                 ? Text(contact.name[0].toUpperCase())
//                                 : null,
//                           ),
//                           title: Text(contact.name),
//                           trailing: isStartingChatWithThisContact
//                               ? const SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                   ),
//                                 )
//                               : null,
//                           onTap: isStartingChatWithThisContact
//                               ? null // Disable tap while loading
//                               : () {

//                                 },
//                         );
//                       },
//                     ),
//                   ),

//                 const SizedBox(height: 16),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
