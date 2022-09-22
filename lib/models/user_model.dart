class UserModel {
  String firstName, email, uid;
  List recentlyPlayed;
  UserModel({
    required this.firstName,
    required this.email,
    required this.uid,
    required this.recentlyPlayed,
  });
}
