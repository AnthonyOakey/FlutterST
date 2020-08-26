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
class RegisterPage extends StatefulWidget {
  static const String id='RegisterPageid';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String Email='E';
  String Username='U';
  String Password='P';
  String Error='';
  String SecondPassword='P';
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
        Text('TestField'),
        Container(child:TextFormField(onChanged: (text){
          this.Email=text;

        }, initialValue: 'E',),
        ),
        Container(child:TextFormField(onChanged: (text){
          this.Username=text;

        }, initialValue: 'U',),
        ),
        Container(child:TextFormField(onChanged: (text){
          this.Password=text;

        }, initialValue: 'P',),
        ),

        Container(child:TextFormField(onChanged: (text){
          this.SecondPassword=text;

        }, initialValue: 'P',),
        ),

        SizedBox(height: 50,),
        Container(child: Text(Error),),
        FlatButton(onPressed: () async {
          if (this.SecondPassword!=this.Password) {
            print (this.Username);
            setState(() {
              this.Error='Password Do Not Match';
            });
          }
          else{
            setState(() {
              this.Error='';
            });

            String response=await ARepository.Register(this.Username, this.Password, this.Email);
            if (response!='OK'){
              setState(() {
                this.Error=response;
              });
            }
            else{
              Navigator.pushNamed(context, CharacterPage.id);
            }

          }
        }, child: Text("Submit")),
        ReturnButton(),



      ],
    )));
  }
}
//child:FutureBuilder(future: TempWidgetList,
//builder: (context,snapshot){
//if (snapshot.hasData){
//return Container(child: Expanded(child: ListView(children: snapshot.data,)));


//}
//else{
//return CircularProgressIndicator();
//}

//})
