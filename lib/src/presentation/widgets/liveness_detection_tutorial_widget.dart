import 'package:flutter_liveness_detection/index.dart';

class LivenessDetectionTutorialScreen extends StatefulWidget {
  final VoidCallback onStartTap;
  final bool isDarkMode;
  final int? duration;
  final LivenessDetectionUiConfig? uiConfig;
  const LivenessDetectionTutorialScreen({
    super.key,
    required this.onStartTap,
    this.isDarkMode = false,
    this.uiConfig,
    required this.duration,
  });

  @override
  State<LivenessDetectionTutorialScreen> createState() =>
      _LivenessDetectionTutorialScreenState();
}

class _LivenessDetectionTutorialScreenState
    extends State<LivenessDetectionTutorialScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uiConfig = widget.uiConfig;
    final backgroundColor =
        uiConfig?.backgroundColor ??
        (widget.isDarkMode ? Colors.black : Colors.white);
    final surfaceColor =
        uiConfig?.surfaceColor ??
        (widget.isDarkMode ? Colors.black87 : Colors.white);
    final onSurfaceColor =
        uiConfig?.onSurfaceColor ??
        (widget.isDarkMode ? Colors.white : Colors.black);
    final primaryColor = uiConfig?.primaryColor ?? onSurfaceColor;
    final onPrimaryColor = uiConfig?.onPrimaryColor ?? onSurfaceColor;
    final shadowColor = uiConfig?.shadowColor ?? Colors.grey;
    final titleStyle =
        uiConfig?.tutorialTitleTextStyle ??
        TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: onSurfaceColor,
        );
    final stepTitleStyle =
        uiConfig?.tutorialStepTitleTextStyle ??
        TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: onSurfaceColor,
        );
    final stepBodyStyle =
        uiConfig?.tutorialStepBodyTextStyle ?? TextStyle(color: onSurfaceColor);
    final footerStyle =
        uiConfig?.tutorialFooterTextStyle ??
        const TextStyle(color: Colors.grey);
    final instructions =
        uiConfig?.tutorialInstructions ??
        [
          const LivenessDetectionTutorialInstruction(
            title: 'Sufficient Lighting',
            description:
                'Make sure you are in an area that has sufficient lighting and that your ears are not covered by anything',
          ),
          const LivenessDetectionTutorialInstruction(
            title: 'Straight Ahead View',
            description:
                'Hold the phone at eye level and look straight at the camera',
          ),
          LivenessDetectionTutorialInstruction(
            title: 'Time Limit Verification',
            description:
                'The time limit given for the liveness detection system verification process is ${widget.duration ?? 45} seconds',
          ),
        ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        minimum: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const SizedBox(height: 16),
            Text(
              uiConfig?.tutorialTitle ?? 'Liveness Detection - Tutorial',
              style: titleStyle,
            ),
            const SizedBox(height: 32),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: surfaceColor,
                boxShadow: !widget.isDarkMode
                    ? [
                        BoxShadow(
                          color: shadowColor.withAlpha(51),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                children: [
                  for (var index = 0; index < instructions.length; index++)
                    ListTile(
                      leading: Text('${index + 1}', style: stepTitleStyle),
                      subtitle: Text(
                        instructions[index].description,
                        style: stepBodyStyle,
                      ),
                      title: Text(
                        instructions[index].title,
                        style: stepTitleStyle,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style:
                  uiConfig?.startButtonStyle ??
                  ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: onPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () => widget.onStartTap(),
              label: Text(
                uiConfig?.tutorialStartButtonLabel ??
                    'Start the Liveness Detection System',
              ),
            ),
            const SizedBox(height: 10),
            const Spacer(),
            if (uiConfig?.showPackageVersion ?? true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.grey,
                    size: 15,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    uiConfig?.packageVersionLabel ?? 'Package Version: 1.2.1',
                    style: footerStyle,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
