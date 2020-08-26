import 'package:flutter/material.dart';
import '../Persistent/Repository.dart';
import '../UI/CharacterMatchupPage.dart';
class FGCCard extends StatelessWidget {
  FGCCard({@required this.name, @required this.picture});
  String name;
  String picture;
  @override
  Widget build(BuildContext context) {
    Repository rep=Repository();
    return FlatButton(child:Row(
        children:[Text(this.name),
          Container(child: Image.network(this.picture),height: MediaQuery.of(context).size.height*.2,width: MediaQuery.of(context).size.height*.2,)
        ]
    ), onPressed: (){
      rep.GetMatchup(this.name);
      Navigator.pushNamed(context, CharacterMatchUp.id);
    },);
  }
}