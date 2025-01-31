class Event {
  final String name;
  final String performer;
  final String location;
  final DateTime date;
  final String details;

  Event({
    required this.name,
    required this.performer,
    required this.location,
    required this.date,
    required this.details,
  });
}

List<Event> eventsList = [
  Event(
    name: 'The Eras Tour',
    performer: 'Taylor Swift',
    location: 'Amsterdam',
    date: DateTime(2025, 6, 18),
    details:
    'The Eras Tour is the sixth worldwide concert tour by American singer-songwriter Taylor Swift. '
        'The tour is in support of all of Swift\'s studio albums, with emphasis on her most recent albums: '
        'Lover (2019), Folklore (2020), Evermore (2020), Midnights (2022), and The Tortured Poets Department (2024).',
  ),
  Event(
    name: 'Hamilton',
    performer: 'Broadway',
    location: 'Boise, ID',
    date: DateTime(2025, 2, 2),
    details: 'A celebrated musical involving the story of Alexander Hamilton.',
  ),
];
