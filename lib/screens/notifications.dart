import 'package:flutter/material.dart';
import 'package:game_link_app/themes/colors.dart';
import 'package:game_link_app/widgets/navbar.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<Notifications> {
  final int _selectedItem = 2;

  // Sample notifications data
  final List<Map<String, String>> notifications = [
    {
      'game': 'Dota 2',
      'title': 'Ryujin invited you to play Dota 2',
      'time': '2 hours ago',
      'date': 'Sep 13, 2024',
    },
    {
      'game': 'Dota 2',
      'title': 'New Update Available!',
      'time': '1 day ago',
      'date': 'Sep 12, 2024',
    },
    {
      'game': 'CSGO',
      'title': 'Fire Dragon Slayer challenged you',
      'time': '2 days ago',
      'date': 'Sep 11, 2024',
    },
    {
      'game': 'Valorant',
      'title': 'Ri5ang sent you a message',
      'time': '3 days ago',
      'date': 'Sep 10, 2024',
    },
    {
      'game': 'Valorant',
      'title': 'Venom sent you an invite.',
      'time': '4 days ago',
      'date': 'Sep 09, 2024',
    },
  ];

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
            'Notifications',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: ThemeColors.textColorWhite,
                hintStyle:
                    TextStyle(color: ThemeColors.textGray.withOpacity(1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.3), // Border color
                        width: 1.0,
                      ),
                    ),
                    color: ThemeColors.textColorWhite,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                notification['game']!,
                                style: const TextStyle(
                                  color: ThemeColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                notification['time']!,
                                style: const TextStyle(
                                  color: ThemeColors.disabledColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            notification['title']!,
                            style: const TextStyle(
                              color: ThemeColors.disabledColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedItem,
      ),
    );
  }
}
