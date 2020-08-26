import 'package:flutter/material.dart';
import 'LogoutPage.dart';
import 'UserDeletePage.dart';
import 'HomePage.dart';
import '../Persistent/Repository.dart';
import '../Widgets/ReturnButtonWidget.dart';
class PasswordResetPage extends StatefulWidget {
  static const String id="PasswordResetPageID";
  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  String Token='';
  String Password='';
  String SecondPassword='';
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
        Text('TestField'),

        Container(child:TextFormField( enableInteractiveSelection: true,onChanged: (text){
          this.Token=text;

        }, initialValue: 'Token',),
        ),
        Container(child:TextFormField(onChanged: (text){
          this.Password=text;

        }, initialValue: 'Password',),
        ),

        Container(child:TextFormField(onChanged: (text){
          this.SecondPassword=text;

        }, initialValue: 'Password Again',),
        ),

        SizedBox(height: 50,),
        Container(child: Text(Error),),
        FlatButton(onPressed: () async {
          if (this.SecondPassword!=this.Password) {

            setState(() {
              this.Error='Password Do Not Match';
            });
          }
          else{
            setState(() {
              this.Error='';
            });

            String response=await ARepository.UpdatePassword(this.Token, this.Password);
            if (response!='Successful Update'){
              setState(() {
                this.Error=response;
              });
            }
            else{
              Navigator.pushNamed(context, HomePage.id);
            }

          }
        }, child: Text("Submit")),
        ReturnButton(),



      ],
    )));
  }
}
