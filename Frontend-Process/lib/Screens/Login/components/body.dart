import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:speech2image/Screens/Home/HomeScreen.dart';
import 'package:speech2image/Screens/Login/components/background.dart';
import 'package:speech2image/Screens/SignUp/SignUpScreen.dart';
// import 'package:speech2image/Screens/Speech2Text/Speech2TextScreen.dart';
import 'package:speech2image/Screens/SpeechDect/speechreg.dart';
// import 'package:speech2image/Screens/Speech2Text/components/body.dart';
import 'package:speech2image/components/AlreadyHaveDoestHave.dart';
import 'package:speech2image/components/RoundedInputField.dart';
import 'package:speech2image/components/RoundedPassInputField.dart';
import 'package:speech2image/components/roundedButton.dart';

import '../../../main.dart';

class Body extends StatelessWidget {
  String email = '', password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "asserts/icons/login.svg",
            height: size.height * 0.38,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {
              email = value.trim();
            },
          ),
          RoundedPasswordField(
            hintText: "Password",
            onChanged: (value) {
              password = value.trim();
            },
          ),
          RoundedButton(
              text: "Login",
              press: () async {
                // auth.signInWithEmailAndPassword(email: email, password: password);

                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyAppA();
                  }));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              }),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAcc(
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUpScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
