import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final Size size;

  MyTile({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      padding: const EdgeInsets.all(5),
      child: Text(
        'Sliding Puzzle',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.height * 0.05,
          color: Colors.grey[100],
        ),
      ),
    );
  }
}
