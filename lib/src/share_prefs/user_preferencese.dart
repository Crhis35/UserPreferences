import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // Ninguna de estas propiedades se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  SharedPreferences _prefs;

  UserPreferences._internal();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET AND SET GENDER
  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int value) {
    _prefs.setInt('gender', value);
  }

  // GET AND SET COLOR
  get secondColor {
    return _prefs.getBool('secondColor') ?? false;
  }

  set secondColor(bool value) {
    _prefs.setBool('secondColor', value);
  }

  // GET AND SET NAME
  get name {
    return _prefs.getString('name') ?? '';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  // GET AND SET LAST PAGE
  get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value) {
    _prefs.setString('lastPage', value);
  }
}
