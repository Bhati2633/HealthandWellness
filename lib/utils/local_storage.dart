import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class LocalStorage {
  static const String _keyAffirmations = 'saved_affirmations';
  static final StreamController<String> _affirmationController = StreamController<String>.broadcast();

  // Stream to listen to saved affirmations
  static Stream<String> get affirmationStream => _affirmationController.stream;

  static Future<void> saveAffirmation(String affirmation) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedAffirmations = prefs.getStringList(_keyAffirmations) ?? [];
    savedAffirmations.add(affirmation);
    prefs.setStringList(_keyAffirmations, savedAffirmations);
    
    // Notify listeners with the latest affirmation
    _affirmationController.add(affirmation);
  }

  static Future<List<String>> getSavedAffirmations() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyAffirmations) ?? [];
  }

  static Future<String?> getLatestAffirmation() async {
    List<String> savedAffirmations = await getSavedAffirmations();
    return savedAffirmations.isNotEmpty ? savedAffirmations.last : null;
  }
}
