#priority 43
import mods.botania.RuneAltar;
import mods.botania.ElvenTrade;
import mods.botaniatweaks.AgglomerationMultiblock;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.Agglomeration;
import mods.botania.Apothecary;
import mods.botania.ManaInfusion;
//Recipe 445
recipes.remove(<embers:wall_ashen_stone>, false);
furnace.remove(<embers:wall_ashen_stone>);

furnace.addRecipe(<embers:wall_ashen_stone>, <appliedenergistics2:quartz_glass>);

//Recipe 446
recipes.remove(<thermalfoundation:tool.bow_platinum>, false);
furnace.remove(<thermalfoundation:tool.bow_platinum>);

Apothecary.addRecipe(<thermalfoundation:tool.bow_platinum>, [<bigreactors:blockblutonium>, <tconstruct:arrow_head>, <bountifulbaubles:trinketballoon>, <bibliocraft:bookcasecreative:6>, <harvestcraft:orangejuiceitem>]);

//Recipe 447
recipes.remove(<quark:candle:7>, false);
furnace.remove(<quark:candle:7>);

recipes.addShapeless("youre_an_expert_harry_447", <quark:candle:7>, [<mekanismgenerators:reactor>, <dynamictreesphc:soursopseed>, <bloodmagic:base_item_filter:2>, <thaumicwonders:meteorb>]);

//Recipe 448
recipes.remove(<atum:palm_stairs>, false);
furnace.remove(<atum:palm_stairs>);

recipes.addShaped("youre_an_expert_harry_448", <atum:palm_stairs>, 
 [[<quark:stonebrick_mossy_slab>, <extrautils2:screen>, <quark:stonebrick_mossy_slab>],
  [<enderio:block_impulse_hopper>, <artisanworktables:artisans_burner_boron>, <enderio:block_impulse_hopper>],
  [<enderio:block_painted_sand>, <bloodmagic:demon_pillar_cap_1:1>, <enderio:block_painted_sand>]]);

//Recipe 449
recipes.remove(<atum:burning_trap>, false);
furnace.remove(<atum:burning_trap>);

furnace.addRecipe(<atum:burning_trap>, <harvestcraft:fruitpunchitem>);

//Recipe 450
recipes.remove(<quark:colored_flowerpot_blue>, false);
furnace.remove(<quark:colored_flowerpot_blue>);

furnace.addRecipe(<quark:colored_flowerpot_blue>, <harvestcraft:apricotyogurtitem>);

//Recipe 451
recipes.remove(<twilightforest:borer_essence>, false);
furnace.remove(<twilightforest:borer_essence>);

recipes.addShapeless("youre_an_expert_harry_451", <twilightforest:borer_essence>, [<draconicevolution:energy_crystal:6>, <quark:basalt_wall>, <botania:animatedtorch>, <paragongems:block_bloodstone>]);

//Recipe 452
recipes.remove(<appliedenergistics2:sky_stone_small_brick_stairs>, false);
furnace.remove(<appliedenergistics2:sky_stone_small_brick_stairs>);

ManaInfusion.addInfusion(<appliedenergistics2:sky_stone_small_brick_stairs>, <abyssalcraft:jzaharspawner>, 5700);

//Recipe 453
recipes.remove(<thermalfoundation:tool.shears_silver>, false);
furnace.remove(<thermalfoundation:tool.shears_silver>);

ManaInfusion.addInfusion(<thermalfoundation:tool.shears_silver>, <artisanworktables:artisans_knife_aluminum>, 7618);

//Recipe 454
recipes.remove(<tcomplement:scorched_stairs_stone>, false);
furnace.remove(<tcomplement:scorched_stairs_stone>);

recipes.addShapeless("youre_an_expert_harry_454", <tcomplement:scorched_stairs_stone>, [<artisanworktables:artisans_trowel_silver>, <densemetals:dense_tungsten_ore>, <artisanworktables:artisans_framing_hammer_elementium>, <abyssalcraft:alegs>]);

//Recipe 455
recipes.remove(<thaumicaugmentation:eldritch_lock_impetus>, false);
furnace.remove(<thaumicaugmentation:eldritch_lock_impetus>);

recipes.addShaped("youre_an_expert_harry_455", <thaumicaugmentation:eldritch_lock_impetus>, 
 [[<aether_legacy:moa_egg>, <draconicevolution:energy_infuser>, <aether_legacy:moa_egg>],
  [<draconicevolution:energy_infuser>, <futuremc:lantern>, <draconicevolution:energy_infuser>],
  [<aether_legacy:moa_egg>, <draconicevolution:energy_infuser>, <aether_legacy:moa_egg>]]);

//Recipe 456
recipes.remove(<nuclearcraft:hoe_hard_carbon>, false);
furnace.remove(<nuclearcraft:hoe_hard_carbon>);

recipes.addShaped("youre_an_expert_harry_456", <nuclearcraft:hoe_hard_carbon>, 
 [[<patchouli:guide_book>, <artisanworktables:artisans_carver_hardcarbon>, <patchouli:guide_book>],
  [<artisanworktables:artisans_carver_hardcarbon>, <enderio:block_self_resetting_lever10i>, <artisanworktables:artisans_carver_hardcarbon>],
  [<patchouli:guide_book>, <artisanworktables:artisans_carver_hardcarbon>, <patchouli:guide_book>]]);

//Recipe 457
recipes.remove(<harvestcraft:springrollitem>, false);
furnace.remove(<harvestcraft:springrollitem>);

Apothecary.addRecipe(<harvestcraft:springrollitem>, [<botania:manasteelshovel>, <minecraft:dark_oak_boat>, <artisanworktables:artisans_needle_boronnitride>, <atum:iron_club>, <harvestcraft:babaganoushitem>, <thaumadditions:mithminite_robe>]);

//Recipe 458
recipes.remove(<thaumcraft:jar_void>, false);
furnace.remove(<thaumcraft:jar_void>);

furnace.addRecipe(<thaumcraft:jar_void>, <thaumadditions:mithrillium_resonator>);

//Recipe 459
recipes.remove(<artisanworktables:artisans_knife_toughalloy>, false);
furnace.remove(<artisanworktables:artisans_knife_toughalloy>);

furnace.addRecipe(<artisanworktables:artisans_knife_toughalloy>, <galacticraftcore:panel_lighting:2>);

//Recipe 460
recipes.remove(<embers:heat_coil>, false);
furnace.remove(<embers:heat_coil>);

ManaInfusion.addInfusion(<embers:heat_coil>, <malisisdoors:curtain_yellow>, 3941);

//Recipe 461
recipes.remove(<abyssalcraft:darkethaxiumbrickslab2>, false);
furnace.remove(<abyssalcraft:darkethaxiumbrickslab2>);

recipes.addShaped("youre_an_expert_harry_461", <abyssalcraft:darkethaxiumbrickslab2>, 
 [[<botania:craftpattern>, <aether_legacy:holystone_sword>, <botania:craftpattern>],
  [<thaumadditions:adaminite_sword>, <taiga:yrdeen_nugget>, <thaumadditions:adaminite_sword>],
  [<midnight:viridshroom_ladder>, <thaumcraft:loot_crate_common>, <midnight:viridshroom_ladder>]]);

//Recipe 462
recipes.remove(<abyssalcraft:dreadiumingot>, false);
furnace.remove(<abyssalcraft:dreadiumingot>);

recipes.addShapeless("youre_an_expert_harry_462", <abyssalcraft:dreadiumingot>, [<forbidden_arcanus:slimec_pickaxe>, <midnight:dark_willow_fence>, <thaumcraft:cloth_boots>, <quark:elder_prismarine_bricks_stairs>]);

//Recipe 463
recipes.remove(<abyssalcraft:abyssalnitecobblestonewall>, false);
furnace.remove(<abyssalcraft:abyssalnitecobblestonewall>);

recipes.addShapeless("youre_an_expert_harry_463", <abyssalcraft:abyssalnitecobblestonewall>, [<extrautils2:creativechest>, <appliedenergistics2:nether_quartz_sword>, <quark:stone_marble_stairs>, <harvestcraft:papayajellysandwichitem>]);

//Recipe 464
recipes.remove(<artisanworktables:artisans_gemcutter_copper>, false);
furnace.remove(<artisanworktables:artisans_gemcutter_copper>);

