import 'package:flutter/material.dart';
import 'package:whats_app_clone/models/chat_data_model.dart';

class ChatDetailsScreen extends StatefulWidget {
const ChatDetailsScreen({super.key, required this.chatData});

final ChatDataModel chatData;

@override
State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
final TextEditingController _messageController = TextEditingController();

List<Map<String, dynamic>> messages = [
  {
    "text": "Hi, How are you?",
    "isMe": false,
  },
  {
    "text": "I'm fine, thank you.",
    "isMe": true,
  },
  {
    "text": "What are you doing?",
    "isMe": false,
  },
  {
    "text": "Working on Flutter Project.",
    "isMe": true,
  },
];

void sendMessage() {
  if (_messageController.text.trim().isEmpty) return;

  setState(() {
    messages.add({
      "text": _messageController.text,
      "isMe": true,
    });
  });

  _messageController.clear();
}

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
    title: Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage(widget.chatData.imagePath),
        ),
        const SizedBox(width: 10),
        Text(
          widget.chatData.name,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    actions: const [
      Icon(Icons.call, color: Colors.white),
      SizedBox(width: 15),
      Icon(Icons.more_vert, color: Colors.white),
      SizedBox(width: 20),
    ],
  ),
  body: Column(
      children: [
  Expanded(
  child: ListView.builder(
  padding: const EdgeInsets.all(10),
  itemCount: messages.length,
  itemBuilder: (context, index) {
    final message = messages[index];

    return Align(
      alignment: message["isMe"]
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: message["isMe"]
              ? const Color(0xFF005C4B)
              : Colors.grey.shade800,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message["text"],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  },
  ),
  ),

  Container(
  padding: const EdgeInsets.all(8),
  color: const Color(0xFF1F2C34),
  child: Row(
  children: [
  Expanded(
  child: TextField(
  controller: _messageController,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
  hintText: "Type a message",
  hintStyle:
  const TextStyle(color: Colors.white54),
  filled: true,
  fillColor: const Color(0xFF2A3942),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: BorderSide.none,
  ),
  ),
  ),
  ),

  const SizedBox(width: 8),

  CircleAvatar(
  backgroundColor: const Color(0xFF00A884),
  child: IconButton(
  icon: const Icon(
  Icons.send,
  color: Colors.white,
  ),
  onPressed: sendMessage,
  ),
  ),
  ],
  ),
  ),
  ],
  ),
  );
}
}

