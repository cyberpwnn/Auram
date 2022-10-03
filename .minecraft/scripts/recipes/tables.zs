import mods.artisanworktables.builder.RecipeBuilder;
#disable_search_tree

// Mechanical Toolbox
RecipeBuilder.get("engineer")
  .setShaped([
    [<minecraft:redstone>, <conarm:armor_plate>.withTag({Material: "wood"}), <minecraft:redstone>],
    [<conarm:armor_plate>.withTag({Material: "wood"}), <artisanworktables:toolbox>, <conarm:armor_plate>.withTag({Material: "wood"})],
    [<thermalfoundation:material:24>, <conarm:armor_plate>.withTag({Material: "wood"}), <thermalfoundation:material:24>]])
  .addOutput(<artisanworktables:mechanical_toolbox>)
  .create();

// Toolbox
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:fence>, <conarm:armor_plate>.withTag({Material: "wood"}), <minecraft:fence>],
    [<conarm:armor_plate>.withTag({Material: "wood"}), <minecraft:chest>, <conarm:armor_plate>.withTag({Material: "wood"})],
    [<minecraft:fence>, <conarm:armor_plate>.withTag({Material: "wood"}), <minecraft:fence>]])
  .addOutput(<artisanworktables:toolbox>)
  .create();

// Basic Worktable
recipes.addShaped(<artisanworktables:worktable:5>, [[null, <minecraft:paper>, null],[<minecraft:paper>, <minecraft:crafting_table>, <minecraft:paper>], [<minecraft:stick>, <minecraft:stick>, <minecraft:stick>]]);

// Basic Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [null, null, null],
    [<tconstruct:tooltables>, <minecraft:stick>, <tconstruct:tooltables>],
    [<minecraft:stick>, <minecraft:stick>, <minecraft:stick>]])
  .addOutput(<artisanworktables:workstation:5>)
  .create();

// Basic Workshop
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:stick>, <tconstruct:tooltables>, <minecraft:stick>],
    [<tconstruct:tooltables>, <artisanworktables:workstation:5>, <tconstruct:tooltables>],
    [<minecraft:paper>, <tconstruct:tooltables>, <minecraft:paper>]])
  .addOutput(<artisanworktables:workshop:5>)
  .create();

// Tailors Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<immersiveengineering:material:5>, <minecraft:stick>, <immersiveengineering:material:5>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<immersiveengineering:material:5>, <minecraft:stick>, <immersiveengineering:material:5>]])
  .addOutput(<artisanworktables:worktable>)
  .create();

// Carpenters Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:fence>, <minecraft:stick>, <minecraft:fence>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<minecraft:fence>, <minecraft:stick>, <minecraft:fence>]])
  .addOutput(<artisanworktables:worktable:1>)
  .create();

// Carpenters Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<conarm:armor_trim>.withTag({Material: "leather"}), <conarm:armor_plate>.withTag({Material: "wood"}), <conarm:armor_trim>.withTag({Material: "leather"})],
    [<conarm:armor_plate>.withTag({Material: "wood"}), <artisanworktables:worktable:1>, <conarm:armor_plate>.withTag({Material: "wood"})],
    [<conarm:armor_trim>.withTag({Material: "leather"}), <conarm:armor_plate>.withTag({Material: "wood"}), <conarm:armor_trim>.withTag({Material: "leather"})]])
  .addOutput(<artisanworktables:workstation:1>)
  .create();

// Masons Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:gravel>, <minecraft:stick>, <minecraft:gravel>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<minecraft:gravel>, <minecraft:stick>, <minecraft:gravel>]])
  .addOutput(<artisanworktables:worktable:2>)
  .create();

// Masons Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:brick>, <minecraft:netherbrick>, <minecraft:brick>],
    [<minecraft:netherbrick>, <artisanworktables:worktable:2>, <minecraft:netherbrick>],
    [<minecraft:brick>, <minecraft:netherbrick>, <minecraft:brick>]])
  .addOutput(<artisanworktables:workstation:2>)
  .create();

// Blacksmith Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:iron_bars>, <minecraft:stick>, <minecraft:iron_bars>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<minecraft:iron_bars>, <minecraft:iron_block>, <minecraft:iron_bars>]])
  .addOutput(<artisanworktables:worktable:3>)
  .create();

// Blacksmith Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:anvil>, <tconstruct:large_plate>.withTag({Material: "iron"}), <minecraft:anvil>],
    [<tconstruct:large_plate>.withTag({Material: "iron"}), <artisanworktables:worktable:3>, <tconstruct:large_plate>.withTag({Material: "iron"})],
    [<minecraft:anvil>, <tconstruct:large_plate>.withTag({Material: "iron"}), <minecraft:anvil>]])
  .addOutput(<artisanworktables:workstation:3>)
  .create();

// Jewlers Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:gold_ingot>, <minecraft:stick>, <minecraft:gold_ingot>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<minecraft:gold_ingot>, <minecraft:paper>, <minecraft:gold_ingot>]])
  .addOutput(<artisanworktables:worktable:4>)
  .create();

// Jewlers Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<conarm:armor_trim>.withTag({Material: "emerald"}), <conarm:armor_plate>.withTag({Material: "gold"}), <conarm:armor_trim>.withTag({Material: "emerald"})],
    [<conarm:armor_plate>.withTag({Material: "gold"}), <artisanworktables:worktable:4>, <conarm:armor_plate>.withTag({Material: "gold"})],
    [<conarm:armor_trim>.withTag({Material: "emerald"}), <conarm:armor_plate>.withTag({Material: "gold"}), <conarm:armor_trim>.withTag({Material: "emerald"})]])
  .addOutput(<artisanworktables:workstation:4>)
  .create();

