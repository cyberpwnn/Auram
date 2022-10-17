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
    [<draconicevolution:awakened_core>, <thaumcraft:plate:3>, <extrautils2:angelring:5>, <thaumcraft:plate:3>, <draconicevolution:awakened_core>],
    [<enderio:item_basic_capacitor:2>, <thermalfoundation:material:1026>, <thaumicaugmentation:key:2>, <thermalfoundation:material:1026>, <enderio:item_basic_capacitor:2>],
    [<draconicevolution:awakened_core>, <thaumcraft:plate:3>, <minecraft:elytra>, <thaumcraft:plate:3>, <draconicevolution:awakened_core>],
    [<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.aevitas"}}), <botania:manaresource:5>, <thaumcraft:cloud_ring>.withTag({Quality: {Slots: ["baubles_trinket", "offhand"], Color: "aqua", AttributeModifiers: [{UUIDMost: -2442772526601187869 as long, UUIDLeast: -4787208134363672741 as long, Amount: 0.029999999329447746, AttributeName: "potioncore.digSpeed", Operation: 2, Name: "qualitytools"}, {UUIDMost: 3992236453414388174 as long, UUIDLeast: -6268058003009287304 as long, Amount: 0.029999999329447746, AttributeName: "generic.attackSpeed", Operation: 2, Name: "qualitytools"}], Name: "quality.graceful.name"}}), <botania:manaresource:5>, <astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.vicio"}})]])
  .addTool(<ore:artisansFile>, 76)
  .addTool(<ore:artisansGrimoire>, 42)
  .addTool(<ore:artisansQuill>, 69)
  .addOutput(<contenttweaker:flight_key>)
  .create();

// Iron
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:iron_chunk>, <contenttweaker:iron_chunk>, <contenttweaker:iron_chunk>],
    [<contenttweaker:iron_chunk>, <contenttweaker:iron_chunk>, <contenttweaker:iron_chunk>],
    [<contenttweaker:iron_chunk>, <contenttweaker:iron_chunk>, <contenttweaker:iron_chunk>]])
  .addTool(<ore:artisansHammer>, 1)
  .addOutput(<thermalfoundation:material> * 2)
  .setExtraOutputOne(<contenttweaker:iron_chunk>, 0.08)
  .setExtraOutputTwo(<nuclearcraft:dust:7>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material>, 0.05)
  .create();

// Lead
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:lead_chunk>, <contenttweaker:lead_chunk>, <contenttweaker:lead_chunk>],
    [<contenttweaker:lead_chunk>, <contenttweaker:lead_chunk>, <contenttweaker:lead_chunk>],
    [<contenttweaker:lead_chunk>, <contenttweaker:lead_chunk>, <contenttweaker:lead_chunk>]])
  .addTool(<ore:artisansHammer>, 2)
  .addOutput(<thermalfoundation:material:67> * 2)
  .setExtraOutputOne(<contenttweaker:lead_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:terrax_dust>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material:67>, 0.05)
  .create();

// Ardite
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:ardite_chunk>, <contenttweaker:ardite_chunk>, <contenttweaker:ardite_chunk>],
    [<contenttweaker:ardite_chunk>, <contenttweaker:ardite_chunk>, <contenttweaker:ardite_chunk>],
    [<contenttweaker:ardite_chunk>, <contenttweaker:ardite_chunk>, <contenttweaker:ardite_chunk>]])
  .addTool(<ore:artisansHammer>, 5)
  .addOutput(<enderio:item_material:30> * 3)
  .setExtraOutputOne(<contenttweaker:ardite_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:vatuunium_dust>, 0.03)
  .setExtraOutputThree(<enderio:item_material:30>, 0.05)
  .create();

