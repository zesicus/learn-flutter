import 'package:flutter/material.dart';
import '../models/tab_widgets_model.dart';

class TabWidgetsVM {
  List<TabListModel> listSource = [
    TabListModel("基础控件", true, [
      TabWidgetsListModel(Icon(Icons.crop_din), Text("Container")),
      TabWidgetsListModel(Icon(Icons.font_download), Text("Text")),
      TabWidgetsListModel(Icon(Icons.view_column), Text("Row & Column")),
      TabWidgetsListModel(Icon(Icons.dashboard), Text("Layout")),
      TabWidgetsListModel(Icon(Icons.local_offer), Text("Wrap")),
      TabWidgetsListModel(Icon(Icons.layers), Text("Stack")),
      TabWidgetsListModel(Icon(Icons.list), Text("List View")),
      TabWidgetsListModel(Icon(Icons.grid_on), Text("Grid View")),
      TabWidgetsListModel(Icon(Icons.credit_card), Text("Card")),
      TabWidgetsListModel(Icon(Icons.image), Text("Image")),
      TabWidgetsListModel(Icon(Icons.touch_app), Text("Button")),
      TabWidgetsListModel(Icon(Icons.text_fields), Text("Text Field")),
      TabWidgetsListModel(Icon(Icons.check_box), Text("Check Box")),
      TabWidgetsListModel(Icon(Icons.radio_button_checked), Text("Radio")),
      TabWidgetsListModel(Icon(Icons.g_translate), Text("Switch")),
      TabWidgetsListModel(Icon(Icons.calendar_today), Text("Date")),
      TabWidgetsListModel(Icon(Icons.fiber_smart_record), Text("Dialog")),
      TabWidgetsListModel(Icon(Icons.camera_roll), Text("Scroll View")),
    ]),
    TabListModel("进阶控件", true, [
      TabWidgetsListModel(Icon(Icons.apps), Text("综合表单")),
      TabWidgetsListModel(Icon(Icons.calendar_view_day), Text("折叠填充")),
      TabWidgetsListModel(Icon(Icons.unfold_more), Text("缩进格")),
      TabWidgetsListModel(Icon(Icons.swap_calls), Text("嵌套连结")),
      TabWidgetsListModel(Icon(Icons.touch_app), Text("手势")),
    ]),
    TabListModel("动画", true, [
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Animation Controller")),
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Tween")),
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Animation Widget")),
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Staggered Widget")),
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Hero")),
    ]),
  ];
}
