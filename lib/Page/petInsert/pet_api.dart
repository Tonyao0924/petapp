import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:petapp/Api/ApiInfo.dart';

import '../../model/Pet.dart';
abstract class ApiPetData {
  Future<String> createPet(Pet body);

  Future<String> getPetList(String type);

  Future<String> updatePet(int id, Pet body);
}
class PetRepository implements ApiPetData {
  final client = http.Client();
  final String domain = ApiInfo.domain;

  @override
  Future<String> createPet(Pet body) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$domain/pet/'));
    print(body.toJson());
    request.body = json.encode(body.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    else {
      return await response.stream.bytesToString();
    }
  }

  // @override
  // Future<String> getPetList(String type) async {
  //   print(type);
  //     var headers = {
  //       'Content-Type': 'application/json'
  //     };
  //     var request = http.Request('GET', Uri.parse('$domain/pet/list/$type/'));
  //     request.headers.addAll(headers);
  //
  //     http.StreamedResponse response = await request.send();
  //     if (response.statusCode == 200) {
  //       return await response.stream.bytesToString();
  //
  //     }
  //     else {
  //       return await response.stream.bytesToString();
  //     }
  // }

  @override
  Future<String> getPetList(String type) async {
    var url = Uri.parse('$domain/pet/list/$type/'); // 替換成你要串接的API網址

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // 成功接收到資料
      var data = response.body; // 取得回傳的資料內容
      // 在這裡處理資料
      return data;
    } else {
      // 請求失敗
      print('請求失敗：${response.statusCode}');
      return "fail";
    }
  }

  @override
  Future<String> updatePet(int id, Pet body) {
    // TODO: implement updatePet
    throw UnimplementedError();
  }
}
