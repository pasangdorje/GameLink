import 'package:flutter/material.dart';
import 'package:game_link_app/routes/app_routes.dart';
import 'package:game_link_app/themes/colors.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<Signup> {
  bool agreeToTerms = false; 
  bool _obscureText = true; 

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
          backgroundColor: ThemeColors.primaryColor,
        ),
        backgroundColor: ThemeColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Create account',
                  style: TextStyle(
                    color: ThemeColors.textColorWhite,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Enter your details to get started',
                  style: TextStyle(
                    color: ThemeColors.textColorWhite,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Name',
                  style: TextStyle(
                    color: ThemeColors.textColorWhite,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle:
                          TextStyle(color: ThemeColors.textGray.withOpacity(1)),
                      filled: true,
                      fillColor: ThemeColors.textColorWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 201, 201, 201)),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email',
                  style: TextStyle(
                    color: ThemeColors.textColorWhite,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle:
                          TextStyle(color: ThemeColors.textGray.withOpacity(1)),
                      filled: true,
                      fillColor: ThemeColors.textColorWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 201, 201, 201)),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: ThemeColors.textColorWhite,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 48,
                  child: TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Create a password',
                      hintStyle:
                          TextStyle(color: ThemeColors.textGray.withOpacity(1)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText; 
                          });
                        },
                      ),
                      filled: true,
                      fillColor: ThemeColors.textColorWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: ThemeColors.textColorWhite,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 48,
                  child: TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      hintStyle:
                          TextStyle(color: ThemeColors.textGray.withOpacity(1)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText; // Toggle visibility
                          });
                        },
                      ),
                      filled: true,
                      fillColor: ThemeColors.textColorWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: agreeToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          agreeToTerms = value!;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "I agree with the Terms and Conditions.",
                        style: TextStyle(
                          fontSize: 14,
                          color: ThemeColors.textColorWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                SizedBox(
                  width: 327, // Set the width of the button
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
                            12), // Adjust the radius as needed
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
