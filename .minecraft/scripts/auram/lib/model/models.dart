import 'dart:convert';

import 'package:artifact/artifact.dart';
import 'package:crypto/crypto.dart';

String cid(String header, String data) {
  return "\"auram_${header}_${md5.convert(utf8.encode(data)).toString()}\"";
}

@artifact
enum CraftType {
  shaped,
  shapeless,
  furnace,
  botaniaInfusion,
  botaniaDaisy,
  botaniaAltar,
  botaniaApothecary,
  botaniaTrades,
}

enum BotaniaInfusionCatalyst { none, alchemy, conjuration }

enum WorktableType {
  basic,
  carpenter,
  tanner,
  mason,
  blacksmith,
  engineer,
  jeweler,
  scribe,
  chemist,
  tailor,
  mage,
  farmer,
  chef,
  designer,
  potter,
}

class WorktableShapelessRecipe extends Recipe {
  final WorktableType type;
  final List<Item> inputs;
  final Item output;
  Map<String, int> tools;
  MapEntry<String, int>? fluid;

  WorktableShapelessRecipe({
    this.inputs = const [],
    required this.output,
    this.tools = const {},
    this.type = WorktableType.basic,
    this.fluid,
  });

  @override
  Iterable<Item> getInputs() sync* {
    yield* inputs;
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield output;
  }

  @override
  void generateAdd(StringBuffer buf, {Map<String, List<String>>? oredict}) {
    buf.write(
      "mods.artisanworktables.builder.RecipeBuilder.get(\"${type.name}\")",
    );

    for (MapEntry<String, int> tool in tools.entries) {
      buf.write(".addTool(${tool.key}, ${tool.value})");
    }
    if (fluid != null) {
      buf.write(".setFluid(${fluid!.key} * ${fluid!.value})");
    }
    buf.write(".setShapeless([");
    for (int i = 0; i < inputs.length; i++) {
      inputs[i].generate(buf, oreDict: oredict, force1Qty: true);
      if (i < inputs.length - 1) {
        buf.write(",");
      }
    }

    buf.write("])");
    ;
    buf.write(".addOutput(");
    output.generate(buf, oreDict: oredict);
    buf.writeln(").create();");
  }
}

class WorktableShapedRecipe extends Recipe {
  final WorktableType type;
  final List<List<Item?>> pattern;
  final Item output;
  Map<String, int> tools;
  MapEntry<String, int>? fluid;

  WorktableShapedRecipe({
    this.tools = const {},
    this.pattern = const [],
    required this.output,
    this.type = WorktableType.basic,
    this.fluid,
  });

  @override
  Iterable<Item> getInputs() sync* {
    yield* pattern
        .expand((row) => row)
        .whereType<Item>()
        .where((id) => id.id.isNotEmpty)
        .map((id) => Item(id: id.id));
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield output;
  }

  @override
  void generateAdd(StringBuffer buf, {Map<String, List<String>>? oredict}) {
    buf.write(
      "mods.artisanworktables.builder.RecipeBuilder.get(\"${type.name}\")",
    );

    for (MapEntry<String, int> tool in tools.entries) {
      buf.write(".addTool(${tool.key}, ${tool.value})");
    }

    if (fluid != null) {
      buf.write(".setFluid(${fluid!.key} * ${fluid!.value})");
    }

    buf.write(".setShaped(");
    buf.write("[");
    for (int i = 0; i < pattern.length; i++) {
      buf.write("[");
      for (int j = 0; j < pattern[i].length; j++) {
        if (pattern[i][j] == null) {
          buf.write("null");
        } else {
          pattern[i][j]!.generate(buf, oreDict: oredict, force1Qty: true);
        }
        if (j < pattern[i].length - 1) {
          buf.write(",");
        }
      }
      buf.write("]");
      if (i < pattern.length - 1) {
        buf.write(",");
      }
    }
    buf.write("])");
    buf.write(".addOutput(");
    output.generate(buf, oreDict: oredict);
    buf.writeln(").create();");
  }
}

@artifact
class BotaniaApothecaryRecipe extends Recipe {
  final List<Item> inputs;
  final Item output;

  BotaniaApothecaryRecipe({this.inputs = const [], required this.output});

  @override
  Iterable<Item> getInputs() sync* {
    yield* inputs;
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield output;
  }
}

@artifact
class BotaniaAltarRecipe extends Recipe {
  final Item input;
  final List<Item> outputs;
  final int mana;

  BotaniaAltarRecipe({
    required this.input,
    this.outputs = const [],
    this.mana = 1000,
  });

  @override
  Iterable<Item> getInputs() sync* {
    yield input;
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield* outputs;
  }
}

@artifact
class BotaniaDaisyRecipe extends Recipe {
  final Item input;
  final Item output;
  final int ticks;

