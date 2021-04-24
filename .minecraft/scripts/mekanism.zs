import mods.artisanworktables.builder.RecipeBuilder;
#disable_search_tree

#modloaded botania mekanism thaumcraft embers

//REMOVE BASES
recipes.remove(<mekanism:controlcircuit>);
recipes.remove(<mekanism:controlcircuit:1>);
recipes.remove(<mekanism:controlcircuit:2>);
recipes.remove(<mekanism:controlcircuit:3>);



//-------------------------BASIC-------------------------
//Mekanism BASIC plate x4 (BOTANIA)
RecipeBuilder.get("engineer")
  .setShaped([
    [<botania:manaresource>, <minecraft:redstone>, <botania:manaresource>],
    [<minecraft:redstone>, <mekanism:ingot:1>, <minecraft:redstone>],
    [<botania:manaresource>, <minecraft:redstone>, <botania:manaresource>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit> * 4)
  .create();


//Mekanism BASIC plate x4 (THAUM)
  RecipeBuilder.get("engineer")
  .setShaped([
    [<thaumcraft:ingot:2>, <minecraft:redstone>, <thaumcraft:ingot:2>],
    [<minecraft:redstone>, <mekanism:ingot:1>, <minecraft:redstone>],
    [<thaumcraft:ingot:2>, <minecraft:redstone>, <thaumcraft:ingot:2>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit> * 4)
  .create();


//Mekanism BASIC plate x4 (EMBERS)
  RecipeBuilder.get("engineer")
  .setShaped([
    [<embers:shard_ember>, <minecraft:redstone>, <embers:shard_ember>],
    [<minecraft:redstone>, <mekanism:ingot:1>, <minecraft:redstone>],
    [<embers:shard_ember>, <minecraft:redstone>, <embers:shard_ember>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit> * 4)
  .create();


//-----------------------ADVANCED-----------------------
//Mekanism ADVANCED plate x4 (BOTANIA)
  RecipeBuilder.get("engineer")
  .setShaped([
    [<minecraft:redstone>, <botania:manaresource:1>, <minecraft:redstone>],
    [<minecraft:redstone>, <mekanism:controlcircuit>, <minecraft:redstone>],
    [<mekanism:enrichedalloy>, <botania:manaresource:5>, <mekanism:enrichedalloy>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit:1> * 4)
  .create();


//Mekanism ADVANCED plate x4 (THAUM)
RecipeBuilder.get("engineer")
  .setShaped([
    [<mekanism:ingot:1>, <thaumcraft:vis_resonator>, <mekanism:ingot:1>],
    [<minecraft:redstone>, <mekanism:controlcircuit>, <minecraft:redstone>],
    [<mekanism:enrichedalloy>, <thaumcraft:mechanism_complex>, <mekanism:enrichedalloy>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit:1> * 4)
  .create();

//Mekanism ADVANCED plate x4 (EMBERS)
  RecipeBuilder.get("engineer")
  .setShaped([
    [<mekanism:ingot:1>, <embers:winding_gears>, <mekanism:ingot:1>],
    [<minecraft:redstone>, <mekanism:controlcircuit>, <minecraft:redstone>],
    [<mekanism:enrichedalloy>, <embers:ember_cluster>, <mekanism:enrichedalloy>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit:1> * 4)
  .create();

//-----------------------ELITE-----------------------
//Mekanism ELITE plate x4 (BOTANIA)
RecipeBuilder.get("engineer")
  .setShaped([
    [<botania:manaresource>, <mekanism:ingot:1>, <botania:manaresource>],
    [<minecraft:redstone>, <mekanism:controlcircuit:1>, <minecraft:redstone>],
    [<mekanism:reinforcedalloy>, <botania:manaresource:2>, <mekanism:reinforcedalloy>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addTool(<ore:artisansCutters>, 1)
  .addOutput(<mekanism:controlcircuit:2> * 4)
  .create();

//Mekanism ELITE plate x4 (THAUM)
RecipeBuilder.get("engineer")
  .setShaped([
    [<thaumcraft:mechanism_simple>, <mekanism:ingot:1>, <thaumcraft:mechanism_simple>],
    [<minecraft:redstone>, <mekanism:controlcircuit:1>, <minecraft:redstone>],
    [<mekanism:reinforcedalloy>, <thaumcraft:mechanism_complex>, <mekanism:reinforcedalloy>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addTool(<ore:artisansCutters>, 1)
  .addOutput(<mekanism:controlcircuit:2> * 4)
  .create();

//Mekanism ELITE plate x4 (EMBERS)
RecipeBuilder.get("engineer")
  .setShaped([
    [<embers:glimmer_shard>.withTag({light: 800}), <mekanism:ingot:1>, <embers:glimmer_shard>.withTag({light: 800})],
    [<minecraft:redstone>, <mekanism:controlcircuit:1>, <minecraft:redstone>],
    [<mekanism:reinforcedalloy>, <embers:wildfire_core>, <mekanism:reinforcedalloy>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addTool(<ore:artisansCutters>, 1)
  .addOutput(<mekanism:controlcircuit:2> * 4)
  .create();
  

//-----------------------ELITE-----------------------
//Mekanism ULTIMATE plate x4 (BOTANIA)
  RecipeBuilder.get("engineer")
  .setShaped([
    [<botania:manaresource:4>, <minecraft:redstone>, <botania:manaresource:4>],
    [<minecraft:redstone>, <mekanism:controlcircuit:2>, <minecraft:redstone>],
    [<mekanism:atomicalloy>, <botania:manaresource:5>, <mekanism:atomicalloy>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addTool(<ore:artisansCutters>, 1)
  .addOutput(<mekanism:controlcircuit:3> * 4)
  .create();

//Mekanism ULTIMATE plate x4 (THAUM)
RecipeBuilder.get("engineer")
  .setShaped([
    [<thaumcraft:ingot:1>, <thaumcraft:salis_mundus>, <thaumcraft:ingot:1>],
    [<minecraft:redstone>, <mekanism:controlcircuit:2>, <minecraft:redstone>],
    [<mekanism:atomicalloy>, <thaumcraft:mechanism_complex>, <mekanism:atomicalloy>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addTool(<ore:artisansCutters>, 1)
  .addOutput(<mekanism:controlcircuit:3> * 4)
  .create();

//Mekanism ULTIMATE plate x4 (EMBERS)
  RecipeBuilder.get("engineer")
  .setShaped([
    [<embers:shifting_scales>, <embers:wildfire_core>, <embers:shifting_scales>],
    [<minecraft:redstone>, <mekanism:controlcircuit:2>, <minecraft:redstone>],
    [<mekanism:atomicalloy>, <embers:wildfire_core>, <mekanism:atomicalloy>]])
  .addTool(<artisanworktables:artisans_solderer_wood>, 1)
  .addTool(<artisanworktables:artisans_cutters_wood>, 1)
  .addOutput(<mekanism:controlcircuit:3> * 4)
  .create();