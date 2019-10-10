import 'package:test/test.dart';

// Write a test case which checks the board size is 3 by 3 and is empty

// Challenge 1
// Write the winning scenario
// 1. Start with checking if a player has all cells in row
// 2. Extend the logic to Columns and diagonal

import 'dart:io';

void main() {
  List<List<String>> board = createBoard();
  printBoard(board);
  String currentPlayer = 'X';

  while (true) {
    print('$currentPlayer\'s move');
    String userChoice = stdin.readLineSync();
    int row = getRow(userChoice);
    int column = getColumn(userChoice);
    if (!validate(row, column, board)) {
      print('Invalid Move');
      continue;
    }
    board[row][column] = currentPlayer;
    printBoard(board);
    if (currentPlayer == 'X') {
      currentPlayer = 'O';
    } else {
      currentPlayer = 'X';
    }
    if(win(board)==true)
      {
        break;
      }
  }
}

bool win(List<List<String>> board)
{
  var value;
  for (int i = 0; i < 3; i++) {
    value = board[i][0]==' '?null:board[i][0];
    if (value == board[i][1] && value == board[i][2]) {
      print('$value  wins the board');
      return true;
    }

    value = board[0][i]==' '?null:board[0][i];

    if (value == board[1][i] && value == board[2][i]) {
      print('$value wins the board');
      return true;
    }
  }
  value = board[0][0]==' '?null:board[0][0];
  if (value == board[1][1] && value == board[2][2]) {
    print('$value  wins the board');
    return true;
  }
  value = board[0][2]==' '?null:board[0][2];
  if (value == board[1][1] && value == board[2][0]) {
    print('$value  wins the board');
    return true;
  }
  return false;
}

// Challenge 2
// Write a test case to see if the board is empty and of size 3 by 3
List<List<String>> createBoard() {
  var boardSize = 3;
  return List.generate(boardSize, (_) => List.filled(boardSize, ' '));
}


bool validate(int row, int column, List<List<String>> board) {
  return board[row][column] == ' ';
}

int getColumn(String userInput) => ['A', 'B', 'C'].indexOf(userInput[0]);

int getRow(String userInput) => ['1', '2', '3'].indexOf(userInput[1]);

void printBoard(List<List<String>> board) {
  print('   A   B   C ');
  List<String> rows = board.map(rowToString).toList();
  print('1 ${rows[0]}');
  print('  ---+---+---');
  print('2 ${rows[1]}');
  print('  ---+---+---');
  print('3 ${rows[2]}');
}

String rowToString(List<String> row) {
  return row.map((String val) => ' $val ').join('|');
}
