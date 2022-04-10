import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

enum _ImageType { defaultImage, networkImage, fileImage, assetImage,  memoryImage }

abstract class _ResponsiveImage extends ResponsiveStatelessWidget {
  _ResponsiveImage({
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
  ) {}
}

/// Responsive Image is a wrapper around [Image], that allows for scaling of the image's
/// width, height and scale. It does this by extending ResponsiveStatelessWidget,
/// and assigning a scale for different device sizes.
class ResponsiveImage extends _ResponsiveImage {
  
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
  ResponsiveImage({
    key,
    required image,
    frameBuilder,
    loadingBuilder,
    errorBuilder,
    semanticLabel,
    excludeFromSemantics = false,
    width,
    height,
    color,
    opacity,
    colorBlendMode,
    fit,
    alignment = Alignment.center,
    repeat = ImageRepeat.noRepeat,
    centerSlice,
    matchTextDirection = false,
    gaplessPlayback = false,
    isAntiAlias = false,
    filterQuality = FilterQuality.low,
  }) : super() {

    set('key', key)
    .set('imageType', _ImageType.defaultImage)
    .set('image', image)
    .set('frameBuilder', frameBuilder)
    .set('loadingBuilder', loadingBuilder)
    .set('errorBuilder', errorBuilder)
    .set('semanticLabel', semanticLabel)
    .set('excludeFromSemantics', excludeFromSemantics)
    .set('width', width)
    .set('height', height)
    .set('color', color)
    .set('opacity', opacity)
    .set('colorBlendMode', colorBlendMode)
    .set('fit', fit)
    .set('alignment', alignment)
    .set('repeat', repeat)
    .set('centerSlice', centerSlice)
    .set('matchTextDirection', matchTextDirection)
    .set('gaplessPlayback', gaplessPlayback)
    .set('isAntiAlias', isAntiAlias)
    .set('filterQuality', filterQuality);

  }

  /// Creates a widget that displays an [ImageStream] obtained from the network.
  ///
  /// The [src], [scale], and [repeat] arguments must not be null.
  ///
  /// Either the [width] and [height] arguments should be specified, or the
  /// widget should be placed in a context that sets tight layout constraints.
  /// Otherwise, the image dimensions will change as the image is loaded, which
  /// will result in ugly layout changes.
  ///
  /// All network images are cached regardless of HTTP headers.
  ///
  /// An optional [headers] argument can be used to send custom HTTP headers
  /// with the image request.
  ///
  /// {@macro flutter.widgets.image.filterQualityParameter}
  ///
  /// If [excludeFromSemantics] is true, then [semanticLabel] will be ignored.
  ///
  /// If [cacheWidth] or [cacheHeight] are provided, it indicates to the
  /// engine that the image should be decoded at the specified size. The image
  /// will be rendered to the constraints of the layout or [width] and [height]
  /// regardless of these parameters. These parameters are primarily intended
  /// to reduce the memory usage of [ImageCache].
  ///
  /// In the case where the network image is on the Web platform, the [cacheWidth]
  /// and [cacheHeight] parameters are ignored as the web engine delegates
  /// image decoding to the web which does not support custom decode sizes.
  //
  // TODO(garyq): We should eventually support custom decoding of network images
  // on Web as well, see https://github.com/flutter/flutter/issues/42789.
  ResponsiveImage.network(
    String src, {
    Key? key,
    double scale = 1.0,
    frameBuilder,
    loadingBuilder,
    errorBuilder,
    semanticLabel,
    excludeFromSemantics = false,
    width,
    height,
    color,
    opacity,
    colorBlendMode,
    fit,
    alignment = Alignment.center,
    repeat = ImageRepeat.noRepeat,
    centerSlice,
    matchTextDirection = false,
    gaplessPlayback = false,
    filterQuality = FilterQuality.low,
    isAntiAlias = false,
    Map<String, String>? headers,
    int? cacheWidth,
    int? cacheHeight,
  }) : super() {

    set('key', key)
    .set('imageType', _ImageType.networkImage)
    .set('frameBuilder', frameBuilder)
    .set('loadingBuilder', loadingBuilder)
    .set('errorBuilder', errorBuilder)
    .set('semanticLabel', semanticLabel)
    .set('excludeFromSemantics', excludeFromSemantics)
    .set('width', width)
    .set('height', height)
    .set('color', color)
    .set('opacity', opacity)
    .set('colorBlendMode', colorBlendMode)
    .set('fit', fit)
    .set('alignment', alignment)
    .set('repeat', repeat)
    .set('centerSlice', centerSlice)
    .set('matchTextDirection', matchTextDirection)
    .set('gaplessPlayback', gaplessPlayback)
    .set('isAntiAlias', isAntiAlias)
    .set('filterQuality', filterQuality)
    .set('cacheWidth', cacheWidth)
    .set('cacheHeight', cacheHeight);

  }
  
