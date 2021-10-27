/// Flutter code sample for Checkbox
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Haeckchen extends StatefulWidget {
  const Haeckchen({Key? key}) : super(key: key);

  @override
  State<Haeckchen> createState() => _HaeckchenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HaeckchenState extends State<Haeckchen> {
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
                  child: Icon(Icons.add_box_sharp),
                ),
                ElevatedButton(
                    onPressed: hinzufuegen, child: Text("Hinzufügen"))
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
