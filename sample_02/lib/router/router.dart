import 'package:go_router/go_router.dart';
import 'package:mask/di/di_setup.dart';
import 'package:mask/presentation/main_screen.dart';
import 'package:mask/presentation/main_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) {
          return getIt.get<MainViewModel>();
        },
        child: const MainScreen(),
      )
    ),
  ],
);