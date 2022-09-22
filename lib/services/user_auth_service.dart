import 'dart:async';

import 'package:injectable/injectable.dart';

import '../constants.dart';
import '../models/user_model.dart';

enum LoginStates {
  waiting,
  loggedIn,
  notLoggedIn,
}

@lazySingleton
class UserAuthService {
  late UserModel currentUser;
  StreamController loggedIn = StreamController.broadcast();

  isUserLoggedIn() {
    if (auth.currentUser == null) {
      loggedIn.add(LoginStates.notLoggedIn);
    } else {
      _getCurrentUser();
    }
  }

  _getCurrentUser() {
    startUserStream();
  }

  startUserStream() {
    db
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .snapshots()
        .listen((value) {
      loggedIn.add(LoginStates.loggedIn);
      setUserData(
        firstName: value['name'],
        email: value['email'],
        uid: value.id,
        recentlyPlayed: value['recentlyPlayed'],
      );
    });
  }

  Future pushUserToDb(email, first, uid, type) async {
    await db.collection("Users").doc(uid).set({
      "name": first,
      'email': email,
      'type': type,
    });
    return true;
  }

  setLogout() {
    loggedIn.add(LoginStates.notLoggedIn);
  }

  setLogin() {
    loggedIn.add(LoginStates.loggedIn);
  }

  setUserData(
      {required firstName,
      required email,
      required uid,
      required recentlyPlayed}) {
    currentUser = UserModel(
        firstName: firstName,
        email: email,
        uid: uid,
        recentlyPlayed: recentlyPlayed);
  }
}
