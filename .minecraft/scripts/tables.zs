import mods.artisanworktables.builder.RecipeBuilder;

// Basic Worktable
recipes.addShaped(<artisanworktables:worktable:5>, [[null, <minecraft:paper>, null],[<minecraft:paper>, <minecraft:crafting_table>, <minecraft:paper>], [<minecraft:stick>, <minecraft:stick>, <minecraft:stick>]]);

// Basic Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>],
    [<tconstruct:tooltables>, <minecraft:stick>, <tconstruct:tooltables>],
    [<minecraft:stick>, <minecraft:stick>, <minecraft:stick>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addOutput(<artisanworktables:workstation:5>)
  .create();

// Basic Workshop
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:stick>, <tconstruct:tooltables>, <minecraft:stick>],
    [<tconstruct:tooltables>, <artisanworktables:workstation:5>, <tconstruct:tooltables>],
    [<minecraft:paper>, <tconstruct:tooltables>, <minecraft:paper>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<artisanworktables:workshop:5>)
  .create();

// Tailors Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<immersiveengineering:material:5>, <minecraft:stick>, <immersiveengineering:material:5>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<immersiveengineering:material:5>, <minecraft:stick>, <immersiveengineering:material:5>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<artisanworktables:worktable>)
  .create();

// Carpenters Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:fence>, <minecraft:stick>, <minecraft:fence>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<minecraft:fence>, <minecraft:stick>, <minecraft:fence>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<artisanworktables:worktable:1>)
  .create();

// Masons Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<atum:limestone_gravel>, <minecraft:stick>, <minecraft:gravel>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<minecraft:gravel>, <minecraft:stick>, <atum:limestone_gravel>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<artisanworktables:worktable:2>)
  .create();

// Blacksmith Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:iron_bars>, <minecraft:stick>, <minecraft:iron_bars>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<minecraft:iron_bars>, <minecraft:iron_block>, <minecraft:iron_bars>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<artisanworktables:worktable:3>)
  .create();

// Jewlers Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:gold_ingot>, <minecraft:stick>, <minecraft:gold_ingot>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<minecraft:gold_ingot>, <minecraft:paper>, <minecraft:gold_ingot>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<artisanworktables:worktable:4>)
  .create();

// Engineers Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<embers:plate_copper>, <minecraft:stick>, <embers:plate_copper>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<embers:plate_copper>, <minecraft:redstone_block>, <embers:plate_copper>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<artisanworktables:worktable:6>)
  .create();

// Mages Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<thaumcraft:salis_mundus>, <minecraft:stick>, <thaumcraft:salis_mundus>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<thaumcraft:salis_mundus>, <thaumcraft:plank_silverwood>, <thaumcraft:salis_mundus>]])
  .addTool(<ore:artisansFramingHammer>, 1)
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<artisanworktables:worktable:7>)
  .create();
