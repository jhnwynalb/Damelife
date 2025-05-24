import 'package:damelife_sample2/cs.dart';
import 'package:damelife_sample2/pp.dart';
import 'package:damelife_sample2/tos.dart';
import 'package:flutter/material.dart';
import 'menu_page.dart';

class terms extends StatefulWidget {
  const terms({super.key});

  @override
  State<terms> createState() => _termsState();
}

class _termsState extends State<terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const menu()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 1, 135, 1),
                  Color.fromARGB(255, 0, 64, 1),
                  Color.fromARGB(255, 0, 34, 5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          toolbarHeight: 50,
          title: const Text(
            'Terms & Policies',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(10, 100, 0, 0),
        child: Column(
          children: [
            Divider(height: 0, thickness: 1),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const tos(),),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 3,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.book_outlined,
                    color: Color.fromARGB(255, 24, 24, 24),
                    size: 30,
                  ),
                  title: const Text(
                    "Terms of Service",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 24, 24, 24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 0, thickness: 1),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const pp(),),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 3,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 24, 24, 24),
                    size: 30,
                  ),
                  title: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 24, 24, 24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 0, thickness: 1),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const cs(),),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 3,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.warning_amber_outlined,
                    color: Color.fromARGB(255, 24, 24, 24),
                    size: 30,
                  ),
                  title: const Text(
                    "Community Standards",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 24, 24, 24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 0, thickness: 1),
          ],
        ),
      ),
    );
  }
}
