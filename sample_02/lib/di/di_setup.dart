import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'di_setup.config.dart';

final getIt = GetIt.instance;

const dev = Environment('dev');
const test = Environment('test');

@InjectableInit()
void configureDependencies() => getIt.init(environment: Environment.dev);