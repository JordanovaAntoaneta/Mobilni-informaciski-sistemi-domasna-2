import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Accepted_offer.dart';
import '../widgets/my_buddy_card.dart';

class MyBuddiesPage extends StatefulWidget {
  @override
  _MyBuddiesPageState createState() => _MyBuddiesPageState();
}

const customOrange = Color(0xFFF1B363);

class _MyBuddiesPageState extends State<MyBuddiesPage> {
  bool _isCardVisible = true;

  @override
  Widget build(BuildContext context) {
    final offer = offers.first;

    return Scaffold(
      appBar: AppBar(
        title: Text('Spotlight', style: GoogleFonts.doHyeon(color: Colors.white, fontSize: 45)),
        automaticallyImplyLeading: false,
        backgroundColor: customOrange,
        actions: [
          IconButton(
            icon: const Icon(Icons.map, color: Colors.white, size: 32),
            onPressed: () => Navigator.pushNamed(context, '/map'),
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white, size: 32),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'My Buddies',
              style: GoogleFonts.doHyeon(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (_isCardVisible)
              BuddyCard(
                offer: offer,
                onClose: () {
                  setState(() {
                    _isCardVisible = false;
                  });
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: customOrange,
        child: const Icon(Icons.home, color: Colors.white, size: 32),
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
    );
  }
}