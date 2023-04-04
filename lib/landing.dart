import 'package:flutter/material.dart';
import 'package:uts/calculator.dart';
import 'package:uts/calendar.dart';
import 'package:uts/detail.dart';
import 'package:uts/login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/caca.jpg'
                        ),
                        radius: 50,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Ernisa Rahma Wahyuni',
                        style:
                        TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '123200003',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      MaterialButton(
                        minWidth: 200.0,
                        height: 42.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CalculatorPage(),
                            ),
                          );
                        },
                        color: Colors.black,
                        child: const Text('Calculator', style: TextStyle(
                            color: Colors.white)
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      MaterialButton(
                        minWidth: 200.0,
                        height: 42.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CalendarPage(),
                            ),
                          );
                        },
                        color: Colors.black,
                        child: const Text('Calendar', style: TextStyle(
                            color: Colors.white)
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      MaterialButton(
                        minWidth: 200.0,
                        height: 42.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailPage(),
                            ),
                          );
                        },
                        color: Colors.black,
                        child: const Text('Detail', style: TextStyle(
                            color: Colors.white)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                    (Route<dynamic> route) => false);
          },
          tooltip: 'Log Out',
          child: const Icon(Icons.logout_rounded),
          backgroundColor: Colors.blueGrey,
        )
    );
  }
}
