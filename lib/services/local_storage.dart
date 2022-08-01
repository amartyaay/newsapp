import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = StateNotifierProvider(((ref) => LocalStorage()));

class LocalStorage extends StateNotifier {
  int value = 0;
  LocalStorage() : super(0);
  Future<void> saveData() async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt('score', value);
  }

  Future<void> getData() async {
    final pref = await SharedPreferences.getInstance();
    value = pref.getInt('score') ?? 0;
    // return value;
  }

  void increase() => value += 1;
}
