import 'package:injectable/injectable.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';

@singleton
class UpdateNote {
  final NoteRepository repository;

  UpdateNote(this.repository);

  Future<void> call(Note note) async {
    await repository.updateNote(note);
  }
}
