import 'package:flutter/material.dart';
import 'package:qizz1/widgets/grid_button.dart';

class Grid extends StatelessWidget {
  final List<int> numbers;
  final Size size;
  final Function(int) clickGrid;

  Grid({
    Key? key,
    required this.numbers,
    required this.size,
    required this.clickGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return numbers[index] != 0
                ? GridButton(
                    index: index,
                    text: '${numbers[index]}',
                    click: clickGrid,
                  )
                : const SizedBox.shrink();
          },
          itemCount: numbers.length,
        ),
      ),
    );
  }
}
