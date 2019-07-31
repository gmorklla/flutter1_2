import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue1 = 0.0;
  bool _blockResize = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSliders(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSliders() {
    return Slider(
        activeColor: Colors.indigoAccent,
        value: _sliderValue1,
        min: 0.0,
        max: 400.0,
        onChanged: (_blockResize)
            ? null
            : (valor) {
                setState(() {
                  _sliderValue1 = valor;
                });
              });
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _blockResize,
    //   onChanged: (value) {
    //     setState(() {
    //       _blockResize = value;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear resize'),
      secondary: Icon(Icons.photo_size_select_large),
      value: _blockResize,
      onChanged: (value) {
        setState(() {
          _blockResize = value;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear resize'),
      secondary: Icon(Icons.photo_size_select_large),
      value: _blockResize,
      onChanged: (value) {
        setState(() {
          _blockResize = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      width: _sliderValue1,
      fit: BoxFit.contain,
      placeholder: AssetImage('assets/loading.gif'),
      image: NetworkImage(
          'https://cdn.shopify.com/s/files/1/0191/7850/products/RICKMORTY_39_-_COVER_A_FNL_WEB.jpg?v=1530034748'),
    );
  }
}
