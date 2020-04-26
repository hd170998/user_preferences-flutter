import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();
  factory PreferenciasUsuario (){
    return _instancia;
  }

  SharedPreferences _prefs;

  PreferenciasUsuario._internal(){}



  initPrefs()async{
    this._prefs =await SharedPreferences.getInstance();
  }
  /*bool _colorSecundario;
  int _genero;
  String _nombre;*/

  get genero{
    return _prefs.getInt('genero')?? 1;
  }

  set genero(int valor){
    _prefs.setInt('genero', valor);
  }
  get colorSecundario{
    return _prefs.getBool('colorSecundario')?? false;
  }

  set colorSecundario(bool valor){
    _prefs.setBool('colorSecundario', valor);
  }
  get nombreUsuario{
    return _prefs.getString('nombreUsuario')?? '';
  }

  set nombreUsuario(String valor){
    _prefs.setString('nombreUsuario', valor);
  }
  get ultimaPagina{
    return _prefs.getString('ultimaPagina')?? 'home';
  }

  set ultimaPagina(String valor){
    _prefs.setString('ultimaPagina', valor);
  }
}