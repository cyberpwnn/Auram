import mods.extendedcrafting.CombinationCrafting;

// Remove Pure Daisy recipes for Livingwood and Livingrock
<recipetype:botania:pure_daisy>.removeByName("botania:pure_daisy/livingwood");
<recipetype:botania:pure_daisy>.removeByName("botania:pure_daisy/livingrock");
<recipetype:botania:mana_infusion>.removeByName("botania:mana_infusion/manasteel");

// Glimmering Livingwood
craftingTable.remove(<item:botania:glimmering_livingwood_log>);
craftingTable.removeByName("botania:glimmering_livingwood");
craftingTable.remove(<item:botania:glimmering_livingwood_log>);
craftingTable.remove(<item:botania:glimmering_livingwood>);
craftingTable.addShapeless("bglimmering_livingwood_log", <item:botania:glimmering_livingwood_log>, [<item:botania:livingwood_log>, <item:aether_redux:veridium_ingot>]);
craftingTable.addShapeless("bglimmering_livingwood", <item:botania:glimmering_livingwood>, [<item:botania:livingwood>, <item:aether_redux:veridium_ingot>]);

// Glimmering Dreamwood
craftingTable.remove(<item:botania:glimmering_dreamwood_log>);
CombinationCrafting.addRecipe("9cdd3a06-8346-453b-bb2d-0c71d90143b3", <item:botania:glimmering_dreamwood_log>, 100000, [<item:botania:dreamwood_log>, <item:botania:pixie_dust>, <item:projectred_core:electrotine_dust>, <item:thermal:signalum_dust>]);
craftingTable.removeByName("botania:glimmering_dreamwood");
CombinationCrafting.addRecipe("8cdd3a06-8346-453b-bb2d-0c71d90143b3", <item:botania:glimmering_dreamwood>, 100000, [<item:botania:dreamwood_log>, <item:botania:pixie_dust>, <item:projectred_core:electrotine_dust>, <item:thermal:signalum_dust>]);
craftingTable.removeByName("botania:glimmering_stripped_dreamwood");
CombinationCrafting.addRecipe("7cdd3a06-8346-453b-bb2d-0c71d90143b3", <item:botania:glimmering_stripped_dreamwood>, 100000, [<item:botania:dreamwood_log>, <item:botania:pixie_dust>, <item:projectred_core:electrotine_dust>, <item:thermal:signalum_dust>]);
craftingTable.remove(<item:botania:glimmering_stripped_dreamwood_log>);
CombinationCrafting.addRecipe("6cdd3a06-8346-453b-bb2d-0c71d90143b3", <item:botania:glimmering_stripped_dreamwood_log>, 100000, [<item:botania:dreamwood_log>, <item:botania:pixie_dust>, <item:projectred_core:electrotine_dust>, <item:thermal:signalum_dust>]);

// Mana Pool
craftingTable.remove(<item:botania:mana_pool>);
mods.extendedcrafting.TableCrafting.addShaped("8363266f-b777-4e85-9e91-3092f92f0720", 0, <item:botania:mana_pool>, [
	[<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], 
	[<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], 
	[<item:botania:livingrock>, <item:aether:ambrosium_shard>, <item:botania:diluted_pool>, <item:aether:ambrosium_shard>, <item:botania:livingrock>], 
	[<item:botania:livingrock>, <item:aether:cold_aercloud>, <item:aether:cold_aercloud>, <item:aether:cold_aercloud>, <item:botania:livingrock>], 
	[<item:botania:livingrock>, <item:botania:livingrock>, <item:botania:livingrock>, <item:botania:livingrock>, <item:botania:livingrock>]
]);

// Elven Spreader
craftingTable.remove(<item:botania:elven_spreader>);
mods.extendedcrafting.TableCrafting.addShaped("8156e880-2d2d-4c0b-ad01-2b27a982a925", 0, <item:botania:elven_spreader>, [
	[<item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>], 
	[<item:botania:glimmering_dreamwood>, <item:tconstruct:large_plate>.withTag({Material: "tconstruct:amethyst_bronze"}), <item:minecraft:air>, <item:botania:dreamwood_twig>, <item:botania:glimmering_dreamwood>], 
	[<item:botania:mana_spreader>, <item:botania:terrasteel_ingot>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], 
	[<item:botania:glimmering_dreamwood>, <item:tconstruct:large_plate>.withTag({Material: "tconstruct:amethyst_bronze"}), <item:minecraft:air>, <item:botania:dreamwood_twig>, <item:botania:glimmering_dreamwood>], 
	[<item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>]
]);

// Gaia Spreader
craftingTable.remove(<item:botania:gaia_spreader>);
mods.extendedcrafting.TableCrafting.addShaped("e1687393-0e93-4dd1-b97f-ead74ea6e238", 0, <item:botania:gaia_spreader>, [
	[<item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>], 
	[<item:botania:glimmering_dreamwood>, <item:thermal:netherite_plate>, <item:botania:terrasteel_ingot>, <item:botania:terrasteel_ingot>, <item:minecraft:air>, <item:botania:dreamwood_twig>, <item:botania:glimmering_dreamwood>], 
	[<item:botania:glimmering_dreamwood>, <item:extendedcrafting:crystaltine_nugget>, <item:extendedcrafting:crystaltine_nugget>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], 
	[<item:botania:dragonstone>, <item:botania:gaia_ingot>, <item:deeperdarker:reinforced_echo_shard>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], 
	[<item:botania:glimmering_dreamwood>, <item:extendedcrafting:crystaltine_nugget>, <item:extendedcrafting:crystaltine_nugget>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], 
	[<item:botania:glimmering_dreamwood>, <item:thermal:netherite_plate>, <item:botania:terrasteel_ingot>, <item:botania:terrasteel_ingot>, <item:minecraft:air>, <item:botania:dreamwood_twig>, <item:botania:glimmering_dreamwood>], 
	[<item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>, <item:botania:glimmering_dreamwood>]
]);

// Automatable Terra Steel
mods.extendedcrafting.CombinationCrafting.addRecipe("166967e5-1345-442f-9c24-cc8a00b8d950", <item:botania:terrasteel_ingot>, 500000, [
	<item:botania:manasteel_ingot>, <item:botania:mana_diamond>, <item:botania:mana_pearl>
]);

// Black Lotus 
mods.extendedcrafting.CombinationCrafting.addRecipe("3245feb5-0f18-4d2f-b32b-22e13db21789", <item:botania:blacker_lotus>, 100000, [
	<item:botania:black_mystical_flower>, <item:immersiveengineering:ingot_uranium>, <item:immersiveengineering:ingot_uranium>, <item:immersiveengineering:ingot_uranium>, <item:immersiveengineering:ingot_uranium>
]);