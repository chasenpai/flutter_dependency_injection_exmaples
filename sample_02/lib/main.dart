import 'package:flutter/material.dart';
import 'package:mask/di/di_setup.dart';
import 'package:mask/presentation/main_screen.dart';
import 'package:mask/presentation/main_view_model.dart';
import 'package:mask/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}