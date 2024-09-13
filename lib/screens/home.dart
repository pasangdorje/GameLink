import 'package:flutter/material.dart';
import 'package:game_link_app/themes/colors.dart';
import 'package:game_link_app/widgets/navbar.dart';
import 'package:game_link_app/routes/app_routes.dart'; // Import your routes file

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

final List<Map<String, dynamic>> friendsPlaying = [
  {'name': 'Ryujin', 'image': 'assets/images/profile-pic.png'},
  {'name': 'Mojo Dojo', 'image': 'assets/images/profile-pic.png'},
  {'name': 'Venom', 'image': 'assets/images/profile-pic.png'},
  {'name': 'Ri5ang', 'image': 'assets/images/profile-pic.png'},
];

class _HomePageState extends State<Home> {
  final int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Welcome Back, Player',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
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
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search games, friends...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: ThemeColors.textColorWhite,
                  hintStyle: TextStyle(
                    color: ThemeColors.textGray.withOpacity(0.7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Featured Game Section
              const Text(
                'Featured Game',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.gameProfile); // Navigate to GameProfile
                },
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/valorant.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Friends Playing Now',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: friendsPlaying.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.userProfile,
                          arguments: {'name': friendsPlaying[index]['name']},
                        ); 
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage(friendsPlaying[index]['image']),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              friendsPlaying[index]['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Popular Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildCategoryCard('Shooter', 'assets/images/shooter.jpg'),
                  _buildCategoryCard('MOBA', 'assets/images/moba.jpeg'),
                  _buildCategoryCard('RPG', 'assets/images/rpg.webp'),
                  _buildCategoryCard('Strategy', 'assets/images/strategy.jpg'),
                ],
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

  Widget _buildCategoryCard(String category, String imagePath) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: ThemeColors.primaryColorLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
