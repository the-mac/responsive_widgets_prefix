
// ignore_for_file: avoid_print
import 'package:device_frame_community/src/info/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_preview/integration_test_preview.dart';

import 'package:example/platforms.dart';

class ScreenIntegrationTestGroups extends IntegrationTestPreview {

    late Map _languagesTestData;

    ScreenIntegrationTestGroups(binding) : super(binding);

    @override Future<void> setupInitialData() async {}

    @override
    Future<BuildContext> getBuildContext() async {
        if(await isPlatformAndroid()) {
          final elementType = find.byType(MaterialApp);
          return tester.element(elementType);
        } else {
          final elementType = find.byType(CupertinoApp);
          return tester.element(elementType);
        }
    }

    @override
    Future<void> togglePlatformUI(TargetPlatform platform) async {
        PlatformWidget.setPlatform(platform);
        PlatformWidget.reassembleApplication();
        await waitForUI(durationMultiple: 2);
    }
    
    @override
    Future<void> testDeviceEndToEnd(DeviceInfo device) async {

        await waitForUI(durationMultiple: 2);
        await testCounterFeature(device);

    }

    Future<void> verifyAppBarText(String appBarText) async {
        if(PlatformWidget.isAndroid) {
            await verifyTextForKey('app-bar-text', appBarText);
        }
        await waitForUI();
    }

    Future<void> setupScreenshot(String fileName) async {
        String platformType = PlatformWidget.isAndroid ? 'android' : 'ios';
        String screenshotPath = 'screenshots/$platformType/$fileName.png';
        print('Setting up screenshot: $screenshotPath');
        await takeScreenshot(screenshotPath);
    }

    Future<void> testCounterFeature(DeviceInfo device) async {

        final devicePath = device.identifier.name.replaceAll('-', '_');
        await setupScreenshot('$devicePath/counter_sample_0');
        await verifyTextForKey('counter-page-text', '0');
        await tapForTooltip('Increment');

        await verifyTextForKey('counter-page-text', '1');
        await tapForTooltip('Increment');

        await verifyTextForKey('counter-page-text', '2');
        await tapForTooltip('Increment');

        await verifyTextForKey('counter-page-text', '3');
        await tapForTooltip('Increment');

        await verifyTextForKey('counter-page-text', '4');
        await setupScreenshot('$devicePath/counter_sample_4');

    }

}