ServerEvents.recipes((event) => {
    console.log("Processing KubeJS Recipes for Botania");
    event.recipes.botania.pure_daisy("botania:livingwood_log", "aether:golden_oak_log", 10);
    event.recipes.botania.pure_daisy("botania:livingwood", "aether:golden_oak_wood", 10);
    event.recipes.botania.pure_daisy("botania:livingrock", "aether:mossy_holystone", 10);
    event.recipes.botania.pure_daisy("botania:livingrock", "aether:mossy_holystone", 10);
    event.recipes.botania.pure_daisy("minecraft:budding_amethyst", "minecraft:amethyst_block", 40);
    event.recipes.botania.pure_daisy("tconstruct:budding_ender_slime_crystal", "tconstruct:ender_slime_crystal_block", 40);
    event.recipes.botania.pure_daisy("tconstruct:budding_earth_slime_crystal", "tconstruct:earth_slime_crystal_block", 40);
    event.recipes.botania.pure_daisy("tconstruct:budding_sky_slime_crystal", "tconstruct:sky_slime_crystal_block", 40);
    event.recipes.botania.pure_daisy("tconstruct:budding_ichor_slime_crystal", "tconstruct:ichor_slime_crystal_block", 40);
    event.recipes.botania.mana_infusion("botania:manasteel_ingot", "thermal:steel_ingot", 10000);
    event.recipes.botania.mana_infusion("appbot:mana_cell_housing", "ae2:fluid_cell_housing", 100000);
    event.recipes.botania.mana_infusion("immersiveengineering:ingot_uranium", "botania:manasteel_ingot", 100000, "twilightforest:fiery_block");
    event.recipes.botania.mana_infusion("mystcraft:booster", "minecraft:book", 100000, "midnight:dark_pearl_block");
});