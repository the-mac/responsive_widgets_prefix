import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_widgets.dart';
import 'package:responsive_widgets_prefix/responsive_helper.dart';

class ResponsivePadding extends ResponsiveStatelessWidget {

  final Widget? child;
  final EdgeInsets padding;
  
  /// Constructs a responsive padding, that accepts a child Widget.
  ///
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
  ResponsivePadding({
    this.child, 
    required this.padding,
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
  );

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      var left = padding.left == 0 ? 0 : padding.left * scale;
      var top = padding.top == 0 ? 0 : padding.top * scale;
      var right = padding.right == 0 ? 0 : padding.right * scale;
      var bottom = padding.bottom == 0 ? 0 : padding.bottom * scale;

      var responsiveLeftTooSmall = left < 0;
      var newLeft = (responsiveLeftTooSmall ? 0 : left).toDouble();
      if(responsiveLeftTooSmall) print('$this left too small ($left), improper inset used newLeft: $newLeft');

      var responsiveTopTooSmall = top < 0;
      var newTop = (responsiveTopTooSmall ? 0 : top).toDouble();
      if(responsiveTopTooSmall) print('$this top too small ($top), improper inset used newTop: $newTop');

      var responsiveRightTooSmall = right < 0;
      var newRight = (responsiveRightTooSmall ? 0 : right).toDouble();
      if(responsiveRightTooSmall) print('$this right too small ($right), improper inset used newRight: $newRight');

      var responsiveBottomTooSmall = bottom < 0;
      var newBottom = (responsiveBottomTooSmall ? 0 : bottom).toDouble();
      if(responsiveBottomTooSmall) print('$this bottom too small ($bottom), improper inset used newBottom: $newBottom');
    
      return Padding(
          padding: EdgeInsets.fromLTRB(newLeft, newTop, newRight, newBottom),
          child: child ?? Container(),
      );
  }

}