import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

class ResponsiveIcon extends ResponsiveStatelessWidget {
  
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
  ResponsiveIcon(
    icon, {
    Key? key,
    size,
    color,
    semanticLabel,
    textDirection,
    double scaleWatch: 0.1,
    double scaleSmallPhone: 1.0,
    double scaleMediumPhone: 1.0,
    double scaleLargePhone: 1.5,
    double scaleSmallTablet: 1.8,
    double scaleMediumTablet: 2.0,
    double scaleLargeTablet: 2.5,
    double scaleMediumDesktop: 3.0,
    double scaleLargeDesktop: 3.6,
    double scaleTelevision: 4.2,
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
        .set('icon', icon)
        .set('size', size)
        .set('color', color)
        .set('semanticLabel', semanticLabel)
        .set('textDirection', textDirection);
    }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      double? iconSize = 0.0;
      var hasSize = has('size');

      print('hasSize: $hasSize');

      if(hasSize) {
          iconSize = get('size');
      } else {
          final IconThemeData iconTheme = IconTheme.of(context);
          iconSize = iconTheme.size;
      }
      print('iconSize: $iconSize');

      var newIconSize = iconSize! * scale;
      print('newIconSize: $newIconSize');
    
      return Icon(
        get('icon'),
        key: get('key'),
        size: newIconSize,
        color: get('color'),
        semanticLabel: get('semanticLabel'),
        textDirection: get('textDirection')
      );
  }

}