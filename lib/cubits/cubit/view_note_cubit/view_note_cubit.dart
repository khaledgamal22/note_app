import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/modals/note_model.dart';
import 'package:note_app/views/widgets/constant.dart';

part 'view_note_state.dart';

class ViewNoteCubit extends Cubit<ViewNoteState> {
  ViewNoteCubit() : super(ViewNoteInitial());

  List<NoteModel> notelist=[];
  readAllNotes(){
      var notes = Hive.box<NoteModel>(kNotesBoxName);
      notelist=notes.values.toList();
      emit(ViewNoteSuccess());
    }
  }
