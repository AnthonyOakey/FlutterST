import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import '../Widgets/FGCCardWidget.dart';
import '../Persistent/Repository.dart';
import '../Persistent/CoreInfo.dart';

class LoginRegisterAPI{
  String _baseurl=basicurl;


  Future<List> LoginAPI (String Username, String Password) async{
    print ("REEEEEF");
    print (_baseurl+'Login/?user=$Username&password=$Password');
    var response=await http.get(_baseurl+'Login/?user=$Username&password=$Password');
    print ("QTFA");
    print (response.body);
    var list=[];
    var temp= json.decode(response.body);
    try{
      print (temp[0]['jwttoken']);
      list.add('OK');
      list.add(temp[0]['jwttoken']);
      print (temp[0]['jwtrefresh']);
      list.add(temp[0]['jwtrefresh']);}
    catch(e){

      list.add(temp['message']);
    }
    print (list);
    return list;
  }
  Future<List> RegisterAPI(String Username, String Password, String Email) async{
    print ('REg111');
    print (Username);
    print (Password);
    print (Email);
    print ('REg');
    print (_baseurl+'Register/?password=$Password&user=$Username&email=$Email');
    var response=await http.post(_baseurl+'Register/?password=$Password&user=$Username&email=$Email');
    var temp=json.decode(response.body);
    var list=[];
    try {list.add(temp['message']);}catch(e){list.add('OK');list.add(temp[0]['jwttoken']);list.add(temp[0]['jwtrefresh']);};

    print(list.toString());
    print ("KKK");

    return list;
  }




}

LoginRegisterAPI ALoginRegisterAPI=LoginRegisterAPI();