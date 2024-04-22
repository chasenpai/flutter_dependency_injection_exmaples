import 'package:note/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDbHelper {
  Database db;

  NoteDbHelper(this.db);

  Future<Note?> getNoteById(int id) async {
    final List<Map<String, dynamic>> result = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return Note.fromJson(result.first);
    }
    return null;
  }

  Future<List<Note>> getNotes() async {
    final result = await db.query(
      'note',
    );
    return result.map((e) => Note.fromJson(e)).toList();
  }

  Future<void> saveNote(Note note) async {
    await db.insert('note', note.toJson());
  }

  Future<void> updateNote(Note note) async {
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(Note note) async {
    await db.delete(
      'note',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
