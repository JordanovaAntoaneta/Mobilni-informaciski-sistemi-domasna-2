import 'package:flutter/material.dart';
import 'package:spotlight_app/pages/buddy_up_page.dart';
import 'package:spotlight_app/pages/calendar_page.dart';
import 'package:spotlight_app/pages/create_user.dart';
import 'package:spotlight_app/pages/event_details_page.dart';
import 'package:spotlight_app/pages/home_page.dart';
import 'package:spotlight_app/pages/login.dart';
import 'package:spotlight_app/pages/map.dart';
import 'package:spotlight_app/pages/my_buddies.dart';
import 'package:spotlight_app/pages/profile_page.dart';
import 'package:spotlight_app/pages/publish_offer_page.dart';

void main() {
  runApp(const SpotlightApp());
}

class SpotlightApp extends StatelessWidget {
  const SpotlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotlight',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomePage(),
        '/calendar': (context) => const CalendarPage(),
        '/buddyUp': (context) => const BuddyUpPage(),
        '/details': (context) => const DetailsPage(),
        '/login': (context) => const LoginPage(),
        '/create_user': (context) => const CreateUserPage(),
        '/profile': (context) => const ProfilePage(),
        '/createOffer': (context) => const PublishOfferPage(),
        '/myBuddies': (context) => MyBuddiesPage(),
        '/map': (context) => MapPage(),
      },
    );
  }
}
