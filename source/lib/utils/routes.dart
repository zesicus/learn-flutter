import 'package:flutter/material.dart';
import '../entrance/entrance.dart';
import '../navigator/pages/named_pass_value_page.dart';
import '../navigator/pages/named_route_page.dart';
import '../navigator/pages/replaced_route_page.dart';
import '../navigator/pages/root_route_page.dart';
import '../navigator/pages/pop_feedback_page.dart';
import '../network/pages/network_http_page.dart';
import '../network/pages/network_json_page.dart';
import '../widgets/origin/pages/widget_button_page.dart';
import '../widgets/origin/pages/widget_card_page.dart';
import '../widgets/origin/pages/widget_checkbox_page.dart';
import '../widgets/origin/pages/widget_column_row_page.dart';
import '../widgets/origin/pages/widget_container_page.dart';
import '../widgets/origin/pages/widget_date_page.dart';
import '../widgets/origin/pages/widget_dialog_page.dart';
import '../widgets/origin/pages/widget_grid_view_page.dart';
import '../widgets/origin/pages/widget_image_page.dart';
import '../widgets/origin/pages/widget_layout_page.dart';
import '../widgets/origin/pages/widget_list_view_page.dart';
import '../widgets/origin/pages/widget_radio_page.dart';
import '../widgets/origin/pages/widget_stack_page.dart';
import '../widgets/origin/pages/widget_switch_page.dart';
import '../widgets/origin/pages/widget_text_field_page.dart';
import '../widgets/origin/pages/widget_text_page.dart';
import '../widgets/origin/pages/widget_wrap_page.dart';
import '../widgets/origin/pages/widget_single_child_page.dart';
import '../widgets/customize/pages/widget_complex_form_page.dart';
import '../widgets/customize/pages/widget_fold_app_bar_page.dart';
import '../widgets/customize/pages/widget_persistent_page.dart';
import '../widgets/customize/pages/widget_nested_scroll_page.dart';
import '../widgets/customize/pages/widget_gestures_page.dart';
import '../widgets/customize/pages/widget_animation_page.dart';
import '../widgets/customize/pages/widget_tween_page.dart';
import '../widgets/customize/pages/widget_animation_widget_page.dart';
import '../widgets/customize/pages/widget_staggered_page.dart';
import '../widgets/customize/pages/widget_hero_page.dart';

// MARK: - 路由
final routes = {
  '/': (context, {arguments = 0}) => Entrance(currentTabIndex: arguments),
  // 控件 - 基础
  '/widget_container': (context) => WidgetContainerPage(),
  '/widget_text': (context) => WidgetTextPage(),
  '/widget_layout': (context) => WidgetLayoutPage(),
  '/widget_column_row': (context) => WidgetColumnRowPage(),
  '/widget_wrap': (context) => WidgetWrapPage(),
  '/widget_stack': (context) => WidgetStackPage(),
  '/widget_card': (context) => WidgetCardPage(),
  '/widget_list_view': (context) => WidgetListViewPage(),
  '/widget_grid_view': (context) => WidgetGridViewPage(),
  '/widget_image': (context) => WidgetImagePage(),
  '/widget_button': (context) => WidgetButtonPage(),
  '/widget_field': (context) => WidgetTextFieldPage(),
  '/widget_checkbox': (context) => WidgetCheckboxPage(),
  '/widget_radio': (context) => WidgetRadioPage(),
  '/widget_switch': (context) => WidgetSwitchPage(),
  '/widget_date': (context) => WidgetDatePage(),
  '/widget_dialog': (context) => WidgetDialogPage(),
  '/widget_scroll': (context) => WidgetSingleChildPage(),
  // 控件 - 进阶
  '/widget_custom_scroll': (context) => WidgetComplexFormPage(),
  '/widget_sliver_bar': (context) => WidgetFoldAppBarPage(),
  '/widget_persistent': (context) => WidgetPersistentPage(),
  '/widget_nested': (context) => WidgetNestedScrollPage(),
  '/widget_gesture': (context) => WidgetGesturesPage(),
  // 控件 - 动画
  '/widget_animation': (context) => WidgetAnimationpage(),
  '/widget_tween': (context) => WidgetTweenPage(),
  '/widget_aw': (context) => WidgetAnimationWidgetpage(),
  '/widget_staggered': (context) => WidgetStaggeredpage(),
  '/widget_hero': (context) => WidgetHeroPage(),
  // 路由
  '/navigator_named': (context) => NamedRoutePage(),
  '/navigator_pass_value': (context, {arguments}) => NamedPassValuePage(argument: arguments),
  '/navigator_replaced': (context) => ReplacedRoutePage(),
  '/navigator_root': (context) => RooteRoutePage(),
  '/navigator_pop': (context) => PopFeedbackPage(),
  // 网络
  '/network_json': (context) => NetworkJsonPage(),
  '/network_http': (context) => NetworkHttpPage(),
};

final RouteFactory onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name]; 
  if (pageContentBuilder != null) {
    final Route route = MaterialPageRoute(
      builder: (context) => settings.arguments == null ? pageContentBuilder(context) :
          pageContentBuilder(context, arguments: settings.arguments),
    );
    return route;
  } else {
    return MaterialPageRoute(builder: (context) => BlankPage());
  }
};

// 空路由
class BlankPage extends StatelessWidget {
  const BlankPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}