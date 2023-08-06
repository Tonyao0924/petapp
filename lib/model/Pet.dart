import 'dart:convert';
Pet welcomeFromJson(String str) => Pet.fromJson(json.decode(str));

String welcomeToJson(Pet data) => json.encode(data.toJson());

class Pet {
  String name;
  int keeper;
  int type;
  String birthday;
  String content;

  Pet({
    required this.name,
    required this.keeper,
    required this.type,
    required this.birthday,
    required this.content,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    name: json["name"],
    keeper: json["keeper"],
    type: json["type"],
    birthday: json["birthday"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "keeper": keeper,
    "type": type,
    "birthday": birthday,
    "content": content,
  };
}
