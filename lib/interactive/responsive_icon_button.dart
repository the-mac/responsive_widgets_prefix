import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

class ResponsiveIconButton extends ResponsiveStatelessWidget {
  final Icon icon;
  final double iconSize;
  final VoidCallback onPressed;
  
  /// Constructs a responsive asset image, that accepts a path String to and image asset.
  /// @param scaleWatch The responsive scale for watch devices (default: 0.1)
  /// @param scaleSmallPhone The responsive scale for small phone devices (default: 1.0)
  /// @param scaleMediumPhone The responsive scale for medium phone devices (default: 1.0)
  /// @param scaleLargePhone The responsive scale for large phone devices (default: 1.5)
  /// @param scaleSmallTablet The responsive scale for small tablet devices (default: 1.8)
  /// @param scaleMediumTablet The responsive scale for medium tablet devices (default: 2.0)
  /// @param scaleLargeTablet The responsive scale for large tablet devices (default: 2.5)
  /// @param scaleMediumDesktop The responsive scale for medium desktop devices (default: 3.0)
  /// @param scaleLargeDesktop The responsive scale for large desktop devices (default: 3.6)
  /// @param scaleTelevision The responsive scale for TV devices (default: 4.2)
  ResponsiveIconButton({
    Key? key,
    this.iconSize = 24.0,
    required this.icon,
    required this.onPressed,
    VisualDensity? visualDensity,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    AlignmentGeometry alignment = Alignment.center,
    double? splashRadius,
    Color? color,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color? disabledColor,
    FocusNode? focusNode,
    bool autofocus = false,
    String? tooltip,
    bool enableFeedback = true,
    BoxConstraints? constraints,
    double scaleWatch = 0.1,
    double scaleSmallPhone = 1.0,
    double scaleMediumPhone = 1.0,
    double scaleLargePhone = 1.5,
    double scaleSmallTablet = 1.8,
    double scaleMediumTablet = 2.0,
    double scaleLargeTablet = 2.5,
    double scaleMediumDesktop = 3.0,
    double scaleLargeDesktop = 3.6,
    double scaleTelevision = 4.2,
  }) : super(
    scaleWatch: scaleWatch,
    scaleSmallPhone: scaleSmallPhone, 
    scaleMediumPhone: scaleMediumPhone,
    scaleLargePhone: scaleLargePhone, 
    scaleSmallTablet: scaleSmallTablet,
    scaleMediumTablet: scaleMediumTablet, 
    scaleLargeTablet: scaleLargeTablet, 
    scaleMediumDesktop: scaleMediumDesktop,
    scaleLargeDesktop: scaleLargeDesktop, 
    scaleTelevision: scaleTelevision
  ) {
        set('key', key)
        .set('alignment', alignment)
        .set('visualDensity', visualDensity)
        .set('padding', padding)
        .set('splashRadius', splashRadius)
        .set('color', color)
        .set('focusColor', focusColor)
        .set('hoverColor', hoverColor)
        .set('highlightColor', highlightColor)
        .set('splashColor', splashColor)
        .set('disabledColor', disabledColor)
        .set('focusNode', focusNode)
        .set('autofocus', autofocus)
        .set('tooltip', tooltip)
        .set('enableFeedback', enableFeedback)
        .set('constraints', constraints);
    }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      var newIconSize = iconSize * scale;
    
      return IconButton(
        icon: icon,
        iconSize: newIconSize,
        onPressed: onPressed,
        key: get('key'),
        alignment: get('alignment'),
        padding: get('padding'),
        splashRadius: get('splashRadius'),
        color: get('color'),
        focusColor: get('focusColor'),
        hoverColor: get('hoverColor'),
        highlightColor: get('highlightColor'),
        splashColor: get('splashColor'),
        disabledColor: get('disabledColor'),
        focusNode: get('focusNode'),
        autofocus: get('autofocus'),
        tooltip: get('tooltip'),
        enableFeedback: get('enableFeedback'),
        constraints: get('constraints')
      );
  }

}