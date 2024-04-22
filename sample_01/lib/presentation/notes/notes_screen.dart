import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note/domain/repository/note_repository.dart';
import 'package:note/domain/uitl/note_order.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:note/presentation/notes/component/note_item.dart';
import 'package:note/presentation/notes/component/order_section.dart';
import 'package:note/presentation/notes/notes_event.dart';
import 'package:note/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          viewModel.titleRepository.getTitle(),
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.onEvent(const NotesEvent.toggleOrderSection());
            },
            icon: const Icon(
              Icons.sort,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListView(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300,),
              child: state.isOrderSectionVisible ? OrderSection(
                noteOrder: state.noteOrder,
                onOrderChanged: (NoteOrder order) {
                  viewModel.onEvent(NotesEvent.changeOrder(order));
                },
              ) : Container(),
            ),
            ...state.notes
                .map(
                  (note) => GestureDetector(
                onTap: () async {
                  final uri = Uri(
                    path: '/edit_note',
                    queryParameters: {'note': jsonEncode(note.toJson()),},
                  );
                  bool? isSaved = await context.push(uri.toString());
                  if(isSaved != null && isSaved) {
                    viewModel.onEvent(const NotesEvent.loadNotes());
                  }
                },
                child: NoteItem(
                  note: note,
                  onDeleteTap: () {
                    viewModel.onEvent(NotesEvent.deleteNote(note));
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 5),
                      content: const Text('note has been deleted'),
                      action: SnackBarAction(
                        label: 'cancel',
                        onPressed: () {
                          viewModel.onEvent(const NotesEvent.restoreNote());
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await context.push('/add_note');
          if(isSaved != null && isSaved) {
            viewModel.onEvent(const NotesEvent.loadNotes());
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
