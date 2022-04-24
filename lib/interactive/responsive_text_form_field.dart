
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';
import 'package:responsive_widgets_prefix/responsive_widgets.dart';

class ResponsiveTextFormField extends ResponsiveStatelessWidget {

  /// {@macro flutter.material.textfield.onTap}
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  
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
  ResponsiveTextFormField({Key? key,
    controller,
    String? initialValue,
    FocusNode? focusNode,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    String? restorationId,
    bool enableIMEPersonalizedLearning = true,
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
      .set('initialValue', initialValue)
      .set('focusNode', focusNode)
      .set('decoration', decoration)
      .set('keyboardType', keyboardType)
      .set('textCapitalization', textCapitalization)
      .set('textInputAction', textInputAction)
      .set('style', style)
      .set('strutStyle', strutStyle)
      .set('textDirection', textDirection)
      .set('textAlign', textAlign)
      .set('textAlignVertical', textAlignVertical)
      .set('autofocus', autofocus)
      .set('readOnly', readOnly)
      .set('toolbarOptions', toolbarOptions)
      .set('showCursor', showCursor)
      .set('obscuringCharacter', obscuringCharacter)
      .set('obscureText', obscureText)
      .set('autocorrect', autocorrect)
      .set('smartDashesType', smartDashesType)
      .set('smartQuotesType', smartQuotesType)
      .set('enableSuggestions', enableSuggestions)
      .set('maxLengthEnforcement', maxLengthEnforcement)
      .set('maxLines', maxLines)
      .set('minLines', minLines)
      .set('expands', expands)
      .set('maxLength', maxLength)
      .set('validator', validator)
      .set('inputFormatters', inputFormatters)
      .set('enabled', enabled)
      .set('cursorWidth', cursorWidth)
      .set('cursorHeight', cursorHeight)
      .set('cursorRadius', cursorRadius)
      .set('cursorColor', cursorColor)
      .set('keyboardAppearance', keyboardAppearance)
      .set('scrollPadding', scrollPadding)
      .set('enableInteractiveSelection', enableInteractiveSelection)
      .set('selectionControls', selectionControls)
      .set('buildCounter', buildCounter)
      .set('scrollPhysics', scrollPhysics)
      .set('autofillHints', autofillHints)
      .set('autovalidateMode', autovalidateMode)
      .set('scrollController', scrollController)
      .set('restorationId', restorationId)
      .set('enableIMEPersonalizedLearning', enableIMEPersonalizedLearning);
      
  }

  @override
  Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale) {

      double height = 1.0;
      double fontSize = 0.0;
      double? newFontSize;

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

      responsiveStyle = responsiveStyle.copyWith(fontSize: newFontSize);

      return TextFormField(
          key : get('key'),
          controller : get('controller'),
          initialValue : get('initialValue'),
          focusNode : get('focusNode'),
          decoration : get('decoration'),
          keyboardType : get('keyboardType'),
          textCapitalization : get('textCapitalization'),
          textInputAction : get('textInputAction'),
          style : responsiveStyle,
          strutStyle : get('strutStyle'),
          textDirection : get('textDirection'),
          textAlign : get('textAlign'),
          textAlignVertical : get('textAlignVertical'),
          autofocus : get('autofocus'),
          readOnly : get('readOnly'),
          toolbarOptions : get('toolbarOptions'),
          showCursor : get('showCursor'),
          obscuringCharacter : get('obscuringCharacter'),
          obscureText : get('obscureText'),
          autocorrect : get('autocorrect'),
          smartDashesType : get('smartDashesType'),
          smartQuotesType : get('smartQuotesType'),
          enableSuggestions : get('enableSuggestions'),
          maxLengthEnforcement : get('maxLengthEnforcement'),
          maxLines : get('maxLines'),
          minLines : get('minLines'),
          expands : get('expands'),
          maxLength : get('maxLength'),
          onChanged : onChanged,
          onTap : onTap,
          onEditingComplete : onEditingComplete,
          onFieldSubmitted : onFieldSubmitted,
          onSaved : onSaved,
          validator : get('validator'),
          inputFormatters : get('inputFormatters'),
          enabled : get('enabled'),
          cursorWidth : get('cursorWidth'),
          cursorHeight : get('cursorHeight'),
          cursorRadius : get('cursorRadius'),
          cursorColor : get('cursorColor'),
          keyboardAppearance : get('keyboardAppearance'),
          scrollPadding : get('scrollPadding'),
          enableInteractiveSelection : get('enableInteractiveSelection'),
          selectionControls : get('selectionControls'),
          buildCounter : get('buildCounter'),
          scrollPhysics : get('scrollPhysics'),
          autofillHints : get('autofillHints'),
          autovalidateMode : get('autovalidateMode'),
          scrollController : get('scrollController'),
          restorationId : get('restorationId'),
          enableIMEPersonalizedLearning : get('enableIMEPersonalizedLearning'),
      );
  }

}