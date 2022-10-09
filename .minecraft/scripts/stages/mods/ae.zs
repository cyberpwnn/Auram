#disable_search_tree

// Disable use of items in AE2
mods.ItemStages.stageModItems("network-administrator", "appliedenergistics2");

// Hide certus quartz ores
mods.orestages.OreStages.addNonDefaultingReplacement("network-administrator", <ore:oreCertusQuartz>);
mods.orestages.OreStages.addNonDefaultingReplacement("network-administrator", <ore:oreNetherCertusQuartz>);
mods.orestages.OreStages.addNonDefaultingReplacement("network-administrator", <ore:oreEndCertusQuartz>);
mods.orestages.OreStages.addNonDefaultingReplacement("network-administrator", <ore:oreNetherChargedCertusQuartz>);
mods.orestages.OreStages.addNonDefaultingReplacement("network-administrator", <appliedenergistics2:sky_stone_block>, <minecraft:bedrock>);