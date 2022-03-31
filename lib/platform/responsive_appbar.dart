import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';

class ResponsiveAppBar extends AppBar {
  
  get preferredSize => ResponsiveHelper.currently(ScreenType.Watch) ? const Size.fromHeight(15.0) : const Size.fromHeight(50.0);

  ResponsiveAppBar({
    Key? key,
    Widget? title,
    Widget? leading,
    bool automaticallyImplyLeading = true,
    List<Widget>? actions,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    double? elevation,
    ShapeBorder? shape,
    Color? backgroundColor,
    Brightness? brightness,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    TextTheme? textTheme,
    bool primary = true,
    bool centerTitle = true,
    bool excludeHeaderSemantics = false,
    double titleSpacing = NavigationToolbar.kMiddleSpacing,
    double toolbarOpacity = 1.0,
    double bottomOpacity = 1.0,  
  }) : super(
    key: key,
    title: title,
    leading: leading,
    automaticallyImplyLeading: automaticallyImplyLeading,
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
    primary: !ResponsiveHelper.currently(ScreenType.Watch),
    centerTitle: centerTitle,
    excludeHeaderSemantics: excludeHeaderSemantics,
    titleSpacing: titleSpacing,
    toolbarOpacity: toolbarOpacity,
    bottomOpacity: bottomOpacity,
  );
}
