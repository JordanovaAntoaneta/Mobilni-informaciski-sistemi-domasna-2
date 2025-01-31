import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Color customOrange;
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.event,
    required this.customOrange,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'resources/${event.name.toLowerCase().replaceAll(" ", "-")}.png',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                errorBuilder: (ctx, _, __) => Container(
                  color: customOrange,
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: const Icon(Icons.music_note, size: 50, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: GoogleFonts.doHyeon(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildDetailRow('Performer: ', event.performer, customOrange),
                  _buildDetailRow('Location: ', event.location, customOrange),
                  _buildDetailRow('Date: ', _formatDate(event.date), customOrange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Color color) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(
            text: label,
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: GoogleFonts.roboto(color: color),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.' +
        '${date.month.toString().padLeft(2, '0')}.' +
        '${date.year}';
  }
}
