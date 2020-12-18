import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/images/logo.png",
            height: 40,
            color: Colors.white,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextField(
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextField(
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              Divider(height: 18),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: 18),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff007EF4),
                      const Color(0xff2A75BC)
                    ]),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Sign In with Google",
                  style: TextStyle(color: Colors.black87, fontSize: 17),
                ),
              ),
            ],
          ),
        ));
  }
}
