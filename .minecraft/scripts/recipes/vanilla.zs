import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<minecraft:stick>);
recipes.remove(<minecraft:stick> * 4);
recipes.remove(<minecraft:stick> * 16);
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks>]])
  .addTool(<ore:artisansHatchet>, 3)
  .addOutput(<minecraft:stick> * 2)
  .setExtraOutputOne(<minecraft:stick>, 1.0)
  .setExtraOutputTwo(<minecraft:stick> * 2, 1.0)
  .setExtraOutputThree(<minecraft:stick> * 5, 1.0)
  .create();

RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]])
  .addTool(<ore:artisansHammer>, 9)
  .addOutput(<minecraft:cobblestone> * 9)
  .create();

RecipeBuilder.get("mason")
  .setShaped([
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:dirt_clump>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>]])
  .addTool(<ore:artisansTrowel>, 9)
  .addOutput(<minecraft:cobblestone> * 2)
  .create();

RecipeBuilder.get("potter")
  .setShaped([
    [<contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>],
    [<contenttweaker:dirt_clump>, <minecraft:stick>, <contenttweaker:dirt_clump>],
    [<contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>]])
  .addTool(<ore:artisansTSquare>, 9)
  .addOutput(<minecraft:dirt> * 2)
  .create();

RecipeBuilder.get("potter")
  .setShaped([
    [<contenttweaker:sand_pile>, <contenttweaker:sand_pile>, <contenttweaker:sand_pile>],
    [<contenttweaker:sand_pile>, <contenttweaker:dirt_clump>, <contenttweaker:sand_pile>],
    [<contenttweaker:sand_pile>, <contenttweaker:sand_pile>, <contenttweaker:sand_pile>]])
  .addTool(<ore:artisansTSquare>, 9)
  .addOutput(<minecraft:sand> * 2)
  .create();

// Flight Key
RecipeBuilder.get("mage")
  .setShaped([
    [<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.evorsio"}}), <botania:manaresource:5>, <botania_tweaks:compressed_tiny_potato_4>, <botania:manaresource:5>, <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.discidia"}})],
    [<draconicevolution:awakened_core>, <thaumcraft:plate:3>, <extrautils2:angelring:5>, <thaumcraft:plate:3>, <draconicevolution:awakened_core>],
    [<enderio:item_basic_capacitor:2>, <thermalfoundation:material:1026>, <thaumicaugmentation:key:2>, <thermalfoundation:material:1026>, <enderio:item_basic_capacitor:2>],
    [<draconicevolution:awakened_core>, <thaumcraft:plate:3>, <minecraft:elytra>, <thaumcraft:plate:3>, <draconicevolution:awakened_core>],
    [<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.aevitas"}}), <botania:manaresource:5>, <thaumcraft:cloud_ring>.withTag({Quality: {Slots: ["baubles_trinket", "offhand"], Color: "aqua", AttributeModifiers: [{UUIDMost: -2442772526601187869 as long, UUIDLeast: -4787208134363672741 as long, Amount: 0.029999999329447746, AttributeName: "potioncore.digSpeed", Operation: 2, Name: "qualitytools"}, {UUIDMost: 3992236453414388174 as long, UUIDLeast: -6268058003009287304 as long, Amount: 0.029999999329447746, AttributeName: "generic.attackSpeed", Operation: 2, Name: "qualitytools"}], Name: "quality.graceful.name"}}), <botania:manaresource:5>, <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.vicio"}})]])
  .addTool(<ore:artisansFile>, 76)
  .addTool(<ore:artisansGrimoire>, 42)
  .addTool(<ore:artisansQuill>, 69)
  .addOutput(<contenttweaker:flight_key>)
  .create();