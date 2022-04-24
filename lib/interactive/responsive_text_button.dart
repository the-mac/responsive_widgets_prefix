
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

class ResponsiveTextButton extends ResponsiveStatelessWidget {

  /// {@macro flutter.material.textbutton.onPressed}
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final Widget child;
  
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
  ResponsiveTextButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    required this.child,
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
        .set('style', style)
        .set('focusNode', focusNode)
        .set('autofocus', autofocus)
        .set('clipBehavior', clipBehavior);
      
  }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      double height = 1.0;
      double fontSize = 0.0;
      double? newFontSize;

      TextStyle responsiveStyle = DefaultTextStyle.of(context).style;
      TextStyle defaultStyle =  DefaultTextStyle.of(context).style;
      ButtonStyle responsiveButtonStyle;

      if(responsiveStyle.fontSize != null) {
        fontSize = responsiveStyle.fontSize!;
      } else {
        fontSize = defaultStyle.fontSize!;
      }

      if(responsiveStyle.height != null) {
        height = responsiveStyle.height!;
      } else if(defaultStyle.height != null) {
        height = defaultStyle.height!;
      }
      
      newFontSize = fontSize * scale;
      
      if(has('style')) {
        responsiveButtonStyle = get('style');
      } else {
        responsiveButtonStyle = TextButton.styleFrom(textStyle: defaultStyle);
      }

      responsiveStyle = responsiveStyle.copyWith(fontSize: newFontSize);

      responsiveButtonStyle = responsiveButtonStyle.copyWith(textStyle: ButtonStyleButton.allOrNull<TextStyle>(responsiveStyle));

      return TextButton(      
        key : get('key'),
        onPressed : onPressed,
        onLongPress : onLongPress,
        onHover : onHover,
        onFocusChange : onFocusChange,
        style : responsiveButtonStyle,
        focusNode : get('focusNode'),
        autofocus : get('autofocus'),
        clipBehavior : get('clipBehavior'),
        child : child          
      );
  }

}