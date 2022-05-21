import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final source = Source.cache;
  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String firstName, String lastName, String email,
      bool firstLogin, List<String> pantry) async {
    final data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "firstLogin": firstLogin,
      "pantry": pantry
    };

    return await userCollection.doc(uid).set(data, SetOptions(merge: true));
  }

  Future retName() async {
    // getUserData();
    // print('$firstName 1');
    Map? snap;
    final docRef = userCollection.doc(uid);
    await docRef.get(GetOptions(source: source)).then((res) {
      snap = res.data() as Map?;
    });
    List<String?> na = <String?>[];
    na.add(snap?['firstName']);
    na.add(snap?['lastName']);
    List<String?> data = <String>[];
    String name = na.join(" ");
    data.add(name);
    data.add(snap?['email']);
    return data;
  }

  Future updateUserLogin(bool firstLogin) async {
    return await userCollection.doc(uid).set({
      'firstLogin': firstLogin,
    }, SetOptions(merge: true));
  }

  Future updateUserPantry(List<dynamic> pantry) async {
    return await userCollection.doc(uid).set({
      'pantry': pantry,
    }, SetOptions(merge: true));
  }
}
