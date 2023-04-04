import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String _date = '';
  String _time = '';
  String _timeZone = 'WIB';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    var time = DateTime.now().toUtc();
    switch(_timeZone) {
      case 'WIB':
        time = time.add(const Duration(hours: 7));
        break;
      case 'WITA':
        time = time.add(const Duration(hours: 8));
        break;
      case 'WIT':
        time = time.add(const Duration(hours: 9));
        break;
      default:
        break;
    }
    var formatDate = DateFormat('EEEE, d MMMM y');
    var formatTime = DateFormat('HH:mm:ss');
    setState(() {
      _date = formatDate.format(time);
      _time = formatTime.format(time);
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
            '$_date',
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
            '$_time',
            style: const TextStyle(fontSize: 50),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              '$_timeZone',
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
                      onPressed: () {
                        setState(() {
                          _timeZone = 'WIB';
                        });
                        _updateTime();
                      },
                      child: const Text('WIB'),
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _timeZone = 'WITA';
                      });
                      _updateTime();
                    },
                    child: const Text('WITA'),
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _timeZone = 'WIT';
                      });
                      _updateTime();
                    },
                    child: const Text('WIT'),
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
