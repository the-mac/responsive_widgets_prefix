
import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

/// Responsive Checkbox is a wrapper around [Checkbox], that allows for scaling of the checkbox's
/// size with a Transform wrapper. It does this by extending ResponsiveStatelessWidget,
/// and assigning a scale for different device sizes.
class ResponsiveCheckbox extends ResponsiveStatelessWidget {

  /// {@macro flutter.material.checkbox.onChanged}
  final ValueChanged<bool?>? onChanged;
  
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
  ResponsiveCheckbox({
    Key? key,
    required bool? value,
    bool tristate = false,
    required ValueChanged<bool?>? this.onChanged,
    MouseCursor? mouseCursor,
    Color? activeColor,
    MaterialStateProperty<Color?>? fillColor,
    Color? checkColor,
    Color? focusColor,
    Color? hoverColor,
    MaterialStateProperty<Color?>? overlayColor,
    double? splashRadius,
    MaterialTapTargetSize? materialTapTargetSize,
    VisualDensity? visualDensity,
    FocusNode? focusNode,
    bool autofocus = false,
    OutlinedBorder? shape,
    BorderSide? side,
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
            .set('tristate', tristate)
            .set('mouseCursor', mouseCursor)
            .set('activeColor', activeColor)
            .set('fillColor', fillColor)
            .set('checkColor', checkColor)
            .set('focusColor', focusColor)
            .set('hoverColor', hoverColor)
            .set('overlayColor', overlayColor)
            .set('splashRadius', splashRadius)
            .set('materialTapTargetSize', materialTapTargetSize)
            .set('visualDensity', visualDensity)
            .set('focusNode', focusNode)
            .set('autofocus', autofocus)
            .set('shape', shape)
            .set('side', side)
        ;
      
  }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      return Transform.scale(
          scale: scale,
          child: Checkbox(
            key : get('key'),
            value : get('value'),
            tristate : get('tristate'),
            onChanged : onChanged,
            mouseCursor : get('mouseCursor'),
            activeColor : get('activeColor'),
            fillColor : get('fillColor'),
            checkColor : get('checkColor'),
            focusColor : get('focusColor'),
            hoverColor : get('hoverColor'),
            overlayColor : get('overlayColor'),
            splashRadius : get('splashRadius'),
            materialTapTargetSize : get('materialTapTargetSize'),
            visualDensity : get('visualDensity'),
            focusNode : get('focusNode'),
            autofocus : get('autofocus'),
            shape : get('shape'),
            side : get('side'),
          ),
      );
  }

}