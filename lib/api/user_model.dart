

class UserModel {

  String username;
  String password;

  UserModel({
    required this.username,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username : json['username'],
    password : json['password'],
  );

  Map<String, dynamic> toJson() => {
    'username' : username,
    'password' : password,
  };

}