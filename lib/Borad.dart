import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qizz1/widgets/grid.dart';
import 'package:qizz1/widgets/menu.dart';
import 'package:qizz1/widgets/tile.dart';

class Borad extends StatefulWidget {
  const Borad({super.key});

  @override
  State<Borad> createState() => _BoradState();
}

class _BoradState extends State<Borad> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  double seconds = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      seconds = 0;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.blue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyTile(size: size),
                Grid(
                  numbers: numbers,
                  size: size,
                  clickGrid: clickGrid,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Menu(
                    reset: reset,
                    move: move,
                    time: seconds,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clickGrid(int index) {
    if ((index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0) ||
        (index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0) ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++;
      });
    }

    checkWin();
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
    });
    resetTimer();
  }

  bool isSorted(List<int> numbers) {
    for (int i = 0; i < numbers.length - 1; i++) {
      if (numbers[i] > numbers[i + 1]) {
        return false;
      }
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("You Win!"),
            content: Text("Your score is $move"),
            actions: [
              TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      resetTimer();
    }
  }
}
