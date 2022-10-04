import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<draconicevolution:draconic_core>);

RecipeBuilder.get("mage")
  .setShaped([
    [<thaumcraft:ingot:1>, <tconstruct:tough_binding>.withTag({Material: "draconium"}), <thaumcraft:ingot:1>],
    [<enderio:item_alloy_nugget:2>, <tconstruct:tough_binding>.withTag({Material: "starmetal"}), <botania:manaresource:18>],
    [<thaumcraft:ingot:1>, <bloodarsenal:blood_diamond:2>, <thaumcraft:ingot:1>]])
  .addTool(<ore:artisansSolderer>, 9)
  .addOutput(<draconicevolution:draconic_core> * 4)
  .create();