import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Accepted_offer.dart';

const customOrange = Color(0xFFF1B363);

class BuddyCard extends StatefulWidget {
  final Accepted_offer offer;
  final VoidCallback onClose;

  const BuddyCard({required this.offer, required this.onClose, Key? key}) : super(key: key);

  @override
  _BuddyCardState createState() => _BuddyCardState();
}

class _BuddyCardState extends State<BuddyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You have a new buddy!',
              style: GoogleFonts.doHyeon(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${widget.offer.name} accepted your offer!',
              style: GoogleFonts.doHyeon(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('resources/john-brisbane.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.offer.eventName ?? '',
                        style: GoogleFonts.doHyeon(fontSize: 24),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 20, color: customOrange),
                          const SizedBox(width: 4),
                          Text(
                            widget.offer.artistName ?? '',
                            style: const TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 20, color: customOrange),
                          const SizedBox(width: 4),
                          Text(
                            widget.offer.location ?? '',
                            style: const TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 20, color: customOrange),
                          const SizedBox(width: 4),
                          Text(
                            widget.offer.date?.toLocal().toString().split(' ')[0] ?? '',
                            style: const TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.offer.email != null) {
                      Clipboard.setData(ClipboardData(text: widget.offer.email!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email copied to clipboard!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No email to copy!')),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.copy, color: customOrange),
                      const SizedBox(width: 4),
                      Text(
                        widget.offer.email ?? '',
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: widget.onClose,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