  BotaniaDaisyRecipe({
    required this.input,
    required this.output,
    this.ticks = 200,
  });

  @override
  Iterable<Item> getInputs() sync* {
    yield Item(id: input.id);
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield Item(id: output.id);
  }
}

@artifact
class BotaniaInfusionRecipe extends Recipe {
  final Item input;
  final Item output;
  final BotaniaInfusionCatalyst catalyst;
  final int mana;

  BotaniaInfusionRecipe({
    required this.input,
    required this.output,
    this.catalyst = BotaniaInfusionCatalyst.none,
    this.mana = 1000,
  });

  @override
  Iterable<Item> getInputs() sync* {
    yield Item(id: input.id);
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield Item(id: output.id);
  }
}

@artifact
class FurnaceRecipe extends Recipe {
  final Item input;
  final Item output;

  FurnaceRecipe({required this.input, required this.output});

  @override
  Iterable<Item> getInputs() sync* {
    yield input;
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield output;
  }
}

@artifact
class ShapedRecipe extends Recipe {
  final List<List<Item?>> pattern;
  final Item output;

  ShapedRecipe({this.pattern = const [], required this.output});

  @override
  void generateAdd(StringBuffer buf, {Map<String, List<String>>? oredict}) {
    buf.write("recipes.addShaped(${cid("sh", output.id)},");
    output.generate(buf);
    buf.write(",[");
    for (int i = 0; i < pattern.length; i++) {
      buf.write("[");
      for (int j = 0; j < pattern[i].length; j++) {
        if (pattern[i][j] == null) {
          buf.write("null");
        } else {
          pattern[i][j]!.generate(buf, oreDict: oredict, force1Qty: true);
        }
        if (j < pattern[i].length - 1) {
          buf.write(",");
        }
      }
      buf.write("]");
      if (i < pattern.length - 1) {
        buf.write(",");
      }
    }
    buf.writeln("]);");
  }

  @override
  void generateRemove(StringBuffer buf, {Map<String, List<String>>? oredict}) {
    buf.write("recipes.remove(");
    output.generate(buf);
    buf.writeln(");");
  }

  @override
  Iterable<Item> getInputs() sync* {
    yield* pattern
        .expand((row) => row)
        .whereType<Item>()
        .where((id) => id.id.isNotEmpty)
        .map((id) => Item(id: id.id));
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield output;
  }
}

@artifact
class ShapelessRecipe extends Recipe {
  final List<Item> inputs;
  final Item output;

  ShapelessRecipe({this.inputs = const [], required this.output});

  @override
  void generateAdd(StringBuffer buf, {Map<String, List<String>>? oredict}) {
    buf.write("recipes.addShapeless(${cid("sl", output.id)},");
    output.generate(buf);
    buf.write(",[");
    for (int i = 0; i < inputs.length; i++) {
      inputs[i].generate(buf, oreDict: oredict, force1Qty: true);
      if (i < inputs.length - 1) {
        buf.write(",");
      }
    }
    buf.writeln("]);");
  }

  @override
  void generateRemove(StringBuffer buf, {Map<String, List<String>>? oredict}) {
    buf.write("recipes.remove(");
    output.generate(buf);
    buf.writeln(");");
  }

  @override
  Iterable<Item> getInputs() sync* {
    yield* inputs;
  }

  @override
  Iterable<Item> getOutputs() sync* {
    yield output;
  }
}

@artifact
class Item {
  final String id;
  final int quantity;

  Item({required this.id, this.quantity = 1});

  Item toOreDict(Map<String, List<String>> oredict) {
    for (MapEntry<String, List<String>> entry in oredict.entries) {
      if (entry.value.contains(id)) {
        return Item(id: entry.key, quantity: quantity);
      }
    }
    return this;
  }

  Item toReal(Map<String, List<String>> oredict) {
    if (oredict.containsKey(id) && oredict[id]!.isNotEmpty) {
      return Item(id: oredict[id]!.first, quantity: quantity);
    }
    return this;
  }

  void generate(
    StringBuffer buf, {
    Map<String, List<String>>? oreDict,
    bool force1Qty = false,
  }) {
    buf.write(id);
    if (quantity > 1 && !force1Qty) {
      buf.write(" * $quantity");
    }
  }

  static Item read(String s) {
    s = s.trim();

    if (s.contains("*")) {
      List<String> parts = s.split("*").map((e) => e.trim()).toList();
      return Item(id: parts[0], quantity: int.tryParse(parts[1]) ?? 1);
    } else {
      return Item(id: s);
    }
  }
}

@artifact
class Recipe {
  Iterable<Item> getInputs() sync* {}

  Iterable<Item> getOutputs() sync* {}

  void generateAdd(StringBuffer buf, {Map<String, List<String>>? oredict}) {}

  void generateRemove(StringBuffer buf, {Map<String, List<String>>? oredict}) {}
}
