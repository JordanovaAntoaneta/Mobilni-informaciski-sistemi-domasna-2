import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Event.dart';

const customOrange = Color(0xFFF1B363);

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const EventCard({required this.event, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'resources/${event.name.toLowerCase().replaceAll(" ", "-")}.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (ctx, _, __) => Container(
                color: customOrange,
                height: 150,
                alignment: Alignment.center,
                child: const Icon(Icons.music_note, size: 50, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    event.name,
                    style: GoogleFonts.doHyeon(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 18, color: customOrange),
                      const SizedBox(width: 4),
                      Text(event.performer, style: GoogleFonts.roboto(fontSize: 16)),
                      const Spacer(),
                      const Icon(Icons.location_on, size: 18, color: customOrange),
                      const SizedBox(width: 4),
                      Text(event.location, style: GoogleFonts.roboto(fontSize: 16)),
                      const Spacer(),
                      const Icon(Icons.calendar_today, size: 18, color: customOrange),
                      const SizedBox(width: 4),
                      Text(
                        _formatDate(event.date),
                        style: GoogleFonts.roboto(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.' + '${date.month.toString().padLeft(2, '0')}.' + '${date.year}';
  }
}
