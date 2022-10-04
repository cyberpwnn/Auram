
import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<enderio:item_basic_capacitor>);
RecipeBuilder.get("engineer")
  .setShaped([
    [null, <botania:manaresource:18>, <midnight:viridshroom_powder>],
    [<botania:manaresource:18>, <enderio:item_material:20>, <botania:manaresource:18>],
    [<midnight:viridshroom_powder>, <botania:manaresource:18>, null]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<enderio:item_basic_capacitor> * 3)
  .setExtraOutputOne(<botania:manaresource:18>, 0.25)
  .setExtraOutputTwo(<midnight:viridshroom_powder>, 0.08)
  .create();

recipes.remove(<enderio:item_basic_capacitor:1>);
RecipeBuilder.get("engineer")
  .setShaped([
    [null, <aether_legacy:ambrosium_shard>, null],
    [<enderio:item_basic_capacitor>, <astralsorcery:itemcraftingcomponent:2>, <enderio:item_basic_capacitor>],
    [<enderio:item_basic_capacitor>, <enderio:item_alloy_ball:1>, <enderio:item_basic_capacitor>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<enderio:item_basic_capacitor:1> * 3)
  .setExtraOutputOne(<enderio:item_alloy_nugget:1> * 5, 0.5)
  .setExtraOutputTwo(<astralsorcery:itemcraftingcomponent:2>, 0.15)
  .create();

recipes.remove(<enderio:item_basic_capacitor:2>);
RecipeBuilder.get("engineer")
  .setShapeless([<enderio:item_basic_capacitor:1>, <twilightforest:naga_scale>, <enderio:item_basic_capacitor:1>, <botania:manaresource:19>, <tconstruct:tough_binding>.withTag({Material: "vibrant_alloy"}), <botania:manaresource:19>, <enderio:item_basic_capacitor:1>, <thaumcraft:focus_2>, <enderio:item_basic_capacitor:1>])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<enderio:item_basic_capacitor:2> * 3)
  .setExtraOutputOne(<twilightforest:naga_scale>, 0.25)
  .setExtraOutputTwo(<thaumcraft:focus_2>, 0.15)
  .setExtraOutputThree(<tconstruct:shard>.withTag({Material: "vibrant_alloy"}) * 3, 0.3)
  .create();