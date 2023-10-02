// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:go_app2/views/start/login_screen.dart';
import 'package:go_app2/views/start/register_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center children vertically
          children: [
            Text(
              'Get Set, Ready',
              style: TextStyle(fontSize: 35, fontFamily: "Lobster"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: const [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  'GO',
                  style: TextStyle(
                      color: Colors.white, fontSize: 40, fontFamily: "Alfa"),
                ),
              ),
            ),
            SizedBox(height: 200),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Container(
                width: 290,
                height: 45,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 36, 76, 255),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'LOG-IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: Container(
                width: 290,
                height: 45,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 36, 76, 255),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
