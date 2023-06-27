import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'config.dart';


abstract class AuthManager{

  Future<String> oAuthLogin(String email);
  Future<String> oAuthRegister(String username,String password,String email);

  Future<String> login(String username,String password);
  Future<String> register(String username,String password,String email);

}

class AuthRepository implements AuthManager{
  static const url = ServerConfig.url;
  Future<String> _oAuthLogin(String email) async{
    try{
      var response = await http.post(
          Uri.parse('$url/api/account/oauth/login/'),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: {
            "email":email,
          }
      ).then((response) {
        if (response.statusCode == 200) {
          debugPrint("Request Success");
          Utf8Decoder utf8decoder = const Utf8Decoder();
          String backResult = json.decode(utf8decoder.convert(response.bodyBytes));
          debugPrint(backResult);
        } else {
          debugPrint('Request Error：${response.statusCode}');
        }
      });
      return response.body;
    }on Error catch(error){
      debugPrint(error.toString());
    }
    return Future.value("Failed");
  }
  Future<String> _oAuthRegister(String username,String password,String email) async{
    try{
      var body = jsonEncode({
        "username":username,
        "password":password,
        "email":email,
      });
      debugPrint('$url/api/account/oauth/register/');
      var response = await http.post(
          Uri.parse('$url/api/account/oauth/register/'),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: body
      );
      return response.body;
    }on Error catch(error){
      debugPrint(error.toString());
    }
    return Future.value("Failed");
  }

  Future<String> _login(String username,String password) async{
    try{
      var response = await http.post(
          Uri.parse('$url/api/account/login/'),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: {
            "username":username,
            "password":password,
          }
      );
      return response.body;
    }on Error catch(error){
      debugPrint(error.toString());
    }
    return Future.value("Failed");
  }

  Future<String> _register(String username,String password,String email) async{
    try{
      var response = await http.post(
          Uri.parse('$url/api/account/register'),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: {
            "username":username,
            "password":password,
            "email":email,
          }
      );
      return response.body;
    }on Error catch(error){
      debugPrint(error.toString());
    }
    return Future.value("Failed");
  }
  @override
  Future<String> oAuthLogin(String email) {
    return _oAuthLogin(email);
  }
  @override
  Future<String> oAuthRegister(String username,String password,String email){
    return _oAuthRegister(username, password, email);
  }

  @override
  Future<String> login(String username, String password) {
    return _login(username,password);
  }

  @override
  Future<String> register(String username, String password, String email) {
    return _register(username, password, email);
  }
}