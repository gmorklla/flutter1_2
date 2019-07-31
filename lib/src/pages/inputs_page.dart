import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _selectedItem = 'Volar';
  TextEditingController _fechaCtrl = new TextEditingController();
  List<String> _poderes = ['Fuerza sobrehumana', 'Volar', 'Rayos X'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearDropdown(),
            _crearPersona()
          ],
        ));
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Escribe tu nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          counter: Text('Letras ${_email.length}'),
          hintText: 'Email de la persona',
          labelText: 'Correo electrónico',
          helperText: 'Proporciona un email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          counter: Text('Letras ${_password.length}'),
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          helperText: 'Proporciona una contraseña',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.security),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _fechaCtrl,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          helperText: 'Establece tu fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1982),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString().substring(0, 10);
        _fechaCtrl.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getItemsForDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('[ ${poder.substring(0, 2).toUpperCase()} ]'),
            SizedBox(width: 10),
            Text(
              poder,
            ),
          ],
        ),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 25.0,
        ),
        Expanded(
          child: DropdownButton(
            icon: Icon(Icons.search),
            isExpanded: true,
            value: _selectedItem,
            items: getItemsForDropdown(),
            onChanged: (item) {
              setState(() {
                _selectedItem = item;
              });
            },
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_box),
              trailing: CircleAvatar(
                child: Text(_selectedItem.substring(0, 2).toUpperCase()),
              ),
              title:
                  Text('${_nombre.length > 0 ? _nombre : "Datos registrados"}'),
              subtitle: Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('$_email'),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text('${_fechaCtrl.text}')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
