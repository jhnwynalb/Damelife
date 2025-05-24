import 'dart:async';
import 'dart:math';
import 'package:damelife_sample2/games.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChessApp());
}

// Enum for piece color
enum PieceColor { white, black }

// Enum for piece type
enum PieceType { pawn, knight, bishop, rook, queen, king }

// Chess piece model
class Piece {
  final PieceColor color;
  final PieceType type;
  bool hasMoved; // To track special moves like castling and en passant

  Piece(this.color, this.type, {this.hasMoved = false});

  String get symbol {
    // Unicode chess symbols by piece and color
    switch (type) {
      case PieceType.pawn:
        return color == PieceColor.white ? '♙' : '♟';
      case PieceType.knight:
        return color == PieceColor.white ? '♘' : '♞';
      case PieceType.bishop:
        return color == PieceColor.white ? '♗' : '♝';
      case PieceType.rook:
        return color == PieceColor.white ? '♖' : '♜';
      case PieceType.queen:
        return color == PieceColor.white ? '♕' : '♛';
      case PieceType.king:
        return color == PieceColor.white ? '♔' : '♚';
    }
  }
}

// Position on board
class Position {
  final int row;
  final int col;

  Position(this.row, this.col);

  @override
  bool operator ==(other) {
    return other is Position && other.row == row && other.col == col;
  }

  @override
  int get hashCode => row * 8 + col;
}

// Move model to keep track for undo, special cases
class Move {
  final Position from;
  final Position to;
  final Piece? capturedPiece;
  final bool wasEnPassant;
  final Position? enPassantCapturedPos;
  final bool wasCastling;
  final Position? castledRookFrom;
  final Position? castledRookTo;
  final Piece? promotedPiece;

  Move({
    required this.from,
    required this.to,
    this.capturedPiece,
    this.wasEnPassant = false,
    this.enPassantCapturedPos,
    this.wasCastling = false,
    this.castledRookFrom,
    this.castledRookTo,
    this.promotedPiece,
  });
}

// Main app widget
class ChessApp extends StatelessWidget {
  const ChessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF121212),
        primaryColor: Colors.tealAccent[700],
      ),
      home: ChessPage(),
    );
  }
}

class ChessPage extends StatefulWidget {
  const ChessPage({super.key});

  @override
  _ChessPageState createState() => _ChessPageState();
}

class _ChessPageState extends State<ChessPage> {
  static const int boardSize = 8;

  late List<List<Piece?>> board;

  PieceColor turn = PieceColor.white;
  Position? selectedPosition;
  List<Position> legalMoves = [];
  List<Move> moveHistory = [];
  Position? enPassantTarget; // Position behind a pawn that just advanced two squares

  String gameMessage = 'White to move';
  bool gameOver = false;

  List<Piece> capturedWhitePieces = [];
  List<Piece> capturedBlackPieces = [];

  final Random random = Random();

  @override
  void initState() {
    super.initState();
    resetBoard();
  }

  void resetBoard() {
    board = List.generate(boardSize, (r) => List.filled(boardSize, null));
    // Place pawns
    for (int i = 0; i < boardSize; i++) {
      board[1][i] = Piece(PieceColor.black, PieceType.pawn);
      board[6][i] = Piece(PieceColor.white, PieceType.pawn);
    }
    // Place other pieces
    final backRank = [
      PieceType.rook,
      PieceType.knight,
      PieceType.bishop,
      PieceType.queen,
      PieceType.king,
      PieceType.bishop,
      PieceType.knight,
      PieceType.rook
    ];
    for (int i = 0; i < boardSize; i++) {
      board[0][i] = Piece(PieceColor.black, backRank[i]);
      board[7][i] = Piece(PieceColor.white, backRank[i]);
    }
    turn = PieceColor.white;
    selectedPosition = null;
    legalMoves.clear();
    moveHistory.clear();
    enPassantTarget = null;
    gameMessage = 'White to move';
    gameOver = false;

    capturedWhitePieces.clear();
    capturedBlackPieces.clear();

    setState(() {});
  }

