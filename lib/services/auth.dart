import 'package:firebase_auth/firebase_auth.dart';
import 'package:munchable/models/firebase_user.dart';
import 'package:munchable/services/database.dart';

class AuthService {
  // underscore means private var only in this file
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on User
  // take out everything except the elements we need like uid
  FirebaseUser? _firebaseUserFromUser(User? user) {
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }

  // auth change user stream (based on logged in or not)
  Stream<FirebaseUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _firebaseUserFromUser(user!));
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _firebaseUserFromUser(user!);
    } catch (e) {
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user?.uid).updateUserLogin(false);
      return _firebaseUserFromUser(user);
    } catch (e) {
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String firstName, String lastName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData(firstName, lastName, email, true, []);

      return _firebaseUserFromUser(user);
    } catch (e) {
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
