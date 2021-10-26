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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 7,
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: onPressed, child: Icon(Icons.settings)),
                Container(
                  width: 0,
                  height: 10,
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
                ElevatedButton(onPressed: onPressed, child: Icon(Icons.search))
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                  child: Container(child: Text('Checkliste 1')),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 100)),
                  //color: Colors.grey,
                  //textColor: Colors.black,
                  onPressed: () {}),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                  child: Container(child: Text('Checkliste 2')),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 100)),
                  //color: Colors.grey,
                  //textColor: Colors.black,
                  onPressed: () {}),
            ),
            Container(
              margin: EdgeInsets.all(20),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Increment',
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
    );
  }

  void onPressed() {}
}
