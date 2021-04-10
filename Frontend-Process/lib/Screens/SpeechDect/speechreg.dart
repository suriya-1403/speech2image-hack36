import 'package:flutter/material.dart';
import 'package:speech2image/Screens/Text2Image/Text2ImageScreen.dart';
import 'package:speech2image/constants.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';


class MyAppA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: VoiceHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VoiceHome extends StatefulWidget {
  @override
  _VoiceHomeState createState() => _VoiceHomeState();
}

class _VoiceHomeState extends State<VoiceHome> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  final _formkey = GlobalKey<FormState>();
  String resultText = "Tiger bites rabbit";
  String textboc="Welcome to EaseEdu ,This app is built made for Deaf or hard-of-hearing students. This app performs an visual representation via images based on the input given as voice by Users."; 
  String textboc2= "Go ahead and give a try below !!";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }
  Future<void> _savingData() async{
      final validation = _formkey.currentState.validate();
      if (!validation){
        return;
      }
      _formkey.currentState.save();
    }
  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,0.0),
                  child: Column(
                    children: [
                      Text(
                        textboc,
                        style: TextStyle(fontSize: 15,color: Colors.red[300]),),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                      Text(textboc2,
                        style: TextStyle(fontSize: 15,color: kPrimaryColor),),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.cancel),
                      mini: true,
                      backgroundColor: Colors.orange[600],
                      onPressed: () {
                        if (_isListening)
                          _speechRecognition.cancel().then(
                                (result) => setState(() {
                                  _isListening = result;
                                  resultText = "";
                                }),
                              );
                      },
                    ),
                    FloatingActionButton(
                      child: Icon(Icons.mic),
                      onPressed: () {
                        if (_isAvailable && !_isListening)
                          _speechRecognition
                              .listen(locale: "en_US")
                              .then((result) => print('$result'));
                      },
                      backgroundColor: Colors.cyan[800],
                    ),
                    FloatingActionButton(
                      child: Icon(Icons.stop),
                      mini: true,
                      backgroundColor: Colors.red[800],
                      onPressed: () {
                        if (_isListening)
                          _speechRecognition.stop().then(
                                (result) => setState(() => _isListening = result),
                              );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  child: Text(
                    resultText,
                    style: TextStyle(fontSize: 24.0,color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        //validating the form and saving it
                        _savingData();

                        //url to send the post request to
                        final url = 'http://127.0.0.1:5000/';

                        //sending a post request to the url
                        final response = await http.post(Uri.parse(url),
                            body: json.encode({'name': resultText}));

                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Text2Image();
                      }));
                      },
                      child: Text("Send Text to Database"),
                      color: kPrimaryLightColor,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
