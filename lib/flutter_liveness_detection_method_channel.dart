import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_liveness_detection_platform_interface.dart';

/// An implementation of [FlutterLivenessDetectionPlatform] that uses method channels.
class MethodChannelFlutterLivenessDetection
    extends FlutterLivenessDetectionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_liveness_detection');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}