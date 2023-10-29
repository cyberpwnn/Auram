import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<minecraft:stick>);
RecipeBuilder.get("carpenter")
  .setShapeless([<minecraft:planks>, <minecraft:planks>])
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<minecraft:stick> * 4)
  .setExtraOutputOne(<minecraft:stick>, 0.15)
  .create();

recipes.remove(<scalinghealth:heartcontainer>);
RecipeBuilder.get("chemist")
  .setShaped([
    [<botania:manaresource:23>, <scalinghealth:crystalshard>, <botania:manaresource:23>],
    [<scalinghealth:crystalshard>, <thaumcraft:salis_mundus>, <scalinghealth:crystalshard>],
    [<botania:manaresource:23>, <scalinghealth:crystalshard>, <botania:manaresource:23>]])
  .addTool(<ore:artisansMortar>, 8)
  .addTool(<ore:artisansBurner>, 4)
  .addOutput(<scalinghealth:heartcontainer>)
  .create();

recipes.remove(<minecraft:tnt>);
RecipeBuilder.get("chemist")
  .setShapeless([<botania:manaresource:23>, <minecraft:sand>, <minecraft:gunpowder>])
  .addTool(<ore:artisansMortar>, 4)
  .addOutput(<minecraft:tnt>)
  .create();

recipes.remove(<minecraft:furnace>);
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:cobblestone>, <minecraft:stone_slab:3>, <minecraft:cobblestone>],
    [<minecraft:cobblestone>, null, <minecraft:cobblestone>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<minecraft:furnace>)
  .create();

recipes.remove(<futuremc:blast_furnace>);
RecipeBuilder.get("mason")
  .setShaped([
    [<abyssalcraft:darkstone_brick>, <abyssalcraft:darkbrickslab1>, <abyssalcraft:darkstone_brick>],
    [<abyssalcraft:darkstone_brick>, <minecraft:iron_bars>, <abyssalcraft:darkstone_brick>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<futuremc:blast_furnace>)
  .create();

recipes.remove(<futuremc:smoker>);
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stone_slab:3>, <minecraft:stone_slab:3>, <minecraft:stone_slab:3>],
    [<minecraft:fence>, <minecraft:furnace>, <minecraft:fence>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<futuremc:smoker>)
  .create();