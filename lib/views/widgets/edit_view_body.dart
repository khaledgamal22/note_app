import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/view_note_cubit/view_note_cubit.dart';
import 'package:note_app/modals/note_model.dart';
import 'package:note_app/views/widgets/custom_appBar.dart';
import 'package:note_app/views/widgets/custom_textfield.dart';

import '../../colors/edit_color_listview.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key,required this.note});
  
  final NoteModel note;
  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
   String? title;

   String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onTapIcon: () {
              widget.note.title=title ?? widget.note.title;
              widget.note.subtitle=subtitle ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<ViewNoteCubit>(context).readAllNotes();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            hintText: widget.note.title,
            onChange: (data) {
              title=data;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: widget.note.subtitle,
            maxlines: 5,
            onChange: (data) {
              subtitle=data;
            },
          ),
          SizedBox(height: 20,),
          ColorListForEdit(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
