// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../repository/data_repo.dart' as _i4;
import '../services/third_party_services.dart' as _i10;
import '../services/user_auth_service.dart' as _i9;
import '../view%20models/bottom_navigation%20view%20model/bottom_navigation_view_model.dart'
    as _i3;
import '../view%20models/home%20view%20model/home_view_model.dart' as _i6;
import '../view%20models/login%20view%20model/login_view_model.dart' as _i7;
import '../view%20models/splash%20view%20model/splash_view_model.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdParty = _$ThirdParty();
  gh.lazySingleton<_i3.BottomNavigationViewModel>(
      () => _i3.BottomNavigationViewModel());
  gh.lazySingleton<_i4.DataRepo>(() => _i4.DataRepo());
  gh.lazySingleton<_i5.DialogService>(() => thirdParty.dialogService);
  gh.lazySingleton<_i6.HomeViewModel>(() => _i6.HomeViewModel());
  gh.lazySingleton<_i7.LoginViewModel>(() => _i7.LoginViewModel());
  gh.lazySingleton<_i5.NavigationService>(() => thirdParty.navigationService);
  gh.lazySingleton<_i8.SplashViewModel>(() => _i8.SplashViewModel());
  gh.lazySingleton<_i9.UserAuthService>(() => _i9.UserAuthService());
  return get;
}

class _$ThirdParty extends _i10.ThirdParty {
  @override
  _i5.DialogService get dialogService => _i5.DialogService();
  @override
  _i5.NavigationService get navigationService => _i5.NavigationService();
}
