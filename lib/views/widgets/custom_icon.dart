import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({required this.icon, this.ontap});

  final IconData icon;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),),
        child: Icon(
          icon,
          size: 25,
        ),
          ),
      );
  }
}