 import 'package:flutter/material.dart';

class Tetromino {
  List<List<int>> blocks;
  int x = 3;
  int y = -2;
  final Color color;
  int rotationState = 0;

  Tetromino(this.blocks, this.color);

  static List<Tetromino> get shapes => [
        Tetromino([
          [0, 0], [1, 0], [-1, 0], [-2, 0]
        ], Colors.cyan), // I
        Tetromino([
          [0, 0], [1, 0], [0, 1], [1, 1]
        ], Colors.yellow), // O
        Tetromino([
          [0, 0], [-1, 0], [1, 0], [0, -1]
        ], Colors.purple), // T
        Tetromino([
          [0, 0], [-1, 0], [0, -1], [1, -1]
        ], Colors.red), // Z
        Tetromino([
          [0, 0], [1, 0], [0, -1], [-1, -1]
        ], Colors.green), // S
        Tetromino([
          [0, 0], [-1, 0], [-2, 0], [0, -1]
        ], Colors.orange), // L
        Tetromino([
          [0, 0], [1, 0], [2, 0], [0, -1]
        ], Colors.blue), // J
      ];

  Tetromino copy() {
    return Tetromino(
      blocks.map((block) => List<int>.from(block)).toList(),
      color,
    )..x = x
     ..y = y
     ..rotationState = rotationState;
  }

  void rotate() {
    for (int i = 0; i < blocks.length; i++) {
      int oldX = blocks[i][0];
      int oldY = blocks[i][1];
      blocks[i][0] = -oldY;
      blocks[i][1] = oldX;
    }
    rotationState = (rotationState + 1) % 4;
  }

  void rotateBack() {
    for (int i = 0; i < blocks.length; i++) {
      int oldX = blocks[i][0];
      int oldY = blocks[i][1];
      blocks[i][0] = oldY;
      blocks[i][1] = -oldX;
    }
    rotationState = (rotationState - 1 + 4) % 4;
  }
}
