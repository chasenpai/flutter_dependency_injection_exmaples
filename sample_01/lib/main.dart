import 'package:flutter/material.dart';
import 'package:note/di/di_setup.dart';
import 'package:note/router/router.dart';
import 'package:note/ui/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: darkGray,
        canvasColor: darkGray,
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(
                  backgroundColor: Colors.white,
                  foregroundColor: darkGray,
                ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: darkGray,
              elevation: 0,
            ),
        unselectedWidgetColor: Colors.white,
        useMaterial3: false,
      ),
    );
  }
}
