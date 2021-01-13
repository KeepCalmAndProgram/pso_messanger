import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../screens/conversation_screen.dart';
import '../helper/user_constants.dart';
import '../configuration/app_text.dart';
import '../configuration/app_path.dart';
import '../services/database.dart';
import '../configuration/app_colors.dart';
import '../widgets/appbar_widget.dart';

class SearchTileWidget extends StatelessWidget {
  final String userName;
  final String userEmail;

  DatabaseMethods _databaseMethods = DatabaseMethods();

  SearchTileWidget({this.userName, this.userEmail});

  String _getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  void _createChatroomAndStartConversation(
    BuildContext context, {
    @required String userName,
  }) {
    if (userName != UserConstants.username) {
      String chatRoomId = _getChatRoomId(userName, UserConstants.username);

      List<String> users = [userName, UserConstants.username];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatroomId": chatRoomId
      };
      _databaseMethods.createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ConversationScreen()));
    } else {
      print("You cannot send a message to this user");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Image.asset(
              AssetsPath.logoAsset,
              height: 25,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            //alignment: Alignment.centerLeft,
            child: Text(
              userName,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => _createChatroomAndStartConversation(
              context,
              userName: userName,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Text(
                AppText.messageText,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
