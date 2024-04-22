import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/uitl/note_order.dart';
import 'package:note/domain/uitl/order_type.dart';
import 'package:note/domain/use_case/use_cases.dart';
import 'package:note/presentation/notes/notes_event.dart';
import 'package:note/presentation/notes/notes_state.dart';

@injectable //필요할 때 마다 생성
class NotesViewModel with ChangeNotifier {
  final UseCases useCases;

  NotesState _state = const NotesState(
    notes: [],
    noteOrder: NoteOrder.date(OrderType.desc()),
    isOrderSectionVisible: false,
  );
  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  NotesViewModel(this.useCases) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
      changeOrder: _changeOrder,
      toggleOrderSection: _toggleOrderSection,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes(state.noteOrder);
    _state = state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if(_recentlyDeletedNote != null) {
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;
      await _loadNotes();
    }
  }

  Future<void> _changeOrder(NoteOrder order) async {
    _state = state.copyWith(
      noteOrder: order,
    );
    await _loadNotes();
  }

  _toggleOrderSection() {
    _state = state.copyWith(
      isOrderSectionVisible: !state.isOrderSectionVisible,
    );
    notifyListeners();
  }
}
