import 'package:flutter/material.dart';

// Tabbar 字体
Text tabText(String text) => Text(text, style: TextStyle(fontSize: 11));
// 列表字体
Text listText(String text) => Text(text, style: TextStyle(fontSize: 13, color: Color(0xff555555)));
// 可展开cell字体
Text headerText(String text) => Text(text, style: TextStyle(fontSize: 18, color: Color(0xff555555), fontWeight: FontWeight.w500));
Text headerHighlightedText(String text, Color color) => Text(text, style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w500));