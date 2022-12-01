import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groupPost");

  Future savingUserData(
      String name, String email, String phone, String student) async {
    return await userCollection.doc(uid).set({
      //update database
      'name': name,
      'id': student,
      'phone': phone,
      'email': email,
      'groupPost': [],
      'profilePic': '',
      'uid': uid,
    });
  }

  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  //get user grups
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }
}
