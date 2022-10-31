import mods.inworldcrafting.FireCrafting;
import mods.thaumcraft.SalisMundus;

recipes.remove(<thaumcraft:salis_mundus>);
FireCrafting.addRecipe(<thaumcraft:salis_mundus>, <midnight:bloomcrystal>, 60);
mods.jei.JEI.addDescription(<thaumcraft:salis_mundus>,"Toss a Bloom Crystal into fire and wait a couple seconds. Bloom Crystals can be obtained in the Midnight dimension.");

recipes.remove(<thaumcraft:stone_arcane>);
recipes.remove(<thaumcraft:stone_arcane> * 9);
mods.botania.PureDaisy.addRecipe(<midnight:nightstone>,<thaumcraft:stone_arcane>, 150);

recipes.remove(<thaumcraft:stone_ancient_tile>);
recipes.remove(<thaumcraft:stone_ancient_tile> * 9);
mods.botania.PureDaisy.addRecipe(<thaumcraft:stone_arcane>,<thaumcraft:stone_ancient_tile>, 100);

recipes.remove(<thaumcraft:stone_ancient>);
recipes.remove(<thaumcraft:stone_ancient> * 9);
mods.botania.PureDaisy.addRecipe(<thaumcraft:stone_ancient_tile>,<thaumcraft:stone_ancient>, 50);

recipes.remove(<thaumcraft:stone_eldritch_tile>);
recipes.remove(<thaumcraft:stone_eldritch_tile> * 9);
mods.botania.PureDaisy.addRecipe(<thaumcraft:stone_ancient>,<thaumcraft:stone_eldritch_tile>, 50);
mods.botania.PureDaisy.addRecipe(<minecraft:glass>,<tconstruct:clear_glass>, 100);

SalisMundus.addSingleConversion(<ore:blockPeridot>, <minecraft:emerald_block>);
SalisMundus.addSingleConversion(<ore:blockEmerald>, <projectred-exploration:stone:7>);

mods.thaumcraft.Infusion.registerRecipe("auriron", "", <minecraft:iron_ore>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:iron_chunk>,<contenttweaker:iron_chunk>,<contenttweaker:iron_chunk>,<contenttweaker:iron_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurlead", "", <thermalfoundation:ore:3>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:lead_chunk>, <contenttweaker:lead_chunk>,<contenttweaker:lead_chunk>,<contenttweaker:lead_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurardite", "", <netherendingores:ore_other_1:2>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:ardite_chunk>,<contenttweaker:ardite_chunk>,<contenttweaker:ardite_chunk>,<contenttweaker:ardite_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurtin", "", <thermalfoundation:ore:1>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:tin_chunk>,<contenttweaker:tin_chunk>,<contenttweaker:tin_chunk>,<contenttweaker:tin_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurosmium", "", <mekanism:oreblock>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:osmium_chunk>,<contenttweaker:osmium_chunk>,<contenttweaker:osmium_chunk>,<contenttweaker:osmium_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurplatinum", "", <thermalfoundation:ore:6>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:platinum_chunk>,<contenttweaker:platinum_chunk>,<contenttweaker:platinum_chunk>,<contenttweaker:platinum_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurcopper", "", <thermalfoundation:ore>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:copper_chunk>,<contenttweaker:copper_chunk>,<contenttweaker:copper_chunk>,<contenttweaker:copper_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurnickel", "", <thermalfoundation:ore:5>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:nickel_chunk>,<contenttweaker:nickel_chunk>,<contenttweaker:nickel_chunk>,<contenttweaker:nickel_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurcobalt", "", <netherendingores:ore_other_1:4>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:cobalt_chunk>,<contenttweaker:cobalt_chunk>,<contenttweaker:cobalt_chunk>,<contenttweaker:cobalt_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aururanium", "", <immersiveengineering:ore:5>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:uranium_chunk>,<contenttweaker:uranium_chunk>,<contenttweaker:uranium_chunk>,<contenttweaker:uranium_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aursilver", "", <thermalfoundation:ore:2>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:silver_chunk>,<contenttweaker:silver_chunk>,<contenttweaker:silver_chunk>,<contenttweaker:silver_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("aurgold", "", <minecraft:gold_ore>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:gold_chunk>,<contenttweaker:gold_chunk>,<contenttweaker:gold_chunk>,<contenttweaker:gold_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <thermalfoundation:ore:7>, 20, [<aspect:metallum> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:iridium_chunk>,<contenttweaker:iridium_chunk>,<contenttweaker:iridium_chunk>,<contenttweaker:iridium_chunk>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <minecraft:diamond_ore>, 20, [<aspect:vitreus> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:diamond_cluster>,<contenttweaker:diamond_cluster>,<contenttweaker:diamond_cluster>,<contenttweaker:diamond_cluster>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <minecraft:emerald_ore>, 20, [<aspect:vitreus> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:emerald_cluster>,<contenttweaker:emerald_cluster>,<contenttweaker:emerald_cluster>,<contenttweaker:emerald_cluster>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <biomesoplenty:gem_ore:2>, 20, [<aspect:vitreus> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:peridot_cluster>,<contenttweaker:peridot_cluster>,<contenttweaker:peridot_cluster>,<contenttweaker:peridot_cluster>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <appliedenergistics2:quartz_ore>, 20, [<aspect:vitreus> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:certus_cluster>,<contenttweaker:certus_cluster>,<contenttweaker:certus_cluster>,<contenttweaker:certus_cluster>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <appliedenergistics2:charged_quartz_ore>, 20, [<aspect:vitreus> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:charged_certus_cluster>,<contenttweaker:charged_certus_cluster>,<contenttweaker:charged_certus_cluster>,<contenttweaker:charged_certus_cluster>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <biomesoplenty:gem_ore:6>, 20, [<aspect:vitreus> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:sapphire_cluster>,<contenttweaker:sapphire_cluster>,<contenttweaker:sapphire_cluster>,<contenttweaker:sapphire_cluster>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <biomesoplenty:gem_ore:1>, 20, [<aspect:vitreus> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:ruby_cluster>,<contenttweaker:ruby_cluster>,<contenttweaker:ruby_cluster>,<contenttweaker:ruby_cluster>]);
mods.thaumcraft.Infusion.registerRecipe("auriridium", "", <embers:ore_quartz>, 20, [<aspect:vitreus> * 8, <aspect:terra> * 5], <minecraft:cobblestone>, 
    [<contenttweaker:quartz_cluster>,<contenttweaker:quartz_cluster>,<contenttweaker:quartz_cluster>,<contenttweaker:quartz_cluster>]);