import 'package:flutter/material.dart';

class ExpenseChartItem extends StatelessWidget {
  const ExpenseChartItem(
      {super.key,
      required this.iconData,
      required this.count,
      required this.color});

  final IconData iconData;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 10.0 * count,
          width: 50,
          color: color,
        ),
        const SizedBox(
          height: 10,
        ),
        Icon(iconData),
      ],
    );
  }
}
