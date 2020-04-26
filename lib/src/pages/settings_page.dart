import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/src/share_prefs/preferencias_usuario.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';


class SettingsPage extends StatefulWidget {

  static final String routname ='settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = '';


  TextEditingController _textEditingController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState(){
    super.initState();
    _textEditingController = new TextEditingController(text: prefs.nombreUsuario);
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    prefs.ultimaPagina= SettingsPage.routname;
  }
  _setSelectedRadio (int valor)async{
    prefs.genero= valor;
    _genero = valor;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario)? Colors.teal: Colors.deepPurple,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            title: Text('Color Secundario'),
            value: _colorSecundario,
            onChanged: (bool value) {
              _colorSecundario = value;
              prefs.colorSecundario= value;
              setState(() {

            });},
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre del user',
              ),
              onChanged: (value){
                prefs.nombreUsuario=value;
              },
            ),
          )
        ],
      )
    );
  }

}
