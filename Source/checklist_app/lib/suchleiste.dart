import 'package:checklist_app/einstellungen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suchleise extends StatefulWidget {
  const Suchleise({Key? key}) : super(key: key);

  @override
  _SuchleiseState createState() => _SuchleiseState();
}

class _SuchleiseState extends State<Suchleise> {
  final TextEditingController _controller = TextEditingController();

  String gesuchteswort = "";

  @override
  void initState() {
    super.initState();
    _controller.text = gesuchteswort;
    _controller.addListener(() {
      setState(() {
        gesuchteswort = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(85, 0, 10, 50.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              textAlign: TextAlign.center,
              autofocus: true,
              style: TextStyle(fontSize: 23),
              decoration: InputDecoration.collapsed(
                  hintText: "Suche:", border: InputBorder.none),
            ),
          ),
          Container(
            width: 10,
          ),
          ElevatedButton(onPressed: search, child: Icon(Icons.search))
        ],
      ),
    );
  }

  void settings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Einstellungen()));
  }

  void search() {}
}