  /// Creates a widget that displays an [ImageStream] obtained from a [File].
  ///
  /// The [file], [scale], and [repeat] arguments must not be null.
  ///
  /// Either the [width] and [height] arguments should be specified, or the
  /// widget should be placed in a context that sets tight layout constraints.
  /// Otherwise, the image dimensions will change as the image is loaded, which
  /// will result in ugly layout changes.
  ///
  /// On Android, this may require the
  /// `android.permission.READ_EXTERNAL_STORAGE` permission.
  ///
  /// {@macro flutter.widgets.image.filterQualityParameter}
  ///
  /// If [excludeFromSemantics] is true, then [semanticLabel] will be ignored.
  ///
  /// If [cacheWidth] or [cacheHeight] are provided, it indicates to the
  /// engine that the image must be decoded at the specified size. The image
  /// will be rendered to the constraints of the layout or [width] and [height]
  /// regardless of these parameters. These parameters are primarily intended
  /// to reduce the memory usage of [ImageCache].
  ///
  /// Loading an image from a file creates an in memory copy of the file,
  /// which is retained in the [ImageCache]. The underlying file is not
  /// monitored for changes. If it does change, the application should evict
  /// the entry from the [ImageCache].
  ///
  /// See also:
  ///
  ///  * [FileImage] provider for evicting the underlying file easily.
  ResponsiveImage.file(
    File file, {
    Key? key,
    double scale = 1.0,
    frameBuilder,
    errorBuilder,
    semanticLabel,
    excludeFromSemantics = false,
    width,
    height,
    color,
    opacity,
    colorBlendMode,
    fit,
    alignment = Alignment.center,
    repeat = ImageRepeat.noRepeat,
    centerSlice,
    matchTextDirection = false,
    gaplessPlayback = false,
    isAntiAlias = false,
    filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) : super() {

    set('key', key)
    .set('imageType', _ImageType.fileImage)
    .set('file', file)
    .set('scale', scale)
    .set('frameBuilder', frameBuilder)
    .set('errorBuilder', errorBuilder)
    .set('semanticLabel', semanticLabel)
    .set('excludeFromSemantics', excludeFromSemantics)
    .set('width', width)
    .set('height', height)
    .set('color', color)
    .set('opacity', opacity)
    .set('colorBlendMode', colorBlendMode)
    .set('fit', fit)
    .set('alignment', alignment)
    .set('repeat', repeat)
    .set('centerSlice', centerSlice)
    .set('matchTextDirection', matchTextDirection)
    .set('gaplessPlayback', gaplessPlayback)
    .set('isAntiAlias', isAntiAlias)
    .set('filterQuality', filterQuality)
    .set('cacheWidth', cacheWidth)
    .set('cacheHeight', cacheHeight);

  }
  
  // * If [width] and [height] are both specified, and [scale] is not, then
  //   size-aware asset resolution will be attempted also, with the given
  //   dimensions interpreted as logical pixels.
  //
  // * If the images have platform, locale, or directionality variants, the
  //   current platform, locale, and directionality are taken into account
  //   during asset resolution as well.
  /// Creates a widget that displays an [ImageStream] obtained from an asset
  /// bundle. The key for the image is given by the `name` argument.
  ///
  /// The `package` argument must be non-null when displaying an image from a
  /// package and null otherwise. See the `Assets in packages` section for
  /// details.
  ///
  /// If the `bundle` argument is omitted or null, then the
  /// [DefaultAssetBundle] will be used.
  ///
  /// By default, the pixel-density-aware asset resolution will be attempted. In
  /// addition:
  ///
  /// * If the `scale` argument is provided and is not null, then the exact
  /// asset specified will be used. To display an image variant with a specific
  /// density, the exact path must be provided (e.g. `images/2x/cat.png`).
  ///
  /// If [excludeFromSemantics] is true, then [semanticLabel] will be ignored.
  ///
  /// If [cacheWidth] or [cacheHeight] are provided, it indicates to the
  /// engine that the image must be decoded at the specified size. The image
  /// will be rendered to the constraints of the layout or [width] and [height]
  /// regardless of these parameters. These parameters are primarily intended
  /// to reduce the memory usage of [ImageCache].
  ///
  /// The [name] and [repeat] arguments must not be null.
  ///
  /// Either the [width] and [height] arguments should be specified, or the
  /// widget should be placed in a context that sets tight layout constraints.
  /// Otherwise, the image dimensions will change as the image is loaded, which
  /// will result in ugly layout changes.
  ///
  /// {@macro flutter.widgets.image.filterQualityParameter}
  ///
  /// {@tool snippet}
  ///
  /// Suppose that the project's `pubspec.yaml` file contains the following:
  ///
  /// ```yaml
  /// flutter:
  ///   assets:
  ///     - images/cat.png
  ///     - images/2x/cat.png
  ///     - images/3.5x/cat.png
  /// ```
  /// {@end-tool}
  ///
  /// On a screen with a device pixel ratio of 2.0, the following widget would
  /// render the `images/2x/cat.png` file:
  ///
  /// ```dart
  /// Image.asset('images/cat.png')
  /// ```
  ///
  /// This corresponds to the file that is in the project's `images/2x/`
  /// directory with the name `cat.png` (the paths are relative to the
  /// `pubspec.yaml` file).
  ///
  /// On a device with a 4.0 device pixel ratio, the `images/3.5x/cat.png` asset
  /// would be used. On a device with a 1.0 device pixel ratio, the
  /// `images/cat.png` resource would be used.
  ///
  /// The `images/cat.png` image can be omitted from disk (though it must still
  /// be present in the manifest). If it is omitted, then on a device with a 1.0
  /// device pixel ratio, the `images/2x/cat.png` image would be used instead.
  ///
  ///
  /// ## Assets in packages
  ///
  /// To create the widget with an asset from a package, the [package] argument
  /// must be provided. For instance, suppose a package called `my_icons` has
  /// `icons/heart.png` .
  ///
  /// {@tool snippet}
  /// Then to display the image, use:
  ///
  /// ```dart
  /// Image.asset('icons/heart.png', package: 'my_icons')
  /// ```
  /// {@end-tool}
  ///
  /// Assets used by the package itself should also be displayed using the
  /// [package] argument as above.
  ///
  /// If the desired asset is specified in the `pubspec.yaml` of the package, it
  /// is bundled automatically with the app. In particular, assets used by the
  /// package itself must be specified in its `pubspec.yaml`.
  ///
  /// A package can also choose to have assets in its 'lib/' folder that are not
  /// specified in its `pubspec.yaml`. In this case for those images to be
  /// bundled, the app has to specify which ones to include. For instance a
  /// package named `fancy_backgrounds` could have:
  ///
  /// ```
  /// lib/backgrounds/background1.png
  /// lib/backgrounds/background2.png
  /// lib/backgrounds/background3.png
  /// ```
  ///
  /// To include, say the first image, the `pubspec.yaml` of the app should
  /// specify it in the assets section:
  ///
  /// ```yaml
  ///   assets:
  ///     - packages/fancy_backgrounds/backgrounds/background1.png
  /// ```
  ///
  /// The `lib/` is implied, so it should not be included in the asset path.
  ///
  ///
  /// See also:
  ///
  ///  * [AssetImage], which is used to implement the behavior when the scale is
  ///    omitted.
  ///  * [ExactAssetImage], which is used to implement the behavior when the
  ///    scale is present.
  ///  * <https://flutter.dev/assets-and-images/>, an introduction to assets in
  ///    Flutter.
  ResponsiveImage.asset(
    String name, {
    Key? key,
    AssetBundle? bundle,
    frameBuilder,
    errorBuilder,
    semanticLabel,
    excludeFromSemantics = false,
    double? scale,
    width,
    height,
    color,
    opacity,
    colorBlendMode,
    fit,
    alignment = Alignment.center,
    repeat = ImageRepeat.noRepeat,
    centerSlice,
    matchTextDirection = false,
    gaplessPlayback = false,
    isAntiAlias = false,
    String? package,
    filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) : super() {

    set('key', key)
    .set('name', name)
    .set('imageType', _ImageType.assetImage)
    .set('frameBuilder', frameBuilder)
    .set('bundle', bundle)
    .set('errorBuilder', errorBuilder)
    .set('semanticLabel', semanticLabel)
    .set('excludeFromSemantics', excludeFromSemantics)
    .set('width', width)
    .set('height', height)
    .set('color', color)
    .set('opacity', opacity)
    .set('colorBlendMode', colorBlendMode)
    .set('fit', fit)
    .set('alignment', alignment)
    .set('repeat', repeat)
    .set('centerSlice', centerSlice)
    .set('matchTextDirection', matchTextDirection)
    .set('gaplessPlayback', gaplessPlayback)
    .set('isAntiAlias', isAntiAlias)
    .set('filterQuality', filterQuality)
    .set('cacheWidth', cacheWidth)
    .set('cacheHeight', cacheHeight);

  }
  
  /// Creates a widget that displays an [ImageStream] obtained from a [Uint8List].
  ///
  /// The `bytes` argument specifies encoded image bytes, which can be encoded
  /// in any of the following supported image formats:
  /// {@macro flutter.dart:ui.imageFormats}
  ///
  /// The `scale` argument specifies the linear scale factor for drawing this
  /// image at its intended size and applies to both the width and the height.
  /// {@macro flutter.painting.imageInfo.scale}
  ///
  /// The `bytes`, `scale`, and [repeat] arguments must not be null.
  ///
  /// This only accepts compressed image formats (e.g. PNG). Uncompressed
  /// formats like rawRgba (the default format of [dart:ui.Image.toByteData])
  /// will lead to exceptions.
  ///
  /// Either the [width] and [height] arguments should be specified, or the
  /// widget should be placed in a context that sets tight layout constraints.
  /// Otherwise, the image dimensions will change as the image is loaded, which
  /// will result in ugly layout changes.
  ///
  /// {@macro flutter.widgets.image.filterQualityParameter}
  ///
  /// If [excludeFromSemantics] is true, then [semanticLabel] will be ignored.
  ///
  /// If [cacheWidth] or [cacheHeight] are provided, it indicates to the
  /// engine that the image must be decoded at the specified size. The image
  /// will be rendered to the constraints of the layout or [width] and [height]
  /// regardless of these parameters. These parameters are primarily intended
  /// to reduce the memory usage of [ImageCache].
  ResponsiveImage.memory(
    Uint8List bytes, {
    Key? key,
    double scale = 1.0,
    frameBuilder,
    errorBuilder,
    semanticLabel,
    excludeFromSemantics = false,
    width,
    height,
    color,
    opacity,
    colorBlendMode,
    fit,
    alignment = Alignment.center,
    repeat = ImageRepeat.noRepeat,
    centerSlice,
    matchTextDirection = false,
    gaplessPlayback = false,
    isAntiAlias = false,
    filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) : super() {

    set('key', key)
    .set('imageType', _ImageType.memoryImage)
    .set('bytes', bytes)
    .set('scale', scale)
    .set('frameBuilder', frameBuilder)
    .set('errorBuilder', errorBuilder)
    .set('semanticLabel', semanticLabel)
    .set('excludeFromSemantics', excludeFromSemantics)
    .set('width', width)
    .set('height', height)
    .set('color', color)
    .set('opacity', opacity)
    .set('colorBlendMode', colorBlendMode)
    .set('fit', fit)
    .set('alignment', alignment)
    .set('repeat', repeat)
    .set('centerSlice', centerSlice)
    .set('matchTextDirection', matchTextDirection)
    .set('gaplessPlayback', gaplessPlayback)
    .set('isAntiAlias', isAntiAlias)
    .set('filterQuality', filterQuality)
    .set('cacheWidth', cacheWidth)
    .set('cacheHeight', cacheHeight);

  }

  Widget _getImageWidget(_ImageType imageType, ScreenType screenType, double scale) {

      double? newWidth;
      double? newHeight;

      if(has('width')) {
        newWidth = get('width') * scale;
      }
      
      if(has('height')) {
        newHeight = get('height') * scale;
      }

      switch (imageType) {
        case _ImageType.defaultImage:
          return Image(
            key : get('key'),
            image: get('image'),
            frameBuilder : get('frameBuilder'),
            errorBuilder : get('errorBuilder'),
            semanticLabel : get('semanticLabel'),
            excludeFromSemantics : get('excludeFromSemantics'),
            width: newWidth,
            height: newHeight,
            color : get('color'),
            opacity : get('opacity'),
            colorBlendMode : get('colorBlendMode'),
            fit : get('fit'),
            alignment : get('alignment'),
            repeat : get('repeat'),
            centerSlice : get('centerSlice'),
            matchTextDirection : get('matchTextDirection'),
            gaplessPlayback : get('gaplessPlayback'),
            isAntiAlias : get('isAntiAlias'),
            filterQuality : get('filterQuality'),
          );
        case _ImageType.networkImage:
          return Image.network(
            get('src'),
            key : get('key'),
            frameBuilder : get('frameBuilder'),
            errorBuilder : get('errorBuilder'),
            semanticLabel : get('semanticLabel'),
            excludeFromSemantics : get('excludeFromSemantics'),
            scale : 1.5 / scale,
            width: newWidth,
            height: newHeight,
            color : get('color'),
            opacity : get('opacity'),
            colorBlendMode : get('colorBlendMode'),
            fit : get('fit'),
            alignment : get('alignment'),
            repeat : get('repeat'),
            centerSlice : get('centerSlice'),
            matchTextDirection : get('matchTextDirection'),
            gaplessPlayback : get('gaplessPlayback'),
            isAntiAlias : get('isAntiAlias'),
            filterQuality : get('filterQuality'),
            headers : get('headers'),
            cacheWidth : get('cacheWidth'),
            cacheHeight : get('cacheHeight'),
          );
        case _ImageType.fileImage:
          return Image.file(
            get('file'),
            key : get('key'),
            scale : 1.5 / scale,
            frameBuilder : get('frameBuilder'),
            errorBuilder : get('errorBuilder'),
            semanticLabel : get('semanticLabel'),
            excludeFromSemantics : get('excludeFromSemantics'),
            width: newWidth,
            height: newHeight,
            color : get('color'),
            opacity : get('opacity'),
            colorBlendMode : get('colorBlendMode'),
            fit : get('fit'),
            alignment : get('alignment'),
            repeat : get('repeat'),
            centerSlice : get('centerSlice'),
            matchTextDirection : get('matchTextDirection'),
            gaplessPlayback : get('gaplessPlayback'),
            isAntiAlias : get('isAntiAlias'),
            filterQuality : get('filterQuality'),
            cacheWidth : get('cacheWidth'),
            cacheHeight : get('cacheHeight'),
          );
        case _ImageType.assetImage:
          return Image.asset(
            get('name'),
            bundle : get('bundle'),
            frameBuilder : get('frameBuilder'),
            errorBuilder : get('errorBuilder'),
            semanticLabel : get('semanticLabel'),
            excludeFromSemantics : get('excludeFromSemantics'),
            scale : 1.5 / scale,
            width: newWidth,
            height: newHeight,
            color : get('color'),
            opacity : get('opacity'),
            colorBlendMode : get('colorBlendMode'),
            fit : get('fit'),
            alignment : get('alignment'),
            repeat : get('repeat'),
            centerSlice : get('centerSlice'),
            matchTextDirection : get('matchTextDirection'),
            gaplessPlayback : get('gaplessPlayback'),
            isAntiAlias : get('isAntiAlias'),
            package : get('package'),
            filterQuality : get('filterQuality'),
            cacheWidth : get('cacheWidth'),
            cacheHeight : get('cacheHeight'),
          );
        case _ImageType.memoryImage:
          return Image.memory(                    
            get('bytes'),
            key : get('key'),
            scale : scale,
            frameBuilder : get('frameBuilder'),
            errorBuilder : get('errorBuilder'),
            semanticLabel : get('semanticLabel'),
            excludeFromSemantics : get('excludeFromSemantics'),
            width: newWidth,
            height: newHeight,
            color : get('color'),
            opacity : get('opacity'),
            colorBlendMode : get('colorBlendMode'),
            fit : get('fit'),
            alignment : get('alignment'),
            repeat : get('repeat'),
            centerSlice : get('centerSlice'),
            matchTextDirection : get('matchTextDirection'),
            gaplessPlayback : get('gaplessPlayback'),
            isAntiAlias : get('isAntiAlias'),
            filterQuality : get('filterQuality'),
            cacheWidth : get('cacheWidth'),
            cacheHeight : get('cacheHeight'),
          );
        default:
          return Image.asset('');
      }

  }
  

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {
      return _getImageWidget(get('imageType'), screenType, scale);
  }

}