import 'dart:async';
import 'dart:math';
import 'package:damelife_sample2/games.dart';
import 'package:flutter/material.dart';
import 'tetromino.dart';

void main() {
  runApp(const TetrisApp());
}

class TetrisApp extends StatelessWidget {
  const TetrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tetris',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
        ),
      ),
      home: const TetrisGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}

const int rowCount = 20;
const int colCount = 10;

class TetrisGame extends StatefulWidget {
  const TetrisGame({super.key});

  @override
  State<TetrisGame> createState() => _TetrisGameState();
}

class _TetrisGameState extends State<TetrisGame> {
  List<List<Color?>> grid = List.generate(rowCount, (_) => List.filled(colCount, null));
  Timer? gameTimer;
  int score = 0;
  Tetromino? currentTetromino;
  Tetromino? nextTetromino;
  bool isPaused = false;
  bool isGameOver = false;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startGame();
    });
  }

  void startGame() {
    spawnTetromino();
    gameTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (!isPaused && !isGameOver && mounted) {
        moveDown();
      }
    });
  }

  void spawnTetromino() {
    nextTetromino ??= Tetromino.shapes[random.nextInt(Tetromino.shapes.length)].copy();

    currentTetromino = nextTetromino;
    currentTetromino!.x = colCount ~/ 2 - 2;
    currentTetromino!.y = -1;

    nextTetromino = Tetromino.shapes[random.nextInt(Tetromino.shapes.length)].copy();

    if (checkCollision(currentTetromino!)) {
      gameOver();
    }
  }

  bool checkCollision(Tetromino tetromino) {
    for (var block in tetromino.blocks) {
      int x = tetromino.x + block[0];
      int y = tetromino.y + block[1];
      if (x < 0 || x >= colCount || y >= rowCount || (y >= 0 && grid[y][x] != null)) {
        return true;
      }
    }
    return false;
  }

  void fixTetromino() {
    for (var block in currentTetromino!.blocks) {
      int x = currentTetromino!.x + block[0];
      int y = currentTetromino!.y + block[1];
      if (y >= 0) {
        grid[y][x] = currentTetromino!.color;
      }
    }
    clearLines();
    spawnTetromino();
  }

  void clearLines() {
    setState(() {
      for (int y = rowCount - 1; y >= 0; y--) {
        if (grid[y].every((cell) => cell != null)) {
          grid.removeAt(y);
          grid.insert(0, List.filled(colCount, null));
          score += 100;
          y++;
        }
      }
    });
  }

  void moveDown() {
    if (!mounted || currentTetromino == null) return;
    setState(() {
      currentTetromino!.y += 1;
      if (checkCollision(currentTetromino!)) {
        currentTetromino!.y -= 1;
        fixTetromino();
      }
    });
  }

  void moveLeft() {
    setState(() {
      currentTetromino?.x -= 1;
      if (checkCollision(currentTetromino!)) {
        currentTetromino!.x += 1;
      }
    });
  }

  void moveRight() {
    setState(() {
      currentTetromino?.x += 1;
      if (checkCollision(currentTetromino!)) {
        currentTetromino!.x -= 1;
      }
    });
  }

  void rotate() {
    setState(() {
      currentTetromino?.rotate();
      if (checkCollision(currentTetromino!)) {
        currentTetromino!.rotateBack();
      }
    });
  }

  void drop() {
    if (isGameOver || isPaused || currentTetromino == null) return;
    setState(() {
      while (true) {
        currentTetromino!.y += 1;
        if (checkCollision(currentTetromino!)) {
          currentTetromino!.y -= 1;
          fixTetromino();
          break;
        }
      }
    });
  }

  void togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  void gameOver() {
    setState(() {
      isGameOver = true;
    });
    gameTimer?.cancel();
    if (!mounted) return;
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Game Over"),
          content: Text("Score: $score"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                resetGame();
              },
              child: const Text("Restart"),
            )
          ],
        ),
      );
    });
  }

  void resetGame() {
    setState(() {
      grid = List.generate(rowCount, (_) => List.filled(colCount, null));
      score = 0;
      isGameOver = false;
      currentTetromino = null;
      nextTetromino = null;
      startGame();
    });
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 184, 184, 184),
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            gameTimer?.cancel();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Games()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Tetris",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Score: $score",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: colCount / rowCount,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all()),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: rowCount * colCount,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: colCount,
                    ),
                    itemBuilder: (context, index) {
                      int x = index % colCount;
                      int y = index ~/ colCount;
                      Color? color = grid[y][x];

                      if (currentTetromino != null) {
                        for (var block in currentTetromino!.blocks) {
                          int bx = currentTetromino!.x + block[0];
                          int by = currentTetromino!.y + block[1];
                          if (bx == x && by == y && by >= 0) {
                            color = currentTetromino!.color;
                          }
                        }
                      }

                      return Container(
                        margin: const EdgeInsets.all(1),
                        color: color ?? (Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[800]
                            : Colors.grey[200]),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 205, 205).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: isGameOver || isPaused ? null : moveLeft, icon: const Icon(Icons.arrow_left, size: 70)),
                      IconButton(onPressed: isGameOver || isPaused ? null : rotate, icon: const Icon(Icons.rotate_right, size: 50)),
                      IconButton(onPressed: isGameOver || isPaused ? null : moveRight, icon: const Icon(Icons.arrow_right, size: 70)),
                      IconButton(onPressed: isGameOver || isPaused ? null : moveDown, icon: const Icon(Icons.arrow_downward, size: 50)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: isGameOver ? null : togglePause,
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: Text(
                          isPaused ? 'Resume' : 'Pause',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: isGameOver || isPaused ? null : drop,
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: const Text(
                          "Drop",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
