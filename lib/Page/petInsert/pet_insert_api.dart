import 'dart:convert';
import 'package:http/http.dart' as http;
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

abstract class ApiPetData {
  Future<String> createPet(Pet body);

  Future<String> getPet(int id);

  Future<String> updatePet(int id, Pet body);
}
class PetRepository implements ApiPetData {
  final client = http.Client();
  final String domain = "http://140.125.207.230:8000/swagger/pet/";


  @override
  Future<String> createPet(Pet body) {
    return _createUser(
      Uri.parse('$domain/pet/'),
      body,
    );
  }
  Future<String> _createUser(
      Uri url,
      Pet body,
      ) async {
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body.toJson(),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> getPet(int id) {
    // TODO: implement getPet
    throw UnimplementedError();
  }

  @override
  Future<String> updatePet(int id, Pet body) {
    // TODO: implement updatePet
    throw UnimplementedError();
  }
}
