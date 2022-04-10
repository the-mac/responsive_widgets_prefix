import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

/// Responsive Text is a wrapper around [Text], that allows for scaling of the text's
/// fontSize and captionStyle. It does this by extending ResponsiveStatelessWidget,
/// and assigning a scale for different device sizes.
class ResponsiveText extends ResponsiveStatelessWidget {
  
  final String text;
  final int? maxLength;
  final bool useCaptionStyle;
  
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
  ResponsiveText(this.text, {
    Key? key,
    TextStyle? style,
    this.maxLength,
    this.useCaptionStyle = false,
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
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
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
      .set('strutStyle', strutStyle)
      .set('textAlign', textAlign)
      .set('textDirection', textDirection)
      .set('locale', locale)
      .set('softWrap', softWrap)
      .set('overflow', overflow)
      .set('textScaleFactor', textScaleFactor)
      .set('maxLines', maxLines)
      .set('semanticsLabel', semanticsLabel)
      .set('textWidthBasis', textWidthBasis)
      .set('textHeightBehavior', textHeightBehavior);
  }

  @override Key getKey() { return get('key') as Key; }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {
    
    double size = 0.0;
    TextStyle defaultStyle = DefaultTextStyle.of(context).style;
    TextStyle responsiveStyle = DefaultTextStyle.of(context).style;
    
    if(has('style')) {
      responsiveStyle = get('style');
    }

    if(responsiveStyle.fontSize != null) {
      size = responsiveStyle.fontSize!;
    } else {
      size = defaultStyle.fontSize!;
    }

    if(useCaptionStyle) {
        TextStyle captionStyle = Theme.of(context).textTheme.caption!;
        responsiveStyle = captionStyle.copyWith(fontSize: size * scale);
    } else {
        responsiveStyle = responsiveStyle.copyWith(fontSize: size * scale);
    }

    var cutOff = get('overflow') == TextOverflow.ellipsis ? '...' : '';
    var maxLengthNeeded = maxLength != null && text.length > maxLength!;
    var responsiveText = maxLengthNeeded ? text.substring(0, maxLength! - cutOff.length) + cutOff : text;

    return Text(
        responsiveText,
        key: get('key'),
        style: responsiveStyle,
        strutStyle: get('strutStyle'),
        textAlign: get('textAlign'),
        textDirection: get('textDirection'),
        locale: get('locale'),
        softWrap: get('softWrap'),
        overflow: get('overflow') ?? TextOverflow.clip,
        textScaleFactor: get('textScaleFactor'),
        maxLines: get('maxLines'),
        semanticsLabel: get('semanticsLabel'),
        textWidthBasis: get('textWidthBasis'),
        textHeightBehavior: get('textHeightBehavior')
    );  
  }
}