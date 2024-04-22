// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:note/data/data_source/note_db_helper.dart' as _i4;
import 'package:note/data/repository/note_repository_impl.dart' as _i6;
import 'package:note/di/app_module.dart' as _i15;
import 'package:note/domain/repository/note_repository.dart' as _i5;
import 'package:note/domain/use_case/add_note.dart' as _i8;
import 'package:note/domain/use_case/delete_note.dart' as _i10;
import 'package:note/domain/use_case/get_note.dart' as _i9;
import 'package:note/domain/use_case/get_notes.dart' as _i11;
import 'package:note/domain/use_case/update_note.dart' as _i7;
import 'package:note/domain/use_case/use_cases.dart' as _i13;
import 'package:note/presentation/add_edit_note/add_edit_note_view_model.dart'
    as _i12;
import 'package:note/presentation/notes/notes_view_model.dart' as _i14;
import 'package:sqflite/sqflite.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.Database>(
      () => appModule.db,
      preResolve: true,
    );
    gh.singleton<_i4.NoteDbHelper>(() => _i4.NoteDbHelper(gh<_i3.Database>()));
    gh.singleton<_i5.NoteRepository>(
        () => _i6.NoteRepositoryImpl(gh<_i4.NoteDbHelper>()));
    gh.singleton<_i7.UpdateNote>(
        () => _i7.UpdateNote(gh<_i5.NoteRepository>()));
    gh.singleton<_i8.AddNote>(() => _i8.AddNote(gh<_i5.NoteRepository>()));
    gh.singleton<_i9.GetNote>(() => _i9.GetNote(gh<_i5.NoteRepository>()));
    gh.singleton<_i10.DeleteNote>(
        () => _i10.DeleteNote(gh<_i5.NoteRepository>()));
    gh.singleton<_i11.GetNotes>(() => _i11.GetNotes(gh<_i5.NoteRepository>()));
    gh.factory<_i12.AddEditNoteViewModel>(
        () => _i12.AddEditNoteViewModel(gh<_i5.NoteRepository>()));
    gh.singleton<_i13.UseCases>(() => _i13.UseCases(
          getNotes: gh<_i11.GetNotes>(),
          getNote: gh<_i9.GetNote>(),
          addNote: gh<_i8.AddNote>(),
          deleteNote: gh<_i10.DeleteNote>(),
          updateNote: gh<_i7.UpdateNote>(),
        ));
    gh.factory<_i14.NotesViewModel>(
        () => _i14.NotesViewModel(gh<_i13.UseCases>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
