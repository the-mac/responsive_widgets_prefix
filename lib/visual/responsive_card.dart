
import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

/// Responsive Card is a wrapper around [Card], that allows for scaling of the card's
/// margin. It does this by extending ResponsiveStatelessWidget,
/// and assigning a scale for different device sizes.
class ResponsiveCard extends ResponsiveStatelessWidget {
  
  Widget? child;
  
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
  ResponsiveCard({
    this.child, 
    Color? color,
    Color? shadowColor,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
    double scaleWatch = 0.1,
    double scaleSmallPhone = 1.0,
    double scaleMediumPhone = 1.0,
    double scaleLargePhone = 1.5,
    double scaleSmallTablet = 2.8,
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
      .set('color', color)
      .set('shadowColor', shadowColor)
      .set('elevation', elevation)
      .set('shape', shape)
      .set('borderOnForeground', borderOnForeground)
      .set('margin', margin)
      .set('clipBehavior', clipBehavior)
      .set('semanticContainer', semanticContainer);
     
  }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      var newMargin = (get('margin') ?? const EdgeInsets.all(4.0)) as EdgeInsets;

      var newLeft = (newMargin.left == 0 ? 0 : newMargin.left * scale) as double;
      var newTop = (newMargin.top == 0 ? 0 : newMargin.top * scale) as double;
      var newRight = (newMargin.right == 0 ? 0 : newMargin.right * scale) as double;
      var newBottom = (newMargin.bottom == 0 ? 0 : newMargin.bottom * scale) as double;

      return Card(
          child: child,
          margin: EdgeInsets.fromLTRB(newLeft, newTop, newRight, newBottom),
          key: get('key'),
          color: get('color'),
          shadowColor: get('shadowColor'),
          elevation: get('elevation'),
          clipBehavior: get('clipBehavior'),
          shape: get('shape'),
          borderOnForeground: get('borderOnForeground'),
          semanticContainer: get('semanticContainer'),
        
      );
  }

}