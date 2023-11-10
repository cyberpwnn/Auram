import 'dart:ui';

abstract class Task {
  final String name;
  double progress = 0;
  bool done = false;

  Task(this.name);

  Future<void> onRun() async {}

  Future<void> run() async {
    progress = 0;
    await run();
    progress = 1;
    done = true;
  }
}
