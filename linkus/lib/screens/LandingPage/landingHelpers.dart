import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkus/constants/Constantcolors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:linkus/screens/HomePage/Homepage.dart';
import 'package:linkus/screens/LandingPage/landingServices.dart';
import 'package:linkus/screens/LandingPage/landingUtils.dart';
import 'package:linkus/services/Authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LandingHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/login.png")),
      ),
    );
  }

  Widget taglineText(BuildContext context) {
    return Positioned(
        top: 450.0,
        left: 10.0,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 170.0,
          ),
          child: RichText(
            text: TextSpan(
                text: 'Are ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: constantColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'You ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: constantColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  TextSpan(
                    text: 'Social ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: constantColors.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  TextSpan(
                    text: '?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: constantColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ]),
          ),
        ));
  }

  Widget mainButton(BuildContext context) {
    return Positioned(
      top: 630,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                emailAuthSheet(context);
              },
              child: Container(
                width: 80.0,
                height: 40.0,
                child: Icon(
                  EvaIcons.emailOutline,
                  color: constantColors.yellowColor,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: constantColors.yellowColor),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("SignIn with Google");
                Provider.of<Authentication>(context, listen: false)
                    .signInWithGoogle()
                    .whenComplete(() {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: Homepage()));
                });
              },
              child: Container(
                width: 80.0,
                height: 40.0,
                child: Icon(
                  EvaIcons.google,
                  color: constantColors.redColor,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: constantColors.redColor),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 80.0,
                height: 40.0,
                child: Icon(
                  FontAwesomeIcons.facebookF,
                  color: constantColors.blueColor,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: constantColors.blueColor),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget privacyText(BuildContext context) {
    return Positioned(
      top: 740.0,
      left: 20.0,
      right: 20.0,
      child: Container(
        child: Column(
          children: [
            Text("By continuing you agree linkUS's Terms of",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0)),
            Text("Services & Privacy Policy",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0))
          ],
        ),
      ),
    );
  }

  emailAuthSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: constantColors.whiteColor,
                  ),
                ),
                Provider.of<LandingService>(context,listen: false).passwordLessSignIn(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      child: Text('Log In',
                          style: TextStyle(
                              color: constantColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Provider.of<LandingService>(context,listen: false).logInSheet(context);
                      },
                    ),
                    MaterialButton(
                      child: Text('Sign In',
                          style: TextStyle(
                              color: constantColors.redColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Provider.of<LandingUtils>(context,listen: false).selectAvatarOptionsSheet(context);
                      },
                    ),
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: constantColors.blueGreyColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          );
        });
  }
}
