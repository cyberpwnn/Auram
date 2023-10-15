import mods.artisanworktables.builder.RecipeBuilder;

// Sticks
recipes.remove(<minecraft:stick>);
recipes.remove(<minecraft:stick> * 4);
recipes.remove(<minecraft:stick> * 16);
RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks>]])
  .addTool(<ore:artisansHatchet>, 3)
  .addOutput(<minecraft:stick> * 2)
  .setExtraOutputOne(<minecraft:stick>, 0.15)
  .setExtraOutputTwo(<minecraft:stick> * 2, 0.1)
  .setExtraOutputThree(<minecraft:stick> * 5, 0.05)
  .create();

// Rock
RecipeBuilder.get("mason")
  .setShaped([
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:dirt_clump>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>]])
  .addTool(<ore:artisansTrowel>, 1)
  .addOutput(<minecraft:cobblestone> * 2)
  .create();

// Dirt
RecipeBuilder.get("potter")
  .setShaped([
    [<contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>],
    [<contenttweaker:dirt_clump>, <minecraft:stick>, <contenttweaker:dirt_clump>],
    [<contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>]])
  .addTool(<ore:artisansTSquare>, 1)
  .addOutput(<minecraft:dirt> * 2)
  .create();

// Sand
RecipeBuilder.get("potter")
  .setShaped([
    [<contenttweaker:sand_pile>, <contenttweaker:sand_pile>, <contenttweaker:sand_pile>],
    [<contenttweaker:sand_pile>, <contenttweaker:dirt_clump>, <contenttweaker:sand_pile>],
    [<contenttweaker:sand_pile>, <contenttweaker:sand_pile>, <contenttweaker:sand_pile>]])
  .addTool(<ore:artisansTSquare>, 1)
  .addOutput(<minecraft:sand> * 2)
  .create();

// Flight Key
RecipeBuilder.get("mage")
  .setShaped([
    [<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.evorsio"}}), <botania:manaresource:5>, <botania_tweaks:compressed_tiny_potato_4>, <botania:manaresource:5>, <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.discidia"}})],
    [<ore:gearDiamond>, <thaumcraft:plate:3>, <thaumcraft:cloud_ring>, <thaumcraft:plate:3>, <ore:gearDiamond>],
    [<tconstruct:tough_binding>.withTag({Material: "psychonium"}), <ore:ingotAuram>, <thaumicaugmentation:key:2>, <ore:ingotAuram>, <tconstruct:tough_binding>.withTag({Material: "psychonium"})],
    [<ore:netherStar>, <thaumcraft:plate:3>, <minecraft:elytra>, <thaumcraft:plate:3>, <ore:netherStar>],
    [<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.aevitas"}}), <botania:manaresource:5>, <thaumcraft:cloud_ring>.withTag({Quality: {Slots: ["baubles_trinket", "offhand"], Color: "aqua", AttributeModifiers: [{UUIDMost: -2442772526601187869 as long, UUIDLeast: -4787208134363672741 as long, Amount: 0.029999999329447746, AttributeName: "potioncore.digSpeed", Operation: 2, Name: "qualitytools"}, {UUIDMost: 3992236453414388174 as long, UUIDLeast: -6268058003009287304 as long, Amount: 0.029999999329447746, AttributeName: "generic.attackSpeed", Operation: 2, Name: "qualitytools"}], Name: "quality.graceful.name"}}), <botania:manaresource:5>, <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.vicio"}})]])
  .addTool(<ore:artisansFile>, 76)
  .addTool(<ore:artisansGrimoire>, 42)
  .addTool(<ore:artisansQuill>, 69)
  .addOutput(<contenttweaker:flight_key>)
  .create();

// Coarse Dirt
RecipeBuilder.get("potter")
  .setShaped([
    [<contenttweaker:dirt_clump>, <contenttweaker:rock>, <contenttweaker:dirt_clump>],
    [<contenttweaker:rock>, <contenttweaker:dirt_clump>, <contenttweaker:rock>],
    [<contenttweaker:dirt_clump>, <contenttweaker:rock>, <contenttweaker:dirt_clump>]])
  .addTool(<ore:artisansTSquare>, 1)
  .addOutput(<minecraft:dirt:1>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.15)
  .setExtraOutputTwo(<contenttweaker:dirt_clump>, 0.2)
  .create();

