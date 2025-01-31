import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Event.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  final customOrange = const Color(0xFFF1B363);

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: customOrange,
        title:
        Text(
          'Spotlight',
          style: GoogleFonts.doHyeon(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'resources/${event.name.toLowerCase().replaceAll(" ", "-")}.png',
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (ctx, _, __) => Container(
                color: Colors.orangeAccent,
                height: 200,
                child: const Icon(Icons.music_note, size: 60),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              event.name,
              style: GoogleFonts.doHyeon(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person, color: customOrange),
                const SizedBox(width: 4),
                Text(
                  event.performer,
                  style: const TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Roboto'),
                ),
                const Spacer(),
                Icon(Icons.location_on, color: customOrange),
                const SizedBox(width: 4),
                Text(
                  event.location,
                  style: const TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Roboto'),
                ),
                const Spacer(),
                Icon(Icons.calendar_today, color: customOrange),
                const SizedBox(width: 4),
                Text(
                  _formatDate(event.date),
                  style: const TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Roboto'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(event.details, style: const TextStyle(fontFamily: 'Roboto', fontSize: 18)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/calendar', arguments: event);
                },
                style: ElevatedButton.styleFrom(backgroundColor: customOrange),
                child: Text('Add to calendar', style: GoogleFonts.doHyeon(color: Colors.white, fontSize: 20)),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/createOffer', arguments: event);
                },
                style: ElevatedButton.styleFrom(backgroundColor: customOrange),
                child: Text('Find buddies!', style: GoogleFonts.doHyeon(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: customOrange,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.' '${date.month.toString().padLeft(2, '0')}.' '${date.year}';
  }
}
