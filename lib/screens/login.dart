import 'package:flutter/material.dart';
import 'package:game_link_app/routes/app_routes.dart';
import 'package:game_link_app/themes/colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0, 
          ),
          child: Center(
            child: Container(
              width: 350, 
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 150,
                    height: 150,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: ThemeColors.textColorWhite,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 48,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email or Phone number',
                        hintStyle: TextStyle(
                            color: ThemeColors.textGray.withOpacity(1)),
                        filled: true,
                        fillColor: ThemeColors.textColorWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 48,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: ThemeColors.textGray.withOpacity(1)),
                        filled: true,
                        fillColor: ThemeColors.textColorWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  // Forgot Password Link
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: ThemeColors.linkColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 327, 
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColors.primaryColorLight,
                        foregroundColor: ThemeColors.textColorDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), 
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Or continue with',
                    style: TextStyle(
                      color: ThemeColors.textColorWhite,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image:
                              AssetImage('assets/images/login_gmail_icon.png'),
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 10),
                        Image(
                          image:
                              AssetImage('assets/images/login_apple_icon.png'),
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 10),
                        Image(
                          image: AssetImage('assets/images/login_fb_icon.png'),
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                        color: ThemeColors.linkColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
