import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:munchable/constants.dart';
import 'package:munchable/models/firebase_user.dart';
import 'package:munchable/screens/authentication/authenticate.dart';
import 'package:munchable/screens/recipes/recipe0.dart';
import 'package:munchable/screens/recipes/recipe1.dart';
import 'package:munchable/screens/recipes/recipe2.dart';
import 'package:munchable/screens/recipes/recipe3.dart';
import 'package:munchable/screens/recipes/recipe4.dart';
import 'package:munchable/screens/recipes/recipe5.dart';
import 'package:munchable/screens/recipes/recipe6.dart';
import 'package:munchable/screens/recipes/recipe7.dart';
import 'package:munchable/screens/wrapper.dart';
import 'package:munchable/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:munchable/models/NavItem.dart';
import 'package:munchable/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return either Home or Auth widget
    final user = Provider.of<FirebaseUser?>(context);

    return StreamProvider<FirebaseUser?>.value(
      catchError: (_, __) {},
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Munchable',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        home: Wrapper(),
        routes: {
          '/recipe0': (context) => Recipe0(),
          '/recipe1': (context) => Recipe1(),
          '/recipe2': (context) => Recipe2(),
          '/recipe3': (context) => Recipe3(),
          '/recipe4': (context) => Recipe4(),
          '/recipe5': (context) => Recipe5(),
          '/recipe6': (context) => Recipe6(),
          '/recipe7': (context) => Recipe7(),
        },
      ),
    );
  }
}
