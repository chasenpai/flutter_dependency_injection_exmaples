import 'package:note/domain/model/note.dart';

abstract class NoteRepository {

  Future<List<Note>> getNotes();

  Future<Note?> getNoteById(int id);

  Future<void> saveNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deleteNote(Note note);
}