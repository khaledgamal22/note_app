import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title,required this.icon, this.onTapIcon});
  final String title;
  final IconData icon;
  final void Function()? onTapIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: const TextStyle(fontSize: 32),),
          CustomIcon(icon: icon,ontap: onTapIcon,),
        ],
      ),
    );
  }
}