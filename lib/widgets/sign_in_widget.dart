import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helper/helper_functions.dart';
import '../screens/chat_rooms_screen.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../widgets/appbar_widget.dart';
import '../configuration/app_text.dart';
import '../configuration/app_path.dart';
import '../configuration/app_colors.dart';

class SignIn extends StatefulWidget {
  final Function _toggle;

  SignIn({
    @required Function toggle,
  }) : _toggle = toggle;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = AuthMethods();
  DatabaseMethods databaseMethods = DatabaseMethods();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool isLoading = false;
  QuerySnapshot snapshotUserInfo;

  bool signIn() {
    if (formKey.currentState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditingController.text);

      setState(() {
        isLoading = true;
      });

      databaseMethods
          .getUserByUserEmail(emailTextEditingController.text)
          .then((value) {
        snapshotUserInfo = value;
        HelperFunctions.saveUserEmailSharedPreference(
            snapshotUserInfo.documents[0].data["name"]);
      });

      authMethods
          .signInWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        if (value != null) {
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 60,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)
                              ? null
                              : AppText.emailValidatorText;
                        },
                        controller: emailTextEditingController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText: AppText.emailText,
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          return value.length > 6
                              ? null
                              : AppText.passwordValidatorText;
                        },
                        controller: passwordTextEditingController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText: AppText.passwordText,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 22),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppText.forgotPasswordText,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Divider(height: 22),
                GestureDetector(
                  onTap: () {
                    signIn();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          AppColors.firstShadeOfButtonColor,
                          AppColors.secondShadeOfButtonColor
                        ]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      AppText.signInText,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Divider(height: 15),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    AppText.signInWithGoogleText,
                    style:
                        TextStyle(color: AppColors.thirdaryColor, fontSize: 17),
                  ),
                ),
                Divider(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppText.dontHaveAccountText,
                        style: Theme.of(context).textTheme.bodyText2),
                    GestureDetector(
                      onTap: () => widget._toggle(),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          AppText.registerNowText,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
