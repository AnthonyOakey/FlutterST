import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/LogoutWidget.dart';
import '../Widgets/ReturnButtonWidget.dart';
import 'LoginPage.dart';
import 'UserDeletePage.dart';
import 'HomePage.dart';
class LogoutPage extends StatelessWidget {
  static const String id='LogoutPageid';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Row(children: [
            FlatButton(onPressed: (){Navigator.pushNamed(context, LogoutPage.id);}, child: Text('Logout')),
            FlatButton(onPressed: (){Navigator.pushNamed(context, DeleteUserPage.id);}, child: Text('Delete Account')),
            FlatButton(onPressed: (){Navigator.pushNamed(context, HomePage.id);}, child: Text('Home')),



          ],)



      ),
      body: SafeArea(child: Column(children: [
      Logout(),
      ReturnButton(),




    ],),),);
  }
}
