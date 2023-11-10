import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<minecraft:crafting_table>);
recipes.addShaped("owctable", <artisanworktables:worktable:5>, [
    [<ore:plankWood>, <ore:plankWood>],
    [<ore:plankWood>, <ore:plankWood>]
]);

// Tanner Table
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:leather>, <minecraft:string>, <minecraft:leather>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]])
  .addOutput(<artisanworktables:worktable>)
  .create();

// Carpenter Table
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:log>, <minecraft:stick>, <minecraft:log>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]])
  .addOutput(<artisanworktables:worktable:1>)
  .create();

// Masons Table
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:stone:2>, <minecraft:stone:4>, <minecraft:stone:2>],
    [<minecraft:stonebrick>, <minecraft:planks>, <minecraft:stonebrick>],
    [<minecraft:stonebrick>, <minecraft:planks>, <minecraft:stonebrick>]])
  .addOutput(<artisanworktables:worktable:2>)
  .create();

// Blacksmiths Table
RecipeBuilder.get("mason")
  .setShaped([
    [<astralsorcery:blockblackmarble>, <astralsorcery:blockblackmarble>, <astralsorcery:blockblackmarble>],
    [<astralsorcery:blockblackmarble:1>, <minecraft:stone:4>, <astralsorcery:blockblackmarble:1>],
    [<astralsorcery:blockblackmarble:1>, null, <astralsorcery:blockblackmarble:1>]])
  .addOutput(<artisanworktables:worktable:3>)
  .create();

// Jewelers Table
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:glass_pane>, <minecraft:diamond>, <minecraft:glass_pane>],
    [<minecraft:stonebrick>, <minecraft:stonebrick>, <minecraft:stonebrick>],
    [<minecraft:planks>, null, <minecraft:planks>]])
  .addOutput(<artisanworktables:worktable:4>)
  .create();

// Engineers Table
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<thaumcraft:stone_arcane_brick>, <immersiveengineering:storage>, <thaumcraft:stone_arcane_brick>],
    [<minecraft:stonebrick>, <minecraft:stonebrick>, <minecraft:stonebrick>],
    [<minecraft:stonebrick>, null, <minecraft:stonebrick>]])
  .addOutput(<artisanworktables:worktable:6>)
  .create();

// Mage Table
RecipeBuilder.get("mason")
  .setShaped([
    [<astralsorcery:blockblackmarble:1>, <thaumcraft:stone_arcane_brick>, <astralsorcery:blockblackmarble:1>],
    [<minecraft:stonebrick>, <minecraft:stonebrick>, <minecraft:stonebrick>],
    [<minecraft:stonebrick>, null, <minecraft:stonebrick>]])
  .addOutput(<artisanworktables:worktable:7>)
  .create();

// Scribes Table
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:bookshelf>, <minecraft:bookshelf>, <minecraft:bookshelf>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]])
  .addOutput(<artisanworktables:worktable:8>)
  .create();

// Chemists Table
RecipeBuilder.get("engineer")
  .setShaped([
    [<minecraft:glass_bottle>, <botania:blazeblock>, <minecraft:glass_bottle>],
    [<minecraft:obsidian>, <minecraft:stone:4>, <minecraft:obsidian>],
    [<minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>]])
  .addOutput(<artisanworktables:worktable:9>)
  .create();

// Farmers Table
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:fence>, <minecraft:dirt:1>, <minecraft:fence>],
    [<minecraft:planks>, <minecraft:dirt:1>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]])
  .addOutput(<artisanworktables:worktable:10>)
  .create();

// Chefs Table
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<minecraft:iron_bars>, <minecraft:iron_trapdoor>, <minecraft:iron_bars>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:obsidian>, <minecraft:planks>, <minecraft:obsidian>]])
  .addOutput(<artisanworktables:worktable:11>)
  .create();

// Designers Table
RecipeBuilder.get("scribe")
  .setShaped([
    [<minecraft:paper>, <minecraft:book>, <minecraft:paper>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]])
  .addOutput(<artisanworktables:worktable:12>)
  .create();

// Tanners Table
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:stonebrick>, <minecraft:stonebrick>, <minecraft:stonebrick>]])
  .addOutput(<artisanworktables:worktable:13>)
  .create();

// Potters Table
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:hardened_clay>, <minecraft:hardened_clay>, <minecraft:hardened_clay>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]])
  .addOutput(<artisanworktables:worktable:14>)
  .create();

// Toolbox
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:stick>, <minecraft:planks>, <minecraft:stick>],
    [<buildcraftcore:gear_wood>, <minecraft:chest>, <buildcraftcore:gear_wood>],
    [<minecraft:stick>, <minecraft:planks>, <minecraft:stick>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<artisanworktables:toolbox>)
  .create();

// Engineers Box
RecipeBuilder.get("engineer")
  .setShaped([
    [<minecraft:iron_bars>, <buildcraftcore:gear_gold>, <minecraft:iron_bars>],
    [<buildcraftcore:gear_gold>, <artisanworktables:toolbox>, <buildcraftcore:gear_gold>],
    [<minecraft:iron_bars>, <buildcraftcore:gear_gold>, <minecraft:iron_bars>]])
  .addTool(<ore:artisansDriver>, 8)
  .addOutput(<artisanworktables:mechanical_toolbox>)
  .create();