import 'package:flutter/material.dart';
import 'responsive_helper.dart';

abstract class ResponsiveStatelessWidget extends StatelessWidget {
    final Map _attributeMap = {};

    final Map<ScreenType, double> _scales = {
      ScreenType.Watch : 0.6,
      ScreenType.SmallPhone : 1.0,
      ScreenType.MediumPhone: 1.0,
      ScreenType.LargePhone : 1.5,
      ScreenType.SmallTablet : 1.8,
      ScreenType.MediumTablet: 2.0,
      ScreenType.LargeTablet : 2.5,
      ScreenType.MediumDesktop : 3.0,
      ScreenType.LargeDesktop : 3.6,
      ScreenType.Television : 4.2
    };

    void _updateScale(ScreenType screenType, double scale) {
      
        if(ResponsiveHelper.currently(screenType) && 10.0 < scale || 0 > scale)  {
            print('$screenType $this scale is not between 1 - 10 ($scale), defaulting the scale to 1.0');
            scale = 1.0;
        }
        _scales[screenType] = scale;

    }

    double getScale() {
        return  _scales[ResponsiveHelper.current()]!;
    }

    ScreenType getScreenType() => ResponsiveHelper.current();

    ResponsiveStatelessWidget({
        Key? key,
        double? scaleWatch,
        double? scaleSmallPhone,
        double? scaleMediumPhone,
        double? scaleLargePhone,
        double? scaleSmallTablet,
        double? scaleMediumTablet,
        double? scaleLargeTablet,
        double? scaleMediumDesktop,
        double? scaleLargeDesktop,
        double? scaleTelevision,
    }) : 
        assert(scaleWatch != null), 
        assert(scaleSmallPhone != null), 
        assert(scaleMediumPhone != null), 
        assert(scaleLargePhone != null), 
        assert(scaleSmallTablet != null), 
        assert(scaleMediumTablet != null), 
        assert(scaleLargeTablet != null), 
        assert(scaleMediumDesktop != null), 
        assert(scaleLargeDesktop != null), 
        assert(scaleTelevision != null), 
        super() {

      _updateScale(ScreenType.Watch, scaleWatch!);
      _updateScale(ScreenType.SmallPhone, scaleSmallPhone!);
      _updateScale(ScreenType.MediumPhone, scaleMediumPhone!);
      _updateScale(ScreenType.LargePhone, scaleLargePhone!);
      _updateScale(ScreenType.SmallTablet, scaleSmallTablet!);
      _updateScale(ScreenType.MediumTablet, scaleMediumTablet!);
      _updateScale(ScreenType.LargeTablet, scaleLargeTablet!);
      _updateScale(ScreenType.MediumDesktop, scaleMediumDesktop!);
      _updateScale(ScreenType.LargeDesktop, scaleLargeDesktop!);
      _updateScale(ScreenType.Television, scaleTelevision!);

    }

    Key getKey() { return const Key('default'); }

    bool has(String key) { return _attributeMap.containsKey(key) && _attributeMap[key] != null; }
    dynamic get(String key) { return _attributeMap[key]; }
    ResponsiveStatelessWidget set(String key, dynamic value) {
      _attributeMap[key] = value;
      return this;
    }

    Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale);

    @override
    Widget build(BuildContext context) {
        return getResponsiveWidget(context, ResponsiveHelper.current(), getScale());
    }
    
}

abstract class ResponsiveStatefulWidget extends StatefulWidget {
    final Map _attributeMap = {};
  
    final Map<ScreenType, double> _scales = {
      ScreenType.Watch : 0.6,
      ScreenType.SmallPhone : 1.0,
      ScreenType.MediumPhone: 1.0,
      ScreenType.LargePhone : 1.5,
      ScreenType.SmallTablet : 1.8,
      ScreenType.MediumTablet: 2.0,
      ScreenType.LargeTablet : 2.5,
      ScreenType.MediumDesktop : 3.0,
      ScreenType.LargeDesktop : 3.6,
      ScreenType.Television : 4.2
    };

    void _updateScale(ScreenType screenType, double scale) {

        if(ResponsiveHelper.currently(screenType) && 10.0 < scale || 0 > scale)  {
            print('$screenType $this scale is not between 1 - 10 ($scale), defaulting the scale to 1.0');
            scale = 1.0;
        }
        _scales[screenType] = scale;

    }
    
    double getScale() {
        return  _scales[ResponsiveHelper.current()]!;
    }
    
    ScreenType getScreenType() => ResponsiveHelper.current();
  
    ResponsiveStatefulWidget({
        Key? key,
        double? scaleWatch,
        double? scaleSmallPhone,
        double? scaleMediumPhone,
        double? scaleLargePhone,
        double? scaleSmallTablet,
        double? scaleMediumTablet,
        double? scaleLargeTablet,
        double? scaleMediumDesktop,
        double? scaleLargeDesktop,
        double? scaleTelevision,
    }) :  
        assert(scaleWatch != null), 
        assert(scaleSmallPhone != null), 
        assert(scaleMediumPhone != null), 
        assert(scaleLargePhone != null), 
        assert(scaleSmallTablet != null), 
        assert(scaleMediumTablet != null), 
        assert(scaleLargeTablet != null), 
        assert(scaleMediumDesktop != null), 
        assert(scaleLargeDesktop != null), 
        assert(scaleTelevision != null), 
        super() {
      
      _updateScale(ScreenType.Watch, scaleWatch!);
      _updateScale(ScreenType.SmallPhone, scaleSmallPhone!);
      _updateScale(ScreenType.MediumPhone, scaleMediumPhone!);
      _updateScale(ScreenType.LargePhone, scaleLargePhone!);
      _updateScale(ScreenType.SmallTablet, scaleSmallTablet!);
      _updateScale(ScreenType.MediumTablet, scaleMediumTablet!);
      _updateScale(ScreenType.LargeTablet, scaleLargeTablet!);
      _updateScale(ScreenType.MediumDesktop, scaleMediumDesktop!);
      _updateScale(ScreenType.LargeDesktop, scaleLargeDesktop!);
      _updateScale(ScreenType.Television, scaleTelevision!);

    }

    bool has(String key) { return _attributeMap.containsKey(key) && _attributeMap[key] != null; }
    dynamic get(String key) { return _attributeMap[key]; }
    ResponsiveStatefulWidget set(String key, dynamic value) {
      _attributeMap[key] = value;
      return this;
    }

}

abstract class ResponsiveState<T extends ResponsiveStatefulWidget> extends State<T> {

    ResponsiveState();

    @override void setState(VoidCallback fn) { if(mounted) super.setState(fn); }

    Widget getResponsiveWidget(BuildContext context, ScreenType screenType, double scale);

    @override Widget build(BuildContext context) {
        return getResponsiveWidget(context, ResponsiveHelper.current(), widget.getScale());
    }
}

// abstract class BaseStatefulWidget extends StatefulWidget {
//     BaseStatefulWidget({ Key? key }) : super(key: key);
// }

// abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
//     BaseState();
//     @override void setState(VoidCallback fn) { if(mounted) super.setState(fn); }
// }
