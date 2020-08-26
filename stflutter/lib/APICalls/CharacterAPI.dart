import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import '../Widgets/FGCCardWidget.dart';
import '../Persistent/Repository.dart';
import '../Persistent/CoreInfo.dart';

class CharacterAPI{

  String _baseurl=basicurl;


  Future<List> GetAllCharctersAPI() async{
    var response = await http.get(this._baseurl+'Characters');
    var temp=json.decode(response.body);
    return  temp;
  }

  Future<List> GetCharacterMatchUPAPI(String Character) async{

    var response=await http.get(_baseurl+'CharaterTable/?name='+Character);

    var temp=json.decode(response.body);
    print ("TT");
    print (temp);
    return temp;
  }
}

CharacterAPI ACharacterAPI=CharacterAPI();