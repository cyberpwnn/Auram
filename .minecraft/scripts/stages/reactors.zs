// Disable use of items in nuclearcraft or bigreactors
mods.ItemStages.stageModItems("nuclear-technician", "nuclearcraft");
mods.ItemStages.stageModItems("nuclear-technician", "bigreactors");

// Hide nuclearcraft/uranium ores
mods.orestages.OreStages.addNonDefaultingReplacement("nuclear-technician", <ore:oreThorium>);
mods.orestages.OreStages.addNonDefaultingReplacement("nuclear-technician", <ore:oreUranium>);
mods.orestages.OreStages.addNonDefaultingReplacement("nuclear-technician", <ore:oreBoron>);
mods.orestages.OreStages.addNonDefaultingReplacement("nuclear-technician", <ore:oreLithium>);
mods.orestages.OreStages.addNonDefaultingReplacement("nuclear-technician", <ore:oreMagnesium>);
