import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DatabaseMethods {
  final Logger _logger = Logger();

  Future<QuerySnapshot> getUserByUserName(String username) async {
    return await Firestore.instance
        .collection("users")
        .where(
          "name",
          isEqualTo: username,
        )
        .getDocuments();
  }

  Future<QuerySnapshot> getUserByUserEmail(String userEmail) async {
    return await Firestore.instance
        .collection("users")
        .where(
          "email",
          isEqualTo: userEmail,
        )
        .getDocuments();
  }

  Future<void> uploadUserInfo(userMap) async {
    await Firestore.instance.collection("users").add(userMap).catchError((e) {
      _logger.e(e.toString());
    });
  }

  Future<void> createChatRoom(String chatroomId, chatRoomMap) async {
    await Firestore.instance
        .collection("ChatRoom")
        .document(chatroomId)
        .setData(chatRoomMap)
        .catchError((e) {
      _logger.e(e.toString());
    });
  }
}
