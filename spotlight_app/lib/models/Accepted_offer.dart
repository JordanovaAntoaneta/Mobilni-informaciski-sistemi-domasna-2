class Accepted_offer{
  final String? eventName;
  final String? location;
  final String? artistName;
  final DateTime? date;
  final String? name;
  final String? email;

  Accepted_offer({
    required this.eventName,
    required this.location,
    required this.artistName,
    required this.date,
    required this.name,
    required this.email,
  });
}

List<Accepted_offer> offers = [
  Accepted_offer(
    eventName: 'The Eras Tour',
    location: 'Amsterdam',
    artistName: 'Taylor Swift',
    date: DateTime(2025, 6, 18),
    name: 'John Brisbane',
    email: 'j.brisbane@gmail.com',
    ),
];
