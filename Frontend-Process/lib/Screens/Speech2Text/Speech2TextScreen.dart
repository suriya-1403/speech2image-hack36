import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech2image/Screens/Speech2Text/components/body.dart';
import 'package:speech2image/constants.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:highlight_text/highlight_text.dart';

class speech2text extends StatefulWidget {
  @override
  _speech2textState createState() => _speech2textState();
}

class _speech2textState extends State<speech2text> {
  // final Map<String, HighlightedWord> _Highlights = {
  //   'hello': HighlightedWord(
  //     onTap: () => print('Hello'),
  //     textStyle: const TextStyle(
  //       color: Colors.blue,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  // };

  stt.SpeechToText _Speech;
  bool _isListening = false;
  String _text = 'Please Start Speaking';
  // double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _Speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Converting'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: kPrimaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: ()=> _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Text(
            _text,
            style: TextStyle(
                fontSize: 32, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          // TextHighlight(
          //   text: _text,
          //   words: _Highlights,
          //   textStyle: const TextStyle(
          //     fontSize: 32.0,
          //     color: Colors.blueGrey,
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _Speech.initialize(
        onStatus: (val) => print('onStatue: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() {
          _isListening = true;
        });
        _Speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            // if (val.hasConfidenceRating && val.confidence > 0) {
            //   _confidence = val.confidence;
            // }
          }),
        );
      } 
      else {
        setState(() => _isListening = false);
        _Speech.stop();
      }
    }
  }
}
