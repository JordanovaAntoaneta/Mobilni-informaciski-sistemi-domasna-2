import '../models/Event.dart';

class EventService {
  final Map<DateTime, List<Event>> _eventsMap = {};

  EventService() {
    for (var e in eventsList) {
      final day = DateTime(e.date.year, e.date.month, e.date.day);
      _eventsMap.putIfAbsent(day, () => []).add(e);
    }
  }

  Map<DateTime, List<Event>> get eventsMap => _eventsMap;

  List<Event> getEventsForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _eventsMap[key] ?? [];
  }

  void addEvent(Event event) {
    final day = DateTime(event.date.year, event.date.month, event.date.day);
    _eventsMap.putIfAbsent(day, () => []);
    if (!_eventsMap[day]!.contains(event)) {
      _eventsMap[day]!.add(event);
    }
  }
}
