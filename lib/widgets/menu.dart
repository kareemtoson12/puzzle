// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:qizz1/widgets/Move.dart';
import 'package:qizz1/widgets/restbutton.dart';

import 'time.dart';

// ignore: must_be_immutable
class Menu extends StatelessWidget {
  Function reset;
  int move;
  double time;
  Menu({
    Key? key,
    required this.reset,
    required this.move,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          RestButton(
            reset: reset,
          ),
          Move(
            move: move,
          ),
          Time(
            time: time,
          ),
        ],
      ),
    );
  }
}