// Engineers Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<embers:plate_copper>, <minecraft:stick>, <embers:plate_copper>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<embers:plate_copper>, <minecraft:redstone_block>, <embers:plate_copper>]])
  .addOutput(<artisanworktables:worktable:6>)
  .create();

// Engineers Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<immersiveengineering:wirecoil>, <minecraft:redstone_block>, <immersiveengineering:wirecoil>],
    [<minecraft:redstone_block>, <artisanworktables:worktable:6>, <minecraft:redstone_block>],
    [<immersiveengineering:wirecoil>, <minecraft:redstone_block>, <immersiveengineering:wirecoil>]])
  .addOutput(<artisanworktables:workstation:6>)
  .create();

// Mages Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<thaumcraft:salis_mundus>, <minecraft:stick>, <thaumcraft:salis_mundus>],
    [<minecraft:stick>, <artisanworktables:worktable:5>, <minecraft:stick>],
    [<thaumcraft:salis_mundus>, <thaumcraft:plank_silverwood>, <thaumcraft:salis_mundus>]])
  .addOutput(<artisanworktables:worktable:7>)
  .create();

// Mages Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<thaumcraft:nugget:6>, <botania:manaresource:18>, <thaumcraft:nugget:6>],
    [<botania:manaresource:18>, <artisanworktables:worktable:7>, <botania:manaresource:18>],
    [<thaumcraft:nugget:6>, <botania:manaresource:18>, <thaumcraft:nugget:6>]])
  .addOutput(<artisanworktables:workstation:7>)
  .create();

// Scribes Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:dye>, <minecraft:paper>, <minecraft:dye>],
    [<minecraft:paper>, <artisanworktables:worktable:5>, <minecraft:paper>],
    [<minecraft:dye>, <minecraft:paper>, <minecraft:dye>]])
  .addOutput(<artisanworktables:worktable:8>)
  .create();

// Scribes Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:dye>, <minecraft:paper>, <minecraft:dye>],
    [<minecraft:paper>, <artisanworktables:worktable:8>, <minecraft:paper>],
    [<minecraft:dye>, <minecraft:paper>, <minecraft:dye>]])
  .addOutput(<artisanworktables:workstation:8>)
  .create();

// Chemists Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:glass_bottle>, <minecraft:paper>, <minecraft:glass_bottle>],
    [<minecraft:paper>, <artisanworktables:worktable:5>, <minecraft:paper>],
    [<minecraft:glass_bottle>, <minecraft:blaze_powder>, <minecraft:glass_bottle>]])
  .addOutput(<artisanworktables:worktable:9>)
  .create();

// Chemists Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>],
    [<minecraft:glass_bottle>, <artisanworktables:worktable:9>, <minecraft:glass_bottle>],
    [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]])
  .addOutput(<artisanworktables:workstation:9>)
  .create();

// Farmers Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:fence>, <minecraft:paper>, <minecraft:fence>],
    [<minecraft:paper>, <artisanworktables:worktable:5>, <minecraft:paper>],
    [<minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>]])
  .addOutput(<artisanworktables:worktable:10>)
  .create();

// Farmers Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>],
    [<minecraft:dirt>, <artisanworktables:worktable:10>, <minecraft:dirt>],
    [<minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>]])
  .addOutput(<artisanworktables:workstation:10>)
  .create();

// Chefs Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:brick>, <minecraft:paper>, <minecraft:brick>],
    [<minecraft:paper>, <artisanworktables:worktable:5>, <minecraft:paper>],
    [<minecraft:stone_slab:3>, <minecraft:stone_slab:3>, <minecraft:stone_slab:3>]])
  .addOutput(<artisanworktables:worktable:11>)
  .create();

// Chefs Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:planks>, <artisanworktables:worktable:11>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]])
  .addOutput(<artisanworktables:workstation:11>)
  .create();

// Potters Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:brick>, <minecraft:paper>, <minecraft:brick>],
    [<minecraft:brick>, <artisanworktables:worktable:5>, <minecraft:brick>],
    [<minecraft:flower_pot>, <minecraft:flower_pot>, <minecraft:flower_pot>]])
  .addOutput(<artisanworktables:worktable:14>)
  .create();

// Potters Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:hardened_clay>, <minecraft:hardened_clay>, <minecraft:hardened_clay>],
    [<minecraft:hardened_clay>, <artisanworktables:worktable:14>, <minecraft:hardened_clay>],
    [<minecraft:hardened_clay>, <minecraft:hardened_clay>, <minecraft:hardened_clay>]])
  .addOutput(<artisanworktables:workstation:14>)
  .create();

// Tanners Worktable
RecipeBuilder.get("basic")
  .setShaped([
    [<minecraft:leather>, <minecraft:paper>, <minecraft:leather>],
    [<minecraft:paper>, <artisanworktables:worktable:5>, <minecraft:paper>],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>]])
  .addOutput(<artisanworktables:worktable:13>)
  .create();

// Tanners Workstation
RecipeBuilder.get("basic")
  .setShaped([
    [<conarm:armor_trim>.withTag({Material: "leather"}), <thaumcraft:fabric>, <conarm:armor_trim>.withTag({Material: "leather"})],
    [<thaumcraft:fabric>, <artisanworktables:worktable>, <thaumcraft:fabric>],
    [<conarm:armor_trim>.withTag({Material: "leather"}), <thaumcraft:fabric>, <conarm:armor_trim>.withTag({Material: "leather"})]])
  .addOutput(<artisanworktables:workstation>)
  .create();