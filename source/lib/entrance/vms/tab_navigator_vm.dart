import 'package:flutter/material.dart';
import '../models/tab_widgets_model.dart';

class TabNavigatorVM {

  final fieldController = TextEditingController();
  
  final list = [
    TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("普通路由")),
    TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("普通传值路由")),
    TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("命名路由")),
    TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("命名传值路由")),
    TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("替换路由")),
    TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("移除路由")),
    TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("回传路由")),
  ];

}