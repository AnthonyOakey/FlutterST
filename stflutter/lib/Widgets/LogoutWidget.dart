import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../UI/HomePage.dart';
class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: FlatButton(onPressed: () async {
      var pref =await SharedPreferences.getInstance();

      pref.setString("SKey", '');

      pref.setString("LKey", '');






        Navigator.pushNamed(context, HomePage.id);

    }, child: Text('LOGOUT')),);
  }
}