recipes.addShapeless("youre_an_expert_harry_464", <artisanworktables:artisans_gemcutter_copper>, [<embers:pickaxe_nickel>, <quark:stained_clay_tiles_red_stairs>, <betternether:bone_cincinnasite_door>, <atum:desert_wolf_iron_armor>]);

//Recipe 465
recipes.remove(<nuclearcraft:milk_chocolate>, false);
furnace.remove(<nuclearcraft:milk_chocolate>);

ManaInfusion.addInfusion(<nuclearcraft:milk_chocolate>, <midnight:viridshroom_ladder>, 9637);

//Recipe 466
recipes.remove(<artisanworktables:artisans_cutting_board_toughalloy>, false);
furnace.remove(<artisanworktables:artisans_cutting_board_toughalloy>);

recipes.addShaped("youre_an_expert_harry_466", <artisanworktables:artisans_cutting_board_toughalloy>, 
 [[<harvestcraft:orangeduckitem>, <quark:glowshroom_block>, <harvestcraft:orangeduckitem>],
  [<quark:glowshroom_block>, <signpost:blockbigpostacacia>, <quark:glowshroom_block>],
  [<harvestcraft:orangeduckitem>, <quark:glowshroom_block>, <harvestcraft:orangeduckitem>]]);

//Recipe 467
recipes.remove(<bloodmagic:sigil_ender_severance>, false);
furnace.remove(<bloodmagic:sigil_ender_severance>);

furnace.addRecipe(<bloodmagic:sigil_ender_severance>, <artisanworktables:artisans_carver_terrasteel>);

//Recipe 468
recipes.remove(<twilightforest:ore_magnet>, false);
furnace.remove(<twilightforest:ore_magnet>);

furnace.addRecipe(<twilightforest:ore_magnet>, <artisanworktables:artisans_needle_tin>);

//Recipe 469
recipes.remove(<appliedenergistics2:memory_card>, false);
furnace.remove(<appliedenergistics2:memory_card>);

recipes.addShaped("youre_an_expert_harry_469", <appliedenergistics2:memory_card>, 
 [[<thaumcraft:crimson_boots>, <astralsorcery:itemenchantmentamulet>, <thaumcraft:crimson_boots>],
  [<astralsorcery:itemenchantmentamulet>, <openblocks:rope_ladder>, <astralsorcery:itemenchantmentamulet>],
  [<thaumcraft:crimson_boots>, <astralsorcery:itemenchantmentamulet>, <thaumcraft:crimson_boots>]]);

//Recipe 470
recipes.remove(<thaumcraft:elemental_axe>, false);
furnace.remove(<thaumcraft:elemental_axe>);

furnace.addRecipe(<thaumcraft:elemental_axe>, <artifacts:everlasting_cooked_mutton>);

//Recipe 471
recipes.remove(<tconstruct:slime_sapling:2>, false);
furnace.remove(<tconstruct:slime_sapling:2>);

furnace.addRecipe(<tconstruct:slime_sapling:2>, <atum:thin_crystal_light_blue_stained_glass>);

//Recipe 472
recipes.remove(<theaurorian:moontemplecellgate>, false);
furnace.remove(<theaurorian:moontemplecellgate>);

recipes.addShapeless("youre_an_expert_harry_472", <theaurorian:moontemplecellgate>, [<botania:manasteelhelm>, <embers:hoe_nickel>, <bigreactors:mineralanglesite>, <atum:ceramic_slab_white>]);

//Recipe 473
recipes.remove(<harvestcraft:lemonjellysandwichitem>, false);
furnace.remove(<harvestcraft:lemonjellysandwichitem>);

recipes.addShapeless("youre_an_expert_harry_473", <harvestcraft:lemonjellysandwichitem>, [<immersiveengineering:powerpack>, <thaumicaugmentation:arcane_door>, <botania:flugeleye>, <abyssalcraft:gatekeeperessence>]);

//Recipe 474
recipes.remove(<harvestcraft:montecristosandwichitem>, false);
furnace.remove(<harvestcraft:montecristosandwichitem>);

Apothecary.addRecipe(<harvestcraft:montecristosandwichitem>, [<enderio:block_dark_steel_door>, <projectred-exploration:peridot_pickaxe>, <opensecurity:rolldoor_element>, <forbidden_arcanus:arcane_crystal_ore>, <atum:thin_crystal_lime_stained_glass>, <harvestcraft:carrotcupcakeitem>, <quark:stone_jasper_slab>, <tconstruct:shovel>, <quark:soul_sandstone>]);

//Recipe 475
recipes.remove(<harvestcraft:tatertotsitem>, false);
furnace.remove(<harvestcraft:tatertotsitem>);

recipes.addShapeless("youre_an_expert_harry_475", <harvestcraft:tatertotsitem>, [<botania:bifrost>, <abyssalcraft:azathothcoin>, <atum:fertile_soil_pile>, <malisisdoors:curtain_black>]);

//Recipe 476
recipes.remove(<quark:andesite_speleothem>, false);
furnace.remove(<quark:andesite_speleothem>);

furnace.addRecipe(<quark:andesite_speleothem>, <bloodmagic:points_upgrade>);

//Recipe 477
recipes.remove(<embers:pipe>, false);
furnace.remove(<embers:pipe>);

recipes.addShaped("youre_an_expert_harry_477", <embers:pipe>, 
 [[<extrabotany:goblinslayerlegs>, <artisanworktables:artisans_razor_silver>, <extrabotany:goblinslayerlegs>],
  [<artisanworktables:artisans_razor_silver>, <artisanworktables:artisans_hatchet_constantan>, <artisanworktables:artisans_razor_silver>],
  [<extrabotany:goblinslayerlegs>, <artisanworktables:artisans_razor_silver>, <extrabotany:goblinslayerlegs>]]);

//Recipe 478
recipes.remove(<dynamictreesphc:figseed>, false);
furnace.remove(<dynamictreesphc:figseed>);

furnace.addRecipe(<dynamictreesphc:figseed>, <forbidden_arcanus:mysterywood_leaves>);

//Recipe 479
recipes.remove(<mekanism:machineblock2:2>, false);
furnace.remove(<mekanism:machineblock2:2>);

furnace.addRecipe(<mekanism:machineblock2:2>, <midnight:rockshroom_bricks_wall>);

//Recipe 480
recipes.remove(<nuclearcraft:record_money_for_nothing>, false);
furnace.remove(<nuclearcraft:record_money_for_nothing>);

recipes.addShapeless("youre_an_expert_harry_480", <nuclearcraft:record_money_for_nothing>, [<quark:arrow_explosive>, <enderio:block_not_holy_dark_fused_quartz:7>, <galacticraftcore:boss_spawner>, <harvestcraft:pamolive>]);

//Recipe 481
recipes.remove(<ironchest:copper_silver_chest_upgrade>, false);
furnace.remove(<ironchest:copper_silver_chest_upgrade>);

ManaInfusion.addInfusion(<ironchest:copper_silver_chest_upgrade>, <nuclearcraft:ingot_former_idle>, 7968);

//Recipe 482
recipes.remove(<nuclearcraft:bin>, false);
furnace.remove(<nuclearcraft:bin>);

recipes.addShapeless("youre_an_expert_harry_482", <nuclearcraft:bin>, [<artisanworktables:artisans_pliers_flint>, <thaumicaugmentation:arcane_door:2>, <extrabotany:rewardbag943>, <harvestcraft:chickencordonbleuitem>]);

//Recipe 483
recipes.remove(<quark:slate:1>, false);
furnace.remove(<quark:slate:1>);

recipes.addShapeless("youre_an_expert_harry_483", <quark:slate:1>, [<immersiveengineering:treated_wood_slab>, <harvestcraft:ketchupitem>, <nuclearcraft:infuser_idle>, <ore:paneGlassPurple>]);

//Recipe 484
recipes.remove(<taiga:emberium_dust>, false);
furnace.remove(<taiga:emberium_dust>);

furnace.addRecipe(<taiga:emberium_dust>, <harvestcraft:spumoniicecreamitem>);

//Recipe 485
recipes.remove(<forbidden_arcanus:draco_arcanus_leggings>, false);
furnace.remove(<forbidden_arcanus:draco_arcanus_leggings>);

recipes.addShapeless("youre_an_expert_harry_485", <forbidden_arcanus:draco_arcanus_leggings>, [<minecraft:end_crystal>, <harvestcraft:cashewchickenitem>, <harvestcraft:cactusfruitseeditem>, <thaumicwonders:timewinder>]);

