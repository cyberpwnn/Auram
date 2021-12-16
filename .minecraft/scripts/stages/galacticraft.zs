#disable_search_tree

// Disable use of items in gc
mods.ItemStages.stageModItems("astronaut", "galacticraftcore");
mods.ItemStages.stageModItems("astronaut", "galacticraftplanets");

// Hide gc ores
mods.orestages.OreStages.addNonDefaultingReplacement("astronaut", <ore:oreSilicon>);
