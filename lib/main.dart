import 'package:flutter/material.dart';
import './helper/authenticate_helper.dart';
import './configuration/app_colors.dart';
import './widgets/sign_up_widget.dart';
import './widgets/sign_in_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.appBarColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 17,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.secondaryColor),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
          ),
        ),
      ),
      home: AuthenticateHelper(),
    );
  }
}
