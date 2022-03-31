import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:responsive_widgets_prefix/responsive_helper.dart';

class _LayoutHelper {

    static LayoutBuilder _getResponsiveLayoutBuilder(Widget homeWidget) {
      return LayoutBuilder(
        builder: (context, boxConstraints) {
          ResponsiveHelper.init(context, boxConstraints);
          return homeWidget;
        }
      );
    }

}

class ResponsiveMaterialApp extends MaterialApp {
  ResponsiveMaterialApp({
    Key? key,
    navigatorKey,
    scaffoldMessengerKey,
    home,
    Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
    initialRoute,
    onGenerateRoute,
    onGenerateInitialRoutes,
    onUnknownRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    builder,
    title = '',
    onGenerateTitle,
    color,
    theme,
    darkTheme,
    highContrastTheme,
    highContrastDarkTheme,
    themeMode = ThemeMode.system,
    locale,
    localizationsDelegates,
    localeListResolutionCallback,
    localeResolutionCallback,
    supportedLocales = const <Locale>[Locale('en', 'US')],
    debugShowMaterialGrid = false,
    showPerformanceOverlay = false,
    checkerboardRasterCacheImages = false,
    checkerboardOffscreenLayers = false,
    showSemanticsDebugger = false,
    debugShowCheckedModeBanner = true,
    shortcuts,
    actions,
    restorationScopeId,
    scrollBehavior,
    useInheritedMediaQuery = false,
  }) : super(
    key: key,
    navigatorKey : navigatorKey,
    scaffoldMessengerKey : scaffoldMessengerKey,
    home : _LayoutHelper._getResponsiveLayoutBuilder(home),
    routes : routes,
    initialRoute : initialRoute,
    onGenerateRoute : onGenerateRoute,
    onGenerateInitialRoutes : onGenerateInitialRoutes,
    onUnknownRoute : onUnknownRoute,
    navigatorObservers : navigatorObservers,
    builder : builder,
    title : title,
    onGenerateTitle : onGenerateTitle,
    color : color,
    theme : theme,
    darkTheme : darkTheme,
    highContrastTheme : highContrastTheme,
    highContrastDarkTheme : highContrastDarkTheme,
    themeMode : themeMode,
    locale : locale,
    localizationsDelegates : localizationsDelegates,
    localeListResolutionCallback : localeListResolutionCallback,
    localeResolutionCallback : localeResolutionCallback,
    supportedLocales : supportedLocales,
    debugShowMaterialGrid : debugShowMaterialGrid,
    showPerformanceOverlay : showPerformanceOverlay,
    checkerboardRasterCacheImages : checkerboardRasterCacheImages,
    checkerboardOffscreenLayers : checkerboardOffscreenLayers,
    showSemanticsDebugger : showSemanticsDebugger,
    debugShowCheckedModeBanner : debugShowCheckedModeBanner,
    shortcuts : shortcuts,
    actions : actions,
    restorationScopeId : restorationScopeId,
    scrollBehavior : scrollBehavior,
    useInheritedMediaQuery : useInheritedMediaQuery
  );

}

class ResponsiveCupertinoApp extends CupertinoApp {
  ResponsiveCupertinoApp({
    Key? key,
    navigatorKey,
    home,
    theme,
    Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{},
    initialRoute,
    onGenerateRoute,
    onGenerateInitialRoutes,
    onUnknownRoute,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    builder,
    title = '',
    onGenerateTitle,
    color,
    locale,
    localizationsDelegates,
    localeListResolutionCallback,
    localeResolutionCallback,
    supportedLocales = const <Locale>[Locale('en', 'US')],
    showPerformanceOverlay = false,
    checkerboardRasterCacheImages = false,
    checkerboardOffscreenLayers = false,
    showSemanticsDebugger = false,
    debugShowCheckedModeBanner = true,
    shortcuts,
    actions,
    restorationScopeId,
    scrollBehavior,
    useInheritedMediaQuery = false,
  }) : super(
        key: key,
        navigatorKey : navigatorKey,
        home : _LayoutHelper._getResponsiveLayoutBuilder(home),
        theme : theme,
        routes : routes,
        initialRoute : initialRoute,
        onGenerateRoute : onGenerateRoute,
        onGenerateInitialRoutes : onGenerateInitialRoutes,
        onUnknownRoute : onUnknownRoute,
        navigatorObservers : navigatorObservers,
        builder : builder,
        title : title ,
        onGenerateTitle : onGenerateTitle,
        color : color,
        locale : locale,
        localizationsDelegates : localizationsDelegates,
        localeListResolutionCallback : localeListResolutionCallback,
        localeResolutionCallback : localeResolutionCallback,
        supportedLocales : supportedLocales,
        showPerformanceOverlay : showPerformanceOverlay,
        checkerboardRasterCacheImages : checkerboardRasterCacheImages,
        checkerboardOffscreenLayers : checkerboardOffscreenLayers,
        showSemanticsDebugger : showSemanticsDebugger,
        debugShowCheckedModeBanner : debugShowCheckedModeBanner,
        shortcuts : shortcuts,
        actions : actions,
        restorationScopeId : restorationScopeId,
        scrollBehavior : scrollBehavior,
        useInheritedMediaQuery : useInheritedMediaQuery
  );

}