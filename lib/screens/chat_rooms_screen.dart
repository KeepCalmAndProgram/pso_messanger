import 'package:flutter/material.dart';
import '../widgets/search_widget.dart';
import '../helper/authenticate_helper.dart';
import '../services/auth.dart';
import '../configuration/app_colors.dart';
import '../configuration/app_path.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods = AuthMethods();

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
            context, MaterialPageRoute(builder: (context) => SearchScreen())),
      ),
    );
  }
}
