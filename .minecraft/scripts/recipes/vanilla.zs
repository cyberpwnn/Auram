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
    [<scalinghealth:crystalshard>, <midnight:viridshroom_powder>, <scalinghealth:crystalshard>],
    [<botania:manaresource:23>, <scalinghealth:crystalshard>, <botania:manaresource:23>]])
  .addTool(<ore:artisansMortar>, 8)
  .addTool(<ore:artisansBurner>, 4)
  .addOutput(<scalinghealth:heartcontainer>)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<midnight:nightshroom_powder>, <minecraft:tnt>])
  .addTool(<ore:artisansMortar>, 4)
  .addOutput(<midnight:spore_bomb>)
  .setExtraOutputOne(<midnight:spore_bomb>, 1.0)
  .setExtraOutputTwo(<midnight:spore_bomb>, 0.75)
  .setExtraOutputThree(<midnight:spore_bomb>, 0.5)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<midnight:dewshroom_powder>, <minecraft:tnt>])
  .addTool(<ore:artisansMortar>, 4)
  .addOutput(<midnight:spore_bomb:1>)
  .setExtraOutputOne(<midnight:spore_bomb:1>, 1.0)
  .setExtraOutputTwo(<midnight:spore_bomb:1>, 0.75)
  .setExtraOutputThree(<midnight:spore_bomb:1>, 0.5)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<midnight:viridshroom_powder>, <minecraft:tnt>])
  .addTool(<ore:artisansMortar>, 4)
  .addOutput(<midnight:spore_bomb:2>)
  .setExtraOutputOne(<midnight:spore_bomb:2>, 1.0)
  .setExtraOutputTwo(<midnight:spore_bomb:2>, 0.75)
  .setExtraOutputThree(<midnight:spore_bomb:2>, 0.5)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<midnight:bogshroom_powder>, <minecraft:tnt>])
  .addTool(<ore:artisansMortar>, 4)
  .addOutput(<midnight:spore_bomb:3>)
  .setExtraOutputOne(<midnight:spore_bomb:3>, 1.0)
  .setExtraOutputTwo(<midnight:spore_bomb:3>, 0.75)
  .setExtraOutputThree(<midnight:spore_bomb:3>, 0.5)
  .create();

recipes.remove(<minecraft:tnt>);
RecipeBuilder.get("chemist")
  .setShapeless([<botania:manaresource:23>, <minecraft:sand>, <minecraft:gunpowder>])
  .addTool(<ore:artisansMortar>, 4)
  .addOutput(<minecraft:tnt>)
  .create();