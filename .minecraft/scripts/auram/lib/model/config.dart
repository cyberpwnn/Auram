import 'package:artifact/artifact.dart';

@artifact
class Config {
  final String seed;
  final double difficultyMultiplier;
  final List<String> craftingTools;
  final List<String> craftingFluids;

  Config({
    this.seed = "auram",
    this.difficultyMultiplier = 1.0,
    this.craftingFluids = const ["<liquid:water>"],
    this.craftingTools = const [
      "<ore:artisansCutters>",
      "<ore:artisansHammer>",
      "<ore:artisansFramingHammer>",
      "<ore:artisansHandsaw>",
      "<ore:artisansCuttingBoard>",
      "<ore:artisansPan>",
      "<ore:artisansBeaker>",
      "<ore:artisansBurner>",
      "<ore:artisansPencil>",
      "<ore:artisansTSquare>",
      "<ore:artisansDriver>",
      "<ore:artisansSpanner>",
      "<ore:artisansLens>",
      "<ore:artisansSifter>",
      "<ore:artisansGemCutter>",
      "<ore:artisansPliers>",
      "<ore:artisansAthame>",
      "<ore:artisansGrimmoire>",
      "<ore:artisansChisel>",
      "<ore:artisansTrowel>",
      "<ore:artisansCarver>",
      "<ore:artisansRazor>",
      "<ore:artisansCompass>",
      "<ore:artisansQuill>",
      "<ore:artisansNeedle>",
      "<ore:artisansShears>",
      "<ore:artisansPunch>",
      "<ore:artisansGroover>",
      "<ore:artisansMortar>",
      "<ore:artisansKnife>",
      "<ore:artisansHatchet>",
      "<ore:artisansFile>",
      "<ore:artisansSolderer>",
    ],
  });
}
