import 'package:flutter/material.dart';
import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

class ResponsiveCircularProgressIndicator extends ResponsiveStatelessWidget {
  
  /// Constructs a responsive container, that accepts a child Widget.
  ///
  /// @param scaleWatch The responsive scale for watch devices (default: 0.8)
  /// @param scaleSmallPhone The responsive scale for small phone devices (default: 1.0)
  /// @param scaleMediumPhone The responsive scale for medium phone devices (default: 1.0)
  /// @param scaleLargePhone The responsive scale for large phone devices (default: 1.5)
  /// @param scaleSmallTablet The responsive scale for small tablet devices (default: 2.0)
  /// @param scaleMediumTablet The responsive scale for medium tablet devices (default: 2.5)
  /// @param scaleLargeTablet The responsive scale for large tablet devices (default: 3.0)
  /// @param scaleMediumDesktop The responsive scale for medium desktop devices (default: 4.0)
  /// @param scaleLargeDesktop The responsive scale for large desktop devices (default: 5.6)
  /// @param scaleTelevision The responsive scale for TV devices (default: 7.2)
  ResponsiveCircularProgressIndicator({
    Key? key,
    double? value,
    Color? backgroundColor,
    Color? color,
    Animation<Color?>? valueColor,
    String? semanticsLabel,
    String? semanticsValue,
    double? strokeWidth = 4.0,
    double? strokeAlign = 0.0,
    StrokeCap? strokeCap,
    double scaleWatch = 0.8,
    double scaleSmallPhone = 1.0,
    double scaleMediumPhone = 1.0,
    double scaleLargePhone = 1.5,
    double scaleSmallTablet = 2.0,
    double scaleMediumTablet = 2.5,
    double scaleLargeTablet = 3.0,
    double scaleMediumDesktop = 4.0,
    double scaleLargeDesktop = 5.6,
    double scaleTelevision = 7.2,
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
          .set('value', value)
          .set('backgroundColor', backgroundColor)
          .set('color', color)
          .set('valueColor', valueColor)
          .set('strokeWidth', strokeWidth)
          .set('strokeAlign', strokeAlign)
          .set('semanticsLabel', semanticsLabel)
          .set('semanticsValue', semanticsValue)
          .set('strokeCap', strokeCap);
      
  }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {
      return Transform.scale(
          scale: scale,
          child: CircularProgressIndicator(
              key : get('key'),
              value : get('value'),
              backgroundColor : get('backgroundColor'),
              color : get('color'),
              valueColor : get('valueColor'),
              strokeWidth : get('strokeWidth'),
              strokeAlign : get('strokeAlign'),
              semanticsLabel : get('semanticsLabel'),
              semanticsValue : get('semanticsValue'),
              strokeCap : get('strokeCap'),
          ),
      );
  }

}