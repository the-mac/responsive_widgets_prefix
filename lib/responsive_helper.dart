
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenType {
    None,
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

  static ResponsiveHelper? _instance;
  static ResponsiveHelper? get instance { return _instance; }
  static void init(BuildContext context, BoxConstraints boxConstraints) {
      _instance = ResponsiveHelper(
        orientation: Orientation.portrait,
        screenSize: Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      _instance!._setupScreenType();
  }

  static late ScreenType _screenType;

  static ScreenType testingScreenType = ScreenType.None;

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

  static get screenType {
      return _screenType;
  }

  static void updateTestingScreenType() {
    if(_instance != null) {
        _instance!._setupScreenType();
    }
  }

  void _setupScreenType() {

      double deviceWidth = 0;
      if (orientation == Orientation.landscape) {
        deviceWidth = screenSize.height;
      } else {
        deviceWidth = screenSize.width;
      }

      if(testingScreenType != ScreenType.None) {
        _screenType = testingScreenType;
      } else {
        _screenType = setupScreenType(deviceWidth);
      }

      if(!kReleaseMode) print('\n\n${toString()}\n\n');
  }

  static ScreenType setupScreenType(double deviceWidth) {

      if (deviceWidth >= 1600) { // 1920
        return ScreenType.Television;
      } else if (deviceWidth >= 1420) {
        return ScreenType.LargeDesktop;
      } else if (deviceWidth >= 1280) {
        return ScreenType.MediumDesktop;
      } else if (deviceWidth >= 1024) {
        return ScreenType.LargeTablet;
      } else if (deviceWidth >= 800) {
        return ScreenType.MediumTablet;
      } else if (deviceWidth >= 600) {
        return ScreenType.SmallTablet;
      } else if (deviceWidth >= 480) {
        return ScreenType.LargePhone;
      } else if (deviceWidth >= 360) {
        return ScreenType.MediumPhone;
      } else if (deviceWidth >= 320) {
        return ScreenType.SmallPhone;
      } else if (deviceWidth >= 150) {
        return ScreenType.Watch;
      } else { return ScreenType.None; }

  }

  @override
  String toString() {
    return '\n\n$orientation\n$_screenType\n$screenSize\n\n';
  }

}