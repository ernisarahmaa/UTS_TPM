import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _rusukSatuController = TextEditingController();
  final _rusukDuaController = TextEditingController();
  final _rusukTigaController = TextEditingController();
  final _rusukEmpatController = TextEditingController();
  final _tinggiController = TextEditingController();
  final _rujiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _rusukSatuController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Rusuk 1 (AB)'
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Rusuk 1 is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _rusukDuaController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Rusuk 2 (CD)'
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Rusuk 2 is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _rusukTigaController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Rusuk 3 (BC)'
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Rusuk 3 is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _rusukEmpatController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Rusuk 4 (DA)'
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Rusuk 4 is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _tinggiController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Tinggi'
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tinggi is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _rujiController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Jari-jari'
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jari-jari is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double rusukSatu = double.parse(_rusukSatuController.text);
                        double rusukDua = double.parse(_rusukDuaController.text);
                        double rusukTiga = double.parse(_rusukTigaController.text);
                        double rusukEmpat = double.parse(_rusukEmpatController.text);
                        double tinggi = double.parse(_tinggiController.text);
                        double jarijari = double.parse(_rujiController.text);
                        double kelilingTrap = rusukSatu + rusukDua + rusukTiga + rusukEmpat;
                        double luasTrap = 1/2 * (rusukSatu + rusukDua) * tinggi;
                        double kelilingTab = 2 * 3.14 * jarijari;
                        double luasTab = (2 * 3.14 * jarijari * tinggi) + (2 * 3.14 * (jarijari *jarijari));
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Result'),
                              content: Text('Luas Trapesium: $luasTrap \nKeliling Trapesium: $kelilingTrap \n\nLuas Permukaan Tabung: $luasTab \nKeliling Alas Tabung: $kelilingTab'),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Close'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                        );
                      }
                    },
                    child: const Text('Calculate'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Fill with 0 if not needed',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
