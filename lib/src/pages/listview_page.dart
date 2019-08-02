import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List page'),
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {
        final img = _listaNumeros[index];
        return FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://picsum.photos/id/$img/500/300'),
        );
      },
    );
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  fetchData() {
    _isloading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isloading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 300,
        curve: Curves.easeInBack, duration: Duration(milliseconds: 500));
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isloading) {
      return Container(
        color: new Color.fromRGBO(126, 146, 255, 0.5),
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Container();
    }
  }
}
