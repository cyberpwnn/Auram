import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<projecte:item.pe_covalence_dust:2>);
recipes.remove(<projecte:item.pe_covalence_dust:2> * 40);
RecipeBuilder.get("mage")
  .setShaped([
    [<thaumcraft:nugget:7>, <projecte:item.pe_matter:1>, <thaumcraft:nugget:7>],
    [<appliedenergistics2:material:43>, <mysticalagriculture:crafting:4>, <appliedenergistics2:material:44>],
    [<thaumcraft:nugget:7>, <botania:manaresource:5>, <thaumcraft:nugget:7>]])
  .addOutput(<projecte:item.pe_covalence_dust:2>)
  .create();