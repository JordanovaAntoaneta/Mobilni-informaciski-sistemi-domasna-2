import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Buddy_offer.dart';
import '../widgets/buddy_up_card.dart';

class BuddyUpPage extends StatefulWidget {
  const BuddyUpPage({Key? key}) : super(key: key);

  @override
  State<BuddyUpPage> createState() => _BuddyUpPageState();
}

class _BuddyUpPageState extends State<BuddyUpPage> {
  late List<BuddyOffer> _offers;

  @override
  void initState() {
    super.initState();
    _offers = List.from(buddyOffers);
  }

  @override
  Widget build(BuildContext context) {
    final customOrange = const Color(0xFFF1B363);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: customOrange,
        title: Text(
          'Spotlight',
          style: GoogleFonts.doHyeon(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.map, color: Colors.white, size: 32),
            onPressed: () {},
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
                _buildNavigationButton('Events', '/', Colors.white, textColor: Colors.grey, borderColor: Colors.grey),
                _buildNavigationButton('Calendar', '/calendar', Colors.white, textColor: Colors.grey, borderColor: Colors.grey),
                _buildNavigationButton('Buddy Up', '/buddyUp', customOrange, textColor: Colors.white, borderColor: customOrange),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _offers.length,
              itemBuilder: (context, index) {
                return BuddyOfferCard(
                  offer: _offers[index],
                  customOrange: customOrange,
                  onBuddyUp: () {
                    setState(() {
                      _offers.removeAt(index);
                    });
                  },
                );
              },
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

  Widget _buildNavigationButton(String label, String route, Color color, {Color textColor = Colors.white, Color borderColor = Colors.transparent}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Text(
            label,
            style: GoogleFonts.doHyeon(color: textColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}