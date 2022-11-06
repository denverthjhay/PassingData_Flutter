import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter',
    home: ScreenOne(),
  ));
}

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() {
    return _ScreenOneState();
  }
}

class _ScreenOneState extends State<ScreenOne> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Page 1'),
        backgroundColor: Color(0xFF765EFC),
        elevation: 10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Input data", labelText: "Text Field"),
              controller: textFieldController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xFF765EFC),
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: Text(
              'Send Data',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _sendDataToScreenTwo(context);
            },
          )
        ],
      ),
    );
  }

  void _sendDataToScreenTwo(BuildContext context) {
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenTwo(
            text: textToSend,
          ),
        ));
  }
}

class ScreenTwo extends StatelessWidget {
  final String text;

  const ScreenTwo({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        backgroundColor: Color(0xFF765EFC),
        elevation: 10,
      ),
      body: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
