class UserModel {
  String firstName, email, uid;
  List recentlyPlayed;
  List likedPlaylists;
  List likedArtists;
  List likedSongs;
  UserModel({
    required this.firstName,
    required this.email,
    required this.uid,
    required this.recentlyPlayed,
    required this.likedPlaylists,
    required this.likedArtists,
    required this.likedSongs,
  });
}
