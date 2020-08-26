import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import '../Widgets/FGCCardWidget.dart';
import '../Persistent/Repository.dart';
import '../Persistent/CoreInfo.dart';
class ResetDeleteAPI{
  String _baseurl=basicurl;



  Future<String> DeleteAccountAPI(String Username, String Password, String Email) async{
    print ("DELETING");
    print (_baseurl+'DeleteUser/?email=$Email&username=$Username&password=$Password');
    var response=await http.post(_baseurl+'DeleteUser/?email=$Email&username=$Username&password=$Password');
    var temp= json.decode(response.body);
    print (temp);
    return temp['message'];
  }

  Future<String> RequestPasswordResetAPI(String Username, String Email) async {
    print (_baseurl+'passwordreset/?user=$Username&email=$Email&password=password');

    var response=await http.post(_baseurl+'passwordreset/?user=$Username&email=$Email&password=password');

    print ('REset');
    var temp= json.decode(response.body);
    print (temp);
    return temp['message'];


  }
  Future<String> ResetPasswordAPI(String Token, String Password) async {
    print ("UPDATING");
    print (_baseurl+'PasswordUpdate/?token=$Token&password=$Password');
    var response=await http.post(_baseurl+'PasswordUpdate/?token=$Token&password=$Password');
    var temp= json.decode(response.body);
    print (temp);
    return temp['message'];
  }



}


ResetDeleteAPI AResetDeleteAPI=ResetDeleteAPI();