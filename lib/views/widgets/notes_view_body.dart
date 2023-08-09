import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/view_note_cubit/view_note_cubit.dart';
import 'package:note_app/views/widgets/custom_appBar.dart';
import 'package:note_app/views/widgets/notes_listView.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {


  @override
  void initState() {
    BlocProvider.of<ViewNoteCubit>(context).readAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
