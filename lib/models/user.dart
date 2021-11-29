class User {
  final String uid;
  final String password;
  final String name;

  User(this.uid, this.password, this.name);
  String getName() {
    return name;
  }

  String getPassword() {
    return password;
  }

  String getUid() {
    return uid;
  }
}
