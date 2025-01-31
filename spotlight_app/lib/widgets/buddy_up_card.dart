import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Buddy_offer.dart';

class BuddyOfferCard extends StatelessWidget {
  final BuddyOffer offer;
  final Color customOrange;
  final VoidCallback onBuddyUp;

  const BuddyOfferCard({
    Key? key,
    required this.offer,
    required this.customOrange,
    required this.onBuddyUp,
  }) : super(key: key);

  String _formatDate(DateTime? date) {
    if (date == null) return "Unknown Date";
    return '${date.day.toString().padLeft(2, '0')}.' '${date.month.toString().padLeft(2, '0')}.' '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final imageName = offer.userName?.toLowerCase().replaceAll(" ", "-") ?? "default";

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('resources/$imageName.png'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.eventName ?? "Unknown Event",
                        style: GoogleFonts.doHyeon(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.person, color: customOrange),
                          const SizedBox(width: 4),
                          Text(
                            offer.artistName ?? "Unknown Artist",
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: customOrange),
                          const SizedBox(width: 4),
                          Text(
                            offer.location ?? "Unknown Location",
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, color: customOrange),
                          const SizedBox(width: 4),
                          Text(
                            _formatDate(offer.date),
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${offer.userName ?? "Unknown User"}, ${offer.age ?? "Unknown Age"}',
                  style: GoogleFonts.doHyeon(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 8),
                Text(
                  '"${offer.message ?? "No message"}"',
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.local_activity, size: 18, color: customOrange),
                    const SizedBox(width: 4),
                    Text(
                      '${offer.ticket ?? 0} ticket${offer.ticket! > 1 ? 's' : ''}',
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: onBuddyUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: customOrange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  "Let's buddy up!",
                  style: GoogleFonts.doHyeon(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
