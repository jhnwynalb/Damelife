import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 1, 135, 1),
              const Color.fromARGB(255, 0, 64, 1),
              const Color.fromARGB(255, 0, 34, 5),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image(
                image: AssetImage('assets/logo.png'),
                height: 150,
                width: 150,
              ),
            ),
            Text(
              'DAMELIFE',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '"Connects you everything with NDMU"',
              style: TextStyle(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 65),
            Text(
              'Welcome Marista',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login_screen()),
                );
              },
              child: Container(
                height: 50,
                width:
                    MediaQuery.of(context).size.width *
                    0.5, // Responsive width (80% of screen width)
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signup_screen()),
                );
              },
              child: Container(
                height: 50,
                width:
                    MediaQuery.of(context).size.width *
                    0.5, // Responsive width (80% of screen width)
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            const Text(
              'Designed for smart and interactive campus experience.',
              style: TextStyle(
                fontSize: 10, 
                color: Colors.white,
                fontStyle: FontStyle.italic
                ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
