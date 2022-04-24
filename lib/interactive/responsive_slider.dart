
import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';
import 'package:responsive_widgets_prefix/structural/responsive_container.dart';

class ResponsiveSlider extends ResponsiveStatelessWidget {

  /// {@macro flutter.material.slider.onChanged}
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final SliderThemeData? sliderThemeData;
  
  /// Constructs a responsive slider, that contains a Slider Widget.
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
  ResponsiveSlider({
    Key? key,
    required double value,
    required this.onChanged,
    this.sliderThemeData,
    this.onChangeStart,
    this.onChangeEnd,
    double  min = 0.0,
    double  max = 1.0,
    int? divisions,
    String? label,
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    MouseCursor? mouseCursor,
    SemanticFormatterCallback? semanticFormatterCallback,
    FocusNode? focusNode,
    bool autofocus = false,
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
          .set('min', min)
          .set('max', max)
          .set('divisions', divisions)
          .set('label', label)
          .set('activeColor', activeColor)
          .set('inactiveColor', inactiveColor)
          .set('thumbColor', thumbColor)
          .set('mouseCursor', mouseCursor)
          .set('semanticFormatterCallback', semanticFormatterCallback)
          .set('focusNode', focusNode)
          .set('autofocus', autofocus)
        ;
      
  }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      double height = 1.0;
      double? newTrackHeight;

      SliderThemeData defaultThemeData = SliderTheme.of(context);
      SliderThemeData responsiveThemeData = SliderTheme.of(context);
      
      if(sliderThemeData != null) {
        responsiveThemeData = sliderThemeData!;
      }

      if(responsiveThemeData.trackHeight != null) {
        height = responsiveThemeData.trackHeight!;
      } else if(defaultThemeData.trackHeight != null) {
        height = defaultThemeData.trackHeight!;
      }
      
      newTrackHeight = height * scale;

      responsiveThemeData = responsiveThemeData.copyWith(trackHeight: newTrackHeight);

      return SliderTheme(
        data: responsiveThemeData,
        child: ResponsiveContainer(
            width: 500,
            child: Slider(
              key : get('key'),
              value : get('value'),
              onChanged : onChanged,
              onChangeStart : onChangeStart,
              onChangeEnd : onChangeEnd,
              min : get('min'),
              max : get('max'),
              divisions : get('divisions'),
              label : get('label'),
              activeColor : get('activeColor'),
              inactiveColor : get('inactiveColor'),
              thumbColor : get('thumbColor'),
              mouseCursor : get('mouseCursor'),
              semanticFormatterCallback : get('semanticFormatterCallback'),
              focusNode : get('focusNode'),
              autofocus : get('autofocus'),
            ),
          ),
      );
  }

}