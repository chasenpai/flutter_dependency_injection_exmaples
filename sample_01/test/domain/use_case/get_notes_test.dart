import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';
import 'package:note/domain/uitl/note_order.dart';
import 'package:note/domain/uitl/order_type.dart';
import 'package:note/domain/use_case/get_notes.dart';
import 'package:mockito/mockito.dart';

import 'get_notes_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test('sorting test', () async {
    final repository = MockNoteRepository();
    final getNotes = GetNotes(repository);

    //동작 정의 - Dummy data
    when(repository.getNotes()).thenAnswer((_) async => [
      const Note(
        title: 'title1',
        content: 'content1',
        timestamp: 1,
        color: 1,
      ),
      const Note(
        title: 'title2',
        content: 'content2',
        timestamp: 2,
        color: 2,
      ),
    ]);

    List<Note> dateDesc = await getNotes(const NoteOrder.date(OrderType.desc()));
    expect(dateDesc, isA<List<Note>>());
    expect(dateDesc.first.timestamp, 2);
    verify(repository.getNotes());
    List<Note> dataAsc = await getNotes(const NoteOrder.date(OrderType.asc()));
    expect(dataAsc.first.timestamp, 1);

    List<Note> titleDesc = await getNotes(const NoteOrder.title(OrderType.desc()));
    expect(titleDesc.first.title, 'title2');
    List<Note> titleAsc= await getNotes(const NoteOrder.title(OrderType.asc()));
    expect(titleAsc.first.title, 'title1');

    List<Note> colorDesc = await getNotes(const NoteOrder.color(OrderType.desc()));
    expect(colorDesc.first.color,  2);
    List<Note> colorAsc = await getNotes(const NoteOrder.color(OrderType.asc()));
    expect(colorAsc.first.color,  1);
  });
}