// Cobalt
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:cobalt_chunk>, <contenttweaker:cobalt_chunk>, <contenttweaker:cobalt_chunk>],
    [<contenttweaker:cobalt_chunk>, <contenttweaker:cobalt_chunk>, <contenttweaker:cobalt_chunk>],
    [<contenttweaker:cobalt_chunk>, <contenttweaker:cobalt_chunk>, <contenttweaker:cobalt_chunk>]])
  .addTool(<ore:artisansHammer>, 5)
  .addOutput(<enderio:item_material:31> * 2)
  .setExtraOutputOne(<contenttweaker:cobalt_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:psychonium_dust>, 0.03)
  .setExtraOutputThree(<enderio:item_material:31>, 0.05)
  .create();

// Aluminum
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:aluminum_chunk>, <contenttweaker:aluminum_chunk>, <contenttweaker:aluminum_chunk>],
    [<contenttweaker:aluminum_chunk>, <contenttweaker:aluminum_chunk>, <contenttweaker:aluminum_chunk>],
    [<contenttweaker:aluminum_chunk>, <contenttweaker:aluminum_chunk>, <contenttweaker:aluminum_chunk>]])
  .addTool(<ore:artisansHammer>, 2)
  .addOutput(<thermalfoundation:material:68> * 2)
  .setExtraOutputOne(<contenttweaker:aluminum_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:pure_dust>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material:68>, 0.05)
  .create();

// Silver
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:silver_chunk>, <contenttweaker:silver_chunk>, <contenttweaker:silver_chunk>],
    [<contenttweaker:silver_chunk>, <contenttweaker:silver_chunk>, <contenttweaker:silver_chunk>],
    [<contenttweaker:silver_chunk>, <contenttweaker:silver_chunk>, <contenttweaker:silver_chunk>]])
  .addTool(<ore:artisansHammer>, 3)
  .addOutput(<thermalfoundation:material:66> * 2)
  .setExtraOutputOne(<contenttweaker:silver_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:cyberium_dust>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material:66>, 0.05)
  .create();

// Tin
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:tin_chunk>, <contenttweaker:tin_chunk>, <contenttweaker:tin_chunk>],
    [<contenttweaker:tin_chunk>, <contenttweaker:tin_chunk>, <contenttweaker:tin_chunk>],
    [<contenttweaker:tin_chunk>, <contenttweaker:tin_chunk>, <contenttweaker:tin_chunk>]])
  .addTool(<ore:artisansHammer>, 1)
  .addOutput(<thermalfoundation:material:65> * 2)
  .setExtraOutputOne(<contenttweaker:tin_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:emberium_dust>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material:65>, 0.05)
  .create();

// Gold
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:gold_chunk>, <contenttweaker:gold_chunk>, <contenttweaker:gold_chunk>],
    [<contenttweaker:gold_chunk>, <contenttweaker:gold_chunk>, <contenttweaker:gold_chunk>],
    [<contenttweaker:gold_chunk>, <contenttweaker:gold_chunk>, <contenttweaker:gold_chunk>]])
  .addTool(<ore:artisansHammer>, 3)
  .addOutput(<thermalfoundation:material:1> * 2)
  .setExtraOutputOne(<contenttweaker:gold_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:vatuunium_dust>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material:1>, 0.05)
  .create();

// Platinum
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:platinum_chunk>, <contenttweaker:platinum_chunk>, <contenttweaker:platinum_chunk>],
    [<contenttweaker:platinum_chunk>, <contenttweaker:platinum_chunk>, <contenttweaker:platinum_chunk>],
    [<contenttweaker:platinum_chunk>, <contenttweaker:platinum_chunk>, <contenttweaker:platinum_chunk>]])
  .addTool(<ore:artisansHammer>, 6)
  .addOutput(<thermalfoundation:material:70> * 2)
  .setExtraOutputOne(<contenttweaker:platinum_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:skylerite_dust>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material:70>, 0.05)
  .create();

// Copper
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:copper_chunk>, <contenttweaker:copper_chunk>, <contenttweaker:copper_chunk>],
    [<contenttweaker:copper_chunk>, <contenttweaker:copper_chunk>, <contenttweaker:copper_chunk>],
    [<contenttweaker:copper_chunk>, <contenttweaker:copper_chunk>, <contenttweaker:copper_chunk>]])
  .addTool(<ore:artisansHammer>, 1)
  .addOutput(<thermalfoundation:material:64> * 2)
  .setExtraOutputOne(<contenttweaker:copper_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:palladium_dust>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material:64>, 0.05)
  .create();

