import 'package:flutter/material.dart';
import 'package:game_link_app/routes/app_routes.dart'; // Ensure this route is properly set up
import 'package:game_link_app/themes/colors.dart';
import 'package:game_link_app/widgets/navbar.dart';

class GameProfile extends StatefulWidget {
  const GameProfile({super.key});

  @override
  _GameProfilePageState createState() => _GameProfilePageState();
}

class _GameProfilePageState extends State<GameProfile> {
  final int _selectedItem = 3;

  final List<Map<String, dynamic>> friendsPlaying = [
    {'name': 'Ryujin', 'image': 'assets/images/profile-pic.png'},
    {'name': 'Mojo Dojo', 'image': 'assets/images/profile-pic.png'},
    {'name': 'Venom', 'image': 'assets/images/profile-pic.png'},
    {'name': 'Ri5ang', 'image': 'assets/images/profile-pic.png'},
  ];

  void _navigateToUserProfile(String friendName) {
    Navigator.pushNamed(
      context,
      AppRoutes.userProfile, 
      // arguments: {'friendName': friendName}, 
    );
  }

  Widget buildFriendsList(List<Map<String, dynamic>> friends) {
    return SizedBox(
      height: 80, 
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: friends.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _navigateToUserProfile(friends[index]['name']),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(friends[index]['image']),
                ),
                Text(
                  friends[index]['name'],
                  style: const TextStyle(color: Colors.white, fontSize: 12,),
                ),
              ],
            ),
          );
        },
      ),
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
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'Game Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        foregroundColor: ThemeColors.textColorWhite,
        backgroundColor: ThemeColors.primaryColor,
      ),
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: IntrinsicHeight(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 250, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/dota2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dota 2', 
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          '#dota21567', 
                          style: TextStyle(
                            fontSize: 16,
                            color: ThemeColors.primaryColorLight,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Game description
                        const Text(
                          'Dota 2 is a multiplayer online battle arena game where two teams of five players battle to destroy the opponent\'s ancient structure.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 32),

                        SizedBox(
                          height: 80, 
                          child: buildFriendsList(friendsPlaying),
                        ),
                        const Text(
                          'Ryujin and 3 others playing this game.',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedItem,
      ),
    );
  }
}
