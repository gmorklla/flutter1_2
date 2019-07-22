import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(children: _crearItems()),
    );
  }

  List<Widget> _crearItems() => opciones
      .map((item) => Column(
            children: <Widget>[
              ListTile(
                title: Text(item),
                subtitle: Text('Subtitulo'),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
              Divider()
            ],
          ))
      .toList();
}
