import 'package:flutter/material.dart';
import '../UI/CharacterNotesPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Persistent/Repository.dart';
class MatchUpWidget extends StatelessWidget {
  // Use media of for size of picture
  MatchUpWidget({@required this.Primaryname, @required this.Primarypicture, @required this.Matchup, @required this.Secondname, @required this.Secondpicture});
  String Primaryname;
  String Primarypicture;
  String Matchup;
  String Secondname;
  String Secondpicture;


  void TokenGet(context) async{
    var pref =await SharedPreferences.getInstance();
    var SKEY= (pref.getString('SKey'));
    ARepository.GetNotes(SKEY, this.Primaryname, this.Secondname);
    Navigator.pushNamed(context, NotesPage.id);
  }

  @override
  Widget build(BuildContext context) {

    var Media=MediaQuery.of(context);
    return FlatButton(child:Row(
        children:[Text(this.Primaryname),
          Container(child: Image.network(this.Primarypicture),height: Media.size.height*.2,width: Media.size.height*.2),
          Text(this.Matchup),
          Container(child: Image.network(this.Secondpicture),height: Media.size.height*.2,width: Media.size.height*.2),
          Text(this.Secondname),
        ]
    ), onPressed: (){TokenGet(context);},);
  }
}
