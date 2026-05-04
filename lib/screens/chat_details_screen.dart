import 'package:flutter/material.dart';
import 'package:whats_app_clone/test_widget.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key, required this.name, required this.imagePath});
  final String name;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            const Icon(
              Icons.call,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          title:  Row(
            children: [
              CircleAvatar(
                radius: 18,
                foregroundImage: AssetImage(imagePath),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              )),
          backgroundColor: const Color.fromARGB(255, 40, 44, 59),
        ),
        body:  Center(
          child: Text(
            "Chat of:$name",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
