import 'package:flutter/material.dart';
import 'package:speech2image/constants.dart';

class AlreadyHaveAnAcc extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAcc({
    Key key, this.login=true, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Doesn't Have an Account? " : "Already Have an Account? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
            onTap: press,
            child: Text(
              login ? "Sign Up": "Login",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}