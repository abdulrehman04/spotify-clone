import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class BottomNavigationViewModel extends BaseViewModel {
  int currentIndex = 0;

  updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
