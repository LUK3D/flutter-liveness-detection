import 'package:flutter_liveness_detection/flutter_liveness_detection.dart';
import 'package:flutter_liveness_detection/flutter_liveness_detection_method_channel.dart';
import 'package:flutter_liveness_detection/flutter_liveness_detection_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLivenessDetectionPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLivenessDetectionPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLivenessDetectionPlatform initialPlatform =
      FlutterLivenessDetectionPlatform.instance;

  test('$MethodChannelFlutterLivenessDetection is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLivenessDetection>());
  });

  test('getPlatformVersion', () async {
    final flutterLivenessDetection = FlutterLivenessDetection.instance;
    final fakePlatform = MockFlutterLivenessDetectionPlatform();
    FlutterLivenessDetectionPlatform.instance = fakePlatform;

    expect(await flutterLivenessDetection.getPlatformVersion(), '42');
  });
}