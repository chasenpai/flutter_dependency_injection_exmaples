import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

//injectable & get it
import 'di_setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() => getIt.init();