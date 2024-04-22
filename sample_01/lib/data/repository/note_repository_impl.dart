import 'package:note/data/data_source/note_db_helper.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {

  final NoteDbHelper db;

  NoteRepositoryImpl(this.db);

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<void> saveNote(Note note) async {
    await db.saveNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNote(note);
  }

}