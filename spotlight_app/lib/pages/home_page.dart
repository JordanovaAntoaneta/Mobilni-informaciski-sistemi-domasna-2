import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Event.dart';
import '../widgets/event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const customOrange = Color(0xFFF1B363);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: customOrange,
        title: Text(
          'Spotlight',
          style: GoogleFonts.doHyeon(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.map, color: Colors.white, size: 32),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/map');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white, size: 32),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 40,
                    decoration: BoxDecoration(
                      color: customOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: const Text(
                        'Events',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/calendar');
                      },
                      child: const Text(
                        'Calendar',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/buddyUp');
                      },
                      child: const Text(
                        'Buddy Up',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                for (var event in eventsList)
                  EventCard(
                    event: event,
                    onTap: () {
                      Navigator.pushNamed(context, '/details', arguments: event);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: customOrange,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/myBuddies');
        },
        child: const Icon(Icons.message, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
