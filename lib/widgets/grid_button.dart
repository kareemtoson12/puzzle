import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final Function(int) click;
  final String text;
  final int index;

  GridButton({
    Key? key,
    required this.click,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => click(index),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(18)),

          // Correctly pass the index parameter
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