// Nickel
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<contenttweaker:nickel_chunk>, <contenttweaker:nickel_chunk>, <contenttweaker:nickel_chunk>],
    [<contenttweaker:nickel_chunk>, <contenttweaker:nickel_chunk>, <contenttweaker:nickel_chunk>],
    [<contenttweaker:nickel_chunk>, <contenttweaker:nickel_chunk>, <contenttweaker:nickel_chunk>]])
  .addTool(<ore:artisansHammer>, 2)
  .addOutput(<thermalfoundation:material:69> * 2)
  .setExtraOutputOne(<contenttweaker:nickel_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:vibranium_dust>, 0.03)
  .setExtraOutputThree(<thermalfoundation:material:69>, 0.05)
  .create();

// Bronze Blend
RecipeBuilder.get("blacksmith")
  .setShapeless([<contenttweaker:copper_chunk>, <contenttweaker:copper_chunk>, <contenttweaker:tin_chunk>, <contenttweaker:copper_chunk>, <contenttweaker:copper_chunk>])
  .addTool(<ore:artisansHammer>, 3)
  .addTool(<ore:artisansMortar>, 1)
  .addOutput(<thermalfoundation:material:99>)
  .setExtraOutputOne(<contenttweaker:copper_chunk>, 0.08)
  .setExtraOutputTwo(<taiga:dyonite_dust>, 0.04)
  .setExtraOutputThree(<thermalfoundation:material:99>, 0.1)
  .create();

// Diamond Cut
RecipeBuilder.get("jeweler")
  .setShaped([
    [null, <contenttweaker:diamond_cluster>, null],
    [<contenttweaker:diamond_cluster>, <contenttweaker:diamond_cluster>, <contenttweaker:diamond_cluster>],
    [null, <contenttweaker:diamond_cluster>, null]])
  .addTool(<ore:artisansGemCutter>, 8)
  .addOutput(<minecraft:diamond>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.75)
  .setExtraOutputTwo(<contenttweaker:rock> * 2, 0.25)
  .setExtraOutputThree(<contenttweaker:rock> * 3, 0.05)
  .create();

// Quartz Cut
RecipeBuilder.get("jeweler")
  .setShaped([
    [null, <contenttweaker:quartz_cluster>, null],
    [<contenttweaker:quartz_cluster>, <contenttweaker:quartz_cluster>, <contenttweaker:quartz_cluster>],
    [null, <contenttweaker:quartz_cluster>, null]])
  .addTool(<ore:artisansGemCutter>, 2)
  .addOutput(<minecraft:quartz>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.75)
  .setExtraOutputTwo(<contenttweaker:rock> * 2, 0.25)
  .setExtraOutputThree(<contenttweaker:rock> * 3, 0.05)
  .create();

// Charged Certus Quartz Cut
RecipeBuilder.get("jeweler")
  .setShaped([
    [null, <contenttweaker:charged_certus_cluster>, null],
    [<contenttweaker:charged_certus_cluster>, <contenttweaker:charged_certus_cluster>, <contenttweaker:charged_certus_cluster>],
    [null, <contenttweaker:charged_certus_cluster>, null]])
  .addTool(<ore:artisansGemCutter>, 2)
  .addOutput(<appliedenergistics2:material:1>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.75)
  .setExtraOutputTwo(<contenttweaker:rock> * 2, 0.25)
  .setExtraOutputThree(<contenttweaker:rock> * 3, 0.05)
  .create();

