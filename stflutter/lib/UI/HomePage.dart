import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stflutter/UI/CharacterListPage.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Persistent/Repository.dart';
import 'LoginPage.dart';
import '../Widgets/TopAppBar.dart';
import 'LogoutPage.dart';
import 'UserDeletePage.dart';
import 'ResetRequestPage.dart';
//Buttons for Login and Register only appear if AKey short and long key not set in
// https://flutter.dev/docs/cookbook/persistence/key-value shared preferences




class HomePage extends StatelessWidget {
  static const String id='HomePageid';

  void LoadandTestToken(context) async {



    var pref =await SharedPreferences.getInstance();

    var SKEY= (pref.getString('SKey'));

    var LKEY= (pref.getString('LKey'));
    print ("HOMEPAGE");
    print (SKEY);
    print (LKEY);

var temp= await ARepository.CheckToken();


    if (temp=='OK'){

      ARepository.RefreshInfo(LKEY);

      Navigator.pushNamed(context, CharacterPage.id);
    }


  }


  @override
  Widget build(BuildContext context) {
    print ("KKQ");
    LoadandTestToken(context);


    return Scaffold(appBar: AppBar(

        title: Row(children: [
          FlatButton(onPressed: (){Navigator.pushNamed(context, LogoutPage.id);}, child: Text('Logout')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, DeleteUserPage.id);}, child: Text('Delete Account')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, HomePage.id);}, child: Text('Home')),



        ],)



    ),body:SafeArea(child: Column(
      children: [
        FlatButton(onPressed: (){
          Navigator.pushNamed(context, RegisterPage.id);
        }, child: Text('Register')),
        FlatButton(onPressed: (){
          Navigator.pushNamed(context, LoginPage.id);
        }, child: Text('Login')),
        FlatButton(onPressed: (){
          Navigator.pushNamed(context, ResetRequestPage.id);
        }, child: Text('Reset Password')),


      ],
    )));
  }
}