//Recipe 486
recipes.remove(<harvestcraft:pamstarfruit>, false);
furnace.remove(<harvestcraft:pamstarfruit>);

furnace.addRecipe(<harvestcraft:pamstarfruit>, <artisanworktables:artisans_compass_boronnitride>);

//Recipe 487
recipes.remove(<minecraft:leather_leggings>, false);
furnace.remove(<minecraft:leather_leggings>);

recipes.addShaped("youre_an_expert_harry_487", <minecraft:leather_leggings>, 
 [[<embers:sword_bronze>, <taiga:dilithium_ingot>, <embers:sword_bronze>],
  [<minecraft:blue_glazed_terracotta>, <artisanworktables:artisans_pencil_boron>, <minecraft:blue_glazed_terracotta>],
  [<botania:biomestonea11slab>, <netherex:lively_netherbrick>, <botania:biomestonea11slab>]]);

//Recipe 488
recipes.remove(<minecraft:emerald_ore>, false);
furnace.remove(<minecraft:emerald_ore>);

Apothecary.addRecipe(<minecraft:emerald_ore>, [<minecraft:shears>, <artisanworktables:artisans_trowel_constantan>, <atum:palm_crate>, <paragongems:chisel_spinel>, <harvestcraft:parsnipitem>, <enderio:item_enchantment_filter_normal>]);

//Recipe 489
recipes.remove(<botania:manasteelshears>, false);
furnace.remove(<botania:manasteelshears>);

recipes.addShapeless("youre_an_expert_harry_489", <botania:manasteelshears>, [<aether_legacy:dungeon_trap:5>, <aether_legacy:aether_portal>, <midnight:ebonys>, <astralsorcery:itemcelestialcrystal>]);

//Recipe 490
recipes.remove(<paragongems:item_turquoise>, false);
furnace.remove(<paragongems:item_turquoise>);

recipes.addShapeless("youre_an_expert_harry_490", <paragongems:item_turquoise>, [<theaurorian:lavenderseeds>, <taiga:karmesine_nugget>, <extrabotany:infinitewine>, <appliedenergistics2:nether_quartz_hoe>]);

//Recipe 491
recipes.remove(<thermalfoundation:armor.legs_constantan>, false);
furnace.remove(<thermalfoundation:armor.legs_constantan>);

Apothecary.addRecipe(<thermalfoundation:armor.legs_constantan>, [<thaumcraft:candle_black>, <dynamictreesphc:grapefruitseed>, <netherex:lively_nether_brick_slab>, <embers:aspectus_iron>, <thermalfoundation:tool.sickle_tin>, <atum:linen_magenta>, <thaumicbases:bloodylegs>, <harvestcraft:cookiesandmilkitem>]);

//Recipe 492
recipes.remove(<atum:alabaster_brick_smooth>, false);
furnace.remove(<atum:alabaster_brick_smooth>);

ManaInfusion.addInfusion(<atum:alabaster_brick_smooth>, <artisanworktables:artisans_compass_lead>, 9810);

//Recipe 493
recipes.remove(<nuclearcraft:radiation_badge>, false);
furnace.remove(<nuclearcraft:radiation_badge>);

recipes.addShapeless("youre_an_expert_harry_493", <nuclearcraft:radiation_badge>, [<immersiveengineering:stone_device:4>, <atum:loot_gold_scepter>, <embers:sword_tin>, <openblocks:pedometer>]);

//Recipe 494
recipes.remove(<immersiveengineering:fluorescent_tube>, false);
furnace.remove(<immersiveengineering:fluorescent_tube>);

Apothecary.addRecipe(<immersiveengineering:fluorescent_tube>, [<compactmachines3:wallbreakable>, <arcanearchives:cleansegleam>, <bloodmagic:sanguine_book>, <enderio:block_wireless_charger_extension>, <theaurorian:silentwoodstairs>]);

//Recipe 495
recipes.remove(<paragongems:item_moonstone>, false);
furnace.remove(<paragongems:item_moonstone>);

recipes.addShapeless("youre_an_expert_harry_495", <paragongems:item_moonstone>, [<harvestcraft:weekendpicnicitem>, <abyssalcraft:dreadstonecobblestonestairs>, <tinker_io:cd_lonesome_avenue>, <nuclearcraft:axe_tough>]);

//Recipe 496
recipes.remove(<botania:gaiahead>, false);
furnace.remove(<botania:gaiahead>);

recipes.addShaped("youre_an_expert_harry_496", <botania:gaiahead>, 
 [[<thaumadditions:shadow_enchanter>, <artisanworktables:artisans_trowel_stone>, <thaumadditions:shadow_enchanter>],
  [<nuclearcraft:block_depleted_uranium>, <artisanworktables:artisans_trowel_boronnitride>, <nuclearcraft:block_depleted_uranium>],
  [<artisanworktables:artisans_framing_hammer_elementium>, <botania_tweaks:compressed_tiny_potato_5>, <artisanworktables:artisans_framing_hammer_elementium>]]);

//Recipe 497
recipes.remove(<opensecurity:rfid_reader>, false);
furnace.remove(<opensecurity:rfid_reader>);

recipes.addShaped("youre_an_expert_harry_497", <opensecurity:rfid_reader>, 
 [[<theaurorian:crystallineshield>, <harvestcraft:ramenitem>, <theaurorian:crystallineshield>],
  [<harvestcraft:ramenitem>, <draconicevolution:draconic_block>, <harvestcraft:ramenitem>],
  [<theaurorian:crystallineshield>, <harvestcraft:ramenitem>, <theaurorian:crystallineshield>]]);

//Recipe 498
recipes.remove(<thaumcraft:grapple_gun>, false);
furnace.remove(<thaumcraft:grapple_gun>);

recipes.addShaped("youre_an_expert_harry_498", <thaumcraft:grapple_gun>, 
 [[<thaumadditions:adaminite_sword>, <compactmachines3:tunneltool>, <thaumadditions:adaminite_sword>],
  [<compactmachines3:tunneltool>, <yurtmod:cos_tepee_wall_rain>, <compactmachines3:tunneltool>],
  [<thaumadditions:adaminite_sword>, <compactmachines3:tunneltool>, <thaumadditions:adaminite_sword>]]);

//Recipe 499
recipes.remove(<artisanworktables:artisans_hammer_platinum>, false);
furnace.remove(<artisanworktables:artisans_hammer_platinum>);

furnace.addRecipe(<artisanworktables:artisans_hammer_platinum>, <harvestcraft:onionhamburgeritem>);

//Recipe 500
recipes.remove(<galacticraftplanets:titanium_hoe>, false);
furnace.remove(<galacticraftplanets:titanium_hoe>);

recipes.addShaped("youre_an_expert_harry_500", <galacticraftplanets:titanium_hoe>, 
 [[<enderio:item_power_conduit>, <atum:poison_trap>, <enderio:item_power_conduit>],
  [<midnight:rockshroom_helmet>, <atum:flax_block>, <midnight:rockshroom_helmet>],
  [<botania:corporearetainer>, <immersiveengineering:metal:11>, <botania:corporearetainer>]]);

//Recipe 501
recipes.remove(<atum:coal_ore>, false);
furnace.remove(<atum:coal_ore>);

recipes.addShaped("youre_an_expert_harry_501", <atum:coal_ore>, 
 [[<harvestcraft:friesitem>, <compactmachines3:machine>, <harvestcraft:friesitem>],
  [<compactmachines3:machine>, <betternether:orange_mushroom>, <compactmachines3:machine>],
  [<harvestcraft:friesitem>, <compactmachines3:machine>, <harvestcraft:friesitem>]]);

//Recipe 502
recipes.remove(<arcanearchives:scintillating_inlay>, false);
furnace.remove(<arcanearchives:scintillating_inlay>);

ManaInfusion.addInfusion(<arcanearchives:scintillating_inlay>, <enderio:block_painted_wooden_door>, 3135);

//Recipe 503
recipes.remove(<thaumcraft:loot_crate_uncommon>, false);
furnace.remove(<thaumcraft:loot_crate_uncommon>);

recipes.addShapeless("youre_an_expert_harry_503", <thaumcraft:loot_crate_uncommon>, [<bibliocraft:lanterngold:6>, <draconicevolution:draconic_spawner>, <harvestcraft:soybeanitem>, <appliedenergistics2:fluix_block>]);

