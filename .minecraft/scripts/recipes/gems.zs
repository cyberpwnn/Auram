import mods.artisanworktables.builder.RecipeBuilder;

// Zircon to diamond 
RecipeBuilder.get("jeweler")
  .setShapeless([<paragongems:block_zircon>])
  .addTool(<ore:artisansGemCutter>, 1)
  .addOutput(<minecraft:diamond> * 4)
  .create();

// Ruby to ruby....
RecipeBuilder.get("jeweler")
  .setShapeless([<paragongems:item_ruby>])
  .addTool(<ore:artisansGemCutter>, 1)
  .addOutput(<projectred-core:resource_item:200>)
  .create();

// Diopside to peridot
RecipeBuilder.get("jeweler")
  .setShapeless([<paragongems:item_diopside>])
  .addTool(<ore:artisansGemCutter>, 1)
  .addOutput(<projectred-core:resource_item:202>)
  .create();

// Sapphire to sapphire
RecipeBuilder.get("jeweler")
  .setShapeless([<paragongems:item_sapphire>])
  .addTool(<ore:artisansGemCutter>, 1)
  .addOutput(<projectred-core:resource_item:201>)
  .create();

// Aquamarine if needed
RecipeBuilder.get("jeweler")
  .setShapeless([<minecraft:sand>, <paragongems:item_turquoise>, <paragongems:item_topaz>])
  .addTool(<ore:artisansGemCutter>, 1)
  .addOutput(<astralsorcery:itemcraftingcomponent> * 3)
  .create();

// Amethyst to amethyst
RecipeBuilder.get("jeweler")
  .setShapeless([<paragongems:item_amethyst>])
  .addTool(<ore:artisansGemCutter>, 1)
  .addOutput(<netherex:amethyst_crystal>)
  .create();

// Emerald recipe with diopside
RecipeBuilder.get("jeweler")
  .setShapeless([<paragongems:item_diopside>, <minecraft:diamond>, <paragongems:item_diopside>])
  .addTool(<ore:artisansGemCutter>, 1)
  .addOutput(<minecraft:emerald>)
  .create();