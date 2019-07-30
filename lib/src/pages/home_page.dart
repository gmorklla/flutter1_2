import 'package:flutter/material.dart';

import 'package:app1/src/providers/menu_provider.dart';
import 'package:app1/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: _lista());
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) => ListView(
        children: _crearItems(snapshot.data, context),
      ),
    );
  }

  List<Widget> _crearItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final wTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon'], 'deepPurple'),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(wTemp)..add(Divider());
    });
    return opciones;
  }
}
