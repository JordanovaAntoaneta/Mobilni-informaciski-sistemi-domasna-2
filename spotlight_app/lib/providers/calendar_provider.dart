import 'package:flutter/material.dart';
import '../models/Event.dart';
import '../service/event_service.dart';

class CalendarProvider with ChangeNotifier {
  final EventService _eventService = EventService();
  DateTime _selectedDay = DateTime.now();

  DateTime get selectedDay => _selectedDay;
  Map<DateTime, List<Event>> get eventsMap => _eventService.eventsMap;

  void selectDay(DateTime day) {
    _selectedDay = day;
    notifyListeners();
  }

  List<Event> get eventsForSelectedDay => _eventService.getEventsForDay(_selectedDay);

  void addEvent(Event event) {
    _eventService.addEvent(event);
    notifyListeners();
  }
}
