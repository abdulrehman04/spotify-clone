import 'package:injectable/injectable.dart';
import 'package:spotify_clone/ui/views/home/home_view.dart';
import 'package:spotify_clone/ui/views/your%20library/your%20library%202.dart';
import 'package:spotify_clone/ui/views/your%20library/your_library.dart';
import 'package:stacked/stacked.dart';

import '../../app/locator.dart';
import '../../services/custom_navigation_service.dart';
import '../../ui/views/search/search.dart';

@lazySingleton
class BottomNavigationViewModel extends BaseViewModel {
  int currentIndex = 0;
  List navKeys = [
    locator<CustomNavigationService>().homeKey,
    locator<CustomNavigationService>().searchKey,
    locator<CustomNavigationService>().libraryKey
  ];
  final List pages = [const HomeView(), const Search(), const YourLibrary()];

  updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
