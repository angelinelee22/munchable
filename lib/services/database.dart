import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      String firstName, String lastName, bool firstLogin) async {
    return await userCollection.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'firstLogin': firstLogin
    });
  }

  Future updateUserLogin(bool firstLogin) async {
    return await userCollection.doc(uid).set({
      'firstLogin': firstLogin,
    });
  }
}
