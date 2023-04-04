import 'package:flutter/material.dart';
import 'landing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user = "";
  String pass = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.jpg',
              height: 100,
            ),
            SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  TextField(
                    onChanged: (value) {
                      user = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Username',
                      hintText: 'Username',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      pass = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      labelText: 'Password',
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String text = "";
                if (user == '123200003' && pass == 'ernisa') {
                  setState(() {
                    text = 'Login Success';
                    isLoginSuccess = true;
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return const LandingPage();
                  }));
                } else {
                  setState(() {
                    text = 'Login Failed';
                    isLoginSuccess = false;
                  });
                }
                SnackBar snackBar = SnackBar(content: Text(text));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Log In'),
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                ),
                primary: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
