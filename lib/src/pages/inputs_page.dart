import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          children: <Widget>[_crearInput()],
        ));
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
    );
  }
}