//Recipe 504
recipes.remove(<artisanworktables:artisans_spanner_invar>, false);
furnace.remove(<artisanworktables:artisans_spanner_invar>);

Apothecary.addRecipe(<artisanworktables:artisans_spanner_invar>, [<artifacts:snorkel>, <botania:ancientwill:4>, <bibliocraft:paintingpress>, <atum:ceramic_stairs_magenta>, <mekanism:machineblock2:13>, <extrautils2:trashcan>, <ironchest:iron_shulker_box_gray:2>]);

//Recipe 505
recipes.remove(<nuclearcraft:fusion_electromagnet_transparent_active>, false);
furnace.remove(<nuclearcraft:fusion_electromagnet_transparent_active>);

recipes.addShapeless("youre_an_expert_harry_505", <nuclearcraft:fusion_electromagnet_transparent_active>, [<minerva:supporter_medal>, <extrautils2:indexerremote>, <thermalfoundation:tool.sword_aluminum>, <opensecurity:rolldoor_element>]);

//Recipe 506
recipes.remove(<harvestcraft:mochidessertitem>, false);
furnace.remove(<harvestcraft:mochidessertitem>);

Apothecary.addRecipe(<harvestcraft:mochidessertitem>, [<atum:deadwood_ladder>, <atum:ceramic_slab_brown>, <embers:ashen_brick>]);

//Recipe 507
recipes.remove(<atum:linen_blue>, false);
furnace.remove(<atum:linen_blue>);

recipes.addShapeless("youre_an_expert_harry_507", <atum:linen_blue>, [<harvestcraft:vanillaitem>, <spectrite:spectrite_blaze_rod>, <taiga:seismum_block>, <thermalfoundation:tool.fishing_rod_constantan>]);

//Recipe 508
recipes.remove(<artisanworktables:artisans_framing_hammer_flint>, false);
furnace.remove(<artisanworktables:artisans_framing_hammer_flint>);

ManaInfusion.addInfusion(<artisanworktables:artisans_framing_hammer_flint>, <twilightforest:mazebreaker_pickaxe>, 9546);

//Recipe 509
recipes.remove(<botania:livingrock>, false);
furnace.remove(<botania:livingrock>);

furnace.addRecipe(<botania:livingrock>, <thaumicbases:goldenplanks>);

//Recipe 510
recipes.remove(<atum:framed_orange_stained_glass>, false);
furnace.remove(<atum:framed_orange_stained_glass>);

furnace.addRecipe(<atum:framed_orange_stained_glass>, <harvestcraft:cactusfruititem>);

//Recipe 511
recipes.remove(<taiga:pure_ingot>, false);
furnace.remove(<taiga:pure_ingot>);

recipes.addShaped("youre_an_expert_harry_511", <taiga:pure_ingot>, 
 [[<netherex:basalt_pillar_wall>, <appliedenergistics2:quantum_ring>, <netherex:basalt_pillar_wall>],
  [<appliedenergistics2:quantum_ring>, <harvestcraft:bubblywateritem>, <appliedenergistics2:quantum_ring>],
  [<netherex:basalt_pillar_wall>, <appliedenergistics2:quantum_ring>, <netherex:basalt_pillar_wall>]]);

//Recipe 512
recipes.remove(<yurtmod:cos_shamiana_red>, false);
furnace.remove(<yurtmod:cos_shamiana_red>);

Apothecary.addRecipe(<yurtmod:cos_shamiana_red>, [<abyssalcraft:cobbleu>, <twilightforest:deadrock>, <theaurorian:runestonesmooth>, <thaumicaugmentation:impetus_matrix>, <forbidden_arcanus:bone_hoe>]);

//Recipe 513
recipes.remove(<densemetals:dense_lapis_ore>, false);
furnace.remove(<densemetals:dense_lapis_ore>);

recipes.addShaped("youre_an_expert_harry_513", <densemetals:dense_lapis_ore>, 
 [[<bibliocraft:deathcompass>, <betternether:cincinnasite_tile_small>, <bibliocraft:deathcompass>],
  [<minecraft:anvil:2>, <minecraft:carpet:7>, <minecraft:anvil:2>],
  [<bloodmagic:demon_stairs_3>, <enderio:item_redstone_toggle_filter>, <bloodmagic:demon_stairs_3>]]);

//Recipe 514
recipes.remove(<tconstruct:bow_string>, false);
furnace.remove(<tconstruct:bow_string>);

recipes.addShaped("youre_an_expert_harry_514", <tconstruct:bow_string>, 
 [[<galacticraftplanets:titanium_chestplate>, <forbidden_arcanus:arcane_crystal>, <galacticraftplanets:titanium_chestplate>],
  [<artisanworktables:artisans_punch_boronnitride>, <thermalfoundation:tool.sickle_nickel>, <artisanworktables:artisans_punch_boronnitride>],
  [<futuremc:netherite_chestplate>, <abyssalcraft:abyssalnitecobblestoneslab2>, <futuremc:netherite_chestplate>]]);

//Recipe 515
recipes.remove(<atum:linen_thread>, false);
furnace.remove(<atum:linen_thread>);

recipes.addShaped("youre_an_expert_harry_515", <atum:linen_thread>, 
 [[<bountifulbaubles:amuletcross>, <futuremc:jungle_trapdoor>, <bountifulbaubles:amuletcross>],
  [<theaurorian:crystallinesprite>, <abyssalcraft:antidote>, <theaurorian:crystallinesprite>],
  [<appliedenergistics2:material:51>, <extrabotany:failnaught>, <appliedenergistics2:material:51>]]);

//Recipe 516
recipes.remove(<thaumcraft:slab_ancient>, false);
furnace.remove(<thaumcraft:slab_ancient>);

recipes.addShaped("youre_an_expert_harry_516", <thaumcraft:slab_ancient>, 
 [[<theaurorian:crystallinesprite>, <thaumicwonders:catalyzation_chamber>, <theaurorian:crystallinesprite>],
  [<thaumicwonders:catalyzation_chamber>, <thaumcraft:mirror>, <thaumicwonders:catalyzation_chamber>],
  [<theaurorian:crystallinesprite>, <thaumicwonders:catalyzation_chamber>, <theaurorian:crystallinesprite>]]);

//Recipe 517
recipes.remove(<minecraft:silver_glazed_terracotta>, false);
furnace.remove(<minecraft:silver_glazed_terracotta>);

furnace.remove(<harvestcraft:cookedtofuduckitem>);
furnace.addRecipe(<minecraft:silver_glazed_terracotta>, <harvestcraft:rawtofuduckitem>);

//Recipe 518
recipes.remove(<taiga:basalt_nugget>, false);
furnace.remove(<taiga:basalt_nugget>);

recipes.addShaped("youre_an_expert_harry_518", <taiga:basalt_nugget>, 
 [[<netherex:wither_dust>, <tconstruct:materials:1>, <netherex:wither_dust>],
  [<tconstruct:materials:1>, <twilightforest:knightmetal_chestplate>, <tconstruct:materials:1>],
  [<netherex:wither_dust>, <tconstruct:materials:1>, <netherex:wither_dust>]]);

//Recipe 519
recipes.remove(<twilightforest:steeleaf_shovel>, false);
furnace.remove(<twilightforest:steeleaf_shovel>);

Apothecary.addRecipe(<twilightforest:steeleaf_shovel>, [<embers:auto_hammer>, <twilightforest:time_plate>, <embers:anti_tinker_lens>, <abyssalcraft:dhelmet>, <theaurorian:darkstonefancy>, <netherex:red_nether_brick_fence>, <opencomputers:endstone>, <artisanworktables:artisans_shears_elementium>, <bigreactors:ingotyellorium>]);

//Recipe 520
recipes.remove(<harvestcraft:plumyogurtitem>, false);
furnace.remove(<harvestcraft:plumyogurtitem>);

recipes.addShaped("youre_an_expert_harry_520", <harvestcraft:plumyogurtitem>, 
 [[<atum:linen_pink>, <artisanworktables:artisans_framing_hammer_terrasteel>, <atum:linen_pink>],
  [<artisanworktables:artisans_framing_hammer_terrasteel>, <netherex:gloomy_nether_brick>, <artisanworktables:artisans_framing_hammer_terrasteel>],
  [<atum:linen_pink>, <artisanworktables:artisans_framing_hammer_terrasteel>, <atum:linen_pink>]]);

