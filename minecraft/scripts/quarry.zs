craftingTable.remove(<item:extrautilitiesrebirth:ender_infused_obsidian>);
mods.extendedcrafting.CombinationCrafting.addRecipe("f345129f-c1fe-45f2-9d70-95e0e3ea56cx", <item:extrautilitiesrebirth:ender_infused_obsidian>*2, 100000, [
	<item:minecraft:obsidian>, <item:minecraft:ender_pearl>, <item:minecraft:ender_pearl>, <item:minecraft:ender_pearl>, <item:minecraft:ender_pearl>
]);

craftingTable.remove(<item:extrautilitiesrebirth:ender_quarry>);
mods.extendedcrafting.CombinationCrafting.addRecipe("c555b425-6526-4bbc-bfa9-b6c92cce8a4b", <item:extrautilitiesrebirth:ender_quarry>, 1000000, [
	<item:extrautilitiesrebirth:ender_infused_obsidian>, <item:mekanism:advanced_control_circuit>, <item:crystalcraft_unlimited_java:black_opal_pickaxe>.withTag({Damage: 0 as int}), <item:extrautilitiesrebirth:ender_core>, <item:extrautilitiesrebirth:ender_thermic_pump>
]);

craftingTable.remove(<item:extrautilitiesrebirth:ender_thermic_pump>);
mods.extendedcrafting.CombinationCrafting.addRecipe("b0337066-4471-4be1-b2ac-a7cd048f37bc", <item:extrautilitiesrebirth:ender_thermic_pump>, 1000000, [
	<item:extrautilitiesrebirth:ender_infused_obsidian>, <item:embers:ember_siphon>, <item:mekanism:advanced_mechanical_pipe>, <item:draconicevolution:draconium_core>, <item:botania:lens_normal>
]);

craftingTable.remove(<item:tesseract:tesseract>);
mods.extendedcrafting.CombinationCrafting.addRecipe("40fa61db-8b05-400f-9182-f901be8e9077", <item:tesseract:tesseract>, 1000000, [
	<item:extendedcrafting:frame>, <item:minecraft:glowstone_dust>, <item:midnight:moonshroom_powder>, <item:botania:mana_powder>, <item:evolvedmekanism:quantum_mechanical_pipe>, <item:evolvedmekanism:quantum_logistical_transporter>, <item:embers:ember_grit>, <item:evolvedmekanism:quantum_universal_cable>, <item:ae2:singularity>
]);