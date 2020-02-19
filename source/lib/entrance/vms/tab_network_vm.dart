import 'package:flutter/material.dart';
import '../models/tab_widgets_model.dart';

class TabNetworkVM {

  final fieldController = TextEditingController();
  
  final list = [
    TabWidgetsListModel(Icon(Icons.library_books), Text("Json")),
    TabWidgetsListModel(Icon(Icons.http), Text("Http")),
    TabWidgetsListModel(Icon(Icons.data_usage), Text("Dio")),
  ];

}