import 'package:flutter/material.dart';

// import 'package:app1/src/utils/network_image.dart';

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
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
    // final _image = new NetworkImageSSL(
    //     'https://www.switchbacktravel.com/sites/default/files/images/articles/Yellowstone%20landscape%20photo.jpg');
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://www.switchbacktravel.com/sites/default/files/images/articles/Yellowstone%20landscape%20photo.jpg'),
            fadeInDuration: Duration(milliseconds: 500),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text('Algo aquí'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(10.0),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
    );
  }
}
