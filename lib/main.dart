import 'package:flutter/material.dart';
import './helper/helper_functions.dart';
import './screens/chat_rooms_screen.dart';
import './widgets/blank_widget.dart';
import './helper/authenticate_helper.dart';
import './configuration/app_colors.dart';
import './widgets/sign_up_widget.dart';
import './widgets/sign_in_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        _userIsLoggedIn = value;
      });
    });
  }

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
      home: _userIsLoggedIn ? ChatRoomScreen() : AuthenticateHelper(),
    );
  }
}
