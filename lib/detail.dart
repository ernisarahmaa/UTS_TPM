import 'package:flutter/material.dart';
import 'package:uts/login.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.black,
              )
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
                    const SizedBox(height: 10),
                    const Text(
                      'IF-D',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sleman, 11 Mei 2002',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Cita-cita dan harapan saya kedepannya saya bisa memiliki pekerjaan utama yang sesuai dengan passion saya. Saya juga berkeinginan untuk bisa membuka lapangan pekerjaan untuk orang lain.',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
