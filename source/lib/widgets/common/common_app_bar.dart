import 'dart:io';
import 'package:flutter/material.dart';

// 通用导航栏
class CommonAppBar extends AppBar {
  final bool showBack;
  final Function backFuntion;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final ShapeBorder shape;
  final IconThemeData actionsIconTheme;
  final String titleString;

  CommonAppBar({
    Key key,
    this.showBack = true,
    this.backFuntion,
    Widget leading,
    this.automaticallyImplyLeading = true,
    Widget title,
    this.titleString = "",
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor = Colors.blue,
    this.brightness = Brightness.dark,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
  })  : assert(automaticallyImplyLeading != null),
        assert(elevation == null || elevation >= 0.0),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        leading = showBack
            ? (leading ?? CommonAppBarBackBtn(backFuntion: backFuntion))
            : null,
        title = Text(
          titleString,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        super(
          key: key,
          leading: showBack ? leading : null,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          shape: shape,
          backgroundColor: backgroundColor,
          brightness: brightness,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          textTheme: textTheme,
          primary: primary,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
        );

  @override
  Size get preferredSize => Size.fromHeight(Platform.isIOS ? 44 : 50);
}

// 通用返回按钮
class CommonAppBarBackBtn extends StatelessWidget {
  final Function backFuntion;
  const CommonAppBarBackBtn({Key key, this.backFuntion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-2.5, 0),
      child: IconButton(
        icon: Image.asset('res/images/sny_back.png', height: 20),
        onPressed: () =>
            backFuntion != null ? backFuntion() : Navigator.pop(context),
      ),
    );
  }
}
