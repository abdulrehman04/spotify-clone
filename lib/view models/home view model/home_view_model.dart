import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class HomeViewModel extends BaseViewModel {
  getWelcomeMsg() {
    DateTime now = DateTime.now();
    print(now.hour);
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
}
