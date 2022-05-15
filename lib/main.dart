import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:munchable/models/firebase_user.dart';
import 'package:munchable/screens/authentication/authenticate.dart';
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
          primaryColor: Colors.lightGreen,
        ),
        home: Wrapper(),
      ),
    );
  }
}
