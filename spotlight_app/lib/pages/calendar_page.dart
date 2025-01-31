import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Event.dart';
import '../widgets/calendar_card.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Map<DateTime, List<Event>> _eventsMap;
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;

    _eventsMap = {};
    for (var e in eventsList) {
      final day = DateTime(e.date.year, e.date.month, e.date.day);
      if (_eventsMap[day] == null) {
        _eventsMap[day] = [];
      }
      _eventsMap[day]!.add(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    const customOrange = Color(0xFFF1B363);

    final newEvent = ModalRoute.of(context)!.settings.arguments;
    if (newEvent != null && newEvent is Event) {
      final day = DateTime(newEvent.date.year, newEvent.date.month, newEvent.date.day);
      _eventsMap.putIfAbsent(day, () => []);
      if (!_eventsMap[day]!.contains(newEvent)) {
        _eventsMap[day]!.add(newEvent);
      }
    }

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
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: const Text(
                        'Events',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 40,
                    decoration: BoxDecoration(
                      color: customOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Current page
                      },
                      child: const Text(
                        'Calendar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/buddyUp');
                      },
                      child: const Text(
                        'Buddy Up',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TableCalendar(
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(day, _selectedDay);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) {
              final key = DateTime(day.year, day.month, day.day);
              return _eventsMap[key] ?? [];
            },
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: customOrange,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: _getEventsForDay(_selectedDay).map((event) {
                return EventCard(
                  event: event,
                  customOrange: customOrange,
                  onTap: () {
                    Navigator.pushNamed(context, '/details', arguments: event);
                  },
                );
              }).toList(),
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

  List<Event> _getEventsForDay(DateTime? day) {
    if (day == null) return [];
    final key = DateTime(day.year, day.month, day.day);
    return _eventsMap[key] ?? [];
  }
}
