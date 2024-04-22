// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:note/data/data_source/note_db_helper.dart' as _i7;
import 'package:note/data/repository/mock_title_repository_impl.dart' as _i5;
import 'package:note/data/repository/note_repository_impl.dart' as _i9;
import 'package:note/data/repository/title_repository_impl.dart' as _i6;
import 'package:note/di/app_module.dart' as _i18;
import 'package:note/domain/repository/note_repository.dart' as _i8;
import 'package:note/domain/repository/title_repository.dart' as _i4;
import 'package:note/domain/use_case/add_note.dart' as _i11;
import 'package:note/domain/use_case/delete_note.dart' as _i13;
import 'package:note/domain/use_case/get_note.dart' as _i12;
import 'package:note/domain/use_case/get_notes.dart' as _i14;
import 'package:note/domain/use_case/update_note.dart' as _i10;
import 'package:note/domain/use_case/use_cases.dart' as _i16;
import 'package:note/presentation/add_edit_note/add_edit_note_view_model.dart'
    as _i15;
import 'package:note/presentation/notes/notes_view_model.dart' as _i17;
import 'package:sqflite/sqflite.dart' as _i3;

const String _dev = 'dev';
const String _prod = 'prod';

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
    gh.singleton<_i4.TitleRepository>(
      () => _i5.MockTitleRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i4.TitleRepository>(
      () => _i6.TitleRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i7.NoteDbHelper>(() => _i7.NoteDbHelper(gh<_i3.Database>()));
    gh.singleton<_i8.NoteRepository>(
        () => _i9.NoteRepositoryImpl(gh<_i7.NoteDbHelper>()));
    gh.singleton<_i10.UpdateNote>(
        () => _i10.UpdateNote(gh<_i8.NoteRepository>()));
    gh.singleton<_i11.AddNote>(() => _i11.AddNote(gh<_i8.NoteRepository>()));
    gh.singleton<_i12.GetNote>(() => _i12.GetNote(gh<_i8.NoteRepository>()));
    gh.singleton<_i13.DeleteNote>(
        () => _i13.DeleteNote(gh<_i8.NoteRepository>()));
    gh.singleton<_i14.GetNotes>(() => _i14.GetNotes(gh<_i8.NoteRepository>()));
    gh.factory<_i15.AddEditNoteViewModel>(
        () => _i15.AddEditNoteViewModel(gh<_i8.NoteRepository>()));
    gh.singleton<_i16.UseCases>(() => _i16.UseCases(
          getNotes: gh<_i14.GetNotes>(),
          getNote: gh<_i12.GetNote>(),
          addNote: gh<_i11.AddNote>(),
          deleteNote: gh<_i13.DeleteNote>(),
          updateNote: gh<_i10.UpdateNote>(),
        ));
    gh.factory<_i17.NotesViewModel>(() => _i17.NotesViewModel(
          gh<_i16.UseCases>(),
          gh<_i4.TitleRepository>(),
        ));
    return this;
  }
}

class _$AppModule extends _i18.AppModule {}
