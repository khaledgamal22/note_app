

import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isChosen, required this.color});
  final bool isChosen;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isChosen?CircleAvatar(
      radius: 33,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: color,
      ),
    )
    : CircleAvatar(
        radius: 30,
        backgroundColor: color,
      );
  }
}