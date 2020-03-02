import 'package:flutter/material.dart';
import '../models/tab_widgets_model.dart';
import '../../utils/styles.dart';
import '../../navigator/pages/normal_route_page.dart';
import '../../navigator/pages/normal_pass_value_page.dart';

class TabVM {
  final fieldController = TextEditingController();

  // 界面源
  List<TabListModel> widgetListSource = [
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
    TabListModel("进阶控件", false, [
      TabWidgetsListModel(Icon(Icons.apps), Text("综合表单")),
      TabWidgetsListModel(Icon(Icons.calendar_view_day), Text("折叠填充")),
      TabWidgetsListModel(Icon(Icons.unfold_more), Text("缩进格")),
      TabWidgetsListModel(Icon(Icons.swap_calls), Text("嵌套连结")),
      TabWidgetsListModel(Icon(Icons.touch_app), Text("手势")),
    ]),
    TabListModel("动画", false, [
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Animation Controller")),
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Tween")),
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Animation Widget")),
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Staggered Widget")),
      TabWidgetsListModel(Icon(Icons.ac_unit), Text("Hero")),
    ]),
    TabListModel("路由", false, [
      TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("普通路由")),
      TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("普通传值路由")),
      TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("命名路由")),
      TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("命名传值路由")),
      TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("替换路由")),
      TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("移除路由")),
      TabWidgetsListModel(Icon(Icons.settings_ethernet), Text("回传路由")),
    ]),
  ];

  // 万花筒源
  final moreListSource = [
    TabListModel("网络", false, [
      TabWidgetsListModel(Icon(Icons.library_books), Text("Json")),
      TabWidgetsListModel(Icon(Icons.http), Text("Http")),
      TabWidgetsListModel(Icon(Icons.data_usage), Text("Dio")),
    ]),
  ];

  /// 列表数据源
  List<ExpansionTile> expandChildren(
      BuildContext context, List<TabListModel> listSource, Function reload) {
    List<ExpansionTile> _theExpandChildren = [];
    for (var i = 0; i < listSource.length; i++) {
      final model = listSource[i];
      // 子cell
      final List<ListTile> _listChildren = model.children.map((model) {
        return ListTile(
          leading: Container(
            child: model.icon,
            margin: EdgeInsets.only(left: 10, right: 0),
          ),
          title: model.text,
          onTap: () {
            _onTapExecution(context, model.text.data);
          },
        );
      }).toList();
      // 母cell
      _theExpandChildren.add(
        ExpansionTile(
          initiallyExpanded: listSource[i].isExpanded,
          title: Container(
            height: 40,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Align(
                  alignment: Alignment(-1.05, 0),
                  child: model.isExpanded
                      ? Icon(Icons.arrow_drop_down,
                          size: 30, color: Theme.of(context).accentColor)
                      : Icon(Icons.arrow_right,
                          size: 30, color: Color(0xff555555)),
                ),
                Align(
                  alignment: Alignment(-0.75, 0),
                  child: model.isExpanded
                      ? headerHighlightedText(
                          model.title, Theme.of(context).accentColor)
                      : headerText(model.title),
                ),
              ],
            ),
          ),
          children: _listChildren,
          trailing: Container(width: 30, height: 30),
          onExpansionChanged: (isOn) {
            listSource[i].isExpanded = isOn;
            reload();
            // setState(() {
            //   vm.
            // });
          },
        ),
      );
    }
    return _theExpandChildren;
  }

  /// Field对话框
  Future<String> _showFieldDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      child: AlertDialog(
        title: Text("传值"),
        content: TextField(
          controller: fieldController,
          decoration: InputDecoration(hintText: "请输入要传的内容"),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text(
              "确定",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Navigator.pop(context, fieldController.text);
            },
          )
        ],
      ),
    );
    return result;
  }

  /// 动作执行
  _onTapExecution(BuildContext context, String text) async {
    switch (text) {
      case "Container":
        Navigator.pushNamed(context, "/widget_container");
        break;
      case "Text":
        Navigator.pushNamed(context, "/widget_text");
        break;
      case "Row & Column":
        Navigator.pushNamed(context, "/widget_column_row");
        break;
      case "Layout":
        Navigator.pushNamed(context, "/widget_layout");
        break;
      case "Wrap":
        Navigator.pushNamed(context, "/widget_wrap");
        break;
      case "Stack":
        Navigator.pushNamed(context, "/widget_stack");
        break;
      case "Card":
        Navigator.pushNamed(context, "/widget_card");
        break;
      case "List View":
        Navigator.pushNamed(context, "/widget_list_view");
        break;
      case "Grid View":
        Navigator.pushNamed(context, "/widget_grid_view");
        break;
      case "Image":
        Navigator.pushNamed(context, "/widget_image");
        break;
      case "Button":
        Navigator.pushNamed(context, "/widget_button");
        break;
      case "Text Field":
        Navigator.pushNamed(context, "/widget_field");
        break;
      case "Check Box":
        Navigator.pushNamed(context, "/widget_checkbox");
        break;
      case "Radio":
        Navigator.pushNamed(context, "/widget_radio");
        break;
      case "Switch":
        Navigator.pushNamed(context, "/widget_switch");
        break;
      case "Date":
        Navigator.pushNamed(context, "/widget_date");
        break;
      case "Dialog":
        Navigator.pushNamed(context, "/widget_dialog");
        break;
      case "Scroll View":
        Navigator.pushNamed(context, "/widget_scroll");
        break;
      case "综合表单":
        Navigator.pushNamed(context, "/widget_custom_scroll");
        break;
      case '折叠填充':
        Navigator.pushNamed(context, "/widget_sliver_bar");
        break;
      case '缩进格':
        Navigator.pushNamed(context, "/widget_persistent");
        break;
      case '嵌套连结':
        Navigator.pushNamed(context, "/widget_nested");
        break;
      case '手势':
        Navigator.pushNamed(context, "/widget_gesture");
        break;
      case 'Animation Controller':
        Navigator.pushNamed(context, "/widget_animation");
        break;
      case 'Tween':
        Navigator.pushNamed(context, "/widget_tween");
        break;
      case 'Animation Widget':
        Navigator.pushNamed(context, "/widget_aw");
        break;
      case 'Staggered Widget':
        Navigator.pushNamed(context, "/widget_staggered");
        break;
      case 'Hero':
        Navigator.pushNamed(context, "/widget_hero");
        break;
      case "普通路由":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NormalRoutePage(),
          ),
        );
        break;
      case "普通传值路由":
        String result = await _showFieldDialog(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NormalPassValuePage(passValue: result == null ? "" : result),
          ),
        );
        break;
      case '命名路由':
        Navigator.pushNamed(context, "/navigator_named");
        break;
      case '命名传值路由':
        String result = await _showFieldDialog(context);
        Navigator.pushNamed(context, "/navigator_pass_value",
            arguments: result == null ? "" : result);
        break;
      case '替换路由':
        Navigator.pushNamed(context, "/navigator_replaced");
        break;
      case '移除路由':
        Navigator.pushNamed(context, "/navigator_root");
        break;
      case '回传路由':
        Navigator.pushNamed(context, "/navigator_pop").then((onValue) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("返回值"),
                content: Text("$onValue"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("确定"),
                  ),
                ],
              );
            },
          );
        });
        break;
      case "Http":
        Navigator.pushNamed(context, "/network_http");
        break;
      case "Json":
        Navigator.pushNamed(context, "/network_json");
        break;
      default:
        print("Others");
        break;
    }
  }
}
