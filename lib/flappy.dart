import 'dart:async';
import 'dart:math';
import 'package:damelife_sample2/games.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: ColorSequenceGame(),
    debugShowCheckedModeBanner: false,
  ),
);

class ColorSequenceGame extends StatefulWidget {
  const ColorSequenceGame({super.key});
  @override
  State<ColorSequenceGame> createState() => _ColorSequenceGameState();
}

class _ColorSequenceGameState extends State<ColorSequenceGame> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  List<int> sequence = [];
  List<int> userInput = [];
  int highlightedIndex = -1;
  bool isPlayingSequence = false;
  bool isGameOver = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    sequence.clear();
    userInput.clear();
    score = 0;
    isGameOver = false;
    _addToSequence();
  }

  void _addToSequence() {
    setState(() {
      userInput.clear();
      isPlayingSequence = true;
    });

    sequence.add(Random().nextInt(colors.length));
    _playSequence();
  }

  Future<void> _playSequence() async {
    for (int index in sequence) {
      await Future.delayed(const Duration(milliseconds: 400));
      setState(() => highlightedIndex = index);
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() => highlightedIndex = -1);
    }
    setState(() => isPlayingSequence = false);
  }

  void _handleUserTap(int index) {
    if (isPlayingSequence || isGameOver) return;

    setState(() => userInput.add(index));

    if (sequence[userInput.length - 1] != index) {
      setState(() => isGameOver = true);
      return;
    }

    if (userInput.length == sequence.length) {
      setState(() => score++);
      _addToSequence();
    }
  }

  void _restart() => _startNewGame();

  Widget _buildLight(int index) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(26, 0, 0, 0),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              highlightedIndex == index
                  ? colors[index].withOpacity(1.0)
                  : colors[index].withOpacity(0.3),
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }

  Widget _buildButton(int index) {
    return GestureDetector(
      onTap: () => _handleUserTap(index),
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: colors[index],
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Games()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          'Color Sequence Game',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[700],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/street.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child:
              isGameOver
                  ? Center(
                    child: Container(
                      padding: const EdgeInsets.all(50),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Game Over",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Score: $score",
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Text(
                                      'Restart Game',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    content: const Text(
                                      'Are you sure you want to restart the game?',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _restart();
                                        },
                                        child: const Text(
                                          'Restart',
                                          style: TextStyle(color: Colors.teal),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.restart_alt,
                              color: Colors.black,
                            ),
                            label: const Text(
                              'Restart',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Memorize the light sequence",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Score: $score",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      isPlayingSequence
                          ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 246, 0, 0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "Watch the lights...",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 253, 253),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                          : Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 185, 22),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "Your turn!",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, _buildLight),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, _buildButton),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
