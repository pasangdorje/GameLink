import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}


 class AppTheme {
  static final theme = ThemeData(
    primaryColor: Colors.black,
    primaryColorLight: Colors.blue,
   
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameLink',
      theme: AppTheme.theme,  // Custom theme
      initialRoute: AppRoutes.initial,  // Initial route
      routes: AppRoutes.routes,  // Defined routes
      debugShowCheckedModeBanner: false,  // Hide debug banner
      navigatorObservers: [],
    );
  }
}
