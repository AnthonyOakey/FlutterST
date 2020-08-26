import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:stflutter/UI/HomePage.dart';

import '../Widgets/FGCCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import '../Bloc/AllSTCharactersBloc.dart';
import '../Persistent/Repository.dart';
import '../Widgets/TopAppBar.dart';
import 'LogoutPage.dart';
import 'UserDeletePage.dart';

class CharacterPage extends StatefulWidget {
  static const String id='CharacterPageID';

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    Repository Rep=Repository();
    Rep.GetAllCharacters();
    return Scaffold(appBar: AppBar(

        title: Row(children: [
          FlatButton(onPressed: (){Navigator.pushNamed(context, LogoutPage.id);}, child: Text('Logout')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, DeleteUserPage.id);}, child: Text('Delete Account')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, HomePage.id);}, child: Text('Home')),



        ],)



    ),
      body: SafeArea(child: StreamBuilder(stream:AllST.Characters,builder: (context,AsyncSnapshot<List<FGCCard>> snapshot){

        if (snapshot.hasData) {
          return Expanded(child: ListView(children:snapshot.data,scrollDirection: MediaQuery.of(context).orientation==Orientation.landscape?Axis.horizontal:Axis.vertical,));
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      }),),
    );
  }
}
