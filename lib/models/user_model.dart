class UserModel {
  String? uid;
  String? email;
  String? password;
  String? username;

  UserModel({this.email, this.password, this.username, uid});

  factory UserModel.fromJson(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      username: map['phoneNumber'] ?? '',
    );
  }
  toFirebase() {
    return {
      "uid": uid,
      "email": email,
      "password": password,
      "username": username,
    };
  }
}
