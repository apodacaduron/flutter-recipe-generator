import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

class MainState with ChangeNotifier {
  // State
  bool _showWelcome = true;
  bool isLoading = true;

  // Getters
  bool get showWelcome => _showWelcome;
  String get appId => 'c38d08b8';
  String get appKey => '5fe3b21113a26ac338d791d4bd9689a2';
  String get api => 'https://api.edamam.com/search?app_id=$appId&app_key=$appKey&';
  Map<String, String> get headers => { 'Accept-Encoding': 'gzip', };

  // Mutations
  hideWelcome() async {
    await storage.write(key: 'showWelcome', value: 'hide');
    notifyListeners();
  }

  clearStorage() async {
    await storage.deleteAll();
    notifyListeners();
  }

  Stream<bool> readStoredToken() async* {
    isLoading = true;
    String welcome = await storage.read(key: 'showWelcome');
    if (welcome == null) {
      _showWelcome = true;
      isLoading = false;
      yield true;
    } else {
      _showWelcome = false;
    }
    isLoading = false;
    yield false;
  }

  // Actions
}
