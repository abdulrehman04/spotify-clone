// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;

import '../services/third_party_services.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdParty = _$ThirdParty();
  gh.lazySingleton<_i3.DialogService>(() => thirdParty.dialogService);
  gh.lazySingleton<_i3.NavigationService>(() => thirdParty.navigationService);
  return get;
}

class _$ThirdParty extends _i4.ThirdParty {
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
  @override
  _i3.NavigationService get navigationService => _i3.NavigationService();
}
