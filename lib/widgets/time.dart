// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Time extends StatelessWidget {
  double time;
  Time({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 15),
        child: Text(
          'Time:  $time',
          style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 18),
        ),
      ),
    );
  }
}
