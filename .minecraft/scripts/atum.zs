import mods.artisanworktables.builder.RecipeBuilder;
#disable_search_tree

// Desert Jewel
recipes.addShaped(<contenttweaker:desertjewel>, [[null, <minecraft:dye:4>, null],[<minecraft:emerald>, <minecraft:diamond>, <minecraft:emerald>], [null, <minecraft:emerald>, null]]);

// Scarab recraft
recipes.remove(<atum:scarab>);
recipes.addShaped(<atum:scarab>, [[null, <ore:ingotGold>, null],[<ore:ingotGold>, <contenttweaker:desertjewel>, <ore:ingotGold>], [null, <ore:ingotGold>, null]]);
