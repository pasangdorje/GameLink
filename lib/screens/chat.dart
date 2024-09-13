import 'package:flutter/material.dart';
import 'package:game_link_app/const/static_data.dart'; // Ensure this import is correct
import 'package:game_link_app/screens/call.dart';
import 'package:game_link_app/screens/user-profile.dart';
import 'package:game_link_app/screens/profile.dart';
import 'package:game_link_app/themes/colors.dart';

class Chat extends StatefulWidget {
  final String name;

  const Chat({
    super.key,
    this.name = 'Dummy User',
  });

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late List<Map<String, String>> messages;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    messages = [];
    _fetchMessages(); 
  }

  Future<void> _fetchMessages() async {
    final user = staticMessages.firstWhere(
      (user) => user['name'] == widget.name,
      orElse: () => {'messages': []}, 
    );

    setState(() {
      messages = List<Map<String, String>>.from(user['messages'] ?? []);
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'sender': 'me', 'text': text});
        _controller.clear();
      });
    }
  }

  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserProfile()),
    );
  }

  void _makeCall(String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Call(contactName: name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: ThemeColors.textColorWhite,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 5.0),
            GestureDetector(
              onTap: _navigateToProfile,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile-pic.png'),
                    radius: 15.0,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.call, color: ThemeColors.textColorWhite),
              onPressed: () => _makeCall(widget.name),
            ),
          ],
        ),
        backgroundColor: ThemeColors.primaryColor.withOpacity(0.5),
      ),
      backgroundColor: ThemeColors.primaryColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true, // To start from the bottom
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                final isMe = message['sender'] == 'me';
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: isMe
                          ? ThemeColors.linkColor
                          : ThemeColors.textColorWhite,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: ThemeColors.textColorWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send,
                            color: ThemeColors.linkColor),
                        onPressed: _sendMessage,
                      ),
                    ),
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
