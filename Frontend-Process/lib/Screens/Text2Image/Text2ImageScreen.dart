import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:speech2image/constants.dart';

class Text2Image extends StatefulWidget {
  @override
  _Text2ImageState createState() => _Text2ImageState();
}

class _Text2ImageState extends State<Text2Image> {
  Image greetings = null;
  String src = '';
  String src2 = '';
  String src3 = '';
  String name1 ='';
  String name2 ='';
  String name3 ='';
  String tag1 ='';
  String tag2 ='';
  String tag3 ='';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // This size provider us total height and width of our screen
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "asserts/images/signup_top.png",
                width: size.width * 0.4,
              )
            ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "asserts/images/login_bottom.png",
                width: size.width * 0.4,
              )
            ),
            Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(greetings, //Text that will be displayed on the screen
                    //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                    Center(
                      child: Container(
                        //container that contains the button
                        // width: 150,
                        // height: 60,
                        width: 125,
                        height:45,
                        child: FlatButton(
                          color: kPrimaryLightColor,
                          onPressed: () async {
                            //async function to perform http get

                            var url = 'http://127.0.0.1:5000/';
                            final response = await http.get(Uri.parse(
                                url)); //getting the response from our backend server script

                            final decoded = json.decode(response.body) as Map<String,
                                dynamic>; //converting it from json to key value pair

                            setState(() {
                              src = decoded['greetings'];
                              src2 = decoded['is'];
                              src3 = decoded['ironman'];
                              name1 = decoded['name1'];
                              name2 = decoded['name2'];
                              name3 = decoded['name3'];
                              tag1 = decoded['tag1'];
                              tag2 = decoded['tag2'];
                              tag3 = decoded['tag3'];
                              // greetings = Image.network(
                              //     src); //changing the state of our widget on data update
                            });
                          },
                          child: Text(
                            'Output',
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Image.network(src),
                    Text(
                      name1+" : "+tag1,
                      style: TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.bold),
                    ),
                    Image.network(src2),
                    Text(
                      name2+" : "+tag2,
                      style: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold),
                    ),
                    Image.network(src3),
                    Text(
                      name3+" : "+tag3,
                      style: TextStyle(color: Colors.green,fontSize: 17,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
