import 'package:flutter/material.dart';
import 'package:game_link_app/const/static_data.dart';
import 'package:game_link_app/routes/app_routes.dart';
import 'package:game_link_app/screens/call.dart';
import 'package:game_link_app/screens/chat.dart';
import 'package:game_link_app/screens/user-profile.dart';
import 'package:game_link_app/themes/colors.dart';
import 'package:game_link_app/widgets/navbar.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});

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
        title: const Text(
          'Friends List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ThemeColors.textColorWhite,
          ),
        ),
         actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              icon: const Icon(Icons.person_add_alt_1,
                  color: ThemeColors.primaryColor),
              label: const Text(
                'Add Friend',
                style: TextStyle(color: ThemeColors.primaryColor),
              ),
              style: TextButton.styleFrom(
                backgroundColor: ThemeColors
                    .primaryColorLight, 
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.addFriends);
              },
            ),
          ),
        ],
        backgroundColor: ThemeColors.primaryColor,
      ),
      backgroundColor: ThemeColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: ThemeColors.textColorWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide.none,
                ),
                prefixIcon:
                    Icon(Icons.search, color: ThemeColors.disabledColor),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: staticMessages.length,
                separatorBuilder: (context, index) => const Divider(
                  color: ThemeColors.primaryColor,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final friend = staticMessages[index];
                  return _buildFriendItem(context, friend['name']);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedIndex: 3,
      ),
    );
  }

  Widget _buildFriendItem(BuildContext context, String friendName) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: ThemeColors.primaryColor,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserProfile()),
          );
        },
        contentPadding: const EdgeInsets.all(1),
        leading: const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/profile-pic.png'),
        ),
        title: Text(
          friendName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.call,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Call(contactName: friendName)),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.message, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Chat(
                      name: friendName,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
