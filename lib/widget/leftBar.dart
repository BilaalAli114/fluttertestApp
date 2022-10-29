import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants/app_constants.dart';

class leftBar1 extends StatelessWidget {
  final double barWidth;
  const leftBar1({required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          //waaa qurxeenaa
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            color: accentColor,
          ),
        )
      ],
    );
  }
}
