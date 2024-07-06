import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RestButton extends StatelessWidget {
  final Function? reset;

  RestButton({super.key, this.reset});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => reset!(),
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white)),
      child: const Text('Reset'),
    );
  }
}
