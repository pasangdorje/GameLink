import 'package:flutter/material.dart';
import 'package:game_link_app/routes/app_routes.dart';
import 'package:game_link_app/themes/colors.dart';
import 'package:game_link_app/widgets/navbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  final int _selectedItem = 3;

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
            'Profile',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/profile-pic.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'King in the North',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '#kinginthenorth1990',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ThemeColors.primaryColorLight,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit_square,
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.editProfile);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Gaming guru. FPS and RPG lover. Always down for a win and some epic co-op. Hit me up for squads or just to chill.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 32),
              // Friends ListTile
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: ListTile(
                  leading: const Icon(Icons.people, color: Colors.white),
                  title: const Text(
                    'Friends',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.friendsList);
                  },
                ),
              ),
              const Divider(color: Colors.white70, height: 1.0),
              // Favorites ListTile
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.white),
                  title: const Text(
                    'Your Favorites',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
              ),
              const Divider(color: Colors.white70, height: 1.0),
              // Help Center ListTile
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: ListTile(
                  leading: const Icon(Icons.help, color: Colors.white),
                  title: const Text(
                    'Help Center',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
              ),
              const Divider(color: Colors.white70, height: 1.0),
              // Logout ListTile
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedItem,
      ),
    );
  }
}
