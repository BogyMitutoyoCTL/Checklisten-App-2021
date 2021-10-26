import 'package:flutter/material.dart';

class ChecklisteAusfuellen extends StatelessWidget {
  const ChecklisteAusfuellen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkliste1"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Row(
        children: [
          ElevatedButton(onPressed: hinzufuegen, child: Text("hinzufuegen"))
        ],
      ),
    );
  }

  void hinzufuegen() {}
}