//Recipe 521
recipes.remove(<quark:birch_pressure_plate>, false);
furnace.remove(<quark:birch_pressure_plate>);

Apothecary.addRecipe(<quark:birch_pressure_plate>, [<galacticraftcore:emergency_kit>]);

//Recipe 522
recipes.remove(<futuremc:netherite_axe>, false);
furnace.remove(<futuremc:netherite_axe>);

ManaInfusion.addInfusion(<futuremc:netherite_axe>, <dynamictreesphc:orangeseed>, 7234);

//Recipe 523
recipes.remove(<abyssalcraft:corboots>, false);
furnace.remove(<abyssalcraft:corboots>);

ManaInfusion.addInfusion(<abyssalcraft:corboots>, <dynamictreesthaumicbases:rainbowcactusseed>, 5946);

//Recipe 524
recipes.remove(<bloodmagic:item_demon_crystal:2>, false);
furnace.remove(<bloodmagic:item_demon_crystal:2>);

furnace.addRecipe(<bloodmagic:item_demon_crystal:2>, <harvestcraft:plumitem>);

//Recipe 525
recipes.remove(<artisanworktables:artisans_solderer_electrum>, false);
furnace.remove(<artisanworktables:artisans_solderer_electrum>);

recipes.addShaped("youre_an_expert_harry_525", <artisanworktables:artisans_solderer_electrum>, 
 [[<quark:stone_slate_stairs>, <abyssalcraft:crystalcluster2:8>, <quark:stone_slate_stairs>],
  [<abyssalcraft:crystalcluster2:8>, <nuclearcraft:salt_mixer_idle>, <abyssalcraft:crystalcluster2:8>],
  [<quark:stone_slate_stairs>, <abyssalcraft:crystalcluster2:8>, <quark:stone_slate_stairs>]]);

//Recipe 526
recipes.remove(<minecraft:bone>, false);
furnace.remove(<minecraft:bone>);

furnace.addRecipe(<minecraft:bone>, <thaumcraft:candle_red>);

//Recipe 527
recipes.remove(<ironchest:iron_shulker_box_lime:4>, false);
furnace.remove(<ironchest:iron_shulker_box_lime:4>);

recipes.addShaped("youre_an_expert_harry_527", <ironchest:iron_shulker_box_lime:4>, 
 [[<embers:stamp_plate>, <harvestcraft:driedsoupitem>, <embers:stamp_plate>],
  [<yurtmod:tent_upgrade_gold>, <abyssalcraft:engraver_on>, <yurtmod:tent_upgrade_gold>],
  [<ae2wtlib:wut_creative>, <artisanworktables:artisans_sifter_bronze>, <ae2wtlib:wut_creative>]]);

//Recipe 528
recipes.remove(<midnight:nightstone_shovel>, false);
furnace.remove(<midnight:nightstone_shovel>);

recipes.addShaped("youre_an_expert_harry_528", <midnight:nightstone_shovel>, 
 [[<futuremc:stripped_oak_log>, <abyssalcraft:darkethaxiumbrickstairs>, <futuremc:stripped_oak_log>],
  [<artisanworktables:artisans_file_copper>, <thermalfoundation:tool.fishing_rod_steel>, <artisanworktables:artisans_file_copper>],
  [<appliedenergistics2:part:160>, <botania:skydirtrod>, <appliedenergistics2:part:160>]]);

//Recipe 529
recipes.remove(<harvestcraft:candleberryseeditem>, false);
furnace.remove(<harvestcraft:candleberryseeditem>);

Apothecary.addRecipe(<harvestcraft:candleberryseeditem>, [<taiga:jauxum_dust>, <netherex:basalt_wall>, <appliedenergistics2:fluid_interface>, <mekanism:glowplasticblock:7>, <enderio:block_painted_stone>, <harvestcraft:orangeduckitem>]);

//Recipe 530
recipes.remove(<ironchest:iron_shulker_box_silver:6>, false);
furnace.remove(<ironchest:iron_shulker_box_silver:6>);

Apothecary.addRecipe(<ironchest:iron_shulker_box_silver:6>, [<tinker_io:crushed_ore>, <harvestcraft:creamedbroccolisoupitem>, <artisanworktables:artisans_chisel_constantan>, <extrabotany:achilleshield>]);

//Recipe 531
recipes.remove(<harvestcraft:orangechickenitem>, false);
furnace.remove(<harvestcraft:orangechickenitem>);

recipes.addShapeless("youre_an_expert_harry_531", <harvestcraft:orangechickenitem>, [<galacticraftcore:view_screen>, <minecraft:orange_glazed_terracotta>, <taiga:dilithium_block>, <taiga:cyberium_ingot>]);

//Recipe 532
recipes.remove(<abyssalcraft:cstonebrickslab1>, false);
furnace.remove(<abyssalcraft:cstonebrickslab1>);

recipes.addShapeless("youre_an_expert_harry_532", <abyssalcraft:cstonebrickslab1>, [<taiga:ovium_block>, <forbidden_arcanus:mysterywood_sapling>, <quark:elder_prismarine_bricks_slab>, <thaumcraft:smelter_thaumium>]);

//Recipe 533
recipes.remove(<appliedenergistics2:fluix_stairs>, false);
furnace.remove(<appliedenergistics2:fluix_stairs>);

recipes.addShaped("youre_an_expert_harry_533", <appliedenergistics2:fluix_stairs>, 
 [[<forbidden_arcanus:soul>, <danknull:dank_null_2>, <forbidden_arcanus:soul>],
  [<danknull:dank_null_2>, <futuremc:spruce_wood>, <danknull:dank_null_2>],
  [<forbidden_arcanus:soul>, <danknull:dank_null_2>, <forbidden_arcanus:soul>]]);

//Recipe 534
recipes.remove(<atum:loot_emerald_ring>, false);
furnace.remove(<atum:loot_emerald_ring>);

recipes.addShaped("youre_an_expert_harry_534", <atum:loot_emerald_ring>, 
 [[<harvestcraft:scallionseeditem>, <harvestcraft:aridgarden>, <harvestcraft:scallionseeditem>],
  [<harvestcraft:aridgarden>, <minecraft:diamond_boots>, <harvestcraft:aridgarden>],
  [<harvestcraft:scallionseeditem>, <harvestcraft:aridgarden>, <harvestcraft:scallionseeditem>]]);

//Recipe 535
recipes.remove(<yurtmod:cos_tepee_wall_creeper>, false);
furnace.remove(<yurtmod:cos_tepee_wall_creeper>);

furnace.addRecipe(<yurtmod:cos_tepee_wall_creeper>, <harvestcraft:omeletitem>);

//Recipe 536
recipes.remove(<bloodarsenal:bound_stick>, false);
furnace.remove(<bloodarsenal:bound_stick>);

recipes.addShaped("youre_an_expert_harry_536", <bloodarsenal:bound_stick>, 
 [[<projectred-exploration:ruby_sword>, <artisanworktables:artisans_spanner_boron>, <projectred-exploration:ruby_sword>],
  [<artisanworktables:artisans_cutters_terrasteel>, <minecraft:cooked_chicken>, <artisanworktables:artisans_cutters_terrasteel>],
  [<artisanworktables:artisans_tsquare_elementium>, <extrautils2:powerbattery>, <artisanworktables:artisans_tsquare_elementium>]]);

//Recipe 537
recipes.remove(<harvestcraft:braisedonionsitem>, false);
furnace.remove(<harvestcraft:braisedonionsitem>);

furnace.addRecipe(<harvestcraft:braisedonionsitem>, <artisanworktables:artisans_needle_copper>);

//Recipe 538
recipes.remove(<harvestcraft:beetseeditem>, false);
furnace.remove(<harvestcraft:beetseeditem>);

recipes.addShapeless("youre_an_expert_harry_538", <harvestcraft:beetseeditem>, [<thaumcraft:quicksilver>, <harvestcraft:cheesesteakitem>, <harvestcraft:chickencurryitem>, <astralsorcery:itemhandtelescope>]);

//Recipe 539
recipes.remove(<harvestcraft:caramelicecreamitem>, false);
furnace.remove(<harvestcraft:caramelicecreamitem>);

