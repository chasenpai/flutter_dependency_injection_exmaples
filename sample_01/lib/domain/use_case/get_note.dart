import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';

class GetNote {

  final NoteRepository repository;

  GetNote(this.repository);

  Future<Note?> call(int id) async {
    Note note = (await repository.getNoteById(id))!;
    return note;
  }
}