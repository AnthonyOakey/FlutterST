//Use Shared Preferences to store AKey for Later https://flutter.dev/docs/cookbook/persistence/key-value
// Set AKey if found in storage
// If ShortKey still set skip page, If not Check if log term is set then referesh, and if neither then login
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import '../Widgets/ReturnButtonWidget.dart';
import '../Persistent/Repository.dart';
import 'CharacterListPage.dart';
import '../Widgets/TopAppBar.dart';
import 'LogoutPage.dart';
import 'UserDeletePage.dart';
import 'HomePage.dart';
class LoginPage extends StatefulWidget {
  static const String id='LoginPageID';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String Username='U';
  String Password='P';
  String Error='';
  Widget temp=Text('');
  Future<List<Widget>> TempWidgetList;





  @override
  Widget build(BuildContext context) {




    return Scaffold(appBar: AppBar(

        title: Row(children: [
          FlatButton(onPressed: (){Navigator.pushNamed(context, LogoutPage.id);}, child: Text('Logout')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, DeleteUserPage.id);}, child: Text('Delete Account')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, HomePage.id);}, child: Text('Home')),



        ],)



    ),body:SafeArea(child:Column(
      children: [
        Text('Log IN'),

        Container(child:TextFormField(onChanged: (text){
          this.Username=text;

        }, initialValue: 'Username',),
        ),
        Container(child:TextFormField(onChanged: (text){
          this.Password=text;

        }, initialValue: 'Password',),
        ),



        SizedBox(height: 50,),
        Container(child: Text(Error),),
        FlatButton(onPressed: () async {


            String response=await ARepository.Login(this.Username, this.Password);

            setState(() {
              this.Error=response;
            });
            if (response=='OK'){Navigator.pushNamed(context, CharacterPage.id);}



          }
        , child: Text("Submit")),
        ReturnButton(),



      ],
    )));
  }
}
