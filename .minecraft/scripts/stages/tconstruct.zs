// Stage use of items in tc
mods.ItemStages.stageModItems("tinkerer", "tconstruct");
mods.ItemStages.stageModItems("tinkerer", "tcomplement");

// Stage use of Ore Excavator modifiers 
mods.ItemStages.stageModItems("excavator", "oeintegration");

// Stage use of items in conarm
mods.ItemStages.stageModItems("alloy-tailor", "conarm");

// Allow crafting basic tables
mods.ItemStages.removeItemStage(<tconstruct:tooltables:3>);
mods.ItemStages.removeItemStage(<tconstruct:tooltables:2>);
mods.ItemStages.removeItemStage(<tconstruct:tooltables>);
mods.ItemStages.removeItemStage(<tconstruct:tooltables:1>);
mods.ItemStages.removeItemStage(<tconstruct:pattern>);

// Stage smeltery for blacksmith
mods.ItemStages.addItemStage("blacksmith", <tconstruct:smeltery_controller>);
mods.ItemStages.addItemStage("blacksmith", <ore:blockSeared>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:faucet>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:channel>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:smeltery_io>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:casting>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:casting:1>);
mods.ItemStages.addItemStage("blacksmith", <ore:cast>);
mods.ItemStages.addItemStage("blacksmith", <tcomplement:cast_clay>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:seared_tank:2>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:seared_glass>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:seared_tank:1>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:seared_tank>);
mods.ItemStages.addItemStage("blacksmith", <tcomplement:melter>);
mods.ItemStages.addItemStage("blacksmith", <tcomplement:melter:8>);
mods.ItemStages.addItemStage("blacksmith", <tcomplement:alloy_tank>);
mods.ItemStages.addItemStage("blacksmith", <ore:ingotBrickSeared>);
mods.ItemStages.addItemStage("blacksmith", <tconstruct:seared_furnace_controller>);

// Stage for advanced blacksmith
mods.ItemStages.stageModItems("advanced-blacksmith", "tinker_io");

// Stage for blacksmith acceleration
mods.ItemStages.addItemStage("blacksmith-acceleration", <simplesmelteryaccelerator:smeltery_accelerator>);

// Stage high oven for blacksmith
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:materials:1>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:scorched_faucet>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:scorched_channel>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:scorched_casting>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:scorched_casting:1>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:high_oven_io>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:high_oven_io:1>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:high_oven_io:2>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:high_oven_controller>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:scorched_block:3>);
mods.ItemStages.addItemStage("blacksmith-high-oven", <tcomplement:scorched_block>);

