import 'package:damelife_sample2/chess.dart';
import 'package:damelife_sample2/flappy.dart';
import 'package:damelife_sample2/tetris.dart';
import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'tetris.dart';
import 'dart:ui';

// Placeholder pages to avoid errors
class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Personal Data')));
}

class EStatementPage extends StatelessWidget {
  const EStatementPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('E-Statement')));
}

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> menu()));
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
            'Games',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.white, size: 25),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
        children: [
          GameItem(
            imagePath: 'assets/tetris.jpg',
            title: 'Tetris',
            description:
                'Stack blocks and clear lines in this classic puzzle game.',
            onTap: () {
              // Navigate to the Tetris game
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TetrisGame()),
              );
            },
          ),
          GameItem(
            imagePath: 'assets/medium.jpg',
            title: 'Color Sequence',
            description:
                'Tap the correct colors in sequence to level up your memory .',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ColorSequenceGame()));
            },
          ),
          GameItem(
            imagePath: 'assets/chess1.jpg',
            title: 'Chess',
            description:
                'Play the timeless strategy game of kings and checkmates.',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChessApp()));
            },
          ),
        ],
      ),
    );
  }
}

Widget GameItem({
  required String imagePath,
  required String title,
  required String description,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 246, 245, 245),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 138, 137, 137),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                // Blurred background image
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(color: Colors.black.withOpacity(0.2)),
                  ),
                ),
                // Foreground image
                Center(
                  child: Container(
                    height: 130,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 110, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Play', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 73, 73, 73),
            ),
          ),
        ],
      ),
    ),
  );
}
