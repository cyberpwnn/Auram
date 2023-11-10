import 'package:flutter/material.dart';
import 'package:launcher/main_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    fullScreen: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    alwaysOnTop: true,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const AuramLauncher());
}

class AuramLauncher extends StatefulWidget {
  const AuramLauncher({super.key});

  @override
  State<AuramLauncher> createState() => _AuramLauncherState();
}

class _AuramLauncherState extends State<AuramLauncher> {
  @override
  void initState() {
    super.initState();
    WindowManager.instance.setFullScreen(true);
  }

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: "Auram Launcher",
        home: MainScreen(),
      );
}
