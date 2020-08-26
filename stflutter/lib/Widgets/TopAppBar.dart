import 'package:flutter/material.dart';
import 'LogoutWidget.dart';
import '../UI/LogoutPage.dart';
import '../UI/UserDeletePage.dart';


class TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(" Quick Commands"),
leading: Row(children: [
  FlatButton(onPressed: (){Navigator.pushNamed(context, LogoutPage.id);}, child: Text('Logout')),
  FlatButton(onPressed: (){Navigator.pushNamed(context, DeleteUserPage.id);}, child: Text('Delete Account')),



],)



    );
  }
}
