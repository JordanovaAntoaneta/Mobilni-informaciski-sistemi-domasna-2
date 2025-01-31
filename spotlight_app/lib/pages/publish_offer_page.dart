import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Buddy_offer.dart'; // Adjust this import based on your file structure.

class PublishOfferPage extends StatefulWidget {
  const PublishOfferPage({super.key});

  @override
  State<PublishOfferPage> createState() => _PublishOfferPageState();
}

class _PublishOfferPageState extends State<PublishOfferPage> {
  final TextEditingController _buddiesController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customOrange = const Color(0xFFF1B363);

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Eras Tour',
              style: GoogleFonts.doHyeon(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.person, size: 18, color: Colors.black),
                const SizedBox(width: 4),
                Text(
                  'Taylor Swift',
                  style: GoogleFonts.roboto(fontSize: 16, color: customOrange),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.black),
                const SizedBox(width: 4),
                Text(
                  'Amsterdam',
                  style: GoogleFonts.roboto(fontSize: 16, color: customOrange),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18, color: Colors.black),
                const SizedBox(width: 4),
                Text(
                  '18.06.2025',
                  style: GoogleFonts.roboto(fontSize: 16, color: customOrange),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _buddiesController,
              decoration: const InputDecoration(labelText: 'Number of buddies:'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age:'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Write your message:'),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_buddiesController.text.isEmpty ||
                      int.tryParse(_buddiesController.text) == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a valid number of buddies.")),
                    );
                    return;
                  }

                  if (_ageController.text.isEmpty ||
                      int.tryParse(_ageController.text) == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a valid age.")),
                    );
                    return;
                  }

                  if (_messageController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please write a message.")),
                    );
                    return;
                  }

                  final newOffer = BuddyOffer(
                    eventName: 'The Eras Tour',
                    artistName: 'Taylor Swift',
                    location: 'Amsterdam',
                    date: DateTime(2025, 6, 18),
                    userName: 'Your Name', // Replace this with dynamic user input
                    age: int.tryParse(_ageController.text) ?? 0,
                    message: _messageController.text,
                    ticket: int.tryParse(_buddiesController.text) ?? 1,
                  );

                  Navigator.pushReplacementNamed(context, '/buddyUp', arguments: newOffer);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: customOrange,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'Publish!',
                  style: GoogleFonts.doHyeon(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pop(context); // Navigate back
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: customOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
