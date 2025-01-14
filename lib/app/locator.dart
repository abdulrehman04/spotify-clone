import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';

var locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(locator);
