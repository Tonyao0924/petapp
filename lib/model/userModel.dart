class UserModel{
  int id;
  String username;
  String email;
  String? last_name;
  String? first_name;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.last_name,
    this.first_name
  });

  factory UserModel.fromJson (Map<String, dynamic> jsonDecodeMapObj) =>
      UserModel(
          id:jsonDecodeMapObj["id"],
          username: jsonDecodeMapObj["username"],
          email: jsonDecodeMapObj['email'],
          last_name: jsonDecodeMapObj['last_name'],
          first_name: jsonDecodeMapObj['first_name']
      );


}