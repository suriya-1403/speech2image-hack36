import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech2image/Screens/Login/LoginScreen.dart';
import 'package:speech2image/Screens/SignUp/SignUpScreen.dart';
import 'package:speech2image/Screens/Welcome/components/background.dart';
import 'package:speech2image/components/roundedButton.dart';
import 'package:speech2image/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to easƎEdu",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            SvgPicture.asset(
              "asserts/icons/chat.svg",
              // "asserts/images/main_icon.png",
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            RoundedButton(
              text: "Login",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
            RoundedButton(
              text: "Sign UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
