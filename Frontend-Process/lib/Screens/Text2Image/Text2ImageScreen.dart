import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Text2Image extends StatefulWidget {
  @override
  _Text2ImageState createState() => _Text2ImageState();
}

class _Text2ImageState extends State<Text2Image> {
  Image greetings = null;
  String src = '';
  String src2 = '';
  String src3 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text(greetings, //Text that will be displayed on the screen
            //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

            Center(
              child: Container(
                //container that contains the button
                width: 150,
                height: 60,
                child: FlatButton(
                  color: Colors.blue,
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

                      // greetings = Image.network(
                      //     src); //changing the state of our widget on data update
                    });
                  },
                  child: Text(
                    'Output',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            Image.network(src),
            Image.network(src2),
            Image.network(src3),
          ],
        ),
      ),
    );
  }
}
