import 'package:flutter/material.dart';

class NeueChecklisteErstellen extends StatefulWidget {
  const NeueChecklisteErstellen({Key? key}) : super(key: key);

  @override
  _NeueChecklisteErstellenState createState() =>
      _NeueChecklisteErstellenState();
}

class _NeueChecklisteErstellenState extends State<NeueChecklisteErstellen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  String _text1 = "Erster Test";

  String _text = "";

  get onPressed => null;

  @override
  void initState() {
    super.initState();

    _controller.text = _text;
    _controller.addListener(() {
      setState(() {
        _text = _controller.text;
      });
    });

    _controller1.text = _text1;
    _controller1.addListener(() {
      setState(() {
        _text1 = _controller1.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Erstelle eine Checkliste"),
          ],
        ),
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: TextFormField(
                controller: _controller,
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration.collapsed(
                    hintText: "Name der Checkliste",
                    border: InputBorder.none))),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.add_circle_outline),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(3),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
