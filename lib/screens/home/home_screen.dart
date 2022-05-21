import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:munchable/components/bottom_nav.dart';
import 'package:munchable/constants.dart';
import 'package:munchable/screens/home/components/body.dart';
import 'package:munchable/services/auth.dart';
import 'package:munchable/size_config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      // On Android by default its false
      centerTitle: true,
      title: Column(children: [
        SizedBox(height: 12.0),
        Text("munchable",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Friends',
              fontSize: 30,
            ))
      ]),
      actions: <Widget>[
        TextButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('logout', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              await _auth.signOut();
            }),
        SizedBox(
          // It means 5 because by out defaultSize = 10
          width: SizeConfig.defaultSize! * 0.5,
        )
      ],
    );
  }
}
