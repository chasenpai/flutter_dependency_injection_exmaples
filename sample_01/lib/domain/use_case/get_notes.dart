import 'package:injectable/injectable.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';
import 'package:note/domain/uitl/note_order.dart';

@singleton
class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call(NoteOrder order) async {
    List<Note> notes = await repository.getNotes();
    order.when(
      title: (type) {
        type.when(
          asc: (){
            notes.sort((a, b) => a.title.compareTo(b.title));
          },
          desc: () {
            notes.sort((a, b) => -a.title.compareTo(b.title));
          },
        );
      },
      date: (type) {
        type.when(
          asc: (){
            notes.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          },
          desc: () {
            notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
          },
        );
      },
      color: (type) {
        type.when(
          asc: (){
            notes.sort((a, b) => a.color.compareTo(b.color));
          },
          desc: () {
            notes.sort((a, b) => -a.color.compareTo(b.color));
          },
        );
      },
    );
    return notes;
  }
}
