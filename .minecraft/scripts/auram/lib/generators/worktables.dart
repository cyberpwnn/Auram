import 'package:auram/model/models.dart';
import 'package:auram/modifier.dart';
import 'package:toxic/extensions/list.dart';

class WorktablesGenerator extends Generator {
  final List<WorktableType> _specialized = WorktableType.values
      .where((i) => i != WorktableType.basic)
      .toList();

  @override
  Iterable<Change> generateChanges(Modifier modifier) sync* {
    yield* modifier.state.toList().whereType<ShapelessRecipe>().map((r) {
      WorktableType? t = generateType(modifier);
      if (t == null) {
        return null;
      }

      return Change(
        remove: r,
        add:
            WorktableShapelessRecipe(
                inputs: r.inputs,
                output: r.output,
                type: t!,
              )
              ..fluid = getFluid(modifier)
              ..tools = getTools(modifier),
      );
    }).whereType<Change>();

    yield* modifier.state.toList().whereType<ShapedRecipe>().map((r) {
      WorktableType? t = generateType(modifier);
      if (t == null) {
        return null;
      }
      return Change(
        remove: r,
        add:
            WorktableShapedRecipe(
                pattern: r.pattern,
                output: r.output,
                type: t!,
              )
              ..fluid = getFluid(modifier)
              ..tools = getTools(modifier),
      );
    }).whereType<Change>();
  }

  MapEntry<String, int>? getFluid(Modifier m) {
    if (m.config.craftingFluids.isNotEmpty &&
        m.random.nextDouble() * m.config.difficultyMultiplier > 3) {
      String fluid = m
          .config
          .craftingFluids[m.config.craftingFluids.randomIndex(m.random)];
      int amount =
          (m.random.nextInt((m.config.difficultyMultiplier * 11).ceil()) +
              (m.config.difficultyMultiplier * 3).ceil()) *
          6;
      return MapEntry(fluid, amount);
    }

    return null;
  }

  Map<String, int> getTools(Modifier m) {
    if (m.config.craftingTools.isNotEmpty &&
        m.random.nextDouble() * m.config.difficultyMultiplier > 1) {
      return {
        m.config.craftingTools[m.config.craftingTools.randomIndex(m.random)]:
            m.random.nextInt(
              (m.config.difficultyMultiplier * m.config.difficultyMultiplier)
                  .ceil(),
            ) +
            (m.config.difficultyMultiplier * 2).ceil(),
        if (m.random.nextDouble() * m.config.difficultyMultiplier > 5.0)
          m.config.craftingTools[m.config.craftingTools.randomIndex(m.random)]:
              m.random.nextInt(
                (m.config.difficultyMultiplier * m.config.difficultyMultiplier)
                    .ceil(),
              ) +
              (m.config.difficultyMultiplier * 2).ceil(),
        if (m.random.nextDouble() * m.config.difficultyMultiplier > 9.0)
          m.config.craftingTools[m.config.craftingTools.randomIndex(m.random)]:
              m.random.nextInt(
                (m.config.difficultyMultiplier * m.config.difficultyMultiplier)
                    .ceil(),
              ) +
              (m.config.difficultyMultiplier * 2).ceil(),
      };
    }

    return {};
  }

  WorktableType? generateType(Modifier m) {
    if (m.random.nextDouble() * m.config.difficultyMultiplier > 0.5) {
      if (m.random.nextDouble() * m.config.difficultyMultiplier > 1.5) {
        return _specialized[_specialized.randomIndex(m.random)];
      }
      return WorktableType.basic;
    }
    return null;
  }

  @override
  String get name => "worktables";
}
