import 'package:flutter/material.dart';
import 'package:game_link_app/const/static_data.dart';
import 'package:game_link_app/routes/app_routes.dart';
import 'package:game_link_app/screens/chat.dart';
import 'package:game_link_app/themes/colors.dart';
import 'package:game_link_app/widgets/navbar.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<Message> {
  final int _selectedItem = 1;

  final List<Map<String, dynamic>> items = staticMessages;

  void _onItemTap(Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(name: item['name']),
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
            'Message',
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20, 
            ),
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final lastMessage = item['messages'].isNotEmpty
                      ? item['messages'].last['text']
                      : 'No messages';

                  return Container(
                    margin: EdgeInsets.only(
                      top: index == 0 ? 8.0 : 0,
                      bottom: index == items.length - 1 ? 8.0 : 0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Card(
                        margin:
                            const EdgeInsets.all(1), 
                        color: ThemeColors.primaryColor,
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/profile-pic.png'),
                            radius: 24.0, 
                          ),
                          title: Text(
                            item['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          textColor: ThemeColors.textColorWhite,
                          subtitle: Text(lastMessage),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          onTap: () => _onItemTap(item),
                        ),
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
