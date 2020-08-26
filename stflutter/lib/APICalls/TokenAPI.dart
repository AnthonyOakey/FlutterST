import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import '../Widgets/FGCCardWidget.dart';
import '../Persistent/Repository.dart';
import '../Persistent/CoreInfo.dart';
class TokenAPI{
  String _baseurl=basicurl;

  Future<String> CheckTokensAPI(String Token) async{
    print ('TOKE');
    print ('');
    var response=await http.get(this._baseurl+'TestToken/?token=$Token');
    print ('TOKE1');
    var temp=json.decode(response.body);
    print (temp);
    if (temp['message']=='Good'){
      print ('TOKE11');
      return 'OK';
    }
    else {return temp['message'];}


  }


  Future<List> RefreshTokenAPI(String Token) async{
    print ("REEEET");
    print (_baseurl+'Refresh/?longtoken=$Token');
    var response= await http.post(_baseurl+'Refresh/?longtoken=$Token');
    return json.decode(response.body);
  }




}


TokenAPI ATokenAPI=TokenAPI();