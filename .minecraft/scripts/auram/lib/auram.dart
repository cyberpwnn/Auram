import 'dart:io';

import 'package:auram/gen/artifacts.gen.dart';
import 'package:auram/generators/worktables.dart';
import 'package:auram/loader/loader.dart';
import 'package:auram/model/config.dart';
import 'package:auram/model/models.dart';
import 'package:auram/modifier.dart';
import 'package:fast_log/fast_log.dart';

Config loadConfig() {
  if (!configFile.existsSync()) {
    verbose("Generating Default Config File at ${configFile.absolute.path}");
    configFile.writeAsStringSync(Config().to.yaml);
  } else {
    try {
      return $Config.from.yaml(configFile.readAsStringSync());
    } catch (e) {
      warn(
        "Config File is corrupted, regenerating default config file at ${configFile.absolute.path}",
      );
      configFile.writeAsStringSync(Config().to.yaml);
    }
  }

  return Config();
}

File get configFile => File(
  "${File("").absolute.parent.absolute.path}${Platform.pathSeparator}auram_config.yaml",
);

Directory get dumpDir => Directory(
  "${File("").absolute.parent.absolute.path}${Platform.pathSeparator}data",
);

Directory get outDir => Directory(
  "${File("").absolute.parent.absolute.path}${Platform.pathSeparator}generated",
);

Map<String, String> loadDumps() => {
  for (File i in dumpDir.listSync().whereType<File>().where(
    (i) => i.path.endsWith(".txt"),
  ))
    i.path.split(Platform.pathSeparator).last.split(".").first: i
        .readAsStringSync(),
};

void main() {
  Map<String, String> dumps = loadDumps();
  verbose("Found ${dumps.length} dumps: ${dumps.keys.join(",")}");
  DumpLoader loader = DumpLoader(dumps);
  info("Items: ${loader.items.length}");
  info("Oredicts: ${loader.oredict.length} groups");
  info("Recipes: ${loader.recipes.length}");
  info(
    "    ${loader.recipes.whereType<ShapelessRecipe>().length} Shapeless Recipes",
  );
  info("    ${loader.recipes.whereType<ShapedRecipe>().length} Shaped Recipes");
  info("Obtainable Items: ${loader.obtainable.length}");
  Modifier modifier = Modifier(loader, generators: [WorktablesGenerator()]);
  modifier.generate();
}
