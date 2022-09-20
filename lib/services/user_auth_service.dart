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

  // UserAuthService() {
  //   _isUserLoggedIn();
  // }

  isUserLoggedIn() {
    if (auth.currentUser == null) {
      // print("Ni tha");
      loggedIn.add(LoginStates.notLoggedIn);
      // print(loggedIn.stream.last.then((value) => print(value)));
    } else {
      // loggedIn.add(LoginStates.loggedIn);
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

  setUserData({
    required firstName,
    required email,
    required uid,
  }) {
    currentUser = UserModel(
      firstName: firstName,
      email: email,
      uid: uid,
    );
  }
}
