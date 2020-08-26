import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import '../Widgets/FGCCardWidget.dart';
import '../Persistent/Repository.dart';
import '../Persistent/CoreInfo.dart';

class NotesAPI{
  String _baseurl=basicurl;

  Future<List> GetNotesAPI(String Token, String Character, String SecondCharacter) async{
    print ('GETTING NOTES');
    print (_baseurl+'/Notes/?token=$Token&primarycharacter=$Character&secondcharacter=$SecondCharacter');
    var response=await http.get(_baseurl+'Notes/?token=$Token&primarycharacter=$Character&secondcharacter=$SecondCharacter');
    print (response.body);
    return json.decode(response.body);
  }

  Future<List> AddNotesAPI(String Token, String Character, String SecondCharacter,String Note) async{
    print ('GETTING NOTES2');
    print(_baseurl+'Notes/?token=$Token&primarycharacter=$Character&secondcharacter=$SecondCharacter&notes=$Note&extra=nothing');
    var response=await http.post(_baseurl+'Notes/?token=$Token&primarycharacter=$Character&secondcharacter=$SecondCharacter&notes=$Note&extra=nothing');
    print (response.body);
    return json.decode(response.body);
  }

}
NotesAPI ANotesAPI=NotesAPI();