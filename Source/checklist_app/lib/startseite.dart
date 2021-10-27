import 'package:checklist_app/einstellungen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Startseite extends StatefulWidget {
  Startseite({Key? key}) : super(key: key);

  @override
  _StartseiteState createState() => _StartseiteState();
}

class _StartseiteState extends State<Startseite> {
  final TextEditingController _controller = TextEditingController();

  String _text = "";

  @override
  void initState() {
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
        title: Text("Deine Checklisten"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ElevatedButton(
                        onPressed: settings, child: Icon(Icons.settings)),
                  ),
                  Container(
                    width: 250,
                    child: TextFormField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      autofocus: true,
                      decoration: InputDecoration.collapsed(
                          hintText: "Search", border: InputBorder.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        onPressed: onPressed, child: Icon(Icons.search)),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: Container(child: Text('Checkliste 1')),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 100)),
                      //color: Colors.grey,
                      //textColor: Colors.black,
                      onPressed: () {}),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: Container(child: Text('Checkliste 2')),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 100)),
                      //color: Colors.grey,
                      //textColor: Colors.black,
                      onPressed: () {}),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: Container(child: Text('Checkliste 3')),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 100)),
                      //color: Colors.grey,
                      //textColor: Colors.black,
                      onPressed: () {}),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Neue Checkliste erstellen',
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }

  void onPressed() {}

  void settings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Einstellungen()));
  }
}
