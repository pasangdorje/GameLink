import 'package:flutter/material.dart';
import 'package:game_link_app/screens/chat.dart';
import 'package:game_link_app/themes/colors.dart';

class Call extends StatelessWidget {
  final String contactName;

  const Call({super.key, this.contactName = 'Dummy User'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: ThemeColors.disabledColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              icon: const Icon(Icons.chat_bubble),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Chat(name: contactName,),
                  ),
                );
              },
            ),
          ),
        ),
        backgroundColor: ThemeColors.primaryColor, 
      ),
      backgroundColor: ThemeColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 100),
          // Profile Section
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile-pic.png'),
                  radius: 50.0, 
                ),
                const SizedBox(height: 8.0),
                Text(
                  contactName,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Connecting...',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Call Controls
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCallControlIcon(
                      icon: Icons.volume_up,
                      color: Colors.white,
                      background: ThemeColors.disabledColor,
                      onPressed: () {},
                    ),
                    _buildCallControlIcon(
                      icon: Icons.mic_off,
                      color: Colors.white,
                      background: ThemeColors.disabledColor,
                      onPressed: () {},
                    ),
                    _buildCallControlIcon(
                      icon: Icons.call_end,
                      color: Colors.white,
                      background: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCallControlIcon({
    required IconData icon,
    required Color color,
    required Color background,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon),
        color: color,
        iconSize: 30.0,
        onPressed: onPressed,
      ),
    );
  }
}
