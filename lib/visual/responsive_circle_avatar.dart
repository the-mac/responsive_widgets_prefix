import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

/// Responsive Circle Avatar is a wrapper around [CircleAvatar], that allows for scaling of the avatar's
/// radius. It does this by extending ResponsiveStatelessWidget,
/// and assigning a scale for different device sizes.
class ResponsiveCircleAvatar extends ResponsiveStatelessWidget {
    
  /// Constructs a responsive circle avatar, that accepts a scalable radius.
  /// 
  /// @param scaleWatch The responsive scale for watch devices (default: 0.6)
  /// 
  /// @param scaleSmallPhone The responsive scale for small phone devices (default:1.0)
  /// 
  /// @param scaleMediumPhone The responsive scale for medium phone devices (default: 1.0)
  /// 
  /// @param scaleLargePhone The responsive scale for large phone devices (default: 1.5)
  /// 
  /// @param scaleSmallTablet The responsive scale for small tablet devices (default: 1.8)
  /// 
  /// @param scaleMediumTablet The responsive scale for medium tablet devices (default: 2.0)
  /// 
  /// @param scaleLargeTablet The responsive scale for large tablet devices (default: 2.5)
  /// 
  /// @param scaleMediumDesktop The responsive scale for medium desktop devices (default: 3.0)
  /// 
  /// @param scaleLargeDesktop The responsive scale for large desktop devices (default: 3.6)
  /// 
  /// @param scaleTelevision The responsive scale for TV devices (default: 4.2)
  /// 
  ResponsiveCircleAvatar({
    key,
    child,
    backgroundColor,
    backgroundImage,
    foregroundImage,
    onBackgroundImageError,
    onForegroundImageError,
    foregroundColor,
    radius,
    minRadius,
    maxRadius,
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
        .set('child', child)
        .set('backgroundColor', backgroundColor)
        .set('backgroundImage', backgroundImage)
        .set('foregroundImage', foregroundImage)
        .set('onBackgroundImageError', onBackgroundImageError)
        .set('onForegroundImageError', onForegroundImageError)
        .set('foregroundColor', foregroundColor)
        .set('radius', radius)
        .set('minRadius', minRadius)
        .set('maxRadius', maxRadius);
  }

  @override Key getKey() { return get('key') as Key; }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {
    
    double? responsiveRadius;
    
    if(has('radius')) {
      responsiveRadius = get('radius') * scale;
    }

    return CircleAvatar(
        key : get('key'),
        child : get('child'),
        backgroundColor : get('backgroundColor'),
        backgroundImage : get('backgroundImage'),
        foregroundImage : get('foregroundImage'),
        onBackgroundImageError : get('onBackgroundImageError'),
        onForegroundImageError : get('onForegroundImageError'),
        foregroundColor : get('foregroundColor'),
        radius : responsiveRadius,
        minRadius : get('minRadius'),
        maxRadius : get('maxRadius'),
    );  
  }
}