import 'Repository.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../UI/HomePage.dart';
import 'package:flutter/material.dart';
import '../Persistent/CoreInfo.dart';
void BackToHomeScreen(context) async{

  var pref =await SharedPreferences.getInstance();

  var SKEY= (await pref.getString('SKey'));

  var LKEY= (await pref.getString('LKey'));

  print ("CHEC123");
  print (SKEY);
  print (LKEY);

  var temp= await ARepository.CheckToken();


  if (temp!='OK'){



    Navigator.pushNamed(context, HomePage.id);
  }

}