import mods.artisanworktables.builder.RecipeBuilder;
#disable_search_tree
#modloaded divergentunderground aether


//vars
var skyroot = <aether:skyroot_stick>;
var dusty = <atum:dusty_bone_stick>;
var deadwood = <atum:deadwood_stick>;
var palm = <atum:palm_stick>;


//Emerald 
RecipeBuilder.get("jeweler")
  .setShapeless([<divergentunderground:gem_raw_emerald>])
  .addTool(<ore:artisansChisel>, 1)
  .addOutput(<minecraft:emerald>)
  .setExtraOutputOne(<thermalfoundation:material:17>, 0.3)
  .setExtraOutputTwo(<thermalfoundation:material:17>, 0.2)
  .setExtraOutputThree(<thermalfoundation:material:17> * 3, 0.1)
  .create();

// Diamond
RecipeBuilder.get("jeweler")
  .setShapeless([<divergentunderground:gem_raw_diamond>])
  .addTool(<ore:artisansChisel>, 1)
  .addOutput(<minecraft:diamond>)
  .setExtraOutputOne(<thermalfoundation:material:16>, 0.3)
  .setExtraOutputTwo(<thermalfoundation:material:16>, 0.2)
  .setExtraOutputThree(<thermalfoundation:material:16> * 3, 0.1)
  .create();

// STICKS
RecipeBuilder.get("carpenter")
  .setShapeless([skyroot,skyroot,skyroot,skyroot,skyroot,skyroot,skyroot,skyroot,skyroot])
  .addTool(<ore:artisansRazor>, 1)
  .addOutput(<minecraft:stick> * 4)
  .create();
//
RecipeBuilder.get("carpenter")
  .setShapeless([dusty,dusty,dusty,dusty,dusty,dusty,dusty,dusty,dusty])
  .addTool(<ore:artisansRazor>, 1)
  .addOutput(<minecraft:stick> * 4)
  .create();
//
RecipeBuilder.get("carpenter")
  .setShapeless([deadwood,deadwood,deadwood,deadwood,deadwood,deadwood,deadwood,deadwood,deadwood])
  .addTool(<ore:artisansRazor>, 1)
  .addOutput(<minecraft:stick> * 4)
  .create();
//
RecipeBuilder.get("carpenter")
  .setShapeless([palm,palm,palm,palm,palm,palm,palm,palm,palm])
  .addTool(<ore:artisansRazor>, 1)
  .addOutput(<minecraft:stick> * 4)
  .create();
// STICKS
