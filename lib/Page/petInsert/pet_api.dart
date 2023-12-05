import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:petapp/Api/ApiInfo.dart';

import '../../model/Pet.dart';
abstract class ApiPetData {
  Future<bool> createPet(FormData body);
  Future<bool> editPet(FormData body,String id);

  Future<List<dynamic>> getPetList(String type);
  Future<List<dynamic>> getPetListAll();

  Future<Map<String, dynamic>> getPetinfo(int id);

  Future<Map<String, dynamic>> getPettype(int id);

  Future<String> updatePet(int id, Pet body);
}
class PetRepository implements ApiPetData {
  final client = http.Client();
  final String domain = ApiInfo.domain;

  @override
  Future<bool> createPet(FormData body) async {
    final dio = Dio();
    var headers = {
      'Content-Type': 'application/json'
    };
    final response = await dio.post('$domain/pet/', data: body);
    print(response.statusCode );
    if (response.statusCode == 201) {
      return true;
    }
    else {
      return false;
    }
  }
  @override
  Future<bool> editPet(FormData body,String id) async {
    final dio = Dio();
    var headers = {
      'Content-Type': 'application/json'
    };

    print('$domain/pet/$id/');
    final response = await dio.patch('$domain/pet/$id/', data: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }

  @override
  Future<List<dynamic>> getPetList(String type) async {
    var url = Uri.parse('$domain/pet/list/$type/'); // 替換成你要串接的API網址

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // 成功接收到資料
      var data = json.decode(utf8.decode(response.bodyBytes)); // 取得回傳的資料內容
      print("data");
      print(data);
      // 在這裡處理資料
      return data;
    } else {
      // 請求失敗
      throw Exception('API 請求失敗');
    }
  }

  @override
  Future<List<dynamic>> getPetListAll() async {
    var url = Uri.parse('$domain/pet/list/'); // 替換成你要串接的API網址

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // 成功接收到資料
      var data = json.decode(utf8.decode(response.bodyBytes)); // 取得回傳的資料內容
      print("data");
      print(data);
      // 在這裡處理資料
      return data;
    } else {
      // 請求失敗
      throw Exception('API 請求失敗');
    }
  }
  @override
  Future<Map<String, dynamic>> getPetinfo(int id) async {
    var url = Uri.parse('$domain/pet/$id/'); // 替換成你要串接的API網址

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // 成功接收到資料
      var data = json.decode(utf8.decode(response.bodyBytes)); // 取得回傳的資料內容
      print("info");
      print(data);
      // 在這裡處理資料
      return data;
    } else {
      // 請求失敗
      throw Exception('API 請求失敗');
    }
  }
  @override
  Future<Map<String, dynamic>> getPettype(int id) async {
    var url = Uri.parse('$domain/petType/$id/'); // 替換成你要串接的API網址

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // 成功接收到資料
      var data = json.decode(utf8.decode(response.bodyBytes)); // 取得回傳的資料內容
      print("type");
      print(data);
      // 在這裡處理資料
      return data;
    } else {
      // 請求失敗
      throw Exception('API 請求失敗');
    }
  }

  @override
  Future<String> updatePet(int id, Pet body) {
    // TODO: implement updatePet
    throw UnimplementedError();
  }

}
