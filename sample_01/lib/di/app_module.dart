
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

//써드파티 객체 의존성 주입
@module
abstract class AppModule {

  @preResolve //future
  Future<Database> get db async => openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE note ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'title TEXT, '
          'content TEXT, '
          'color INTEGER, '
          'timestamp INTEGER'
        ')',
      );
    },
  );
}