// Certus Quartz Cut
RecipeBuilder.get("jeweler")
  .setShaped([
    [null, <contenttweaker:certus_cluster>, null],
    [<contenttweaker:certus_cluster>, <contenttweaker:certus_cluster>, <contenttweaker:certus_cluster>],
    [null, <contenttweaker:certus_cluster>, null]])
  .addTool(<ore:artisansGemCutter>, 2)
  .addOutput(<appliedenergistics2:material>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.75)
  .setExtraOutputTwo(<contenttweaker:rock> * 2, 0.25)
  .setExtraOutputThree(<contenttweaker:rock> * 3, 0.05)
  .create();

// Emerald Cut
RecipeBuilder.get("jeweler")
  .setShaped([
    [null, <contenttweaker:emerald_cluster>, null],
    [<contenttweaker:emerald_cluster>, <contenttweaker:emerald_cluster>, <contenttweaker:emerald_cluster>],
    [null, <contenttweaker:emerald_cluster>, null]])
  .addTool(<ore:artisansGemCutter>, 6)
  .addOutput(<minecraft:emerald>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.75)
  .setExtraOutputTwo(<contenttweaker:rock> * 2, 0.25)
  .setExtraOutputThree(<contenttweaker:rock> * 3, 0.05)
  .create();

// Sapphire Cut
RecipeBuilder.get("jeweler")
  .setShaped([
    [null, <contenttweaker:sapphire_cluster>, null],
    [<contenttweaker:sapphire_cluster>, <contenttweaker:sapphire_cluster>, <contenttweaker:sapphire_cluster>],
    [null, <contenttweaker:sapphire_cluster>, null]])
  .addTool(<ore:artisansGemCutter>, 6)
  .addOutput(<projectred-core:resource_item:201>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.75)
  .setExtraOutputTwo(<contenttweaker:rock> * 2, 0.25)
  .setExtraOutputThree(<contenttweaker:rock> * 3, 0.05)
  .create();

// Ruby Cut
RecipeBuilder.get("jeweler")
  .setShaped([
    [null, <contenttweaker:ruby_cluster>, null],
    [<contenttweaker:ruby_cluster>, <contenttweaker:ruby_cluster>, <contenttweaker:ruby_cluster>],
    [null, <contenttweaker:ruby_cluster>, null]])
  .addTool(<ore:artisansGemCutter>, 6)
  .addOutput(<projectred-core:resource_item:200>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.75)
  .setExtraOutputTwo(<contenttweaker:rock> * 2, 0.25)
  .setExtraOutputThree(<contenttweaker:rock> * 3, 0.05)
  .create();

// Peridot Cut
RecipeBuilder.get("jeweler")
  .setShaped([
    [null, <contenttweaker:peridot_cluster>, null],
    [<contenttweaker:peridot_cluster>, <contenttweaker:peridot_cluster>, <contenttweaker:peridot_cluster>],
    [null, <contenttweaker:peridot_cluster>, null]])
  .addTool(<ore:artisansGemCutter>, 6)
  .addOutput(<projectred-core:resource_item:202>)
  .setExtraOutputOne(<contenttweaker:rock>, 0.75)
  .setExtraOutputTwo(<contenttweaker:rock> * 2, 0.25)
  .setExtraOutputThree(<contenttweaker:rock> * 3, 0.05)
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

RecipeBuilder.get("engineer")
  .setShaped([
    [<contenttweaker:rock>, <contenttweaker:rock>, null],
    [<contenttweaker:rock>, <minecraft:stick>, null],
    [null, null, <minecraft:stick>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<paragongems:chisel_stone>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<minecraft:iron_nugget>, <minecraft:iron_ingot>, null],
    [<minecraft:iron_ingot>, <minecraft:stick>, null],
    [null, null, <minecraft:stick>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<paragongems:chisel_iron>)
  .create();

recipes.addShapeless("chiopal", <paragongems:chisel_opal>, [<paragongems:chisel_iron>, <paragongems:item_opal>]);
recipes.addShapeless("chispinel", <paragongems:chisel_spinel>, [<paragongems:chisel_iron>, <paragongems:item_spinel>]);
recipes.addShapeless("chiruby", <paragongems:chisel_ruby>, [<paragongems:chisel_iron>, <paragongems:item_ruby>]);