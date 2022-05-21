import 'package:flutter/material.dart';
import 'package:munchable/components/loading.dart';
import 'package:munchable/size_config.dart';
import 'package:munchable/services/database.dart';
import 'info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_menu_item.dart';

class Body extends StatefulWidget {
  final toggleView;

  const Body({Key? key, this.toggleView}) : super(key: key);
  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  dynamic user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid)
            .retName(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          } else {
            dynamic names = snapshot.data[0].split(' ');
            String fname = names[0];
            String lname = names[1];
            String initials = fname[0] + lname[0];
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Info(
                    initials: initials,
                    name: snapshot.data[0] ?? "blah",
                    email: snapshot.data[1] ?? "random.com",
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
        });
  }
}
