import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../configuration/app_text.dart';
import '../screens/chat_rooms_screen.dart';
import '../configuration/app_path.dart';
import '../configuration/app_colors.dart';
import '../services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .singUpwithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        //print("${value.uid}");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppPath.logoAsset,
          height: 40,
          color: AppColors.primaryIconColor,
        ),
      ),
      body: isLoading
          ? Container(
              child: CircularProgressIndicator(),
              alignment: AlignmentDirectional.center)
          : SingleChildScrollView(
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
                                return value.isEmpty || value.length < 4
                                    ? AppText.usernameValidatorText
                                    : null;
                              },
                              controller: userNameTextEditingController,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecoration(
                                hintText: AppText.usernameText,
                              ),
                            ),
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
                      Divider(height: 22),
                      GestureDetector(
                        onTap: () {
                          signMeUp();
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
                            AppText.signUpText,
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
                          AppText.signUpWithGoogleText,
                          style: TextStyle(
                              color: AppColors.thirdaryColor, fontSize: 17),
                        ),
                      ),
                      Divider(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppText.haveAccountText,
                              style: Theme.of(context).textTheme.bodyText2),
                          Text(
                            AppText.signInNowText,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 17,
                              decoration: TextDecoration.underline,
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
