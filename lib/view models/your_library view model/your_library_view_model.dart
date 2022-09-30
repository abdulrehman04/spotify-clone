import 'package:injectable/injectable.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/repository/data_repo.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class YourLibraryViewModel extends BaseViewModel {
  final DataRepo dataRepo = locator<DataRepo>();
  bool get isDataFetched {
    notifyListeners();
    return dataRepo.dataFetched;
  }

  getLikedPlaylists() {
    return dataRepo.likedPlaylists;
  }

  runInit() {
    print(dataRepo.dataFetched);
  }
}
