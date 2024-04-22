import 'package:injectable/injectable.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';

@singleton
class DeleteNote{
  final NoteRepository repository;

  DeleteNote(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}
