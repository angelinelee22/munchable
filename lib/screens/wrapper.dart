import 'package:flutter/material.dart';
import 'package:munchable/components/bottom_nav.dart';
import 'package:munchable/models/NavItem.dart';
import 'package:munchable/models/firebase_user.dart';
import 'package:munchable/screens/authentication/authenticate.dart';
import 'package:munchable/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Auth widget
    final user = Provider.of<FirebaseUser?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return BottomNav();
    }
  }
}
