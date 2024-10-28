import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _keyAffirmations = 'saved_affirmations';
  static const String _keyExerciseProgress = 'exercise_progress';
  static final StreamController<String> _affirmationController = StreamController<String>.broadcast();

  static Stream<String> get affirmationStream => _affirmationController.stream;

  static Future<void> saveAffirmation(String affirmation) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedAffirmations = prefs.getStringList(_keyAffirmations) ?? [];
    savedAffirmations.add(affirmation);
    prefs.setStringList(_keyAffirmations, savedAffirmations);
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

  static Future<void> saveExerciseProgress(double progress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyExerciseProgress, progress);
  }

  static Future<double> getExerciseProgress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keyExerciseProgress) ?? 0.0;
  }

  static const String _keyExerciseStep = 'exercise_step';

static Future<void> saveExerciseStep(int step) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(_keyExerciseStep, step);
}

static Future<int?> getExerciseStep() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(_keyExerciseStep);
}

}
