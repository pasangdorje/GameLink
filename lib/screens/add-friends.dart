import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:game_link_app/routes/app_routes.dart';
import 'package:game_link_app/themes/colors.dart';
import 'package:game_link_app/widgets/navbar.dart';

class AddFriends extends StatelessWidget {
  final int _selectedItem = 3;
  const AddFriends({super.key});

  void _copyLink(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Link copied!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.6),
      textColor: Colors.white,
      fontSize: 16.0,
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
        title: const Text(
          'Add Friends',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the title bold
            fontSize: 20, // Adjust the size
            color: ThemeColors.textColorWhite,
          ),
        ),
        backgroundColor: ThemeColors.primaryColor.withOpacity(0.5),
      ),
      backgroundColor: ThemeColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row for Share Invite and Copy Link buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: ThemeColors.disabledColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.share, size: 20),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Share Invite',
                      style: TextStyle(
                        color: ThemeColors.textColorWhite,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40), // Space between the buttons
                Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: ThemeColors.disabledColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.link, size: 20),
                        color: Colors.white,
                        onPressed: () => _copyLink(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Copy Link',
                      style: TextStyle(
                        color: ThemeColors.textColorWhite,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20), // Space before the search bar
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search for friends...',
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
            const SizedBox(height: 40),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.foundFriendList);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.primaryColorLight,
                  foregroundColor: ThemeColors.textColorDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: const Text(
                  'Find friends',
                  style: TextStyle(fontSize: 18.0),
                ),
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
