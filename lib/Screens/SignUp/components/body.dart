import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech2image/Screens/Login/LoginScreen.dart';
import 'package:speech2image/Screens/SignUp/components/background.dart';
import 'package:speech2image/components/AlreadyHaveDoestHave.dart';
import 'package:speech2image/components/RoundedInputField.dart';
import 'package:speech2image/components/RoundedPassInputField.dart';
import 'package:speech2image/components/roundedButton.dart';

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
            "Signup",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "asserts/icons/signup.svg",
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
            text: "Signup",
            press: () async {
              // auth.createUserWithEmailAndPassword(
              //     email: email, password: password);
              
              try {
              UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email,
                password: password
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
}
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAcc(
            login: false,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
