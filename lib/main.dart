import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alphabet Speaker',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: AlphabetSpeaker(),
    );
  }
}

class AlphabetSpeaker extends StatefulWidget {
  @override
  _AlphabetSpeakerState createState() => _AlphabetSpeakerState();
}

class _AlphabetSpeakerState extends State<AlphabetSpeaker> {
  FlutterTts flutterTts=FlutterTts();
  String currentWord = '';

  @override
  void initState() {
    super.initState();
    // flutterTts = FlutterTts();
  }

  void speakWord() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(currentWord);
  }

  void clearWord() {
    setState(() {
      currentWord = '';
    });
  }

  void addToWord(String letter) {
    setState(() {
      currentWord += letter;
    });
  }

 Widget buildGridButton(String letter) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: () => addToWord(letter),
      child: Text(
        letter,
        style: TextStyle(fontSize: 30),
      ),
    ),
  );
}


void deleteLastCharacter() {
  setState(() {
    if (currentWord.isNotEmpty) {
      currentWord = currentWord.substring(0, currentWord.length - 1);
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet Speaker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              currentWord,
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              // crossAxisAlignment: CrossAxisAlignment.center,
              padding: EdgeInsets.all(16),
              children: [

                // improve build  method, loop if possible
                buildGridButton('A'),
                buildGridButton('B'),
                buildGridButton('C'),
                buildGridButton('D'),
                buildGridButton('E'),
                buildGridButton('F'),
                buildGridButton('G'),
                buildGridButton('H'),
                buildGridButton('I'),
                buildGridButton('J'),
                buildGridButton('K'),
                buildGridButton('L'),
                buildGridButton('M'),
                buildGridButton('N'),
                buildGridButton('O'),
                buildGridButton('P'),
                buildGridButton('Q'),
                buildGridButton('R'),
                buildGridButton('S'),
                buildGridButton('T'),
                buildGridButton('U'),
                buildGridButton('V'),
                buildGridButton('W'),
                buildGridButton('X'),
                buildGridButton('Y'),
                buildGridButton('Z'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: deleteLastCharacter,
              ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: clearWord,
                ),
                IconButton(
                  icon: Icon(Icons.volume_up),
                  onPressed: speakWord,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
