import '../../utils/styles.dart';
import 'package:flutter/material.dart';
import '../vms/tab_widgets_vm.dart';

class TabWidgetsPage extends StatefulWidget {
  TabWidgetsPage({Key key}) : super(key: key);

  @override
  _TabWidgetsPageState createState() => _TabWidgetsPageState();
}

class _TabWidgetsPageState extends State<TabWidgetsPage> {
  final vm = TabWidgetsVM();

  List<ExpansionTile> _expandChildren() {
    List<ExpansionTile> _theExpandChildren = [];
    for (var i = 0; i < vm.listSource.length; i++) {
      final model = vm.listSource[i];
      // 子cell
      final List<ListTile> _listChildren = model.children.map((model) {
        return ListTile(
          leading: Container(
            child: model.icon,
            margin: EdgeInsets.only(left: 10, right: 0),
          ),
          title: model.text,
          onTap: () {
            _onTapExecution(model.text.data);
          },
        );
      }).toList();
      // 母cell
      _theExpandChildren.add(
        ExpansionTile(
          initiallyExpanded: true,
          title: Container(
            height: 40,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Align(
                  alignment: Alignment(-1.05, 0),
                  child: model.isExpanded
                      ? Icon(Icons.arrow_drop_down, size: 30, color: Theme.of(context).accentColor)
                      : Icon(Icons.arrow_right, size: 30, color: Color(0xff555555)),
                ),
                Align(
                  alignment: Alignment(-0.75, 0),
                  child: model.isExpanded ? headerHighlightedText(model.title, Theme.of(context).accentColor) : headerText(model.title),
                ),
              ],
            ),
          ),
          children: _listChildren,
          trailing: Container(width: 30, height: 30),
          onExpansionChanged: (isOn) {
            setState(() {
              vm.listSource[i].isExpanded = isOn;
            });
          },
        ),
      );
    }
    return _theExpandChildren;
  }

  _onTapExecution(String text) {
    // 页面跳转
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
      default:
        print("Others");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _expandChildren(),
    );
  }
}
