import 'dart:async';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _dateTime = DateTime.now();
  String _timeZone = 'WIB';
  String _timeZoneOffset = '+7';

  void _setTimeZone(String timeZone, String timeZoneOffset) {
    setState(() {
      _timeZone = timeZone;
      _timeZoneOffset = timeZoneOffset;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
  }

  void _getCurrentTime() {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calendar'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            DateFormat('EEEE, d MMMM y').format(_dateTime),
            style: const TextStyle(fontSize: 24),
          ),
          TableCalendar(
              headerStyle: const HeaderStyle(formatButtonVisible: false,titleCentered: true),
              availableGestures: AvailableGestures.all,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 30),
              focusedDay: DateTime.now(),
          ),
          const SizedBox(height: 10),
          Text(
            DateFormat('HH:mm:ss').format(_dateTime),
            style: const TextStyle(fontSize: 50),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              '$_timeZone (GMT $_timeZoneOffset)',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () => _setTimeZone('WIB', '+7'),
                      child: const Text('WIB'),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat().add_jms().format(DateTime.now().toUtc().add(const Duration(hours: 7))),
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _setTimeZone('WITA', '+8'),
                    child: const Text('WITA'),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat().add_jms().format(DateTime.now().toUtc().add(const Duration(hours: 8))),
                  ),

                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _setTimeZone('WIT', '+9'),
                    child: const Text('WIT'),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat().add_jms().format(DateTime.now().toUtc().add(const Duration(hours: 9))),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
