import 'package:flutter/material.dart';
import 'package:game_link_app/screens/add-friends.dart';
import 'package:game_link_app/screens/call.dart';
import 'package:game_link_app/screens/chat.dart';
import 'package:game_link_app/screens/edit-profile.dart';
import 'package:game_link_app/screens/found-friend-list.dart';
import 'package:game_link_app/screens/friends-list.dart';
import 'package:game_link_app/screens/game-profile.dart';
import 'package:game_link_app/screens/user-profile.dart';
import 'package:game_link_app/screens/home.dart';
import 'package:game_link_app/screens/login.dart';
import 'package:game_link_app/screens/message.dart';
import 'package:game_link_app/screens/signup.dart';
import 'package:game_link_app/screens/startup.dart';
import 'package:game_link_app/screens/notifications.dart';
import 'package:game_link_app/screens/profile.dart';

class AppRoutes {
  static const initial = '/startup';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const message = '/message';
  static const notifications = '/notifications';
  static const profile = '/profile';
  static const chat = '/chat';
  static const call = '/call';
  static const addFriends = '/addFriends';
  static const friendsList = '/friendsList';
  static const foundFriendList = '/foundFriendList';
  static const userProfile = '/userProfile';
  static const editProfile = '/editProfile';
  static const gameProfile = '/gameProfile';

  static Map<String, WidgetBuilder> routes = {
    '/startup': (context) => const StartupPage(),
    '/login': (context) => const Login(),
    '/signup': (context) => const Signup(),
    '/home': (context) => const Home(),
    '/message': (context) => const Message(),
    '/notifications': (context) => const Notifications(),
    '/profile': (context) => const Profile(),
    '/chat': (context) => const Chat(),
    '/call': (context) => const Call(),
    '/addFriends': (context) => const AddFriends(),
    '/friendsList': (context) => const FriendsList(),
    '/foundFriendList': (context) => const FoundFriendList(),
    '/userProfile': (context) => const UserProfile(),
    '/editProfile': (context) => const EditProfile(),
    '/gameProfile': (context) => const GameProfile(),
  };
}
