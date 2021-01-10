import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../helper/user_constants.dart';
import '../screens/conversation_screen.dart';
import '../configuration/app_text.dart';
import '../widgets/search_tile_widget.dart';
import '../configuration/app_path.dart';
import '../services/database.dart';
import '../configuration/app_colors.dart';
import '../widgets/appbar_widget.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  DatabaseMethods _databaseMethods = DatabaseMethods();
  TextEditingController _searchTextEdittingController = TextEditingController();

  QuerySnapshot searchSnapshot;

  Future<void> initiateSearch() async => await _databaseMethods
          .getUserByUserName(_searchTextEdittingController.text)
          .then((value) {
        setState(() {
          searchSnapshot = value;
        });
      });

  createChatroomAndStartConversation(String userName) {
    String chatRoomId = _getChatRoomId(userName, UserConstants.username);

    List<String> users = [userName, UserConstants.username];
    Map<String, dynamic> chatRoomMap = {
      "users": users,
      "chatroomId": chatRoomId
    };
    _databaseMethods.createChatRoom(chatRoomId, chatRoomMap);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConversationScreen()));
  }

  Widget _buildSearchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchTileWidget(
                userName: searchSnapshot.documents[index].data["name"],
                userEmail: searchSnapshot.documents[index].data["email"],
              );
            })
        : SizedBox.shrink();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.primarySearchBarColor,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => initiateSearch(),
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.secondarySearchBarColor,
                              AppColors.thirdarySearchBarColor,
                            ]),
                            borderRadius: BorderRadius.circular(40)),
                        padding: EdgeInsets.all(12),
                        child: Image.asset("assets/images/search.png")),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchTextEdittingController,
                      style: TextStyle(color: AppColors.primaryColor),
                      decoration: InputDecoration(
                          hintText: AppText.searchUsernameText,
                          hintStyle:
                              TextStyle(color: AppColors.primarySearchBarColor),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            _buildSearchList()
          ],
        ),
      ),
    );
  }
}

String _getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
/*getChatRoomId(String a, String b){
  if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)) {
    return "$b\_$a";
  }else {
    return "$a\_$b";
  }
}*/