// Gravel
RecipeBuilder.get("potter")
  .setShaped([
    [<contenttweaker:dirt_clump>, <contenttweaker:rock>, <contenttweaker:dirt_clump>],
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>],
    [<contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>, <contenttweaker:dirt_clump>]])
  .addTool(<ore:artisansTSquare>, 1)
  .setExtraOutputOne(<contenttweaker:rock>, 0.15)
  .setExtraOutputTwo(<contenttweaker:dirt_clump>, 0.15)
  .addOutput(<minecraft:gravel>)
  .create();

// Cobble Slab
RecipeBuilder.get("mason")
  .setShapeless([<contenttweaker:dirt_clump>, <contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>])
  .addTool(<ore:artisansTrowel>, 1)
  .addOutput(<minecraft:stone_slab:3>)
  .create();

// Cobble Stairs
RecipeBuilder.get("mason")
  .setShaped([
    [<contenttweaker:rock>, null, null],
    [<contenttweaker:rock>, <contenttweaker:rock>, null],
    [<contenttweaker:dirt_clump>, <contenttweaker:rock>, <contenttweaker:rock>]])
  .addTool(<ore:artisansTrowel>, 1)
  .addOutput(<minecraft:stone_stairs>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.2)
  .create();


// Iron Bucket
recipes.remove(<minecraft:bucket>);
RecipeBuilder.get("blacksmith")
  .setShaped([
    [null, <minecraft:iron_nugget>, null],
    [<minecraft:iron_ingot>, null, <minecraft:iron_ingot>],
    [null, <minecraft:iron_ingot>, null]])
  .addTool(<ore:artisansHammer>, 7)
  .addOutput(<minecraft:bucket>)
  .create();

// Sandstone
RecipeBuilder.get("mason")
  .setShaped([
    [<contenttweaker:sand_pile>, <contenttweaker:rock>, <contenttweaker:sand_pile>],
    [<contenttweaker:rock>, <contenttweaker:sand_pile>, <contenttweaker:rock>],
    [<contenttweaker:sand_pile>, <contenttweaker:rock>, <contenttweaker:sand_pile>]])
  .addTool(<ore:artisansTrowel>, 1)
  .addOutput(<minecraft:sandstone> * 2)
  .setExtraOutputOne(<contenttweaker:sand_pile>, 0.1)
  .setExtraOutputTwo(<contenttweaker:rock>, 0.15)
  .create();

// Diorite
RecipeBuilder.get("mason")
  .setShaped([
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:quartz_cluster>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>]])
  .addTool(<ore:artisansTrowel>, 1)
  .addOutput(<minecraft:stone:3> * 2)
  .create();

// Andesite
RecipeBuilder.get("mason")
  .setShaped([
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:certus_cluster>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>]])
  .addTool(<ore:artisansTrowel>, 1)
  .addOutput(<minecraft:stone:5> * 2)
  .create();

// Granite
RecipeBuilder.get("mason")
  .setShaped([
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <minecraft:flint>, <contenttweaker:rock>],
    [<contenttweaker:rock>, <contenttweaker:rock>, <contenttweaker:rock>]])
  .addTool(<ore:artisansTrowel>, 1)
  .addOutput(<minecraft:stone:1> * 2)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<minecraft:sapling>, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vitium"}]})])
  .addTool(<ore:artisansNeedle>, 24)
  .addOutput(<minecraft:sapling:5> * 4)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<minecraft:sapling>, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "terra"}]})])
  .addTool(<ore:artisansNeedle>, 24)
  .addOutput(<minecraft:sapling:1> * 4)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<minecraft:sapling>, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "herba"}]})])
  .addTool(<ore:artisansNeedle>, 24)
  .addOutput(<minecraft:sapling:3> * 4)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<minecraft:sapling>, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "aer"}]})])
  .addTool(<ore:artisansNeedle>, 24)
  .addOutput(<minecraft:sapling:4> * 4)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<minecraft:sapling>, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "ordo"}]})])
  .addTool(<ore:artisansNeedle>, 24)
  .addOutput(<minecraft:sapling:2> * 4)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<minecraft:sapling>, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "praecantatio"}]})])
  .addTool(<ore:artisansNeedle>, 24)
  .addOutput(<thaumcraft:sapling_silverwood> * 4)
  .create();

