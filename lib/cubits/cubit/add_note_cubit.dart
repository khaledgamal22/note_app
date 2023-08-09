import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/modals/note_model.dart';
import 'package:note_app/views/widgets/constant.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color=const Color(0xffFFF2F1);

  void addNote(NoteModel note)async{
    note.color=color.value;
    emit(AddNoteLoading());
    try{
      var notesBox = Hive.box<NoteModel>(kNotesBoxName);
    await notesBox.add(note);
    emit(AddNoteSuccess());
    }catch(e){
      emit(AddNoteFailre(errorMessage: 'failed'));
    }
  }
}
