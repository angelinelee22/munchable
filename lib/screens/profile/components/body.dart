import 'package:flutter/material.dart';
import 'package:munchable/size_config.dart';

import 'info.dart';
import 'profile_menu_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/pic.png",
            name: "John Doe",
            email: "Johndoe01@gmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize! * 2), //20
          ProfileMenuItem(
            icon: Icon(Icons.bookmark, color: Colors.grey),
            title: "Saved Recipes",
            press: () {},
          ),
          ProfileMenuItem(
            icon: Icon(Icons.star, color: Colors.yellow),
            title: "Super Plan",
            press: () {},
          ),
          ProfileMenuItem(
            icon: Icon(Icons.language, color: Colors.grey),
            title: "Change Language",
            press: () {},
          ),
          ProfileMenuItem(
            icon: Icon(Icons.info, color: Colors.grey),
            title: "Help",
            press: () {},
          ),
          ProfileMenuItem(
            icon: Icon(Icons.person, color: Colors.grey),
            title: "Help",
            press: () {},
          ),
        ],
      ),
    );
  }
}