recipes.addShaped("youre_an_expert_harry_539", <harvestcraft:caramelicecreamitem>, 
 [[<aether_legacy:neptune_leggings>, <artisanworktables:artisans_cutters_boronnitride>, <aether_legacy:neptune_leggings>],
  [<thaumcraft:tube>, <galacticraftcore:infinite_battery>, <thaumcraft:tube>],
  [<botania:cocoon>, <botania:terrasteellegs>, <botania:cocoon>]]);

//Recipe 540
recipes.remove(<harvestcraft:meatpieitem>, false);
furnace.remove(<harvestcraft:meatpieitem>);

recipes.addShaped("youre_an_expert_harry_540", <harvestcraft:meatpieitem>, 
 [[<bloodarsenal:blood_infused_iron_pickaxe>, <appliedenergistics2:sky_stone_small_brick>, <bloodarsenal:blood_infused_iron_pickaxe>],
  [<appliedenergistics2:sky_stone_small_brick>, <appliedenergistics2:sky_stone_brick>, <appliedenergistics2:sky_stone_small_brick>],
  [<bloodarsenal:blood_infused_iron_pickaxe>, <appliedenergistics2:sky_stone_small_brick>, <bloodarsenal:blood_infused_iron_pickaxe>]]);

//Recipe 541
recipes.remove(<harvestcraft:museliitem>, false);
furnace.remove(<harvestcraft:museliitem>);

furnace.addRecipe(<harvestcraft:museliitem>, <aether_legacy:zanite_gemstone>);

//Recipe 542
recipes.remove(<atum:desert_helmet_diamond>, false);
furnace.remove(<atum:desert_helmet_diamond>);

recipes.addShapeless("youre_an_expert_harry_542", <atum:desert_helmet_diamond>, [<futuremc:end_stone_brick_wall>, <artisanworktables:artisans_razor_manasteel>, <artisanworktables:artisans_pan_toughalloy>, <atum:desert_boots_iron>]);

//Recipe 543
recipes.remove(<bloodmagic:sigil_air>, false);
furnace.remove(<bloodmagic:sigil_air>);

furnace.addRecipe(<bloodmagic:sigil_air>, <harvestcraft:chilidogitem>);

//Recipe 544
recipes.remove(<minecraft:obsidian>, false);
furnace.remove(<minecraft:obsidian>);

recipes.addShaped("youre_an_expert_harry_544", <minecraft:obsidian>, 
 [[<quark:stone_andesite_wall>, <nuclearcraft:lithium>, <quark:stone_andesite_wall>],
  [<nuclearcraft:lithium>, <openblocks:donation_station>, <nuclearcraft:lithium>],
  [<quark:stone_andesite_wall>, <nuclearcraft:lithium>, <quark:stone_andesite_wall>]]);

//Recipe 545
recipes.remove(<artisanworktables:artisans_solderer_gold>, false);
furnace.remove(<artisanworktables:artisans_solderer_gold>);

furnace.addRecipe(<artisanworktables:artisans_solderer_gold>, <enderio:block_enhanced_wired_charger>);

//Recipe 546
recipes.remove(<harvestcraft:phoitem>, false);
furnace.remove(<harvestcraft:phoitem>);

recipes.addShaped("youre_an_expert_harry_546", <harvestcraft:phoitem>, 
 [[<harvestcraft:lemondrizzlecakeitem>, <draconicevolution:dislocator_advanced>, <harvestcraft:lemondrizzlecakeitem>],
  [<draconicevolution:dislocator_advanced>, <quark:iron_button>, <draconicevolution:dislocator_advanced>],
  [<harvestcraft:lemondrizzlecakeitem>, <draconicevolution:dislocator_advanced>, <harvestcraft:lemondrizzlecakeitem>]]);

//Recipe 547
recipes.remove(<quark:prismarine_slab>, false);
furnace.remove(<quark:prismarine_slab>);

ManaInfusion.addInfusion(<quark:prismarine_slab>, <nuclearcraft:turbine_dynamo_coil:1>, 9312);

//Recipe 548
recipes.remove(<minecraft:diamond_sword>, false);
furnace.remove(<minecraft:diamond_sword>);

furnace.addRecipe(<minecraft:diamond_sword>, <thaumicbases:crystalblockair>);

//Recipe 549
recipes.remove(<twilightforest:ice_bow>, false);
furnace.remove(<twilightforest:ice_bow>);

recipes.addShapeless("youre_an_expert_harry_549", <twilightforest:ice_bow>, [<botania:pool:2>, <extrautils2:itemcreativebuilderswand>, <harvestcraft:fishandchipsitem>, <harvestcraft:jackfruit_sapling>]);

//Recipe 550
recipes.remove(<futuremc:suspicious_stew>, false);
furnace.remove(<futuremc:suspicious_stew>);

furnace.addRecipe(<futuremc:suspicious_stew>, <dynamictreesphc:papayaseed>);

//Recipe 551
recipes.remove(<harvestcraft:rawtofenisonitem>, false);
furnace.remove(<harvestcraft:rawtofenisonitem>);

furnace.addRecipe(<harvestcraft:rawtofenisonitem>, <thaumcraft:thaumium_pick>);

//Recipe 552
recipes.remove(<atum:porphyry_tiled_slab>, false);
furnace.remove(<atum:porphyry_tiled_slab>);

recipes.addShaped("youre_an_expert_harry_552", <atum:porphyry_tiled_slab>, 
 [[<abyssalcraft:abyssalnitecobblestoneslab2>, <botania:elementiumlegs>, <abyssalcraft:abyssalnitecobblestoneslab2>],
  [<thaumcraft:wand_workbench>, <botania:recordgaia2>, <thaumcraft:wand_workbench>],
  [<sonarcore:stablestone_brown>, <harvestcraft:spicymustardporkitem>, <sonarcore:stablestone_brown>]]);

//Recipe 553
recipes.remove(<aether_legacy:white_apple>, false);
furnace.remove(<aether_legacy:white_apple>);

recipes.addShapeless("youre_an_expert_harry_553", <aether_legacy:white_apple>, [<bibliocraft:paintingframemiddle:3>, <harvestcraft:softpretzelitem>, <artisanworktables:artisans_grimoire_flint>, <artisanworktables:artisans_shears_boron>]);

//Recipe 554
recipes.remove(<atum:limestone_brick_cracked_brick>, false);
furnace.remove(<atum:limestone_brick_cracked_brick>);

furnace.addRecipe(<atum:limestone_brick_cracked_brick>, <thaumcraft:tube_filter>);

//Recipe 555
recipes.remove(<futuremc:bamboo>, false);
furnace.remove(<futuremc:bamboo>);

recipes.addShaped("youre_an_expert_harry_555", <futuremc:bamboo>, 
 [[<artisanworktables:artisans_punch_toughalloy>, <harvestcraft:lemoncupcakeitem>, <artisanworktables:artisans_punch_toughalloy>],
  [<harvestcraft:lemoncupcakeitem>, <mekanismgenerators:hohlraum>, <harvestcraft:lemoncupcakeitem>],
  [<artisanworktables:artisans_punch_toughalloy>, <harvestcraft:lemoncupcakeitem>, <artisanworktables:artisans_punch_toughalloy>]]);

//Recipe 556
recipes.remove(<aether_legacy:gummy_swet>, false);
furnace.remove(<aether_legacy:gummy_swet>);

furnace.addRecipe(<aether_legacy:gummy_swet>, <atum:brigand_shield>);

//Recipe 557
recipes.remove(<nuclearcraft:curium:10>, false);
furnace.remove(<nuclearcraft:curium:10>);

recipes.addShaped("youre_an_expert_harry_557", <nuclearcraft:curium:10>, 
 [[<artisanworktables:artisans_mortar_gold>, <futuremc:smooth_stone>, <artisanworktables:artisans_mortar_gold>],
  [<yurtmod:shamiana_blue>, <conarm:gauntlet_mat_speed>, <yurtmod:shamiana_blue>],
  [<ferdinandsflowers:block_cff_doublesd:1>, <harvestcraft:papayajuiceitem>, <ferdinandsflowers:block_cff_doublesd:1>]]);

//Recipe 558
recipes.remove(<nuclearcraft:rtg_plutonium>, false);
furnace.remove(<nuclearcraft:rtg_plutonium>);

recipes.addShapeless("youre_an_expert_harry_558", <nuclearcraft:rtg_plutonium>, [<minecraft:grass>, <yurtmod:cos_shamiana_pink>, <harvestcraft:fig_sapling>, <harvestcraft:juteitem>]);

