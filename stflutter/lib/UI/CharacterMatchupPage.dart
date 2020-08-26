import 'dart:convert';
import '../Widgets/FGCCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import '../Bloc/AllSTCharactersBloc.dart';
import '../Persistent/Repository.dart';
import '../Bloc/MatchupBloc.dart';
import '../Widgets/MatchUpWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CharacterNotesPage.dart';
import '../Persistent/BackToHomeScreen.dart';
import '../Widgets/TopAppBar.dart';
import '../Widgets/ReturnButtonWidget.dart';
import 'LogoutPage.dart';
import 'UserDeletePage.dart';
import 'HomePage.dart';
class CharacterMatchUp extends StatefulWidget {
  static const String id='CharacterMatchUpid';
  @override
  _CharacterMatchUpState createState() => _CharacterMatchUpState();
}

class _CharacterMatchUpState extends State<CharacterMatchUp> {



  @override
  Widget build(BuildContext context) {
    BackToHomeScreen(context);
    return   Scaffold(appBar: AppBar(

        title: Row(children: [
          FlatButton(onPressed: (){Navigator.pushNamed(context, LogoutPage.id);}, child: Text('Logout')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, DeleteUserPage.id);}, child: Text('Delete Account')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, HomePage.id);}, child: Text('Home')),



        ],)



    ),
        body: SafeArea(child: Column(children:[StreamBuilder(stream:AMatchUp.matchup,builder: (context,AsyncSnapshot<List<MatchUpWidget>> snapshot){

      if (snapshot.hasData) {
        return Expanded(child: ListView(children:snapshot.data,scrollDirection: MediaQuery.of(context).orientation==Orientation.landscape?Axis.horizontal:Axis.vertical));
      } else if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      }
      return Center(child: CircularProgressIndicator());
    }), ReturnButton()]))
    );
  }
}
