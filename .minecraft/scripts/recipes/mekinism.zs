import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<mekanism:controlcircuit:1>);
RecipeBuilder.get("engineer")
  .setShaped([
    [null, <botania:manaresource:17>, null],
    [<mekanism:enrichedalloy>, <mekanism:controlcircuit>, <mekanism:enrichedalloy>],
    [null, <thaumcraft:nugget:6>, null]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit:1>)
  .create();

recipes.remove(<mekanism:controlcircuit:2>);
RecipeBuilder.get("engineer")
  .setShaped([
    [null, <midnight:dewshroom_powder>, null],
    [<mekanism:reinforcedalloy>, <mekanism:controlcircuit:1>, <mekanism:reinforcedalloy>],
    [null, <astralsorcery:itemcraftingcomponent:2>, null]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit:2>)
  .create();

recipes.remove(<mekanism:controlcircuit:3>);
RecipeBuilder.get("engineer")
  .setShaped([
    [null, <tconstruct:binding>.withTag({Material: "terrasteel"}), null],
    [<mekanism:atomicalloy>, <mekanism:controlcircuit:2>, <mekanism:atomicalloy>],
    [null, <thaumcraft:nugget:7>, null]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<mekanism:controlcircuit:3>)
  .create();