import 'package:flutter/material.dart';

import '../modals/note_model.dart';
import '../views/widgets/constant.dart';
import 'color_item.dart';

class ColorListForEdit extends StatefulWidget {
  const ColorListForEdit({super.key, required this.note});
  final NoteModel note;

  @override
  State<ColorListForEdit> createState() => _ColorListForEditState();
}

class _ColorListForEditState extends State<ColorListForEdit> {

  late int currentindex;
  @override
  void initState() {
    currentindex=kColorList.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: (){
                currentindex=index;
                widget.note.color=kColorList[index].value;
                setState(() {
                  
                });
              },
              child: ColorItem(
                isChosen: currentindex==index,
                 color: kColorList[index],
                ),
            ),
          );
        },
      ),
    );
  }
}