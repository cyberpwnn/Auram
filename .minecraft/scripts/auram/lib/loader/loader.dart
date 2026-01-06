import 'package:auram/model/models.dart';
import 'package:fast_log/fast_log.dart';

class DumpLoader {
  List<String> items = [];
  Map<String, List<String>> oredict = {};
  List<Recipe> recipes = [];
  Map<String, int> usages = {};
  Set<String> obtainable = {};

  DumpLoader(Map<String, String> raw) {
    verbose("Reading Dump...");
    items = loadItems(raw["items"] ?? "");
    oredict = loadOredict(raw["oredict"] ?? "");
    recipes = loadRecipes(raw);
    usages = calculateUsages();
    obtainable = {...recipes.expand((e) => e.getOutputs().map((i) => i.id))};
  }

  List<Recipe> loadRecipes(Map<String, String> raw) {
    List<Recipe> recipes = [...loadCraftingRecipes(raw)];
    return recipes;
  }

  List<Recipe> loadCraftingRecipes(Map<String, String> raw) {
    List<Recipe> recipes = [];
    if (raw["recipes_crafting"] == null) return recipes;

    for (String line in raw["recipes_crafting"]!.split("\n")) {
      String i = line.trim();

      if (i.contains(":*") || i.contains(".with")) {
        continue;
      }
      if (i.startsWith("recipes.addShapeless")) {
        i = i.removeUntil('",').trim();
        String outputRaw = i.trimUntil(",").trim();
        i = i.removeUntil(",").trim();

        Item output = parseOutput(outputRaw);
        String inputsRaw = i.removeUntil("[").trim().removeUntilLast("]");
        List<Item?> inputs = parseItemList(inputsRaw);

        recipes.add(
          ShapelessRecipe(
            inputs: inputs.whereType<Item>().toList(),
            output: output,
          ),
        );
      } else if (i.startsWith("recipes.addShaped")) {
        i = i.removeUntil('",').trim();
        String outputRaw = i.trimUntil(",").trim();
        i = i.removeUntil(",").trim();

        Item output = parseOutput(outputRaw);
        String patternRaw = i
            .removeUntil("[[")
            .trim()
            .removeUntilLast("]]")
            .trim();
        List<List<Item?>> pattern = parsePattern(patternRaw);

        recipes.add(ShapedRecipe(pattern: pattern, output: output));
      }
    }
    return recipes;
  }

  Item parseOutput(String outputRaw) => Item.read(outputRaw);

  List<Item?> parseItemList(String raw) {
    List<Item?> items = [];
    String remaining = raw.trim();
    while (remaining.isNotEmpty &&
        (remaining.contains("<") || remaining.contains("null"))) {
      String itemStr;
      if (remaining.contains(",")) {
        itemStr = remaining.substring(0, remaining.indexOf(",")).trim();
        remaining = remaining.substring(remaining.indexOf(",") + 1).trim();
      } else {
        itemStr = remaining.trim();
        remaining = "";
      }
      if (itemStr.startsWith("<")) {
        items.add(Item.read(itemStr));
      } else if (itemStr.startsWith("null")) {
        items.add(null);
      }
    }
    return items;
  }

  List<List<Item?>> parsePattern(String raw) {
    raw = "[$raw]";
    List<List<Item?>> pattern = [];
    String remaining = raw.trim();
    while (remaining.startsWith("[")) {
      remaining = remaining
          .removeUntil("[")
          .trim(); // Now inside row: <ore...>, <ore...>]
      String rowRaw = remaining.trimUntil("]").trim();
      remaining = remaining.removeUntil("]").trim(); // Skip ] and possible ,
      if (remaining.startsWith(",")) {
        remaining = remaining.removeUntil(",").trim();
      }
      List<Item?> row = parseItemList(rowRaw);
      pattern.add(row);
    }

    return pattern;
  }

  Map<String, List<String>> loadOredict(String data) {
    Map<String, List<String>> oredict = {};

    String current = "";
    List<String> l = data.split("\n");

    for (String i in l) {
      if (i.startsWith("Ore entries for <")) {
        current = i.split("re entries for ").last.trim();
        current = current.substring(0, current.length - 1).trim();
        oredict[current] = [];
      } else if (i.startsWith("-<")) {
        oredict[current]?.add(i.substring(1).trim());
      }
    }

    return oredict;
  }

  List<String> loadItems(String data) {
    data = data.replaceAll("\"\"", "\"");
    Set<String> items = {};
    List<String> l = data.split("\n");
    verbose("Reading Items...");
    for (String i in l) {
      if (!i.startsWith("\"<")) {
        continue;
      }

      i = i.trim().substring(1);
      i = i.substring(0, i.length - 1);
      items.add(i);
    }

    return items.toList();
  }

  Map<String, int> calculateUsages() {
    Map<String, int> usages = {};

    for (Recipe r in recipes) {
      for (Item input in r.getInputs()) {
        String id = oredict[input.id]?.first ?? input.id;
        usages[id] = (usages[id] ?? 0) + 1;
      }
    }

    return usages;
  }
}

extension XString on String {
  String trimUntil(String token) {
    if (!contains(token)) {
      return this;
    }
    return substring(0, indexOf(token)).trim();
  }

  String trimUntilLast(String token) {
    if (!contains(token)) {
      return this;
    }
    return substring(0, lastIndexOf(token)).trim();
  }

  String removeUntil(String token) {
    if (!contains(token)) {
      return this;
    }
    return substring(indexOf(token) + token.length).trim();
  }

  String removeUntilLast(String token) {
    if (!contains(token)) {
      return this;
    }
    return substring(0, lastIndexOf(token)).trim();
  }
}
