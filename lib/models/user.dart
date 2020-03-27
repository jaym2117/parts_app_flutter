class User {
  int id;
  String email;
  String username;
  Role role;

  User({this.id, this.email, this.username, this.role});
}

class Role {
  int id;
  String role;

  Role({this.id, this.role});
}