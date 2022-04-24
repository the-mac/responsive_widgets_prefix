import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_widgets.dart';
import 'package:responsive_widgets_prefix/responsive_helper.dart';

/// Responsive Button Theme is a wrapper around [ButtonTheme], that allows for scaling of the button's
/// height and width. It does this by extending ResponsiveStatelessWidget,
/// and assigning a scale for different device sizes.
class ResponsiveButtonTheme extends ResponsiveStatelessWidget {
  
  final Widget? child;
  
  /// Constructs a responsive text, that accepts a String of text.
  /// @param scaleWatch The responsive scale for watch devices (default: 0.6)
  /// @param scaleSmallPhone The responsive scale for small phone devices (default:1.0)
  /// @param scaleMediumPhone The responsive scale for medium phone devices (default: 1.0)
  /// @param scaleLargePhone The responsive scale for large phone devices (default: 1.5)
  /// @param scaleSmallTablet The responsive scale for small tablet devices (default: 1.8)
  /// @param scaleMediumTablet The responsive scale for medium tablet devices (default: 2.0)
  /// @param scaleLargeTablet The responsive scale for large tablet devices (default: 2.5)
  /// @param scaleMediumDesktop The responsive scale for medium desktop devices (default: 3.0)
  /// @param scaleLargeDesktop The responsive scale for large desktop devices (default: 3.6)
  /// @param scaleTelevision The responsive scale for TV devices (default: 4.2)
  // ignore: use_key_in_widget_constructors
  ResponsiveButtonTheme({
    Key? key,
    ButtonTextTheme textTheme = ButtonTextTheme.normal,
    ButtonBarLayoutBehavior layoutBehavior = ButtonBarLayoutBehavior.padded,
    double minWidth = 88.0,
    double height = 36.0,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    bool alignedDropdown = false,
    Color? buttonColor,
    Color? disabledColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    ColorScheme? colorScheme,
    MaterialTapTargetSize? materialTapTargetSize,
    this.child,
    double scaleWatch = 0.6,
    double scaleSmallPhone = 0.89,
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
        .set('textTheme', textTheme)
        .set('layoutBehavior', layoutBehavior)
        .set('minWidth', minWidth)
        .set('height', height)
        .set('padding', padding)
        .set('shape', shape)
        .set('alignedDropdown', alignedDropdown)
        .set('buttonColor', buttonColor)
        .set('disabledColor', disabledColor)
        .set('focusColor', focusColor)
        .set('hoverColor', hoverColor)
        .set('highlightColor', highlightColor)
        .set('splashColor', splashColor)
        .set('colorScheme', colorScheme)
        .set('materialTapTargetSize', materialTapTargetSize);
  }

  @override Key getKey() { return get('key') as Key; }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {
    
    var newMinWidth = (get('minWidth') as double) * scale;
    var newHeight = (get('height') as double) * scale;

    return ButtonTheme(
        key: get('key'),
        textTheme: get('textTheme'),
        layoutBehavior: get('layoutBehavior'),
        minWidth: newMinWidth,
        height: newHeight,
        padding: get('padding'),
        shape: get('shape'),
        alignedDropdown: get('alignedDropdown'),
        buttonColor: get('buttonColor'),
        disabledColor: get('disabledColor'),
        focusColor: get('focusColor'),
        hoverColor: get('hoverColor'),
        highlightColor: get('highlightColor'),
        splashColor: get('splashColor'),
        colorScheme: get('colorScheme'),
        materialTapTargetSize: get('materialTapTargetSize'),
        child: child!

    );  
  }
}