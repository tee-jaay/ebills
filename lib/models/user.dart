class User {
  User({
    required this.id,
    required this.email,
    required this.username,
    required this.accessToken,
    required this.isAuthenticated,
  });

  String id;
  String email;
  String username;
  String accessToken;
  bool isAuthenticated = false;
}
