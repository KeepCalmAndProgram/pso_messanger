import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../configuration/app_text.dart';
import '../configuration/app_path.dart';
import '../services/database.dart';
import '../configuration/app_colors.dart';
import '../widgets/appbar_widget.dart';

class SearchTileWidget extends StatelessWidget {
  final String userName;
  final String userEmail;

  SearchTileWidget({this.userName, this.userEmail});

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
              onTap: () {},
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
        ));
  }
}
