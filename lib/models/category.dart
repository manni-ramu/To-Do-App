import 'package:flutter/material.dart';

enum Categories { Water_Power, Management, Security, Others }

class Category {
  const Category(this.title, this.color);
  final String title;
  final Color color;
}
