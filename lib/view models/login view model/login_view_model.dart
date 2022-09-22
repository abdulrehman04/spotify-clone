import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/services/user_auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class LoginViewModel extends BaseViewModel {
  UserAuthService authService = locator<UserAuthService>();
  NavigationService nav = locator<NavigationService>();

  googleLogin() async {
    await GoogleSignIn().signOut();
    GoogleSignInAccount? google = await GoogleSignIn().signIn();
    if (google != null) {
      final GoogleSignInAuthentication googleAuth = await google.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential authUser =
          await FirebaseAuth.instance.signInWithCredential(credential);
      DocumentSnapshot value = await FirebaseFirestore.instance
          .collection("Users")
          .doc(authUser.user!.uid)
          .get();
      if (value.exists) {
        authService.setUserData(
          firstName: value['name'],
          email: value['email'],
          uid: value.id,
          recentlyPlayed: value['recentlyPlayed'],
        );
        authService.setLogin();
      } else {
        await authService.pushUserToDb(
          google.email,
          google.displayName,
          authUser.user!.uid,
          "google",
        );
        authService.setUserData(
          firstName: google.displayName,
          email: google.email,
          uid: authUser.user!.uid,
          recentlyPlayed: value['recentlyPlayed'],
        );
        authService.setLogin();
      }
    }
  }

  getToHome() {
    nav.navigateTo('/home');
  }
}
