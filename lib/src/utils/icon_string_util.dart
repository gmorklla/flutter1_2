import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
};

final _colors = <String, Color>{
  'blueGrey': Colors.blueGrey,
  'amber': Colors.amber,
  'cyanAccent': Colors.cyanAccent,
  'deepPurple': Colors.deepPurple,
};

Icon getIcon(String name, String color) {
  return Icon(_icons[name], color: _colors[color]);
}
