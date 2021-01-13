import 'package:flutter/material.dart';
import '../helper/helper_functions.dart';
import '../helper/user_constants.dart';
import '../widgets/search_widget.dart';
import '../helper/authenticate_helper.dart';
import '../services/auth.dart';
import '../configuration/app_colors.dart';
import '../configuration/app_path.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  AuthMethods authMethods = AuthMethods();

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    UserConstants.username =
        await HelperFunctions.getUserNameSharedPreference();
  }

  void _signOutOnTap() {
    authMethods.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthenticateHelper(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsPath.logoAsset,
          height: 40,
        ),
        actions: [
          GestureDetector(
            onTap: _signOutOnTap,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchWidget())),
      ),
    );
  }
}
