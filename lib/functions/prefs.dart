import 'package:shared_preferences/shared_preferences.dart';

Future<void> prefsSetSaved(isRemember, login, motDePasse) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('saved', isRemember);
  await prefs.setString('login', login);
  await prefs.setString('motDePasse', motDePasse);
}

Future<void> prefsDeleteSaved() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('saved', false);
  await prefs.setString('login', '');
  await prefs.setString('motDePasse', '');
}

Future<List> prefsGetSaved() async {
  final prefs = await SharedPreferences.getInstance();
  final bool? saved = prefs.getBool('saved');

  if (saved == false || saved == null) {
    return [false, '', ''];
  }

  String? login = prefs.getString('login');
  String? motDePasse = prefs.getString('motDePasse');

  return [true, login, motDePasse];
}
