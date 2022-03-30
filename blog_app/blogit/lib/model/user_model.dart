class UserModel {
  String uid = '';
  String name = '';
  String email = '';

  UserModel({required this.uid, required this.name, required this.email});

  // get user data fromm server

  factory UserModel.fromMap(map) {
    return UserModel(uid: map['uid'], name: map['name'], email: map['email']);
  }

  // send data to server
  Map<String, dynamic> sendToServer() {
    return {'uid': uid, 'name': name, 'email': email};
  }
}
