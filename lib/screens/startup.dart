import 'package:flutter/material.dart';
import 'package:game_link_app/routes/app_routes.dart';
import 'package:game_link_app/themes/colors.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                  'assets/images/logo.png'), // Replace with your image path
              width: 150, // Set the desired width
              height: 150, // Set the desired height
            ),
            const Text(
              'WELCOME TO GAMELINK',
              style: TextStyle(
                color: ThemeColors.textColorWhite,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Adding a slogan below the title
            const Text(
              'Your Gateway to Gaming Communities',
              style: TextStyle(
                color: ThemeColors.textColorWhite,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 100),
            // Adding Register and Login buttons
            SizedBox(
              height: 50,
              width: 327, 
              child: ElevatedButton(
                onPressed: () {
                   Navigator.pushNamed(
                      context, AppRoutes.signup); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.primaryColorLight,
                  foregroundColor: ThemeColors.textColorDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // Adjust the radius as needed
                  ),
                ),
                child: const Text('Register'),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 327, 
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, AppRoutes.login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.textColorWhite,
                  foregroundColor: ThemeColors.textColorDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12),
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
