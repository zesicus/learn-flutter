import 'package:flutter/material.dart';

class TabListModel {
  String title;
  bool isExpanded;
  List<TabWidgetsListModel> children;
  TabListModel(this.title, this.isExpanded, this.children);
}

class TabWidgetsListModel {
  Icon icon;
  Text text;
  TabWidgetsListModel(this.icon, this.text);
}