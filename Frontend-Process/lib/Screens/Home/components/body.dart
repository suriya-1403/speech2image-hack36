import 'package:flutter/material.dart';
import 'package:speech2image/Screens/Home/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 210.0, 0.0, 0.0),
                  child: Text(
                    "Hello",
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 270.0, 0.0, 0.0),
                  child: Text(
                    "There",
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(240.0, 270.0, 0.0, 0.0),
                  child: Text(
                    ".",
                    style: TextStyle(
                        fontSize: 80,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        )
      ],
      // mainAxisAlignment: MainAxisAlignment.center,
    ));
  }
}
