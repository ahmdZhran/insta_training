class UserModel {
  final String name;
  final String uid;
  final String username;
  final String email;
  final String bio;
  final String password;
  final List following;
  final List followers;

  UserModel({
    required this.name,
    required this.uid,
    required this.username,
    required this.email,
    required this.bio,
    required this.password,
    required this.following,
    required this.followers,
  });
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "username": username,
        "bio": bio,
        "password": password,
        "follwoing": following,
        "follwoers": followers,
      };
}
