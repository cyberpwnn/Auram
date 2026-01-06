import 'dart:io';
import 'dart:math';

import 'package:auram/auram.dart';
import 'package:auram/loader/loader.dart';
import 'package:auram/model/config.dart';
import 'package:auram/model/models.dart';
import 'package:fast_log/fast_log.dart';

class Modifier {
  final DumpLoader loader;
  List<Recipe> initial = [];
  List<Recipe> state = [];
  late final Config config;
  late Random random;
  final List<Generator> generators;

  Modifier(this.loader, {this.generators = const []}) {
    config = loadConfig();
    random = Random(config.seed.hashCode);
    initial = loader.recipes.toList();
    state = loader.recipes.toList();
  }

  void generate() {
    if (outDir.existsSync()) {
      outDir.deleteSync(recursive: true);
    }
    outDir.createSync();
    for (Generator i in generators) {
      apply(i);
    }
  }

  void apply(Generator generator) {
    int ch = 0;
    int f = 0;
    StringBuffer buf = StringBuffer();
    int tch = 0;
    for (Change i
        in generator.generateChanges(this).where((i) => i.isValid())) {
      applyChange(i);

      if (i.remove != null) {
        i.remove!.generateRemove(buf);
      }

      i.add.generateAdd(buf, oredict: loader.oredict);
      tch++;

      if (ch++ > 250) {
        ch = 0;
        File out = File(
          "${outDir.absolute.path}${Platform.pathSeparator}${generator.name}_$f.zs",
        );
        f++;
        out.writeAsStringSync(buf.toString());
        buf = StringBuffer();
      }
    }

    if (ch > 0) {
      File out = File(
        "${outDir.absolute.path}${Platform.pathSeparator}${generator.name}_$f.zs",
      );
      out.writeAsStringSync(buf.toString());
    }

    info("Applied ${generator.name} with $tch changes across ${f + 1} file(s)");
  }

  void applyChange(Change c) {
    if (c.remove != null) {
      state.removeWhere(
        (i) =>
            i.runtimeType == c.remove.runtimeType &&
            c.remove!.getOutputs().map((i) => "${i.id}*${i.id}").join(",") ==
                i.getOutputs().map((i) => "${i.id}*${i.id}").join(",") &&
            c.remove!.getInputs().map((i) => "${i.id}*${i.id}").join(",") ==
                i.getInputs().map((i) => "${i.id}*${i.id}").join(","),
      );
    }

    state.add(c.add);
  }
}

abstract class Generator {
  Iterable<Change> generateChanges(Modifier modifier);

  String get name;

  Iterable<String> generateCustomScript() => [];
}

class Change {
  final Recipe? remove;
  final Recipe add;

  Change({required this.add, this.remove});

  bool isValid() => add.getOutputs().isNotEmpty && add.getInputs().isNotEmpty;

  void write(Modifier modifier, StringBuffer buf) {
    if (remove != null) {
      remove!.generateRemove(buf);
    }

    add.generateAdd(buf, oredict: modifier.loader.oredict);
  }
}
