import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _keyAffirmations = 'saved_affirmations';

  static Future<void> saveAffirmation(String affirmation) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedAffirmations = prefs.getStringList(_keyAffirmations) ?? [];
    savedAffirmations.add(affirmation);
    prefs.setStringList(_keyAffirmations, savedAffirmations);
  }

  static Future<List<String>> getSavedAffirmations() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyAffirmations) ?? [];
  }
}
