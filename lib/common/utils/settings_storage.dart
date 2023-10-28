import 'package:localstorage/localstorage.dart';


abstract class SettingsStorage{

  Future<dynamic> get(String key);

  Future<void> store(String key, dynamic value);

  void remove(String key);

}


class LocalSettingsStorage extends SettingsStorage{

  final String _fileName = "vega.settings";
  late LocalStorage localStorage;
  LocalSettingsStorage(){
    localStorage = LocalStorage(_fileName);
  }

  @override
  Future<dynamic> get(String key) async{
    return await localStorage.getItem(key);
  }

  @override
  Future<void> store(String key, dynamic value) async{
    await localStorage.setItem(key, value);
  }

  @override
  Future<void> remove(String key) async{
    await localStorage.deleteItem(key);
  }

}