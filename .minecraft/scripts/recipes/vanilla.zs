import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<minecraft:stick>);
recipes.remove(<minecraft:stick> * 4);
recipes.remove(<minecraft:stick> * 16);
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks>]])
  .addTool(<ore:artisansHatchet>, 3)
  .addOutput(<minecraft:stick> * 2)
  .setExtraOutputOne(<minecraft:stick>, 1.0)
  .setExtraOutputTwo(<minecraft:stick> * 2, 1.0)
  .setExtraOutputThree(<minecraft:stick> * 5, 1.0)
  .create();

RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]])
  .addTool(<ore:artisansHammer>, 9)
  .addOutput(<minecraft:cobblestone> * 9)
  .create();

RecipeBuilder.get("mason")
  .setShaped([
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:dirt_clump>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>]])
  .addTool(<ore:artisansTrowel>, 9)
  .addOutput(<minecraft:cobblestone> * 2)
  .create();

RecipeBuilder.get("potter")
  .setShaped([
    [<contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>],
    [<contenttweaker:dirt_clump>, <minecraft:stick>, <contenttweaker:dirt_clump>],
    [<contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>]])
  .addTool(<ore:artisansTSquare>, 9)
  .addOutput(<minecraft:dirt> * 2)
  .create();

RecipeBuilder.get("potter")
  .setShaped([
    [<contenttweaker:sand_pile>, <contenttweaker:sand_pile>, <contenttweaker:sand_pile>],
    [<contenttweaker:sand_pile>, <contenttweaker:dirt_clump>, <contenttweaker:sand_pile>],
    [<contenttweaker:sand_pile>, <contenttweaker:sand_pile>, <contenttweaker:sand_pile>]])
  .addTool(<ore:artisansTSquare>, 9)
  .addOutput(<minecraft:sand> * 2)
  .create();