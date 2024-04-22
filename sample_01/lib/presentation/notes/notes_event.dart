import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/uitl/note_order.dart';

part 'notes_event.freezed.dart';

@freezed
sealed class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote;
  const factory NotesEvent.changeOrder(NoteOrder noteOrder) = ChangeOrder;
  const factory NotesEvent.toggleOrderSection() = ToggleOrderSection;
}