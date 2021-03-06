
// clear && printf '\e[3J' && flutter drive -t integration_test/app_features.dart ; flutter clean

// clear && printf '\e[3J' && flutter drive -t integration_test/app_features.dart

import 'package:device_frame_community/src/devices/devices.dart';
import 'package:device_frame_community/src/info/info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_preview/integration_test_binding.dart';

import 'package:example/main.dart' as app;
import 'app_feature_groups.dart';

void main() async {

    final binding = IntegrationTestPreviewBinding.ensureInitialized();

    testWidgets('Testing end to end multi-screen integration', (WidgetTester tester) async {
      
          final main = app.setupMainWidget();
          final List<DeviceInfo> testDevices = [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone12ProMax,
            Devices.android.samsungGalaxyA50,
            Devices.ios.iPadPro11Inches,
            Devices.android.sonyXperia1II
          ];
          
          final integrationTestGroups = ScreenIntegrationTestGroups(binding);
          await integrationTestGroups.initializeDevices(testDevices, state: ScreenshotState.RESPONSIVE);
          await integrationTestGroups.initializeTests(tester, main);
          await integrationTestGroups.testDevicesEndToEnd();

      }, timeout: const Timeout(Duration(minutes: 4))
    );
    
}