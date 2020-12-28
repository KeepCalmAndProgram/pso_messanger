import 'package:flutter/material.dart';
import '../configuration/app_colors.dart';
import '../configuration/app_path.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      AssetsPath.logoAsset,
      height: 40,
      color: AppColors.primaryIconColor,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(17),
        bottomRight: Radius.circular(17),
      ),
    ),
  );
}
