

<recipetype:botania:pure_daisy>.removeByName("botania:pure_daisy/livingwood");
<recipetype:botania:pure_daisy>.removeByName("botania:pure_daisy/livingrock");

craftingTable.remove(<item:botania:glimmering_livingwood_log>);
craftingTable.removeByName("botania:glimmering_livingwood");
craftingTable.remove(<item:botania:glimmering_livingwood_log>);
craftingTable.remove(<item:botania:glimmering_livingwood>);
craftingTable.addShapeless("bglimmering_livingwood_log", <item:botania:glimmering_livingwood_log>, [<item:botania:livingwood_log>, <item:aether_redux:veridium_ingot>]);
craftingTable.addShapeless("bglimmering_livingwood", <item:botania:glimmering_livingwood>, [<item:botania:livingwood>, <item:aether_redux:veridium_ingot>]);

craftingTable.remove(<item:botania:mana_pool>);
