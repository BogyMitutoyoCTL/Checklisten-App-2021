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
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(onPressed: settings, child: Icon(Icons.settings)),
          Container(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              controller: _controller,
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration.collapsed(
                  hintText: "Search", border: InputBorder.none),
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
