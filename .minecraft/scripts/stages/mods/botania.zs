#disable_search_tree

// Disable use of items in bot
mods.ItemStages.stageModItems("botanical-mage", "botania");
mods.ItemStages.stageModItems("botanical-mage", "botania_tweaks");
mods.ItemStages.stageModItems("botanical-mage", "botanicadds");
mods.ItemStages.stageModItems("botanical-mage", "extrabotany");

// Hide bot flowers & shrooms
mods.orestages.OreStages.addNonDefaultingReplacement("botanical-mage", <botania:mushroom:*>, <minecraft:red_mushroom>);
mods.orestages.OreStages.addNonDefaultingReplacement("botanical-mage", <botania:flower:*>, <minecraft:tallgrass>);