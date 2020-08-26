//Split notes top bottom with bottom being editable and when you click save it submits note
import 'package:flutter/material.dart';
import '../Persistent/Repository.dart';
import '../Bloc/NotesBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Persistent/BackToHomeScreen.dart';
import '../Widgets/TopAppBar.dart';
import 'LogoutPage.dart';
import 'UserDeletePage.dart';
import 'HomePage.dart';
class NotesPage extends StatefulWidget {
  static const String id='NotesPageID';
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  String Notes='';
  String primary='';
  String second='';


  void UpdateNotes() async{
    var pref =await SharedPreferences.getInstance();
    print ("NOTESUDA");
    print (this.Notes);
    await ARepository.UpdateNotes(pref.getString('SKey'), this.primary, this.second, this.Notes);
  }

  @override
  void initState() {
    BackToHomeScreen(context);
    ANotes.WhoseNotesG.listen((event) {

        this.primary=event[0];this.second=event[1];

       });

  }
  Widget build(BuildContext context) {

    var media=MediaQuery.of(context);
    return Scaffold(appBar: AppBar(

        title: Row(children: [
          FlatButton(onPressed: (){Navigator.pushNamed(context, LogoutPage.id);}, child: Text('Logout')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, DeleteUserPage.id);}, child: Text('Delete Account')),
          FlatButton(onPressed: (){Navigator.pushNamed(context, HomePage.id);}, child: Text('Home')),



        ],)



    ),
      body: SafeArea(child: Column(
        children: [
          Text('$primary     vs   $second'),
          Container(width: media.size.width*.9,height: media.size.height*.2,
            child: StreamBuilder(stream: ANotes.GenericNotes,builder: (context,snapshot){
              if (snapshot.hasData) {
                return  Text(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            }),),
          Divider(),
          Container(width: media.size.width*.9,height: media.size.height*.2,
          child: StreamBuilder(stream: ANotes.PersonalNotes,builder: (context,snapshot){
            if (snapshot.hasData) {
              //this.Notes=snapshot.data.toString();
              return  TextFormField(onChanged:(text){

                  this.Notes=text;


                print (this.Notes);
              } ,initialValue: snapshot.data.toString(),);
            } else if (snapshot.hasError) {
              return Text('Error');
            }
            return Center(child: CircularProgressIndicator());
          }),),
          Row(children: [
            FlatButton(onPressed: (){Navigator.pop(context);}, child: Text('Return')),
            FlatButton(onPressed: () async {
              print ("NOTTEY");
              print (this.Notes);
              var pref =await SharedPreferences.getInstance();
              UpdateNotes();
            }, child: Text('Submit')),
          ],)
        ],
      )),
    );
  }
}
