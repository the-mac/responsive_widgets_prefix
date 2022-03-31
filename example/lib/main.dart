import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets_prefix/responsive_widgets_prefix.dart';

import 'platforms.dart';

void main() => runApp(setupMainWidget());

Widget setupMainWidget() {
  WidgetsFlutterBinding.ensureInitialized();
  return const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) {
    return PlatformApp(
        defaultPlatform: PlatformWidget.platform,
        androidApp: ResponsiveMaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const MyHomePage()
        ),
        iosApp: ResponsiveCupertinoApp(
            theme: const CupertinoThemeData(primaryColor: Colors.blue),
            home: const MyHomePage(),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ResponsiveText('You have pushed the button this many times:'),
            ResponsiveText('$_counter', key: Key('counter-page-text'), style: Theme.of(context).textTheme.headline4, scaleMediumTablet: 4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, tooltip: 'Increment', child: const Icon(Icons.add),
      ),
    );
  }
}
