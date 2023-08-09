import 'package:flutter/material.dart';
import 'package:note_app/modals/note_model.dart';
import 'package:note_app/views/widgets/edit_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({super.key,required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(note: note,),
    ) ;
  }
}