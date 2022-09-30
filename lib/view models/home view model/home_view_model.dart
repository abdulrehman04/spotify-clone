import 'package:injectable/injectable.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/repository/data_repo.dart';
import 'package:spotify_clone/services/user_auth_service.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class HomeViewModel extends BaseViewModel {
  final DataRepo dataRepo = locator<DataRepo>();
  final UserAuthService auth = locator<UserAuthService>();

  getWelcomeMsg() {
    DateTime now = DateTime.now();
    if (now.hour > 0 && now.hour < 6) {
      return "Night";
    } else if (now.hour > 6 && now.hour < 12) {
      return 'Morning';
    } else if (now.hour > 12 && now.hour < 16) {
      return 'Afternoon';
    } else {
      return "Evening";
    }
  }

  fetchUserData() async {
    if (!dataRepo.dataFetched) {
      await dataRepo.fetchUserData(auth.currentUser.recentlyPlayed);
      notifyListeners();
    }
  }
}
