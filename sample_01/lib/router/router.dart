import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:note/di/di_setup.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:note/presentation/notes/notes_screen.dart';
import 'package:note/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/notes',
  routes: [
    GoRoute(
      path: '/notes',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => getIt<NotesViewModel>(),
          child: const NotesScreen(),
        );
      },
    ),
    GoRoute(
      path: '/add_note',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => getIt<AddEditNoteViewModel>(),
          child: const AddEditNoteScreen(),
        );
      },
    ),
    GoRoute(
      path: '/edit_note',
      builder: (context, state) {
        final Note note = Note.fromJson(jsonDecode(state.uri.queryParameters['note']!));
        return ChangeNotifierProvider(
          create: (_) => getIt<AddEditNoteViewModel>(),
          child: AddEditNoteScreen(
            note: note,
          ),
        );
      },
    ),
  ],
);