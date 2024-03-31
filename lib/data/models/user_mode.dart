class UserModel {
  final String uid;
  final String username;
  final String email;
  final String bio;
  final String imageUrl;
  final String password;
  final List following;
  final List followers;

  UserModel({
    required this.uid,
    required this.imageUrl,
    required this.username,
    required this.email,
    required this.bio,
    required this.password,
    required this.following,
    required this.followers,
  });
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "bio": bio,
        "imageUrl": imageUrl,
        "password": password,
        "follwoing": following,
        "follwoers": followers,
      };
}
