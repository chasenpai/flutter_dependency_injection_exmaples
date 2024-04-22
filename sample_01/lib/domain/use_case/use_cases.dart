import 'package:injectable/injectable.dart';
import 'package:note/domain/use_case/add_note.dart';
import 'package:note/domain/use_case/delete_note.dart';
import 'package:note/domain/use_case/get_note.dart';
import 'package:note/domain/use_case/get_notes.dart';
import 'package:note/domain/use_case/update_note.dart';

@singleton
class UseCases {
  final GetNotes getNotes;
  final GetNote getNote;
  final AddNote addNote;
  final DeleteNote deleteNote;
  final UpdateNote updateNote;

  UseCases({
    required this.getNotes,
    required this.getNote,
    required this.addNote,
    required this.deleteNote,
    required this.updateNote,
  });
}
