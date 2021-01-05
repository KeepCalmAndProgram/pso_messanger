import 'package:flutter/material.dart';
import '../widgets/sign_in_widget.dart';
import '../widgets/sign_up_widget.dart';

class AuthenticateHelper extends StatefulWidget {
  @override
  _AuthenticateHelperState createState() => _AuthenticateHelperState();
}

class _AuthenticateHelperState extends State<AuthenticateHelper> {
  bool _showSignIn = true;

  void toggleView() {
    setState(() {
      _showSignIn = !_showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSignIn) {
      return SignIn(toggle: toggleView);
    } else {
      return SignUp(toggle: toggleView);
    }
    ;
  }
}
