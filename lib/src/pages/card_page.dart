import 'dart:io';

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[_cardTipo1(), SizedBox(height: 30.0), _cardTipo2()],
      ),
      backgroundColor: Colors.grey,
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Título'),
            subtitle: Text(
                'Este es un subtítulo para la tarjeta que se debe renderear como ejemplo'),
            contentPadding: EdgeInsets.all(20.0),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final _client = new HttpClient();
    _client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://www.switchbacktravel.com/sites/default/files/images/articles/Yellowstone%20landscape%20photo.jpg'),
          ),
          Container(
            child: Text('Algo aquí'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );
  }
}
