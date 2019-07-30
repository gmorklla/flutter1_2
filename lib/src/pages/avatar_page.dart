import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://i.cdn.turner.com/adultswim/big/img/2018/01/09/RickMorty2_Marathon_2.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              child: Text('R'),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://cdn.shopify.com/s/files/1/0191/7850/products/RICKMORTY_39_-_COVER_A_FNL_WEB.jpg?v=1530034748'),
        ),
      ),
    );
  }
}
