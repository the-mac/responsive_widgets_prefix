
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenType {
    Watch,
    SmallPhone,
    MediumPhone,
    LargePhone,
    SmallTablet,
    MediumTablet,
    LargeTablet,
    MediumDesktop,
    LargeDesktop,
    Television,
}

class ResponsiveHelper {

  static late ResponsiveHelper _instance;
  static ResponsiveHelper get instance { return _instance; }
  static void init(BuildContext context, BoxConstraints boxConstraints) {
      _instance = ResponsiveHelper(
        orientation: Orientation.portrait,
        screenSize: Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      _instance._setupScreenType();
  }

  static late ScreenType _screenType;

  Orientation orientation;
  Size screenSize;

  ResponsiveHelper({
    required this.orientation,
    required this.screenSize
  });

  static ScreenType current() {
      return _screenType;
  }

  static bool currently(ScreenType _screenTypeOption) {
      return _screenType == _screenTypeOption;
  }

  static bool smallerThan(ScreenType _screenTypeOption) {
      return _screenType.index < _screenTypeOption.index;
  }

  void _setupScreenType() {

      double deviceWidth = 0;
      if (orientation == Orientation.landscape) {
        deviceWidth = screenSize.height;
      } else {
        deviceWidth = screenSize.width;
      }

      if (deviceWidth >= 1600) { // 1920
        _screenType = ScreenType.Television;
      } else if (deviceWidth >= 1420) {
        _screenType = ScreenType.LargeDesktop;
      } else if (deviceWidth >= 1280) {
        _screenType = ScreenType.MediumDesktop;
      } else if (deviceWidth >= 1024) {
        _screenType = ScreenType.LargeTablet;
      } else if (deviceWidth >= 800) {
        _screenType = ScreenType.MediumTablet;
      } else if (deviceWidth >= 600) {
        _screenType = ScreenType.SmallTablet;
      } else if (deviceWidth >= 480) {
        _screenType = ScreenType.LargePhone;
      } else if (deviceWidth >= 360) {
        _screenType = ScreenType.MediumPhone;
      } else if (deviceWidth >= 320) {
        _screenType = ScreenType.SmallPhone;
      } else { _screenType = ScreenType.Watch; }

      if(!kReleaseMode) print('\n\n${toString()}\n\n');

  }

  @override
  String toString() {
    return '\n\n$orientation\n$_screenType\n$screenSize\n\n';
  }

}