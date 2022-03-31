import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

class ResponsiveContainer extends ResponsiveStatelessWidget {
  
  final Widget? child;
  
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
  ResponsiveContainer({
    Key? key,
    this.child,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    Clip clipBehavior = Clip.none,
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
        .set('alignment', alignment)
        .set('padding', padding)
        .set('color', color)
        .set('decoration', decoration)
        .set('foregroundDecoration', foregroundDecoration)
        .set('width', width)
        .set('height', height)
        .set('constraints', constraints)
        .set('margin', margin)
        .set('transform', transform)
        .set('clipBehavior', clipBehavior);        
      }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      double? newWidth;
      double? newHeight;
      var hasConstraints = has('constraints');
      var hasWidth = has('width');
      var hasHeight = has('height');

      if(hasConstraints) {
        var constraints = get('constraints') as BoxConstraints;
        newWidth = constraints.maxWidth * scale;
        newHeight = constraints.maxHeight * scale;
      } else if(hasWidth || hasHeight) {
        newWidth = hasWidth ? get('width') * scale : null;
        newHeight = hasHeight ? get('height') * scale : null;
      } else {
        newWidth = null;
        newHeight = null;
      }

      return Container(
          child: child,
          width: newWidth,
          height: newHeight,
          key: get('key'),
          alignment: get('alignment'),
          padding: get('padding'),
          color: get('color'),
          decoration: get('decoration'),
          foregroundDecoration: get('foregroundDecoration'),
          margin: get('margin'),
          transform: get('transform'),
          clipBehavior: get('clipBehavior'),
      );
  }

}