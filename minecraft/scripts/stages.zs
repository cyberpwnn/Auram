import mods.itemstages.ItemStages;
import mods.recipestages.Recipes;
import mods.orestages.OreStages;
import mods.jmapstages.JMapStages;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.type.IIngredientList;
import crafttweaker.api.ingredient.IIngredient;

function stageMod(modid as string, desc as string) as void {
    stageModFilter(modid, desc, [] as IIngredient[]);
}

function stageModFilter(modid as string, desc as string, butNot as IIngredient[]) as void {
    var preventPickup = false;
    var preventInventory = false;

    if (butNot.length == 0) {
        ItemStages.createModRestriction(modid, modid)
            .preventPickup(preventPickup)
            .preventInventory(preventInventory)
            .hiddenName(desc);
    } else {
        var excludeIng = new IIngredientList(butNot);
        ItemStages.createModRestriction(
            modid,
            s => excludeIng.matches(s),
            modid
        )
        .preventPickup(preventPickup)
        .preventInventory(preventInventory)
        .hiddenName(desc);
    }

    Recipes.setRecipeStageByMod(modid, modid);
}

// mods.jadestage.JadeStage.setStage("jade");
// JMapStages.setWaypointStage("map");
// JMapStages.setMinimapStage("map");
// JMapStages.setFullscreenStage("map"); 

// // Completed
// stageMod("minecraft", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>An Item");
// stageMod("tconstruct", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Crafting Stuff");
// stageMod("tinkers_hoes", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Tinkers' Hoe?");
// stageMod("tinkers_shovels", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Tinkers' Shovel?");
// stageMod("ironchest", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Container Junk");
// stageMod("colossalchests", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Colossal Block");
// stageMod("toms_storage", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Storage Stuff");
// stageMod("nomadictents", "<grad from=#16a124 to=#5e3e30 hue><wiggle a=2 f=0.1>Tent` Tent");
// stageModFilter("thermal", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Thermal Stuff", [
//     <item:thermal:iron_coin>,
//     <item:thermal:gold_coin>,
//     <item:thermal:copper_coin>,
//     <item:thermal:netherite_coin>,
//     <item:thermal:tin_coin>,
//     <item:thermal:lead_coin>,
//     <item:thermal:invar_coin>,
//     <item:thermal:silver_coin>,
//     <item:thermal:nickel_coin>,
//     <item:thermal:steel_coin>,
//     <item:thermal:rose_gold_coin>,
//     <item:thermal:bronze_coin>,
//     <item:thermal:electrum_coin>,
//     <item:thermal:constantan_coin>,
//     <item:thermal:signalum_coin>,
//     <item:thermal:lumium_coin>,
//     <item:thermal:enderium_coin>
// ] as IIngredient[]);
// stageMod("projectred_exploration", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Red Stuff");
// stageMod("regions_unexplored", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Exploration Junk");
// stageMod("waystones", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Waystone...?");
// stageMod("immersive_weathering", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Immersive Stuff");
// stageMod("rpgbackpacks", "<glitch f=3 j=0.02 b=0.01 s=0.1>Backpack?");
// stageMod("botania", "<grad from=#16a124 to=#5e3e30 hue><wiggle a=2 f=0.1>Living Botanical Thingy");
// stageMod("aether_redux", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Aether Stuff");
// stageMod("deep_aether", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Aether Stuff");
// stageMod("lost_aether_content", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Aether Stuff");
// stageMod("aether", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Aether Stuff");

// // TBC
// stageMod("industrialforegoing", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Industrial Stuff");
// stageMod("draconicevolution", "<grad from=#dd05f5 to=#a821d1 hue><glitch f=3 j=0.02 b=0.01 s=0.1>Balanced Effort");
// stageMod("iceandfire", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Icy Hot Stuff");
// stageMod("twilightforest", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Enchanted Object");
// stageMod("bloodmagic", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Blood Art Thing");
// stageMod("midnight", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Dark Stuff");
// stageMod("butchery", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Meaty Item");
// stageMod("custommachinery", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Machinery?");
// stageMod("dimdoors", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Dimensional Artifact");
// stageMod("deeperdarker", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Deep Stuff");
// stageMod("integrateddynamics", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Integratedd Object");
// stageMod("pneumaticcraft", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Pessure Shit");
// stageMod("ars_nouveau", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Arcane Thingy");
// stageMod("disenchanting_table", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Disenchanting Table?");
// stageMod("elevatorid", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Ender Wool?");
// stageMod("projectred_core", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Red Stuff");
// stageMod("projectred_expansion", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Red Stuff");
// stageMod("projectred_integration", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Red Stuff");
// stageMod("projectred_transmission", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Red Stuff");
// stageMod("projectred_fabrication", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Red Stuff");
// stageMod("projectred_illumination", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Red Stuff");
// stageMod("projectred_transportation", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Red Stuff");
// stageMod("ars_elemental", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Elemental Stuff");
// stageMod("ad_astra", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Space Stuff");
// stageMod("ae2", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Energistic Crap");
// stageMod("appliede", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Energistic Crap");
// stageMod("appmek", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mechanical Stuff");
// stageMod("compactmachines", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Machine?");
// stageMod("mutantmonsters", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Smelly ... Thing...");
// stageMod("mekanism", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mechanical Junk");
// stageMod("mekanism_lasers", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mechanical Lasers?");
// stageMod("extrastorage", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Storage Junk");
// stageMod("evolvedmekanism", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mechanical Junk");
// stageMod("mekanismadditions", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mechanical Junk");
// stageMod("mekanismgenerators", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mechanical Junk");
// stageMod("mekanismtools", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mechanical Junk");
// stageMod("mekmm", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mechanical Junk");
// stageMod("cb_microblock", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Tiny Block");
// stageMod("mowziesmobs", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Smelly Object");
// stageMod("pipez", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Pipe Stuff");
// stageMod("projecte", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Alchemical Stuff");
// stageMod("rftoolsbase", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Flux Junk");
// stageMod("aquaculture", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Fishing Gear?");
// stageMod("appbot", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Automated Flowers?");
// stageMod("arseng", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Engineering Stuff");
// stageMod("computercraft", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Computer Stuff");
// stageMod("igleelib", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Blazing Stuff");
// stageMod("megacells", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Sky Stuff");
// stageMod("bigreactors", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Reactor Junk");
// stageMod("appflux", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Flux Junk");
// stageMod("tarotcards", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Mystical Cards");
// stageMod("tf_dnv", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Twilight Village Junk?");
// stageMod("tinycoalmod", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Tiny Carbon?");
// stageMod("tomeofblood", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Ars Blood?");
// stageMod("wands", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Magic Wand?");
// stageMod("xnet", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>X Stuff");
// stageMod("atmospheric", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Atmospheric Stuff");
// stageMod("immersiveengineering", "<fade a=0.6 f=1.5 w=0.5><turb a=0.25 f=0.5>Immersive Stuff");
