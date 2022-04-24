
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

class ResponsiveSwitch extends ResponsiveStatelessWidget {

  /// {@macro flutter.material.switch.onChanged}
  final ValueChanged<bool>? onChanged;
  
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
  ResponsiveSwitch({
    Key? key,
    required bool value,
    bool tristate = false,
    required this.onChanged,
    MouseCursor? mouseCursor,
    Color? activeColor,
    MaterialStateProperty<Color?>? fillColor,
    Color? checkColor,
    Color? focusColor,
    Color? hoverColor,
    MaterialStateProperty<Color?>? overlayColor,
    double? splashRadius,
    MaterialTapTargetSize? materialTapTargetSize,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    VisualDensity? visualDensity,
    FocusNode? focusNode,
    bool autofocus = false,
    OutlinedBorder? shape,
    BorderSide? side,
    Color? activeTrackColor,
    Color? inactiveThumbColor,
    Color? inactiveTrackColor,
    ImageProvider? activeThumbImage,
    ImageErrorListener? onActiveThumbImageError,
    ImageProvider? inactiveThumbImage,
    ImageErrorListener? onInactiveThumbImageError,
    MaterialStateProperty<Color?>? thumbColor,
    MaterialStateProperty<Color?>? trackColor,
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
          .set('activeColor', activeColor)
          .set('activeTrackColor', activeTrackColor)
          .set('inactiveThumbColor', inactiveThumbColor)
          .set('inactiveTrackColor', inactiveTrackColor)
          .set('activeThumbImage', activeThumbImage)
          .set('onActiveThumbImageError', onActiveThumbImageError)
          .set('inactiveThumbImage', inactiveThumbImage)
          .set('onInactiveThumbImageError', onInactiveThumbImageError)
          .set('materialTapTargetSize', materialTapTargetSize)
          .set('thumbColor', thumbColor)
          .set('trackColor', trackColor)
          .set('dragStartBehavior', dragStartBehavior)
          .set('mouseCursor', mouseCursor)
          .set('focusColor', focusColor)
          .set('hoverColor', hoverColor)
          .set('overlayColor', overlayColor)
          .set('splashRadius', splashRadius)
          .set('focusNode', focusNode)
          .set('autofocus', autofocus);
      
  }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      return Transform.scale(
          scale: scale,
          child: Switch(
              key : get('key'),
              value : get('value'),
              onChanged : onChanged,
              activeColor : get('activeColor'),
              activeTrackColor : get('activeTrackColor'),
              inactiveThumbColor : get('inactiveThumbColor'),
              inactiveTrackColor : get('inactiveTrackColor'),
              activeThumbImage : get('activeThumbImage'),
              onActiveThumbImageError : get('onActiveThumbImageError'),
              inactiveThumbImage : get('inactiveThumbImage'),
              onInactiveThumbImageError : get('onInactiveThumbImageError'),
              materialTapTargetSize : get('materialTapTargetSize'),
              thumbColor : get('thumbColor'),
              trackColor : get('trackColor'),
              dragStartBehavior : get('dragStartBehavior'),
              mouseCursor : get('mouseCursor'),
              focusColor : get('focusColor'),
              hoverColor : get('hoverColor'),
              overlayColor : get('overlayColor'),
              splashRadius : get('splashRadius'),
              focusNode : get('focusNode'),
              autofocus : get('autofocus'),
          ),
      );
  }

}