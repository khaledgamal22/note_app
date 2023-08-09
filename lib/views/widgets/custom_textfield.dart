import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hintText,this.maxlines=1,this.onSaved, this.onChange});
  final String hintText;
  final int maxlines;
  final Function(String?)? onSaved;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChange,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'field is required';
        }
      },
      maxLines: maxlines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: bordershape(color: kPrimaryColor),
        enabledBorder: bordershape(color: Colors.white),
        border: bordershape(color: Colors.red)
      ),
    );
  }

  OutlineInputBorder bordershape({required Color color}) {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(15)
      );
  }
}