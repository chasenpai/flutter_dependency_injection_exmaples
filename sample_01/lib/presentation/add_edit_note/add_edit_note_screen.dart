import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:note/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({
    this.note,
    super.key,
  });

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  StreamSubscription? _streamSubscription; //Stream has already been listened to

  @override
  void initState() {
    super.initState();

    if(widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(
          saveNote: () {
            Navigator.of(context).pop(true);
          },
          showSnackBar: (message) {
            final snackBar = SnackBar(content: Text(message,),);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        );
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300,),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: Color(viewModel.color),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: noteColors
                    .map(
                      (color) => InkWell(
                        onTap: () {
                          viewModel.onEvent(AddEditNoteEvent.changeColor(color.value));
                        },
                        child: _renderBackGroundColor(
                          color: color,
                          selected: viewModel.color == color.value,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _titleController,
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: darkGray,
                    ),
                decoration: const InputDecoration(
                  hintText: 'enter a title',
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: darkGray,
                    ),
                decoration: const InputDecoration(
                  hintText: 'enter a content',
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onEvent(
            AddEditNoteEvent.saveNote(
              widget.note?.id,
              _titleController.text,
              _contentController.text,
            ),
          );
        },
        child: const Icon(
          Icons.check,
        ),
      ),
    );
  }

  Widget _renderBackGroundColor({
    required Color color,
    required bool selected,
  }) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6.0,
            spreadRadius: 1.0,
          ),
        ],
        border: selected
            ? Border.all(
                color: Colors.black,
                width: 3.0,
              )
            : null,
      ),
    );
  }
}
