import 'package:flutter/material.dart';

class TextModel {
  final String text;
  final TextStyle style;
  final double? maxLines;

  TextModel({required this.text, required this.style, this.maxLines});
}
