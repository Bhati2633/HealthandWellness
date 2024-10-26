import 'package:flutter/material.dart';

class Affirmation {
  bool saved = false;
  String text = '';
  Widget icon = Icon(Icons.bookmark_outline);

  Affirmation(String text) {
    this.text = text;
  }

  void toggleSaved() {
    saved = !saved;
    if (saved){
      icon = Icon(Icons.bookmark);
    }
    else{
      icon = Icon(Icons.bookmark_outline);
    }
  }

  void setText(String text) {
    this.text = text;
  }

  Widget getIcon(){
    return icon;
  }

  bool getSaved() {
    return saved;
  }

  String getText() {
    return text;
  }
}