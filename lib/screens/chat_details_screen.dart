import 'package:flutter/material.dart';
import 'package:whats_app_clone/models/chat_data_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key, required this.chatData});
  final ChatDataModel chatData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2C34),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:  Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(chatData.imagePath),
            ),
            const SizedBox(width: 10),
            Text(
              chatData.name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 30),
        ],
      ),
      body:  Center(
        child: Text(
          "محادثة ${chatData.name}",
          style: const TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ),
    );
  }
}