  // Helper to check if inside board
  bool isInside(int row, int col) {
    return row >= 0 && row < boardSize && col >= 0 && col < boardSize;
  }

  // Checks if position is under attack by opponent pieces
  bool isSquareAttacked(Position pos, PieceColor attackerColor) {
    // For each direction check for attacks:
    int row = pos.row;
    int col = pos.col;

    // Directions for rook/queen
    List<List<int>> rookDirs = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ];

    // Directions for bishop/queen
    List<List<int>> bishopDirs = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
    ];

    // Knight moves
    List<List<int>> knightMoves = [
      [2, 1],
      [1, 2],
      [-1, 2],
      [-2, 1],
      [-2, -1],
      [-1, -2],
      [1, -2],
      [2, -1],
    ];

    // Pawn attacks depend on color
    int pawnDir = attackerColor == PieceColor.white ? -1 : 1;

    // Check pawn attacks
    List<Position> pawnAttacks = [
      Position(row + pawnDir, col - 1),
      Position(row + pawnDir, col + 1)
    ];
    for (var p in pawnAttacks) {
      if (isInside(p.row, p.col)) {
        Piece? piece = board[p.row][p.col];
        if (piece != null &&
            piece.color == attackerColor &&
            piece.type == PieceType.pawn) {
          return true;
        }
      }
    }

    // Check knight attacks
    for (var m in knightMoves) {
      int r = row + m[0];
      int c = col + m[1];
      if (isInside(r, c)) {
        Piece? piece = board[r][c];
        if (piece != null &&
            piece.color == attackerColor &&
            piece.type == PieceType.knight) {
          return true;
        }
      }
    }

    // Check rook/queen directions
    for (var dir in rookDirs) {
      int r = row + dir[0];
      int c = col + dir[1];
      while (isInside(r, c)) {
        Piece? piece = board[r][c];
        if (piece != null) {
          if (piece.color == attackerColor &&
              (piece.type == PieceType.rook || piece.type == PieceType.queen)) {
            return true;
          } else {
            break; // blocked
          }
        }
        r += dir[0];
        c += dir[1];
      }
    }

    // Check bishop/queen directions
    for (var dir in bishopDirs) {
      int r = row + dir[0];
      int c = col + dir[1];
      while (isInside(r, c)) {
        Piece? piece = board[r][c];
        if (piece != null) {
          if (piece.color == attackerColor &&
              (piece.type == PieceType.bishop || piece.type == PieceType.queen)) {
            return true;
          } else {
            break; // blocked
          }
        }
        r += dir[0];
        c += dir[1];
      }
    }

    // Check king proximity (attacked by king adjacent)
    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        if (dr == 0 && dc == 0) continue;
        int r = row + dr;
        int c = col + dc;
        if (isInside(r, c)) {
          Piece? piece = board[r][c];
          if (piece != null &&
              piece.color == attackerColor &&
              piece.type == PieceType.king) {
            return true;
          }
        }
      }
    }

    return false;
  }

  // Find white or black king position
  Position? findKingPosition(PieceColor color) {
    for (int r = 0; r < boardSize; r++) {
      for (int c = 0; c < boardSize; c++) {
        Piece? piece = board[r][c];
        if (piece != null && piece.color == color && piece.type == PieceType.king) {
          return Position(r, c);
        }
      }
    }
    return null;
  }

  // Check if the player is in check
  bool isInCheck(PieceColor color) {
    Position? kingPos = findKingPosition(color);
    if (kingPos == null) return false; // Should not happen
    return isSquareAttacked(kingPos, oppositeColor(color));
  }

  PieceColor oppositeColor(PieceColor color) =>
      color == PieceColor.white ? PieceColor.black : PieceColor.white;

  // Generate legal moves for piece in position (basic + special)
  List<Position> generateLegalMoves(Position from) {
    Piece? piece = board[from.row][from.col];
    if (piece == null || piece.color != turn) return [];

    List<Position> moves = [];

    switch (piece.type) {
      case PieceType.pawn:
        moves.addAll(pawnMoves(from, piece));
        break;
      case PieceType.knight:
        moves.addAll(knightMoves(from, piece));
        break;
      case PieceType.bishop:
        moves.addAll(bishopMoves(from, piece));
        break;
      case PieceType.rook:
        moves.addAll(rookMoves(from, piece));
        break;
      case PieceType.queen:
        moves.addAll(queenMoves(from, piece));
        break;
      case PieceType.king:
        moves.addAll(kingMoves(from, piece));
        break;
    }

    // Filter moves that leave own king in check
    moves = moves.where((to) {
      return !doesMoveExposeKing(from, to);
    }).toList();

    return moves;
  }

  // Helper to test move if exposes king to check
  bool doesMoveExposeKing(Position from, Position to) {
    Piece? movingPiece = board[from.row][from.col];
    if (movingPiece == null) return true;

    Piece? capturedPiece = board[to.row][to.col];
    // Save board state
    board[to.row][to.col] = movingPiece;
    board[from.row][from.col] = null;

    bool inCheck = isInCheck(movingPiece.color);

    // Undo move
    board[from.row][from.col] = movingPiece;
    board[to.row][to.col] = capturedPiece;

    return inCheck;
  }

  // Pawn moves
  List<Position> pawnMoves(Position from, Piece pawn) {
    List<Position> moves = [];
    int dir = pawn.color == PieceColor.white ? -1 : 1;
    int startRow = pawn.color == PieceColor.white ? 6 : 1;

    int r = from.row + dir;
    int c = from.col;

    // Forward move 1
    if (isInside(r, c) && board[r][c] == null) {
      moves.add(Position(r, c));
      // Forward move 2 from start row
      int rr = r + dir;
      if (from.row == startRow && board[rr][c] == null) {
        moves.add(Position(rr, c));
      }
    }

    // Captures
    for (int dc in [-1, 1]) {
      int cc = from.col + dc;
      if (isInside(r, cc)) {
        Piece? target = board[r][cc];
        if (target != null && target.color != pawn.color) {
          moves.add(Position(r, cc));
        }
        // En passant capture
        if (enPassantTarget != null &&
            enPassantTarget == Position(r, cc) &&
            (from.row == (pawn.color == PieceColor.white ? 3 : 4))) {
          moves.add(Position(r, cc));
        }
      }
    }

    return moves;
  }

  // Knight moves
  List<Position> knightMoves(Position from, Piece knight) {
    List<Position> moves = [];
    List<List<int>> jumps = [
      [2, 1],
      [1, 2],
      [-1, 2],
      [-2, 1],
      [-2, -1],
      [-1, -2],
      [1, -2],
      [2, -1]
    ];

    for (var jump in jumps) {
      int r = from.row + jump[0];
      int c = from.col + jump[1];
      if (isInside(r, c)) {
        Piece? target = board[r][c];
        if (target == null || target.color != knight.color) {
          moves.add(Position(r, c));
        }
      }
    }
    return moves;
  }

  // Bishop moves
  List<Position> bishopMoves(Position from, Piece bishop) {
    return slidingMoves(from, bishop, [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
    ]);
  }

  // Rook moves
  List<Position> rookMoves(Position from, Piece rook) {
    return slidingMoves(from, rook, [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ]);
  }

  // Queen moves
  List<Position> queenMoves(Position from, Piece queen) {
    return slidingMoves(from, queen, [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
    ]);
  }

  // Generic sliding moves for bishop/rook/queen
  List<Position> slidingMoves(Position from, Piece piece, List<List<int>> directions) {
    List<Position> moves = [];

    for (var dir in directions) {
      int r = from.row + dir[0];
      int c = from.col + dir[1];
      while (isInside(r, c)) {
        Piece? target = board[r][c];
        if (target == null) {
          moves.add(Position(r, c));
        } else {
          if (target.color != piece.color) {
            moves.add(Position(r, c));
          }
          break;
        }
        r += dir[0];
        c += dir[1];
      }
    }

    return moves;
  }

  // King moves including castling
  List<Position> kingMoves(Position from, Piece king) {
    List<Position> moves = [];

    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        if (dr == 0 && dc == 0) continue;
        int r = from.row + dr;
        int c = from.col + dc;
        if (isInside(r, c)) {
          Piece? target = board[r][c];
          if (target == null || target.color != king.color) {
            moves.add(Position(r, c));
          }
        }
      }
    }

    // Castling (only if king and rook have not moved, no pieces between, and no check on path)
    if (!king.hasMoved && !isInCheck(king.color)) {
      int row = from.row;
      Piece? rookKingSide = board[row][7];
      if (rookKingSide != null &&
          rookKingSide.type == PieceType.rook &&
          rookKingSide.color == king.color &&
          !rookKingSide.hasMoved) {
        if (board[row][5] == null && board[row][6] == null) {
          // Check if squares king passes through are attacked
          if (!isSquareAttacked(Position(row, 5), oppositeColor(king.color)) &&
              !isSquareAttacked(Position(row, 6), oppositeColor(king.color))) {
            moves.add(Position(row, 6)); // King side castling destination
          }
        }
      }

      Piece? rookQueenSide = board[row][0];
      if (rookQueenSide != null &&
          rookQueenSide.type == PieceType.rook &&
          rookQueenSide.color == king.color &&
          !rookQueenSide.hasMoved) {
        if (board[row][1] == null &&
            board[row][2] == null &&
            board[row][3] == null) {
          if (!isSquareAttacked(Position(row, 2), oppositeColor(king.color)) &&
              !isSquareAttacked(Position(row, 3), oppositeColor(king.color))) {
            moves.add(Position(row, 2)); // Queen side castling destination
          }
        }
      }
    }

    return moves;
  }

  Future<void> handleTap(int row, int col) async {
    if (gameOver) return;
    if (turn == PieceColor.black) return; // Disable user control of black pieces (AI controls)

    Position tapped = Position(row, col);
    Piece? tappedPiece = board[row][col];

    if (selectedPosition == null) {
      // No piece selected, select if tapped piece belongs to current player
      if (tappedPiece != null && tappedPiece.color == turn) {
        selectedPosition = tapped;
        legalMoves = generateLegalMoves(selectedPosition!);
        setState(() {});
      }
    } else {
      // Piece is selected, check if tapped is legal move
      if (tapped == selectedPosition) {
        // Deselect
        selectedPosition = null;
        legalMoves.clear();
        setState(() {});
        return;
      }
      if (legalMoves.contains(tapped)) {
        // Move piece
        await makeMove(selectedPosition!, tapped);
        selectedPosition = null;
        legalMoves.clear();
        setState(() {});
        await handleAITurnIfNeeded();
      } else {
        // Select new piece if belongs to current player
        if (tappedPiece != null && tappedPiece.color == turn) {
          selectedPosition = tapped;
          legalMoves = generateLegalMoves(selectedPosition!);
          setState(() {});
        }
      }
    }
  }

  // Promotion dialog
  Future<PieceType?> showPromotionDialog() async {
    return showDialog<PieceType>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF222222),
          title: Text('Pawn Promotion'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              promotionButton(PieceType.queen),
              promotionButton(PieceType.rook),
              promotionButton(PieceType.bishop),
              promotionButton(PieceType.knight),
            ],
          ),
        );
      },
    );
  }

  Widget promotionButton(PieceType type) {
    String symbol;
    switch (type) {
      case PieceType.queen:
        symbol = turn == PieceColor.white ? '♕' : '♛';
        break;
      case PieceType.rook:
        symbol = turn == PieceColor.white ? '♖' : '♜';
        break;
      case PieceType.bishop:
        symbol = turn == PieceColor.white ? '♗' : '♝';
        break;
      case PieceType.knight:
        symbol = turn == PieceColor.white ? '♘' : '♞';
        break;
      default:
        symbol = '';
    }
    return GestureDetector(
      onTap: () => Navigator.pop(context, type),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF333333),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          symbol,
          style: TextStyle(fontSize: 42),
        ),
      ),
    );
  }

  // Execute move from->to including special move handling
  Future<void> makeMove(Position from, Position to) async {
    Piece? movingPiece = board[from.row][from.col];
    if (movingPiece == null) return;

    Piece? targetPiece = board[to.row][to.col];

    bool wasEnPassant = false;
    Position? enPassantCapturedPos;
    bool wasCastling = false;
    Position? castledRookFrom;
    Position? castledRookTo;
    Piece? promotedPiece;

    // Check for castling
    if (movingPiece.type == PieceType.king &&
        (to.col - from.col).abs() == 2 &&
        from.row == to.row) {
      wasCastling = true;
      // Move rook too
      if (to.col == 6) {
        // king side
        castledRookFrom = Position(from.row, 7);
        castledRookTo = Position(from.row, 5);
        Piece? rook = board[castledRookFrom.row][castledRookFrom.col];
        board[castledRookTo.row][castledRookTo.col] = rook;
        board[castledRookFrom.row][castledRookFrom.col] = null;
        rook?.hasMoved = true;
      } else if (to.col == 2) {
        // queen side
        castledRookFrom = Position(from.row, 0);
        castledRookTo = Position(from.row, 3);
        Piece? rook = board[castledRookFrom.row][castledRookFrom.col];
        board[castledRookTo.row][castledRookTo.col] = rook;
        board[castledRookFrom.row][castledRookFrom.col] = null;
        rook?.hasMoved = true;
      }
    }

    // En passant capture
    if (movingPiece.type == PieceType.pawn &&
        to == enPassantTarget) {
      wasEnPassant = true;
      int dir = movingPiece.color == PieceColor.white ? 1 : -1;
      int capturedRow = to.row + dir;
      enPassantCapturedPos = Position(capturedRow, to.col);
      targetPiece = board[capturedRow][to.col];
      board[capturedRow][to.col] = null;
    }

    // Move the piece
    board[to.row][to.col] = movingPiece;
    board[from.row][from.col] = null;

    // Pawn promotion
    if (movingPiece.type == PieceType.pawn &&
        (to.row == 0 || to.row == 7)) {
      if (turn == PieceColor.white) {
        PieceType? promotion = await showPromotionDialog();
        promotion ??= PieceType.queen; // default queen
        promotedPiece = Piece(movingPiece.color, promotion);
      } else {
        // AI promotes always to queen
        promotedPiece = Piece(movingPiece.color, PieceType.queen);
      }
      board[to.row][to.col] = promotedPiece;
    }

    // Update hasMoved flag
    movingPiece.hasMoved = true;

    // Update captured pieces counters
    if (targetPiece != null) {
      if (targetPiece.color == PieceColor.white) {
        capturedWhitePieces.add(targetPiece);
      } else {
        capturedBlackPieces.add(targetPiece);
      }
    }

    // Update enPassantTarget
    if (movingPiece.type == PieceType.pawn &&
        (to.row - from.row).abs() == 2) {
      int epRow = (to.row + from.row) ~/ 2;
      enPassantTarget = Position(epRow, from.col);
    } else {
      enPassantTarget = null;
    }

    // Save move to history
    moveHistory.add(Move(
      from: from,
      to: to,
      capturedPiece: targetPiece,
      wasEnPassant: wasEnPassant,
      enPassantCapturedPos: enPassantCapturedPos,
      wasCastling: wasCastling,
      castledRookFrom: castledRookFrom,
      castledRookTo: castledRookTo,
      promotedPiece: promotedPiece,
    ));

    // Change turn
    turn = oppositeColor(turn);

    // Check game status
    updateGameStatus();

    setState(() {});
  }

  void updateGameStatus() {
    bool check = isInCheck(turn);
    bool noLegalMoves = !hasAnyLegalMoves(turn);

    if (check && noLegalMoves) {
      gameMessage = '${colorName(turn)} is checkmate!! ${colorName(oppositeColor(turn))} wins!';
      gameOver = true;
    } else if (!check && noLegalMoves) {
      gameMessage = 'Stalemate! It\'s a draw.';
      gameOver = true;
    } else if (check) {
      gameMessage = '${colorName(turn)} is in check';
      gameOver = false;
    } else {
      gameMessage = '${colorName(turn)} to move';
      gameOver = false;
    }
  }

  bool hasAnyLegalMoves(PieceColor color) {
    for (int r = 0; r < boardSize; r++) {
      for (int c = 0; c < boardSize; c++) {
        Piece? piece = board[r][c];
        if (piece != null && piece.color == color) {
          List<Position> moves = generateLegalMoves(Position(r, c));
          if (moves.isNotEmpty) return true;
        }
      }
    }
    return false;
  }

  String colorName(PieceColor color) =>
      color == PieceColor.white ? 'White' : 'Black';

  // Undo last move
  void undoMove() {
    if (moveHistory.isEmpty || gameOver) return;
    Move lastMove = moveHistory.removeLast();

    // Undo move
    Piece? movingPiece = board[lastMove.to.row][lastMove.to.col];
    board[lastMove.from.row][lastMove.from.col] = movingPiece;
    board[lastMove.to.row][lastMove.to.col] = lastMove.capturedPiece;

    // Undo special moves
    if (lastMove.wasEnPassant && lastMove.enPassantCapturedPos != null) {
      board[lastMove.enPassantCapturedPos!.row][lastMove.enPassantCapturedPos!.col] =
          lastMove.capturedPiece;
      // Remove from captured pieces if en passant
      if (lastMove.capturedPiece != null) {
        if (lastMove.capturedPiece!.color == PieceColor.white) {
          capturedWhitePieces.remove(lastMove.capturedPiece);
        } else {
          capturedBlackPieces.remove(lastMove.capturedPiece);
        }
      }
    }

    if (lastMove.wasCastling && lastMove.castledRookFrom != null && lastMove.castledRookTo != null) {
      Piece? rook = board[lastMove.castledRookTo!.row][lastMove.castledRookTo!.col];
      board[lastMove.castledRookFrom!.row][lastMove.castledRookFrom!.col] = rook;
      board[lastMove.castledRookTo!.row][lastMove.castledRookTo!.col] = null;
    }

    // Undo promotion
    if (lastMove.promotedPiece != null) {
      board[lastMove.from.row][lastMove.from.col] = Piece(turn, PieceType.pawn, hasMoved: true);
    }

    // Remove captured piece from lists if applicable
    if (lastMove.capturedPiece != null && !lastMove.wasEnPassant) {
      if (lastMove.capturedPiece!.color == PieceColor.white) {
        capturedWhitePieces.remove(lastMove.capturedPiece);
      } else {
        capturedBlackPieces.remove(lastMove.capturedPiece);
      }
    }

    // Update movingPiece hasMoved flag
    movingPiece?.hasMoved = false;

    // Switch turn back
    turn = oppositeColor(turn);

    // Reset enPassantTarget (simple approach)
    enPassantTarget = null;

    gameOver = false;
    gameMessage = '${colorName(turn)} to move';

    selectedPosition = null;
    legalMoves.clear();

    setState(() {});
  }

  // AI logic for black moves - basic random legal move
  Future<void> handleAITurnIfNeeded() async {
    if (gameOver) return;
    if (turn == PieceColor.black) {
      await Future.delayed(Duration(milliseconds: 800)); // Small delay for AI "thinking"
      // Get all black pieces and their legal moves
      List<Tuple> allMoves = [];
      for (int r = 0; r < boardSize; r++) {
        for (int c = 0; c < boardSize; c++) {
          Piece? piece = board[r][c];
          if (piece != null && piece.color == PieceColor.black) {
            List<Position> moves = generateLegalMoves(Position(r, c));
            for (var to in moves) {
              allMoves.add(Tuple(Position(r, c), to));
            }
          }
        }
      }
      if (allMoves.isEmpty) return;

      // Choose best move by simple heuristic (prioritize capture)
      List<Tuple> captureMoves = [];
      for (var move in allMoves) {
        Piece? target = board[move.to.row][move.to.col];
        if (target != null && target.color == PieceColor.white) {
          captureMoves.add(move);
        }
      }
      Tuple chosenMove;
      if (captureMoves.isNotEmpty) {
        chosenMove = captureMoves[random.nextInt(captureMoves.length)];
      } else {
        chosenMove = allMoves[random.nextInt(allMoves.length)];
      }

      await makeMove(chosenMove.from, chosenMove.to);
      await handleAITurnIfNeeded(); // If AI still black's turn (unlikely), repeat
    }
  }

  Widget buildBoard() {
    bool isLightSquare(int r, int c) => (r + c) % 2 == 1;

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: boardSize),
          itemCount: boardSize * boardSize,
          itemBuilder: (context, index) {
            int row = index ~/ boardSize;
            int col = index % boardSize;

            Piece? piece = board[row][col];
            bool lightSquare = isLightSquare(row, col);

            Color squareColor = lightSquare
                ? Color(0xFFEEEED2)
                : Color(0xFF769656);

            // Highlight legal moves
            bool isLegalMove = legalMoves.contains(Position(row, col));

            if (isLegalMove) {
              squareColor = squareColor.withAlpha(180);
            }

            // Highlight selected piece
            bool isSelected = selectedPosition == Position(row, col);

            return GestureDetector(
              onTap: () {
                handleTap(row, col);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: squareColor,
                  border: isSelected ? Border.all(color: Colors.orange, width: 4) : null,
                ),
                child: Center(
                  child: piece != null
                      ? Text(
                          piece.symbol,
                          style: TextStyle(
                            fontSize: 36,
                            color: piece.color == PieceColor.white ? Colors.white : Colors.black,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(1, 1),
                                blurRadius: 1,
                              )
                            ],
                          ),
                        )
                      : isLegalMove
                          ? Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: turn == PieceColor.white
                                    ? Colors.orange.withOpacity(0.7)
                                    : Colors.tealAccent.withOpacity(0.7),
                                shape: BoxShape.circle,
                              ),
                            )
                          : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.tealAccent[700],
          ),
          onPressed: undoMove,
          icon: Icon(Icons.undo, color: Colors.black),
          label: Text('Undo', style: TextStyle(color: Colors.black)),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Color(0xFF222222),
                  title: Text('Restart Game'),
                  content: Text('Are you sure you want to restart the game?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel', style: TextStyle(color: Colors.white70)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        resetBoard();
                      },
                      child: Text('Restart', style: TextStyle(color: Colors.tealAccent)),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.restart_alt, color: Colors.black),
          label: Text('Restart', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

 Widget buildCapturedPiecesDisplay() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // White captured by Black
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 161, 161, 161).withOpacity(0.1), // Background color for Black captured
            borderRadius: BorderRadius.circular(8), // Adding border radius
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                'Black Captured:',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.tealAccent),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: capturedWhitePieces
                        .map((p) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                p.symbol,
                                style: TextStyle(fontSize: 22, color: Colors.white),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        // Black captured by White
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 161, 161, 161).withOpacity(0.1), // Background color for White captured
            borderRadius: BorderRadius.circular(8), // Adding border radius
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                'White Captured:',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: capturedBlackPieces
                        .map((p) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                p.symbol,
                                style: TextStyle(fontSize: 22, color: Colors.black),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Games()));
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text('CHESS', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xFF121212),
        elevation: 0,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double boardMaxHeight = constraints.maxHeight - 200;
            double boardSizePx = boardMaxHeight < constraints.maxWidth
                ? boardMaxHeight
                : constraints.maxWidth;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                              Divider(height: 40, thickness: 1),
                buildCapturedPiecesDisplay(),
                SizedBox(
                  width: boardSizePx,
                  height: boardSizePx,
                  child: buildBoard(),
                ),
                SizedBox(height: 20),
                Text(
                  gameMessage,
                  style: TextStyle(
                    fontSize: 18,
                    color: gameOver ? Colors.redAccent : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                              Divider(height: 40, thickness: 1),
                buildControlButtons(),
                SizedBox(height: 12),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Helper class to hold a move tuple
class Tuple {
  final Position from;
  final Position to;

  Tuple(this.from, this.to);
}
