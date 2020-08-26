import 'package:flutter/material.dart';
import 'LogoutPage.dart';
import 'UserDeletePage.dart';
import 'HomePage.dart';
import '../Widgets/ReturnButtonWidget.dart';
import '../Persistent/Repository.dart';
import 'PasswordResetPage.dart';

class ResetRequestPage extends StatefulWidget {
  static const String id='ResetRequestPageID';
  @override
  _ResetRequestPage createState() => _ResetRequestPage();
}

class _ResetRequestPage extends State<ResetRequestPage> {
  String Email='';
  String Username='';
  String Error='';

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
        Text('REQUEST RESET'),
        Container(child:TextFormField(onChanged: (text){
          this.Email=text;

        }, initialValue: 'Email',),
        ),
        Container(child:TextFormField(onChanged: (text){
          this.Username=text;

        }, initialValue: 'Username',),
        ),


        SizedBox(height: 50,),
        Container(child: Text(Error),),
        FlatButton(onPressed: () async {


            setState(() {
              this.Error='';
            });

            var tempstring=await ARepository.RequestPasswordReset(this.Username, this.Email);


            if (tempstring=='Email sent') {
              Navigator.pushNamed(context, PasswordResetPage.id);
            }
            else{
              setState(() {
                this.Error=tempstring;
              });

            }


          }
        , child: Text("Sumbit")),
        ReturnButton(),



      ],
    )));
  }
}
