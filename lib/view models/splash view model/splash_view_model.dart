import 'package:injectable/injectable.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/repository/data_repo.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/user_auth_service.dart';

@lazySingleton
class SplashViewModel extends BaseViewModel {
  NavigationService nav = locator<NavigationService>();
  DataRepo repo = locator<DataRepo>();
  UserAuthService authService = locator<UserAuthService>();

  getState() {
    print(authService.loggedIn.stream.last.then((value) {
      print(value);
    }));
  }

  Future<bool> fetchData() async {
    bool result = await repo.fetchData();
    return result;
  }

  getToHome() {
    nav.replaceWith('/home');
  }

  getToLogin() {
    nav.replaceWith('/login');
  }
}