RecipeBuilder.get("chemist")
  .setShapeless([<minecraft:sapling>, <thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "victus"}]})])
  .addTool(<ore:artisansNeedle>, 24)
  .addOutput(<thaumcraft:sapling_greatwood> * 4)
  .create();

recipes.remove(<extraalchemy:empty_ring>);
RecipeBuilder.get("jeweler")
  .setShaped([
    [<minecraft:gold_nugget>, <minecraft:glass_bottle>, <minecraft:gold_nugget>],
    [<minecraft:gold_nugget>, null, <minecraft:gold_nugget>],
    [<minecraft:gold_nugget>, <minecraft:gold_nugget>, <minecraft:gold_nugget>]])
  .addTool(<ore:artisansPliers>, 12)
  .addOutput(<extraalchemy:empty_ring>)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>],
    [<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<minecraft:log> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks:1>, <minecraft:planks:1>, <minecraft:planks:1>],
    [<minecraft:planks:1>, <minecraft:planks:1>, <minecraft:planks:1>],
    [<minecraft:planks:1>, <minecraft:planks:1>, <minecraft:planks:1>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<minecraft:log:1> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks:2>, <minecraft:planks:2>, <minecraft:planks:2>],
    [<minecraft:planks:2>, <minecraft:planks:2>, <minecraft:planks:2>],
    [<minecraft:planks:2>, <minecraft:planks:2>, <minecraft:planks:2>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<minecraft:log:2> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks:3>, <minecraft:planks:3>, <minecraft:planks:3>],
    [<minecraft:planks:3>, <minecraft:planks:3>, <minecraft:planks:3>],
    [<minecraft:planks:3>, <minecraft:planks:3>, <minecraft:planks:3>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<minecraft:log:3> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks:4>, <minecraft:planks:4>, <minecraft:planks:4>],
    [<minecraft:planks:4>, <minecraft:planks:4>, <minecraft:planks:4>],
    [<minecraft:planks:4>, <minecraft:planks:4>, <minecraft:planks:4>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<minecraft:log2> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<minecraft:planks:5>, <minecraft:planks:5>, <minecraft:planks:5>],
    [<minecraft:planks:5>, <minecraft:planks:5>, <minecraft:planks:5>],
    [<minecraft:planks:5>, <minecraft:planks:5>, <minecraft:planks:5>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<minecraft:log2:1> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<atum:deadwood_planks>, <atum:deadwood_planks>, <atum:deadwood_planks>],
    [<atum:deadwood_planks>, <atum:deadwood_planks>, <atum:deadwood_planks>],
    [<atum:deadwood_planks>, <atum:deadwood_planks>, <atum:deadwood_planks>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<atum:deadwood_log> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<atum:palm_planks>, <atum:palm_planks>, <atum:palm_planks>],
    [<atum:palm_planks>, <atum:palm_planks>, <atum:palm_planks>],
    [<atum:palm_planks>, <atum:palm_planks>, <atum:palm_planks>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<atum:palm_log> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>],
    [<thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>],
    [<thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<thaumcraft:log_greatwood> * 2)
  .create();

RecipeBuilder.get("carpenter")
  .setShaped([
    [<thaumcraft:plank_silverwood>, <thaumcraft:plank_silverwood>, <thaumcraft:plank_silverwood>],
    [<thaumcraft:plank_silverwood>, <thaumcraft:plank_silverwood>, <thaumcraft:plank_silverwood>],
    [<thaumcraft:plank_silverwood>, <thaumcraft:plank_silverwood>, <thaumcraft:plank_silverwood>]])
  .addTool(<ore:artisansHatchet>, 4)
  .addOutput(<thaumcraft:log_silverwood> * 2)
  .create();