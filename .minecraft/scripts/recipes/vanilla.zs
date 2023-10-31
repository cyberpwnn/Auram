import mods.artisanworktables.builder.RecipeBuilder;

recipes.remove(<minecraft:stick>);
RecipeBuilder.get("carpenter")
  .setShapeless([<minecraft:planks>, <minecraft:planks>])
  .addTool(<ore:artisansHandsaw>, 1)
  .addOutput(<minecraft:stick> * 4)
  .setExtraOutputOne(<minecraft:stick>, 0.15)
  .create();

recipes.remove(<scalinghealth:heartcontainer>);
RecipeBuilder.get("chemist")
  .setShaped([
    [<botania:manaresource:23>, <scalinghealth:crystalshard>, <botania:manaresource:23>],
    [<scalinghealth:crystalshard>, <thaumcraft:salis_mundus>, <scalinghealth:crystalshard>],
    [<botania:manaresource:23>, <scalinghealth:crystalshard>, <botania:manaresource:23>]])
  .addTool(<ore:artisansMortar>, 8)
  .addTool(<ore:artisansBurner>, 4)
  .addOutput(<scalinghealth:heartcontainer>)
  .create();

recipes.remove(<minecraft:tnt>);
RecipeBuilder.get("chemist")
  .setShapeless([<botania:manaresource:23>, <minecraft:sand>, <minecraft:gunpowder>])
  .addTool(<ore:artisansMortar>, 4)
  .addOutput(<minecraft:tnt>)
  .create();

recipes.remove(<minecraft:furnace>);
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:cobblestone>, <minecraft:stone_slab:3>, <minecraft:cobblestone>],
    [<minecraft:cobblestone>, null, <minecraft:cobblestone>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<minecraft:furnace>)
  .create();

recipes.remove(<futuremc:blast_furnace>);
RecipeBuilder.get("mason")
  .setShaped([
    [<abyssalcraft:darkstone_brick>, <abyssalcraft:darkbrickslab1>, <abyssalcraft:darkstone_brick>],
    [<abyssalcraft:darkstone_brick>, <minecraft:iron_bars>, <abyssalcraft:darkstone_brick>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<futuremc:blast_furnace>)
  .create();

recipes.remove(<futuremc:smoker>);
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stone_slab:3>, <minecraft:stone_slab:3>, <minecraft:stone_slab:3>],
    [<minecraft:fence>, <minecraft:furnace>, <minecraft:fence>],
    [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<futuremc:smoker>)
  .create();

recipes.remove(<botania:pool>);
RecipeBuilder.get("mage")
  .setShaped([
    [<botania:livingrock>, null, <botania:livingrock>],
    [<botania:livingrock>, <botania:livingrock>, <botania:livingrock>]])
  .addTool(<ore:artisansChisel>, 4)
  .addOutput(<botania:pool>)
  .create();

recipes.remove(<botania:pool:2>);
RecipeBuilder.get("mage")
  .setShaped([
    [<botania:livingrock0slab>, null, <botania:livingrock0slab>],
    [<botania:livingrock0slab>, <botania:livingrock0slab>, <botania:livingrock0slab>]])
  .addTool(<ore:artisansChisel>, 4)
  .addOutput(<botania:pool:2>)
  .create();

recipes.remove(<botania:pool:3>);
RecipeBuilder.get("mage")
  .setShaped([
    [<botania:shimmerrock>, null, null, null, <botania:shimmerrock>],
    [<botania:shimmerrock>, <botania:livingrock0slab>, <botania:livingrock0slab>, <botania:livingrock0slab>, <botania:shimmerrock>],
    [<botania:shimmerrock>, <botania:shimmerrock>, <botania:shimmerrock>, <botania:shimmerrock>, <botania:shimmerrock>]])
  .setFluid(<liquid:fairy> * 1000)
  .addTool(<ore:artisansChisel>, 16)
  .addTool(<ore:artisansGrimoire>, 16)
  .addTool(<ore:artisansTSquare>, 16)
  .addOutput(<botania:pool:3>)
  .create();


recipes.remove(<botania:pylon>);
mods.thaumcraft.Infusion.registerRecipe("manapylon", "", <botania:pylon>, 20, [<aspect:instrumentum> * 8, <aspect:praecantatio> * 4], <botania:manaresource:2>, [<forbidden_arcanus:arcane_gold_nugget>, <botania:manaresource>, <forbidden_arcanus:arcane_gold_nugget>, <botania:manaresource>]);
recipes.remove(<botania:pylon:1>);
mods.thaumcraft.Infusion.registerRecipe("manapylongreen", "", <botania:pylon:1>, 40, [<aspect:instrumentum> * 16, <aspect:praecantatio> * 16], <botania:pylon>, [<botania:manaresource:4>, <tconstruct:binding>.withTag({Material: "red_aurum"}), <botania:manaresource:4>, <tconstruct:binding>.withTag({Material: "red_aurum"})]);
recipes.remove(<botania:pylon:2>);
mods.thaumcraft.Infusion.registerRecipe("manapylonpink", "", <botania:pylon:2>, 60, [<aspect:instrumentum> * 32, <aspect:praecantatio> * 64], <botania:pylon:1>, [<botania:manaresource:8>, <tconstruct:binding>.withTag({Material: "thaumium"}), <botania:manaresource:8>, <tconstruct:binding>.withTag({Material: "thaumium"})]);

mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:infusion_matrix>);
RecipeBuilder.get("mage")
  .setShaped([
    [<thaumcraft:stone_arcane>, <thaumcraft:salis_mundus>, <thaumcraft:stone_arcane>],
    [<minecraft:glowstone_dust>, <astralsorcery:itemcraftingcomponent:2>, <minecraft:glowstone_dust>],
    [<thaumcraft:stone_arcane>, <thaumcraft:salis_mundus>, <thaumcraft:stone_arcane>]])
  .addTool(<ore:artisansHammer>, 16)
  .addTool(<ore:artisansGrimoire>, 32)
  .addOutput(<thaumcraft:infusion_matrix>)
  .create();

mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:morphic_resonator>);
RecipeBuilder.get("mage")
  .setShaped([
    [<forbidden_arcanus:arcane_gold_nugget>, <minecraft:glass_pane>, <forbidden_arcanus:arcane_gold_nugget>],
    [<minecraft:glass_pane>, <astralsorcery:itemcraftingcomponent:2>, <minecraft:glass_pane>],
    [<forbidden_arcanus:arcane_gold_nugget>, <minecraft:glass_pane>, <forbidden_arcanus:arcane_gold_nugget>]])
  .addTool(<ore:artisansGrimoire>, 32)
  .addTool(<ore:artisansSolderer>, 16)
  .addOutput(<thaumcraft:morphic_resonator>)
  .create();

recipes.remove(<botania:terrapick>);
RecipeBuilder.get("mage")
  .setShaped([
    [<forbidden_arcanus:arcane_gold_ingot>, <tconstruct:large_plate>.withTag({Material: "terrasteel"}), <tconstruct:large_plate>.withTag({Material: "terrasteel"}), <tconstruct:large_plate>.withTag({Material: "terrasteel"}), <forbidden_arcanus:arcane_gold_ingot>],
    [null, <thaumcraft:ingot:1>, <botania:manasteelpick>, <thaumcraft:ingot:1>, null],
    [null, null, <embers:aspectus_dawnstone>, null, null],
    [null, null, <tconstruct:tough_tool_rod>.withTag({Material: "starmetal"}), null, null],
    [null, null, <tconstruct:tough_tool_rod>.withTag({Material: "starmetal"}), null, null]])
  .addOutput(<botania:terrapick>)
  .create();

recipes.remove(<botania:flighttiara>);

RecipeBuilder.get("chemist")
  .setShapeless([<botania:manaresource:2>, <scalinghealth:heartdust>, <botania:overgrowthseed>])
  .addTool(<ore:artisansMortar>, 4)
  .addOutput(<quark:diamond_heart>)
  .create();

recipes.remove(<botania:flighttiara>);

RecipeBuilder.get("jeweler")
  .setShapeless([<minecraft:nether_wart>, <arcanearchives:shaped_quartz>, <minecraft:netherbrick>, <minecraft:glowstone_dust>])
  .addOutput(<minecraft:ghast_tear>)
  .create();

recipes.remove(<minecraft:arrow>);
RecipeBuilder.get("carpenter")
  .setShaped([
    [null, null, <minecraft:flint>],
    [<immersiveengineering:material:4>, <minecraft:stick>, null],
    [null, <immersiveengineering:material:4>, null]])
  .addTool(<ore:artisansRazor>, 2)
  .addOutput(<minecraft:arrow> * 4)
  .setExtraOutputOne(<minecraft:arrow>, 0.25)
  .setExtraOutputOne(<immersiveengineering:material:4>, 0.5)
  .create();