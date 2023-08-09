import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/cubit/add_note_cubit.dart';
import 'package:note_app/modals/note_model.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_textfield.dart';

import 'colors/colors_listview.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          CustomTextField(
            hintText: 'title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: 'content',
            maxlines: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 75,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return MyCustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    DateTime currentdate = DateTime.now();
                    String formateddate =
                        DateFormat.yMMMMd().format(currentdate);
                    formKey.currentState!.save();
                    NoteModel note = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formateddate,
                        color: Colors.blue.value,
                        );
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                  setState(() {});
                },
              );
            },
          ),
        ],
      ),
    );
  }
}




