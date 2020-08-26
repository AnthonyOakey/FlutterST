import 'package:flutter/material.dart';
import '../Widgets/TopAppBar.dart';
import '../Persistent/Repository.dart';
import '../Widgets/ReturnButtonWidget.dart';
import 'LogoutPage.dart';
import 'UserDeletePage.dart';
import 'HomePage.dart';
class DeleteUserPage extends StatefulWidget {
  static const String id='DeleteUserPageID';

  @override
  _DeleteUserPageState createState() => _DeleteUserPageState();
}

class _DeleteUserPageState extends State<DeleteUserPage> {
  String Email='';
  String Username='';
  String Password='';
  String Error='';
  String SecondPassword='';
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

        }, initialValue: 'Email',),
        ),
        Container(child:TextFormField(onChanged: (text){
          this.Username=text;

        }, initialValue: 'Username',),
        ),
        Container(child:TextFormField(onChanged: (text){
          this.Password=text;

        }, initialValue: 'Password',),
        ),

        Container(child:TextFormField(onChanged: (text){
          this.SecondPassword=text;

        }, initialValue: 'Password again',),
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

            String response=await ARepository.DeleteAccount(this.Username, this.Password, this.Email);

              setState(() {
                this.Error=response;
              });



          }
        }, child: Text("Delete")),
        ReturnButton(),



      ],
    )));
  }
}


