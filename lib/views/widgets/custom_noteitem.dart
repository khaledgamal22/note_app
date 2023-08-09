import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/view_note_cubit/view_note_cubit.dart';
import 'package:note_app/modals/note_model.dart';
import 'package:note_app/views/edit_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditView(note: note,)));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<ViewNoteCubit>(context).readAllNotes();
                  },
                ),
                title: Text(
                  note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 35),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    note.subtitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  note.date,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 15),
                ),
              )
            ]),
      ),
    );
  }
}
