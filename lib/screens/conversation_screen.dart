import 'package:flutter/material.dart';
import 'package:pso_messanger/configuration/app_colors.dart';
import 'package:pso_messanger/configuration/app_path.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsPath.logoAsset,
          height: 40,
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.primarySearchBarColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        // controller: _searchTextEdittingController,
                        style: TextStyle(color: AppColors.primaryColor),
                        decoration: InputDecoration(
                            hintText: "Message...",
                            hintStyle: TextStyle(
                                color: AppColors.primarySearchBarColor),
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      //onTap: () => initiateSearch(),
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
                          child: Image.asset("assets/images/send.png")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
