import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final bool isSwitched;

  SecondPage({required this.isSwitched});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = isSwitched ? ThemeData.light() : ThemeData.dark();
    return MaterialApp(
      title: 'Second Page',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              SizedBox(width: 50),
              Center(
                child: Text('Second Page'),
              ),
            ],
          ),
        ),
        body: Center(
          child: Text(
            isSwitched ? 'Привет, мир' : 'Пока, мир',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