//Recipe 559
recipes.remove(<harvestcraft:barleyseeditem>, false);
furnace.remove(<harvestcraft:barleyseeditem>);

ManaInfusion.addInfusion(<harvestcraft:barleyseeditem>, <densemetals:dense_redstone_ore>, 9563);

//Recipe 560
recipes.remove(<quark:stained_clay_tiles_cyan_slab>, false);
furnace.remove(<quark:stained_clay_tiles_cyan_slab>);

Apothecary.addRecipe(<quark:stained_clay_tiles_cyan_slab>, [<draconicevolution:energy_crystal:7>]);

//Recipe 561
recipes.remove(<midnight:nightstone>, false);
furnace.remove(<midnight:nightstone>);

Apothecary.addRecipe(<midnight:nightstone>, [<tconstruct:book>, <thaumicwonders:disjunction_cloth>, <quark:thatch_slab>]);

//Recipe 562
recipes.remove(<twilightforest:firefly_jar>, false);
furnace.remove(<twilightforest:firefly_jar>);

recipes.addShapeless("youre_an_expert_harry_562", <twilightforest:firefly_jar>, [<artisanworktables:artisans_trowel_diamond>, <atum:palm_fence_gate>, <atum:emmer_flour>, <bigreactors:reactorredstoneport>]);

//Recipe 563
recipes.remove(<harvestcraft:manjuuitem>, false);
furnace.remove(<harvestcraft:manjuuitem>);

recipes.addShaped("youre_an_expert_harry_563", <harvestcraft:manjuuitem>, 
 [[<minecraft:leather_boots>, <forbidden_arcanus:golden_feather>, <minecraft:leather_boots>],
  [<harvestcraft:rainbowcurryitem>, <supersoundmuffler:sound_muffler_bauble>, <harvestcraft:rainbowcurryitem>],
  [<qualitytools:emerald_amulet>, <thaumicaugmentation:focus_ancient>, <qualitytools:emerald_amulet>]]);

//Recipe 564
recipes.remove(<plustic:battery_cell>, false);
furnace.remove(<plustic:battery_cell>);

recipes.addShaped("youre_an_expert_harry_564", <plustic:battery_cell>, 
 [[<quark:leaf_carpet:5>, <forbidden_arcanus:golden_dragon_scale>, <quark:leaf_carpet:5>],
  [<thaumadditions:zeith_fur>, <aether_legacy:valkyrie_gloves>, <thaumadditions:zeith_fur>],
  [<tcomplement:scorched_slab:6>, <nuclearcraft:radaway>, <tcomplement:scorched_slab:6>]]);

//Recipe 565
recipes.remove(<enderio:block_concussion_charge>, false);
furnace.remove(<enderio:block_concussion_charge>);

recipes.addShaped("youre_an_expert_harry_565", <enderio:block_concussion_charge>, 
 [[<artisanworktables:artisans_burner_steel>, <thaumcraft:banner_purple>, <artisanworktables:artisans_burner_steel>],
  [<thaumcraft:banner_purple>, <midnight:rockshroom_boots>, <thaumcraft:banner_purple>],
  [<artisanworktables:artisans_burner_steel>, <thaumcraft:banner_purple>, <artisanworktables:artisans_burner_steel>]]);

//Recipe 566
recipes.remove(<enderio:item_dark_steel_hand>, false);
furnace.remove(<enderio:item_dark_steel_hand>);

Apothecary.addRecipe(<enderio:item_dark_steel_hand>, [<betternether:nether_brick_tile_large>, <betternether:stalagnate_planks_gate>, <extrabotany:lens:6>]);

//Recipe 567
recipes.remove(<abyssalcraft:abydreadbrick>, false);
furnace.remove(<abyssalcraft:abydreadbrick>);

ManaInfusion.addInfusion(<abyssalcraft:abydreadbrick>, <bigreactors:mineralbenitoite>, 8522);

//Recipe 568
recipes.remove(<artisanworktables:artisans_athame_silver>, false);
furnace.remove(<artisanworktables:artisans_athame_silver>);

Apothecary.addRecipe(<artisanworktables:artisans_athame_silver>, [<atum:limestone_large_slab>, <taiga:adamant_nugget>, <artisanworktables:artisans_quill_bronze>, <harvestcraft:pistachiobakedsalmonitem>, <harvestcraft:wintersquashitem>, <harvestcraft:coleslawitem>, <botania:hourglass>]);

//Recipe 569
recipes.remove(<botanicadds:gaiasteel_block>, false);
furnace.remove(<botanicadds:gaiasteel_block>);

furnace.addRecipe(<botanicadds:gaiasteel_block>, <minecraft:hay_block>);

//Recipe 570
recipes.remove(<harvestcraft:lettuceseeditem>, false);
furnace.remove(<harvestcraft:lettuceseeditem>);

Apothecary.addRecipe(<harvestcraft:lettuceseeditem>, [<atum:limestone_smooth_slab>, <harvestcraft:kohlundpinkelitem>, <artisanworktables:artisans_hatchet_toughalloy>, <quark:thatch_stairs>, <appliedenergistics2:molecular_assembler>]);

//Recipe 571
recipes.remove(<harvestcraft:nutellaitem>, false);
furnace.remove(<harvestcraft:nutellaitem>);

ManaInfusion.addInfusion(<harvestcraft:nutellaitem>, <harvestcraft:pamtamarind>, 7140);

//Recipe 572
recipes.remove(<tconstruct:dried_clay>, false);
furnace.remove(<tconstruct:dried_clay>);

furnace.addRecipe(<tconstruct:dried_clay>, <extrautils2:sickle_stone>);

//Recipe 573
recipes.remove(<atum:efreet_heart>, false);
furnace.remove(<atum:efreet_heart>);

recipes.addShaped("youre_an_expert_harry_573", <atum:efreet_heart>, 
 [[<quark:bark_oak_slab>, <thaumcraft:banner_magenta>, <quark:bark_oak_slab>],
  [<thaumcraft:banner_magenta>, <futuremc:netherite_helmet>, <thaumcraft:banner_magenta>],
  [<quark:bark_oak_slab>, <thaumcraft:banner_magenta>, <quark:bark_oak_slab>]]);

//Recipe 574
recipes.remove(<abyssalcraft:necronomicon_cor>, false);
furnace.remove(<abyssalcraft:necronomicon_cor>);

recipes.addShaped("youre_an_expert_harry_574", <abyssalcraft:necronomicon_cor>, 
 [[<artisanworktables:artisans_chisel_platinum>, <enderio:block_not_holy_fused_quartz:3>, <artisanworktables:artisans_chisel_platinum>],
  [<enderio:block_not_holy_fused_quartz:3>, <openblocks:generic:9>, <enderio:block_not_holy_fused_quartz:3>],
  [<artisanworktables:artisans_chisel_platinum>, <enderio:block_not_holy_fused_quartz:3>, <artisanworktables:artisans_chisel_platinum>]]);

//Recipe 575
recipes.remove(<harvestcraft:kohlrabiseeditem>, false);
furnace.remove(<harvestcraft:kohlrabiseeditem>);

recipes.addShaped("youre_an_expert_harry_575", <harvestcraft:kohlrabiseeditem>, 
 [[<thaumicwonders:void_beacon>, <enderio:block_painted_iron_door>, <thaumicwonders:void_beacon>],
  [<immersiveengineering:stone_decoration:7>, <harvestcraft:gingeredrhubarbtartitem>, <immersiveengineering:stone_decoration:7>],
  [<galacticraftcore:schematic>, <harvestcraft:chickpeaseeditem>, <galacticraftcore:schematic>]]);

//Recipe 576
recipes.remove(<nuclearcraft:salt_fission_frame>, false);
furnace.remove(<nuclearcraft:salt_fission_frame>);

Apothecary.addRecipe(<nuclearcraft:salt_fission_frame>, [<ferdinandsflowers:block_cff_flowers:4>, <minecraft:diamond_ore>, <minecraft:stone_pressure_plate>, <thaumicwonders:placeholder_obsidian>, <botania:pavement1stairs>, <mca:rose_gold_block>]);

//Recipe 577
recipes.remove(<plustic:centrifuge:1>, false);
furnace.remove(<plustic:centrifuge:1>);

furnace.addRecipe(<plustic:centrifuge:1>, <arcanearchives:mindspindle>);

//Recipe 578
recipes.remove(<artisanworktables:artisans_pliers_osmium>, false);
furnace.remove(<artisanworktables:artisans_pliers_osmium>);

