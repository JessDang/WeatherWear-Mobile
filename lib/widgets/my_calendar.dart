import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class MyCalendar extends StatefulWidget {
  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Use `day` to determine which events to show.
    return selectedEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: focusedDay,
          calendarFormat: format,
          onFormatChanged: (CalendarFormat _format) {
            setState(() {
              format = _format;
            });
          },
          startingDayOfWeek: StartingDayOfWeek.sunday,
          daysOfWeekVisible: true,

          // Day changed
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
            });
            print(focusedDay);
          },
          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },

          eventLoader: _getEventsForDay,

          // To style the Calendar
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(255, 160, 216, 162),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            selectedTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(
              color: Colors.purpleAccent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            defaultDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            weekendDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            formatButtonShowsNext: false,
          ),
        ),
        ..._getEventsForDay(selectedDay).map((event) => ListTile(title: Text(event.title))),
      ],
    );
  }
}

class Event {
  final String title;

  Event({required this.title});

  @override
  String toString() => title;
}
