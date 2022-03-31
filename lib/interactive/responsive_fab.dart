import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';

class ResponsiveFloatingActionButton extends FloatingActionButton {
  
  ResponsiveFloatingActionButton({
    Key? key,
    Widget? child,
    String? tooltip,
    Color? foregroundColor,
    Color? backgroundColor,
    Color? focusColor,
    Color? hoverColor,
    Color? splashColor,
    Object? heroTag,
    double? elevation,
    double? focusElevation,
    double? hoverElevation,
    double? highlightElevation,
    double? disabledElevation,
    required VoidCallback onPressed,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    bool autofocus = false,
    MaterialTapTargetSize? materialTapTargetSize,
    bool isExtended = false,
  }) : super(
    key: key,
    child: child,
    tooltip: tooltip,
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    focusColor: focusColor,
    hoverColor: hoverColor,
    splashColor: splashColor,
    heroTag: heroTag,
    elevation: elevation,
    focusElevation: focusElevation,
    hoverElevation: hoverElevation,
    highlightElevation: highlightElevation,
    disabledElevation: disabledElevation,
    onPressed: onPressed,
    mini: ResponsiveHelper.currently(ScreenType.Watch),
    shape: shape,
    clipBehavior: clipBehavior,
    focusNode: focusNode,
    autofocus: autofocus,
    materialTapTargetSize: materialTapTargetSize,
    isExtended: isExtended,
  );
}