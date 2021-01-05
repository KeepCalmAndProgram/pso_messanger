import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pso_messanger/configuration/app_text.dart';
import '../widgets/search_tile_widget.dart';
import '../configuration/app_path.dart';
import '../services/database.dart';
import '../configuration/app_colors.dart';
import '../widgets/appbar_widget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DatabaseMethods databaseMethods = DatabaseMethods();
  TextEditingController searchTextEdittingController = TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch() {
    databaseMethods
        .getUserByUserName(searchTextEdittingController.text)
        .then((value) {
      setState(() {
        searchSnapshot = value;
      });
    });
  }

  createChatroomAndStartConversation(String userName) {
    //List<String> users = [userName, ];
    //databaseMethods.createChatRoom()
  }

  Widget _buildSearchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchTile(
                userName: searchSnapshot.documents[index].data["name"],
                userEmail: searchSnapshot.documents[index].data["email"],
              );
            })
        : Container();
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
                  Expanded(
                    child: TextField(
                      controller: searchTextEdittingController,
                      style: TextStyle(color: AppColors.primaryColor),
                      decoration: InputDecoration(
                          hintText: AppText.searchUsernameText,
                          hintStyle:
                              TextStyle(color: AppColors.primarySearchBarColor),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
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
                  )
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
