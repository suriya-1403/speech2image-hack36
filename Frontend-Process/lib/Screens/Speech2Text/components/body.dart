import 'package:flutter/material.dart';
import 'package:speech2image/Screens/Speech2Text/components/background.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class speech2text extends StatefulWidget {
  @override
  _speech2textState createState() => _speech2textState();
}

class _speech2textState extends State<speech2text> {
  stt.SpeechToText _Speech;
  bool _isListening = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
