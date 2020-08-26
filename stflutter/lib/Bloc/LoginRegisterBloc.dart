import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../Persistent/CoreInfo.dart';
class LoginRegister{


  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _LongKey=StreamController<String>.broadcast();
  final _ShortKey=StreamController<String>.broadcast();
  String _LKey='';
  String _SKey='';


  Stream<String> get LongKey => _LongKey.stream;
  Stream<String> get ShortKey => _ShortKey.stream;
  String get SKey=>_SKey;
  String get LKey=>_LKey;

  void GetPreferences() async {

     final SharedPreferences prefs = await _prefs;

    this._LKey= (await prefs.getString('LKey') ?? '');
    this._SKey= (await prefs.getString('SKey') ?? '');
    print ('GETPREFERENCES');
    print (_LKey);

  }

  void EnterKeys(String L, String S) async{
    print ("L45678");
    print (L);
    print (S);
    final SharedPreferences prefs = await _prefs;
    this._LKey=L;
    await prefs.setString("LKey", L);

    this._SKey=S;
    await prefs.setString("SKey", S);

    print ("OKKKKKKKAFEAFA");
    print (await prefs.getString('SKey'));
    print (await prefs.getString('LKey'));

    this._LongKey.sink.add(L);
    this._ShortKey.sink.add(S);
    print (_LKey);


  }


}

LoginRegister ALoginRegister=LoginRegister();