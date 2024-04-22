import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

//injectable & get it
import 'di_setup.config.dart';

final getIt = GetIt.instance;

//환경 구성
const dev = Environment('dev');
const prod = Environment('prod');

@InjectableInit()
Future<void> configureDependencies() => getIt.init(environment: Environment.dev);