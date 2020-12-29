import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar_widget.dart';
import '../configuration/app_text.dart';
import '../configuration/app_path.dart';
import '../configuration/app_colors.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: AppText.emailText,
                  ),
                ),
                TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: AppText.passwordText,
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
                Container(
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
                      onTap: () => widget.toggle(),
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
