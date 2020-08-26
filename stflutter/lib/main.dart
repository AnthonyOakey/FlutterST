import 'package:flutter/material.dart';
import 'package:stflutter/UI/ResetRequestPage.dart';
import 'UI/HomePage.dart';

import 'file:///C:/Users/aoakey/AndroidStudioProjects/stflutter/lib/UI/RegisterPage.dart';
import 'UI/CharacterListPage.dart';
import 'UI/CharacterMatchupPage.dart';
import 'Bloc/LoginRegisterBloc.dart';
import 'UI/LoginPage.dart';
import 'UI/CharacterNotesPage.dart';
import 'UI/LogoutPage.dart';
import 'UI/UserDeletePage.dart';
import 'UI/PasswordResetPage.dart';
import 'UI/ResetRequestPage.dart';
import 'UI/PasswordResetPage.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    ALoginRegister.GetPreferences();
    // TODO: implement build
    return
        MaterialApp(
          color: Colors.white,
          initialRoute: HomePage.id,
          routes: {
            HomePage.id:(context)=> HomePage(),
            RegisterPage.id:(context)=>RegisterPage(),
            CharacterPage.id:(context)=>CharacterPage(),
            CharacterMatchUp.id:(context)=>CharacterMatchUp(),
            LoginPage.id:(context)=>LoginPage(),
            NotesPage.id:(context)=>NotesPage(),
            LogoutPage.id:(context)=>LogoutPage(),
            DeleteUserPage.id:(context)=>DeleteUserPage(),
            ResetRequestPage.id:(context)=>ResetRequestPage(),
            PasswordResetPage.id:(context)=>PasswordResetPage(),



          },
        );
  }
}