import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //reference for our collections

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // final CollectionReference groupCollection =
  //     FirebaseFirestore.instance.collection("groups");

  //saving the userdata
  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
     // "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }

  //getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // //getting user groups
  // getUserGroups() async {
  //   return userCollection.doc(uid).snapshots();
  // }

  // //Create a group
  // Future createGroup(String userName, String id, String groupName) async {
  //   DocumentReference groupDocumentReference = await groupCollection.add({
  //     "groupName": groupName,
  //     "groupIcon": "",
  //     "admin": "${id}_$userName",
  //     "members": [],
  //     "groupId": "",
  //     "recentMessage": "",
  //     "recentMessageSender": "",
  //   });

    // //update the members
    // await groupDocumentReference.update({
    //   "members": FieldValue.arrayUnion(["${uid}_$userName"]),
    //   "groupId": groupDocumentReference.id,
    // });

    // DocumentReference userDocumentReference = userCollection.doc(uid);
    // return await userDocumentReference.update({
    //   "groups":
    //       FieldValue.arrayUnion(["${groupDocumentReference.id}_$groupName"])
    // });
  //}
}
