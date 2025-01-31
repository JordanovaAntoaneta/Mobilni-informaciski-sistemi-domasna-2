class BuddyOffer {
  final String? eventName;
  final String? location;
  final String? artistName;
  final DateTime? date;
  final String? userName;
  final int? age;
  final int? ticket;
  final String? message;

  BuddyOffer({
    required this.eventName,
    required this.location,
    required this.artistName,
    required this.date,
    required this.userName,
    required this.age,
    required this.message,
    required this.ticket,
  });
}

List<BuddyOffer> buddyOffers = [
  BuddyOffer(
    eventName: 'The Eras Tour',
    location: 'Amsterdam',
    artistName: 'Taylor Swift',
    date: DateTime(2025, 6, 18),
    userName: 'Erica Han',
    age: 28,
    ticket: 2,
    message:
    'Hello! I need 2 Swifties willing to go see Taylor with me this summer! '
        'The tickets cost \$100 each and are on the left side of the stage',
  ),
  BuddyOffer(
    eventName: 'The Eras Tour',
    location: 'Singapore',
    artistName: 'Taylor Swift',
    date: DateTime(2025, 3, 22),
    userName: 'James Denver',
    age: 32,
    ticket: 1,
    message:
    'I will be attending the Eras Tour in Singapore with a group of 7 friends. '
        'We have an extra ticket, if anyone\'s interested. Cost of the tickets: \$250',
  ),
  BuddyOffer(
    eventName: 'Hamilton',
    location: 'Atlanta, GA',
    artistName: 'Broadway theatre',
    date: DateTime(2025, 10, 10),
    userName: 'Mike Johnson',
    age: 29,
    ticket: 1,
    message:
    'Looking for a friend to join me for Hamilton in Atlanta. Front row seats, \$120 each!',
  ),
];