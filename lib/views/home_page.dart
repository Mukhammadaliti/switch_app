import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:switch_app/views/second_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitched = false;
  List<String> switchLogs = [];

  void _onSwitchChanged(bool value) {
    setState(() {
      isSwitched = value;
      switchLogs.add(
        '${DateFormat('HH:mm:ss').format(DateTime.now())} - Switch: ${value ? 'Hello world' : 'Bye world'}',
      );
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: isSwitched,
              onChanged: _onSwitchChanged,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(isSwitched: isSwitched),
                  ),
                );
              },
              child: Text('Go to Second Page'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: switchLogs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(switchLogs[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
