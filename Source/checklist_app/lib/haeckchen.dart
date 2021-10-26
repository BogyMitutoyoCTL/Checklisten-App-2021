/// Flutter code sample for Checkbox

// This example shows how you can override the default theme of
// of a [Checkbox] with a [MaterialStateProperty].
// In this example, the checkbox's color will be `Colors.blue` when the [Checkbox]
// is being pressed, hovered, or focused. Otherwise, the checkbox's color will
// be `Colors.red`.

import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isBananeChecked = false;
  bool isApfelChecked = false;

  @override
  final TextEditingController _controller = TextEditingController();
  String _text = "";

  @override
  void iniState() {
    super.initState();
    _controller.text = _text;
    _controller.addListener(() {
      setState(() {
        _text = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkliste1"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: isBananeChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isBananeChecked = value!;
                    });
                  },
                ),
                Text("Banane"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: isApfelChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isApfelChecked = value!;
                    });
                  },
                ),
                Text("Apfel"),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  decoration: InputDecoration.collapsed(
                      hintText: "Notizen", border: InputBorder.none),
                )),
            Row(
              children: [
                Placeholder(
                  fallbackHeight: 300,
                  fallbackWidth: 392,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: settings,
                  child: Icon(Icons.settings),
                ),
                ElevatedButton(
                    onPressed: hinzufuegen, child: Text("hinzufuegen"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void settings() {}

  void hinzufuegen() {}
}
