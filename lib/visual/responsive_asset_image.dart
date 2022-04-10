import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

/// Responsive Asset Image is a wrapper around [AssetImage], that allows for scaling of the asset image's
/// surrounding container. It does this by extending ResponsiveStatelessWidget, wrapping with a Container
/// and assigning a scale for different device sizes.
class ResponsiveAssetImage extends ResponsiveStatelessWidget {
  
  /// Constructs a responsive asset image, that accepts a path String to and image asset.
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
  ResponsiveAssetImage(assetName, {
    key,
    bundle,
    package,
    required size,
    alignment = Alignment.center,
    useBufferSize = true,
    double scaleWatch = 0.1,
    double scaleSmallPhone = 1.0,
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
      .set('bundle', bundle)
      .set('assetName', assetName)
      .set('package', package)
      .set('size', size)
      .set('alignment', alignment)
      .set('useBufferSize', useBufferSize);

  }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      final Size size = get('size');
      final bool useBufferSize = get('useBufferSize');
      final Alignment alignment = get('alignment');

      var responsiveWidthTooSmall = size.width * scale <= 20;
      var newWidth = responsiveWidthTooSmall && useBufferSize ? size.width * scale + 20 : size.width * scale;
      if(responsiveWidthTooSmall) print('$this width too small (${size.width * scale}), improper size used newWidth: $newWidth');

      var responsiveHeightTooSmall = size.height * scale <= 20;
      var newHeight = responsiveHeightTooSmall && useBufferSize ? size.height * scale + 20 : size.height * scale;
      if(responsiveHeightTooSmall) print('$this height too small (${size.height * scale}), improper size used newHeight: $newHeight');
      var responsiveSize = Size(newWidth, newHeight);
    
      return Container(
        key: key,
        width: responsiveSize.width,
        height: responsiveSize.height,
        alignment: alignment,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              get('assetName'),
              bundle: get('bundle'),
              package: get('package')
            ),
            fit: BoxFit.fill
          ),
        ),
      );
  }

}