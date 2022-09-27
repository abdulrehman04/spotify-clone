import 'package:injectable/injectable.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/repository/data_repo.dart';
import 'package:spotify_clone/services/custom_navigation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/user_auth_service.dart';

@lazySingleton
class SplashViewModel extends BaseViewModel {
  CustomNavigationService nav = locator<CustomNavigationService>();
  DataRepo repo = locator<DataRepo>();
  UserAuthService authService = locator<UserAuthService>();

  getToHome() {
    nav.replaceWith('/home');
  }

  getToLogin() {
    nav.replaceWith('/login');
  }
}
