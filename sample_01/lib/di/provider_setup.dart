import 'package:note/data/data_source/note_db_helper.dart';
import 'package:note/data/repository/note_repository_impl.dart';
import 'package:note/domain/repository/note_repository.dart';
import 'package:note/domain/use_case/add_note.dart';
import 'package:note/domain/use_case/delete_note.dart';
import 'package:note/domain/use_case/get_note.dart';
import 'package:note/domain/use_case/get_notes.dart';
import 'package:note/domain/use_case/update_note.dart';
import 'package:note/domain/use_case/use_cases.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:note/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute('CREATE TABLE note ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'title TEXT, '
          'content TEXT, '
          'color INTEGER, '
          'timestamp INTEGER'
          ')');
    },
  );

  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository repository = NoteRepositoryImpl(noteDbHelper);
  UseCases useCases = UseCases(
    getNotes: GetNotes(repository),
    getNote: GetNote(repository),
    addNote: AddNote(repository),
    deleteNote: DeleteNote(repository),
    updateNote: UpdateNote(repository),
  );
  NotesViewModel notesViewModel = NotesViewModel(useCases);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(repository);

  return [
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel),
  ];
}
