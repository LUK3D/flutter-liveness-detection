import 'package:flutter/material.dart';
import 'package:flutter_liveness_detection/src/models/liveness_detection_step_item.dart';

typedef LivenessDetectionOverlayInstructionBuilder =
    Widget Function(
      BuildContext context,
      LivenessDetectionOverlayInstructionData data,
    );

typedef LivenessDetectionCooldownBodyBuilder =
    String Function(LivenessDetectionCooldownTextData data);

typedef LivenessDetectionResultMessageBuilder =
    String Function(LivenessDetectionResultMessageData data);

class LivenessDetectionOverlayInstructionData {
  const LivenessDetectionOverlayInstructionData({
    required this.step,
    required this.currentStep,
    required this.totalSteps,
    required this.isDarkMode,
    required this.surfaceColor,
    required this.onSurfaceColor,
    required this.textStyle,
  });

  final LivenessDetectionStepItem step;
  final int currentStep;
  final int totalSteps;
  final bool isDarkMode;
  final Color surfaceColor;
  final Color onSurfaceColor;
  final TextStyle textStyle;
}

class LivenessDetectionCooldownTextData {
  const LivenessDetectionCooldownTextData({
    required this.maxFailedAttempts,
    required this.remainingCooldownTime,
  });

  final int maxFailedAttempts;
  final Duration remainingCooldownTime;
}

class LivenessDetectionResultMessageData {
  const LivenessDetectionResultMessageData({
    required this.isSuccess,
    required this.durationLimitInSeconds,
  });

  final bool isSuccess;
  final int durationLimitInSeconds;
}

class LivenessDetectionTutorialInstruction {
  const LivenessDetectionTutorialInstruction({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class LivenessDetectionUiConfig {
  const LivenessDetectionUiConfig({
    this.backgroundColor,
    this.surfaceColor,
    this.onSurfaceColor,
    this.primaryColor,
    this.onPrimaryColor,
    this.successColor,
    this.shadowColor,
    this.progressInactiveColor,
    this.progressActiveColor,
    this.tutorialTitleTextStyle,
    this.tutorialStepTitleTextStyle,
    this.tutorialStepBodyTextStyle,
    this.tutorialFooterTextStyle,
    this.overlayStepTextStyle,
    this.overlayStatusTextStyle,
    this.overlayTopBarTextStyle,
    this.overlayInstructionBuilder,
    this.startButtonStyle,
    this.tutorialTitle,
    this.tutorialStartButtonLabel,
    this.tutorialInstructions,
    this.backButtonLabel,
    this.faceDetectedLabel,
    this.faceNotDetectedLabel,
    this.cooldownTitle,
    this.cooldownBodyBuilder,
    this.cooldownRemainingTimeLabel,
    this.cooldownBackButtonLabel,
    this.resultMessageBuilder,
    this.successMessage,
    this.packageVersionLabel,
    this.showPackageVersion = true,
  });

  final Color? backgroundColor;
  final Color? surfaceColor;
  final Color? onSurfaceColor;
  final Color? primaryColor;
  final Color? onPrimaryColor;
  final Color? successColor;
  final Color? shadowColor;
  final Color? progressInactiveColor;
  final Color? progressActiveColor;
  final TextStyle? tutorialTitleTextStyle;
  final TextStyle? tutorialStepTitleTextStyle;
  final TextStyle? tutorialStepBodyTextStyle;
  final TextStyle? tutorialFooterTextStyle;
  final TextStyle? overlayStepTextStyle;
  final TextStyle? overlayStatusTextStyle;
  final TextStyle? overlayTopBarTextStyle;
  final LivenessDetectionOverlayInstructionBuilder? overlayInstructionBuilder;
  final ButtonStyle? startButtonStyle;
  final String? tutorialTitle;
  final String? tutorialStartButtonLabel;
  final List<LivenessDetectionTutorialInstruction>? tutorialInstructions;
  final String? backButtonLabel;
  final String? faceDetectedLabel;
  final String? faceNotDetectedLabel;
  final String? cooldownTitle;
  final LivenessDetectionCooldownBodyBuilder? cooldownBodyBuilder;
  final String? cooldownRemainingTimeLabel;
  final String? cooldownBackButtonLabel;
  final LivenessDetectionResultMessageBuilder? resultMessageBuilder;
  final String? successMessage;
  final String? packageVersionLabel;
  final bool showPackageVersion;
}
