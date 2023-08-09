import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/view_note_cubit/view_note_cubit.dart';
import 'package:note_app/views/widgets/custom_noteitem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewNoteCubit, ViewNoteState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount:
                  BlocProvider.of<ViewNoteCubit>(context).notelist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CustomNoteItem(
                    note:
                        BlocProvider.of<ViewNoteCubit>(context).notelist[index],
                  ),
                );
              }),
        );
      },
    );
  }
}



// return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: ListView.builder(
//               padding: EdgeInsets.zero,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: CustomNoteItem(),
//                 );
//               }),
//         );