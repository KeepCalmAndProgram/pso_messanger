import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByUserName(String username) async {
    return await Firestore.instance
        .collection("users")
        .where(
          "name",
          isEqualTo: username,
        )
        .getDocuments();
  }

  getUserByUserEmail(String userEmail) async {
    return await Firestore.instance
        .collection("users")
        .where(
          "email",
          isEqualTo: userEmail,
        )
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String chatroomId, chatRoomMap) {
    Firestore.instance
        .collection("ChatRoom")
        .document(chatroomId)
        .setData(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
