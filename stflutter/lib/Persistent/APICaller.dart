import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import '../Widgets/FGCCardWidget.dart';
import 'Repository.dart';
import '../APICalls/NotesAPI.dart';
import '../APICalls/CharacterAPI.dart';
import '../APICalls/LoginRegisterAPI.dart';
import '../APICalls/ResetDeleteAPI.dart';
import '../APICalls/TokenAPI.dart';
class APICalls{

  String _baseurl='http://10.0.2.2:3000/';




  Future<String> CheckTokens(String Token) async{
    return ATokenAPI.CheckTokensAPI(Token);


  }

  Future<String> ResetRequest(String Username, String Email) async {
    return await AResetDeleteAPI.RequestPasswordResetAPI(Username, Email);
}

Future<String> ResetPassword(String Token, String Password) async{
    return await AResetDeleteAPI.ResetPasswordAPI(Token, Password);
}




  Future<List> GetAllCharcters() async{
    return ACharacterAPI.GetAllCharctersAPI();
  }

  Future<List> GetCharacterMatchUP(String Character) async{

    return ACharacterAPI.GetCharacterMatchUPAPI(Character);
  }

  Future<List> GetNotes(String Token, String Character, String SecondCharacter) async{

    return ANotesAPI.GetNotesAPI(Token, Character, SecondCharacter);
  }

  Future<List> AddNotes(String Token, String Character, String SecondCharacter,String Note) async{
    return ANotesAPI.AddNotesAPI(Token, Character, SecondCharacter, Note);
  }

  Future<List> RefreshToken(String Token) async{
   return ATokenAPI.RefreshTokenAPI(Token);
  }

  Future<List> Login (String Username, String Password) async{
    return ALoginRegisterAPI.LoginAPI(Username, Password);
  }

  Future<List> Register(String Username, String Password, String Email) async{
 return ALoginRegisterAPI.RegisterAPI(Username, Password, Email);
  }

  Future<List> DeleteAccount(String Username, String Password, String Token) async{
    var response=await http.delete(_baseurl+'/DeleteAccount/?username=$Username&password=$Password&token=$Token');
    return json.decode(response.body);
  }




}