recipes.addShaped("youre_an_expert_harry_578", <artisanworktables:artisans_pliers_osmium>, 
 [[<harvestcraft:rawtofeakitem>, <quark:paper_wall_sakura>, <harvestcraft:rawtofeakitem>],
  [<quark:paper_wall_sakura>, <theaurorian:aurorianbacon>, <quark:paper_wall_sakura>],
  [<harvestcraft:rawtofeakitem>, <quark:paper_wall_sakura>, <harvestcraft:rawtofeakitem>]]);

//Recipe 579
recipes.remove(<immersiveengineering:stone_decoration_stairs_hempcrete>, false);
furnace.remove(<immersiveengineering:stone_decoration_stairs_hempcrete>);

recipes.addShaped("youre_an_expert_harry_579", <immersiveengineering:stone_decoration_stairs_hempcrete>, 
 [[<harvestcraft:salmononigiriitem>, <botania:biomestonea14slab>, <harvestcraft:salmononigiriitem>],
  [<botania:biomestonea14slab>, <enderio:block_stirling_generator>, <botania:biomestonea14slab>],
  [<harvestcraft:salmononigiriitem>, <botania:biomestonea14slab>, <harvestcraft:salmononigiriitem>]]);

//Recipe 580
recipes.remove(<quark:biome_cobblestone:1>, false);
furnace.remove(<quark:biome_cobblestone:1>);

furnace.addRecipe(<quark:biome_cobblestone:1>, <thermalfoundation:tool.sickle_iron>);

//Recipe 581
recipes.remove(<theaurorian:bossspawnermoonqueen>, false);
furnace.remove(<theaurorian:bossspawnermoonqueen>);

recipes.addShaped("youre_an_expert_harry_581", <theaurorian:bossspawnermoonqueen>, 
 [[<botania:pavement5stairs>, <harvestcraft:bbqchickenpizzaitem>, <botania:pavement5stairs>],
  [<harvestcraft:bbqchickenpizzaitem>, <theaurorian:darkstonefancy>, <harvestcraft:bbqchickenpizzaitem>],
  [<botania:pavement5stairs>, <harvestcraft:bbqchickenpizzaitem>, <botania:pavement5stairs>]]);

//Recipe 582
recipes.remove(<artisanworktables:artisans_knife_constantan>, false);
furnace.remove(<artisanworktables:artisans_knife_constantan>);

recipes.addShapeless("youre_an_expert_harry_582", <artisanworktables:artisans_knife_constantan>, [<artisanworktables:artisans_gemcutter_terrasteel>, <harvestcraft:marshmellowsitem>, <projectred-transmission:wire:21>, <astralsorcery:itemrockcrystalsimple>]);

//Recipe 583
recipes.remove(<midnight:tenebrum_shovel>, false);
furnace.remove(<midnight:tenebrum_shovel>);

Apothecary.addRecipe(<midnight:tenebrum_shovel>, [<bibliocraft:paintingframefancy:3>, <theaurorian:aurorianfurnacelit>, <artisanworktables:artisans_burner_iron>, <theaurorian:silentwoodplanks>, <enderio:block_alloy_smelter>, <atum:linen_magenta>, <tconstruct:sign_head>]);

//Recipe 584
recipes.remove(<extrautils2:lawsword>, false);
furnace.remove(<extrautils2:lawsword>);

recipes.addShaped("youre_an_expert_harry_584", <extrautils2:lawsword>, 
 [[<taiga:terrax_dust>, <harvestcraft:okrachipsitem>, <taiga:terrax_dust>],
  [<thaumicaugmentation:fortified_glass>, <bloodmagic:teleposition_focus:2>, <thaumicaugmentation:fortified_glass>],
  [<enderio:block_vacuum_chest>, <artisanworktables:artisans_burner_steel>, <enderio:block_vacuum_chest>]]);

//Recipe 585
recipes.remove(<twilightforest:steeleaf_sword>, false);
furnace.remove(<twilightforest:steeleaf_sword>);

recipes.addShapeless("youre_an_expert_harry_585", <twilightforest:steeleaf_sword>, [<taiga:palladium_nugget>, <atum:deadwood_crate>, <botania:flowerbag>, <abyssalcraft:shoggothblock>]);

//Recipe 586
recipes.remove(<quark:slime_bucket>, false);
furnace.remove(<quark:slime_bucket>);

Apothecary.addRecipe(<quark:slime_bucket>, [<nuclearcraft:depleted_fuel_plutonium:3>, <galacticraftcore:parachute:8>, <thermalfoundation:tool.hoe_constantan>]);

//Recipe 587
recipes.remove(<botania:fertilizer>, false);
furnace.remove(<botania:fertilizer>);

Apothecary.addRecipe(<botania:fertilizer>, [<galacticraftplanets:desh_chestplate>, <mekanism:scubatank>, <atum:ceramic_slab_red>, <artisanworktables:artisans_pliers_steel>, <enderio:item_end_steel_axe>, <atum:framed_purple_stained_glass>, <astralsorcery:blockchalice>, <opencomputers:assembler>, <projectred-illumination:feedback_light_button:14>]);

//Recipe 588
recipes.remove(<ironchest:iron_shulker_box_pink:3>, false);
furnace.remove(<ironchest:iron_shulker_box_pink:3>);

recipes.addShaped("youre_an_expert_harry_588", <ironchest:iron_shulker_box_pink:3>, 
 [[<thaumicbases:netherleaves>, <embers:axe_lead>, <thaumicbases:netherleaves>],
  [<quark:spruce_pressure_plate>, <bountifulbaubles:trinketmixeddragonscale>, <quark:spruce_pressure_plate>],
  [<harvestcraft:pamcoconut>, <thaumicbases:nuggetthauminite>, <harvestcraft:pamcoconut>]]);

//Recipe 589
recipes.remove(<opensecurity:mag_card>, false);
furnace.remove(<opensecurity:mag_card>);

recipes.addShaped("youre_an_expert_harry_589", <opensecurity:mag_card>, 
 [[<artisanworktables:artisans_lens_bronze>, <thaumicwonders:timewinder>, <artisanworktables:artisans_lens_bronze>],
  [<harvestcraft:coconutitem>, <artisanworktables:artisans_pliers_copper>, <harvestcraft:coconutitem>],
  [<theaurorian:silkberry>, <harvestcraft:friedfeastitem>, <theaurorian:silkberry>]]);

//Recipe 590
recipes.remove(<atum:linen_carpet_gray>, false);
furnace.remove(<atum:linen_carpet_gray>);

ManaInfusion.addInfusion(<atum:linen_carpet_gray>, <abyssalcraft:gatewaykey>, 8955);

//Recipe 591
recipes.remove(<twilightforest:trollvidr>, false);
furnace.remove(<twilightforest:trollvidr>);

recipes.addShapeless("youre_an_expert_harry_591", <twilightforest:trollvidr>, [<artisanworktables:artisans_punch_bone>, <nuclearcraft:ingot:7>, <quark:polished_netherrack_bricks_wall>, <twilightforest:yeti_boots>]);

//Recipe 592
recipes.remove(<nuclearcraft:pickaxe_hard_carbon>, false);
furnace.remove(<nuclearcraft:pickaxe_hard_carbon>);

recipes.addShaped("youre_an_expert_harry_592", <nuclearcraft:pickaxe_hard_carbon>, 
 [[<artisanworktables:artisans_spanner_diamond>, <enderio:block_attractor_obelisk>, <artisanworktables:artisans_spanner_diamond>],
  [<malisisdoors:garage_door>, <artisanworktables:artisans_handsaw_lead>, <malisisdoors:garage_door>],
  [<tconstruct:materials:2>, <yurtmod:tepee_wall_creeper>, <tconstruct:materials:2>]]);

//Recipe 593
recipes.remove(<artisanworktables:artisans_beaker_flint>, false);
furnace.remove(<artisanworktables:artisans_beaker_flint>);

furnace.addRecipe(<artisanworktables:artisans_beaker_flint>, <galacticraftplanets:canister_partial_ln2:1>);

//Recipe 594
recipes.remove(<harvestcraft:cashewitem>, false);
furnace.remove(<harvestcraft:cashewitem>);

ManaInfusion.addInfusion(<harvestcraft:cashewitem>, <harvestcraft:okraseeditem>, 9233);

