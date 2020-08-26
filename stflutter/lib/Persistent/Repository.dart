import 'package:flutter/material.dart';
import 'package:stflutter/APICalls/ResetDeleteAPI.dart';
import 'APICaller.dart';
import '../Bloc/AllSTCharactersBloc.dart';
import '../Bloc/NotesBloc.dart';
import '../Bloc/MatchupBloc.dart';
import 'KeyClass.dart';
import '../Bloc/LoginRegisterBloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../Bloc/SavedMatchesBloc.dart';
import '../UI/CharacterNotesPage.dart';
import '../Persistent/CoreInfo.dart';
class Repository{



  APICalls API=APICalls();


  void SaveToList(String Primary, String Secondary,context) async{
    var pref = await SharedPreferences.getInstance();
    var SKEY= (await pref.getString('SKey'));
    //ARepository.GetNotes(SKEY, Primary, Secondary);
    //Navigator.pushNamed(context, NotesPage.id);
  }

  Future<String> Register(String Username, String Password, String Email) async{
    var temp=await API.Register(Username, Password, Email);
    print ("QQQQQ");

    print (temp);

    if(temp[0]!='OK'){  print ("KK"); print(temp[0]);return temp[0].toString();}else {
      ALoginRegister.EnterKeys(temp[1], temp[2]);
    return 'OK';
    }


  }

  void GetAllCharacters() async {
    var temp=await API.GetAllCharcters();
    AllST.AddCharacters(temp);

  }

  void GetNotes(String Token,String Character, String SecondCharacter) async {
    var temp=await(API.GetNotes(Token, Character, SecondCharacter));
    ANotes.AddInfo(Character, SecondCharacter);


    try{

      ANotes.AddGeneric(temp[0]['notes1']);
    ANotes.AddPersonal(temp[0]['notes2']);}catch (e){ANotes.AddGeneric(temp[0]['notes1']);ANotes.AddPersonal('');}
  }

  void UpdateNotes(String Token, String Character, String SecondCharacter, String Note) async{


    print ("GEGAGEAG");
print (Note);
    var temp=await(API.AddNotes(Token, Character, SecondCharacter, Note));
    print ('UPDATEEEE');
    print (temp);
    //GetNotes(Token, Character, SecondCharacter);
  }

  Future<String> Login(String Username, String Password) async{
    var temp= await(API.Login(Username, Password));
    print ("LOOOOOOGIN");
    print (temp[0]);
    if (temp[0]=='OK'){
      ALoginRegister.EnterKeys(temp[2], temp[1]);
      return temp[0];

    }
    else{
      return temp[0];
    }

  }

  void RefreshKey(String LongToken) async{
    var temp=await(API.RefreshToken(LongToken));
    print ("REFFFFFRESH");
    print (temp);
    ALoginRegister.EnterKeys(LongToken, temp[0]['jwttoken']);
  }

  Future<String> DeleteAccount(String Username, String Password, String Email) async {
    String temp= await AResetDeleteAPI.DeleteAccountAPI(Username, Password, Email);
    if (temp.length>100){
      var pref =await SharedPreferences.getInstance();
      await pref.setString('SKey','');
      await pref.setString('LKey','');
      return "ACCOUNT DELETED";

    }
    else{return temp;}




  }

  void GetMatchup(String Character) async{
    var temp=await(API.GetCharacterMatchUP(Character));
    AMatchUp.AddMatchUp(temp);

  }

  void DisposeAll() {
    ANotes.dispose();
    AMatchUp.dispose();
    AllST.dispose();
  }
  void ResetPassword(){}

  void LoadInfo(){
    ALoginRegister.GetPreferences();
  }
  void RefreshInfo(String LongToken) async {
    var temp= await API.RefreshToken(LongToken);
    print ('U');
    print (temp.toString());
    print ('P');
    try{ print (temp[0]['message']);}catch(e){print (temp[0]['jwttoken']);}

    }

    Future<String> CheckToken() async {
    print ("11");

      var pref =await SharedPreferences.getInstance();

    print ("22");
      var SKEY= (await pref.getString('SKey'));
      var LKEY= (await pref.getString('LKey'));
    print ("33");
    print (LKEY);
      var temp= await API.CheckTokens(SKEY);

      print ("55");
      print (temp);
      if (temp!='OK'){print ("NOT OK"); print (temp);temp=await API.CheckTokens(LKEY);}
      if (temp=='OK'){print ("REFRESHING");  await ARepository.RefreshKey(LKEY);}

    print ("44");
      print (temp);
      return temp;

    }


    Future<String> RequestPasswordReset(String Username, String Email) async{
    return await API.ResetRequest(Username, Email);


    }

    Future <String> UpdatePassword(String Token, String Password) async{
    return await API.ResetPassword(Token, Password);

    }



}
Repository ARepository=Repository();