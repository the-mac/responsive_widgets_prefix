import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

class ResponsiveTextField extends ResponsiveStatelessWidget {

  /// {@macro flutter.material.textfield.onTap}
  final GestureTapCallback? onTap;
  
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
  ResponsiveTextField({
    Key? key,
    controller,
    focusNode,
    decoration = const InputDecoration(),
    TextInputType? keyboardType,
    textInputAction,
    textCapitalization = TextCapitalization.none,
    style,
    strutStyle,
    textAlign = TextAlign.start,
    textAlignVertical,
    textDirection,
    readOnly = false,
    ToolbarOptions? toolbarOptions,
    showCursor,
    autofocus = false,
    obscuringCharacter = '•',
    obscureText = false,
    autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    enableSuggestions = true,
    maxLines = 1,
    minLines,
    expands = false,
    maxLength,
    @Deprecated(
      'Use maxLengthEnforcement parameter which provides more specific '
      'behavior related to the maxLength limit. '
      'This feature was deprecated after v1.25.0-5.0.pre.',
    )
    maxLengthEnforced = true,
    maxLengthEnforcement,
    onChanged,
    onEditingComplete,
    onSubmitted,
    onAppPrivateCommand,
    inputFormatters,
    enabled,
    cursorWidth = 2.0,
    cursorHeight,
    cursorRadius,
    cursorColor,
    selectionHeightStyle = BoxHeightStyle.tight,
    selectionWidthStyle = BoxWidthStyle.tight,
    keyboardAppearance,
    scrollPadding = const EdgeInsets.all(20.0),
    dragStartBehavior = DragStartBehavior.start,
    enableInteractiveSelection = true,
    selectionControls,
    this.onTap,
    mouseCursor,
    buildCounter,
    scrollController,
    scrollPhysics,
    autofillHints = const <String>[],
    clipBehavior = Clip.hardEdge,
    restorationId,
    enableIMEPersonalizedLearning = true,
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
          .set('controller', controller)
          .set('focusNode', focusNode)
          .set('decoration', decoration)
          .set('keyboardType', keyboardType)
          .set('textInputAction', textInputAction)
          .set('textCapitalization', textCapitalization)
          .set('style', style)
          .set('strutStyle', strutStyle)
          .set('textAlign', textAlign)
          .set('textAlignVertical', textAlignVertical)
          .set('textDirection', textDirection)
          .set('readOnly', readOnly)
          .set('toolbarOptions', toolbarOptions)
          .set('showCursor', showCursor)
          .set('autofocus', autofocus)
          .set('obscuringCharacter', obscuringCharacter)
          .set('obscureText', obscureText)
          .set('autocorrect', autocorrect)
          .set('smartDashesType', smartDashesType)
          .set('smartQuotesType', smartQuotesType)
          .set('enableSuggestions', enableSuggestions)
          .set('maxLines', maxLines)
          .set('minLines', minLines)
          .set('expands', expands)
          .set('maxLength', maxLength)
          .set('maxLengthEnforced', maxLengthEnforced)
          .set('maxLengthEnforcement', maxLengthEnforcement)
          .set('onChanged', onChanged)
          .set('onEditingComplete', onEditingComplete)
          .set('onSubmitted', onSubmitted)
          .set('onAppPrivateCommand', onAppPrivateCommand)
          .set('inputFormatters', inputFormatters)
          .set('enabled', enabled)
          .set('cursorWidth', cursorWidth)
          .set('cursorHeight', cursorHeight)
          .set('cursorRadius', cursorRadius)
          .set('cursorColor', cursorColor)
          .set('selectionHeightStyle', selectionHeightStyle)
          .set('selectionWidthStyle', selectionWidthStyle)
          .set('keyboardAppearance', keyboardAppearance)
          .set('scrollPadding', scrollPadding)
          .set('dragStartBehavior', dragStartBehavior)
          .set('enableInteractiveSelection', enableInteractiveSelection)
          .set('selectionControls', selectionControls)
          .set('mouseCursor', mouseCursor)
          .set('buildCounter', buildCounter)
          .set('scrollController', scrollController)
          .set('scrollPhysics', scrollPhysics)
          .set('autofillHints', autofillHints)
          .set('clipBehavior', clipBehavior)
          .set('restorationId', restorationId)
          .set('enableIMEPersonalizedLearning', enableIMEPersonalizedLearning);

      }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      double height = 1.0;
      double fontSize = 0.0;
      double? newFontSize;
      double? newHeight;

      TextStyle defaultStyle = DefaultTextStyle.of(context).style;
      TextStyle responsiveStyle = DefaultTextStyle.of(context).style;
      
      if(has('style')) {
        responsiveStyle = get('style');
      }

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
      newHeight = height * scale;

      print('newFontSize: $newFontSize');
      print('newHeight: $newHeight');

      responsiveStyle = responsiveStyle.copyWith(fontSize: newFontSize);//, height: newHeight);

      return TextField(
          key : get('key'),
          controller : get('controller'),
          focusNode : get('focusNode'),
          decoration : get('decoration'),
          keyboardType : get('keyboardType'),
          textInputAction : get('textInputAction'),
          textCapitalization : get('textCapitalization'),
          style : responsiveStyle,
          strutStyle : get('strutStyle'),
          textAlign : get('textAlign'),
          textAlignVertical : get('textAlignVertical'),
          textDirection : get('textDirection'),
          readOnly : get('readOnly'),
          toolbarOptions : get('toolbarOptions'),
          showCursor : get('showCursor'),
          autofocus : get('autofocus'),
          obscuringCharacter : get('obscuringCharacter'),
          obscureText : get('obscureText'),
          autocorrect : get('autocorrect'),
          smartDashesType : get('smartDashesType'),
          smartQuotesType : get('smartQuotesType'),
          enableSuggestions : get('enableSuggestions'),
          maxLines : get('maxLines'),
          minLines : get('minLines'),
          expands : get('expands'),
          maxLength : get('maxLength'),
          maxLengthEnforced : get('maxLengthEnforced'),
          maxLengthEnforcement : get('maxLengthEnforcement'),
          onChanged : get('onChanged'),
          onEditingComplete : get('onEditingComplete'),
          onSubmitted : get('onSubmitted'),
          onAppPrivateCommand : get('onAppPrivateCommand'),
          inputFormatters : get('inputFormatters'),
          enabled : get('enabled'),
          cursorWidth : get('cursorWidth'),
          cursorHeight : get('cursorHeight'),
          cursorRadius : get('cursorRadius'),
          cursorColor : get('cursorColor'),
          selectionHeightStyle : get('selectionHeightStyle'),
          selectionWidthStyle : get('selectionWidthStyle'),
          keyboardAppearance : get('keyboardAppearance'),
          scrollPadding : get('scrollPadding'),
          dragStartBehavior : get('dragStartBehavior'),
          enableInteractiveSelection : get('enableInteractiveSelection'),
          selectionControls : get('selectionControls'),
          onTap : onTap,
          mouseCursor : get('mouseCursor'),
          buildCounter : get('buildCounter'),
          scrollController : get('scrollController'),
          scrollPhysics : get('scrollPhysics'),
          autofillHints : get('autofillHints'),
          clipBehavior : get('clipBehavior'),
          restorationId : get('restorationId'),
          enableIMEPersonalizedLearning : get('enableIMEPersonalizedLearning'),
      );
  }

}