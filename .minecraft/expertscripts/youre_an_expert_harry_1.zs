#priority 45
import mods.botania.RuneAltar;
import mods.botania.ElvenTrade;
import mods.botaniatweaks.AgglomerationMultiblock;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.Agglomeration;
import mods.botania.Apothecary;
import mods.botania.ManaInfusion;
//Recipe 146
recipes.remove(<harvestcraft:broccolimacitem>, false);
furnace.remove(<harvestcraft:broccolimacitem>);

ManaInfusion.addInfusion(<harvestcraft:broccolimacitem>, <harvestcraft:meatpieitem>, 8489);

//Recipe 147
recipes.remove(<extrabotany:shadowkatana>, false);
furnace.remove(<extrabotany:shadowkatana>);

Apothecary.addRecipe(<extrabotany:shadowkatana>, [<abyssalcraft:configurator>, <paragongems:item_turquoise>]);

//Recipe 148
recipes.remove(<minecraft:chorus_fruit>, false);
furnace.remove(<minecraft:chorus_fruit>);
ManaInfusion.removeRecipe(<minecraft:chorus_fruit>);

recipes.addShapeless("youre_an_expert_harry_148", <minecraft:chorus_fruit>, [<densemetals:dense_tin_ore>, <midnight:nagrilite_pressure_plate>, <theaurorian:silentwoodaxe>, <midnight:viridshroom_slab>]);

//Recipe 149
recipes.remove(<harvestcraft:carrotcakeitem>, false);
furnace.remove(<harvestcraft:carrotcakeitem>);

recipes.addShaped("youre_an_expert_harry_149", <harvestcraft:carrotcakeitem>, 
 [[<malisisdoors:iron_sliding_door>, <atum:efreet_heart>, <malisisdoors:iron_sliding_door>],
  [<extrautils2:lawsword>, <botania:incensestick>, <extrautils2:lawsword>],
  [<densemetals:dense_chromium_ore>, <artisanworktables:artisans_cutting_board_bone>, <densemetals:dense_chromium_ore>]]);

//Recipe 150
recipes.remove(<botania:quartzstairsblaze>, false);
furnace.remove(<botania:quartzstairsblaze>);

recipes.addShaped("youre_an_expert_harry_150", <botania:quartzstairsblaze>, 
 [[<atum:linen_blue>, <botania:manasteelhelmreveal>, <atum:linen_blue>],
  [<plustic:battery_cell>, <harvestcraft:crabrawitem>, <plustic:battery_cell>],
  [<aether_legacy:white_apple>, <quark:slime_bucket>, <aether_legacy:white_apple>]]);

//Recipe 151
recipes.remove(<harvestcraft:marshmellowchicksitem>, false);
furnace.remove(<harvestcraft:marshmellowchicksitem>);

RuneAltar.addRecipe(<harvestcraft:marshmellowchicksitem>, [<appliedenergistics2:chiseled_quartz_slab>, <bloodmagic:sigil_air>, <minecraft:lead>, <atum:atums_protection>, <harvestcraft:grapefruitsmoothieitem>], 5000);

//Recipe 152
recipes.remove(<midnight:viridshroom_stairs>, false);
furnace.remove(<midnight:viridshroom_stairs>);

furnace.addRecipe(<midnight:viridshroom_stairs>, <harvestcraft:carrotcake>);

//Recipe 153
recipes.remove(<artisanworktables:artisans_burner_wood>, false);
furnace.remove(<artisanworktables:artisans_burner_wood>);

recipes.addShapeless("youre_an_expert_harry_153", <artisanworktables:artisans_burner_wood>, [<forbidden_arcanus:dark_nether_star>, <abyssalcraft:abydreadbrick>, <extrautils2:itembuilderswand>, <bloodmagic:experience_tome>]);

//Recipe 154
recipes.remove(<taiga:emberium_block>, false);
furnace.remove(<taiga:emberium_block>);

ManaInfusion.addAlchemy(<taiga:emberium_block>, <mekanism:shard:4>, 7909);

//Recipe 155
recipes.remove(<abyssalcraft:dsbfence>, false);
furnace.remove(<abyssalcraft:dsbfence>);

recipes.addShaped("youre_an_expert_harry_155", <abyssalcraft:dsbfence>, 
 [[<nuclearcraft:helium_collector_compact>, <nuclearcraft:curium:10>, <nuclearcraft:helium_collector_compact>],
  [<quark:cobbed_stone_wall>, <mekanism:shard:5>, <quark:cobbed_stone_wall>],
  [<quark:stone_basalt_bricks_wall>, <minecraft:egg>, <quark:stone_basalt_bricks_wall>]]);

//Recipe 156
recipes.remove(<astralsorcery:itemsextant>, false);
furnace.remove(<astralsorcery:itemsextant>);

Apothecary.addRecipe(<astralsorcery:itemsextant>, [<atum:thin_framed_lime_stained_glass>, <harvestcraft:ricesoupitem>, <paragongems:item_moonstone>, <harvestcraft:ricecakeitem>, <midnight:crystalotus>, <harvestcraft:dandelionsaladitem>, <artisanworktables:artisans_compass_copper>, <thaumcraft:jar_void>, <openblocks:trophy>]);

//Recipe 157
recipes.remove(<harvestcraft:honey>, false);
furnace.remove(<harvestcraft:honey>);

furnace.addRecipe(<harvestcraft:honey>, <harvestcraft:citrussaladitem>);

//Recipe 158
recipes.remove(<quark:soul_bead>, false);
furnace.remove(<quark:soul_bead>);

ManaInfusion.addInfusion(<quark:soul_bead>, <forbidden_arcanus:mortem_leggings>, 8056);

//Recipe 159
recipes.remove(<taiga:dyonite_block>, false);
furnace.remove(<taiga:dyonite_block>);

recipes.addShaped("youre_an_expert_harry_159", <taiga:dyonite_block>, 
 [[<storagedrawers:framingtable>, <harvestcraft:plumyogurtitem>, <storagedrawers:framingtable>],
  [<harvestcraft:plumyogurtitem>, <midnight:tenebrum_trapdoor>, <harvestcraft:plumyogurtitem>],
  [<storagedrawers:framingtable>, <harvestcraft:plumyogurtitem>, <storagedrawers:framingtable>]]);

//Recipe 160
recipes.remove(<artisanworktables:artisans_grimoire_silver>, false);
furnace.remove(<artisanworktables:artisans_grimoire_silver>);

recipes.addShaped("youre_an_expert_harry_160", <artisanworktables:artisans_grimoire_silver>, 
 [[<nuclearcraft:pressurizer_active>, <nuclearcraft:record_money_for_nothing>, <nuclearcraft:pressurizer_active>],
  [<nuclearcraft:record_money_for_nothing>, <artisanworktables:artisans_mortar_diamond>, <nuclearcraft:record_money_for_nothing>],
  [<nuclearcraft:pressurizer_active>, <nuclearcraft:record_money_for_nothing>, <nuclearcraft:pressurizer_active>]]);

//Recipe 161
recipes.remove(<galacticraftplanets:mars_machine>, false);
furnace.remove(<galacticraftplanets:mars_machine>);

ManaInfusion.addInfusion(<galacticraftplanets:mars_machine>, <abyssalcraft:cstonebrickslab1>, 8305);

//Recipe 162
recipes.remove(<enderio:item_big_item_filter>, false);
furnace.remove(<enderio:item_big_item_filter>);

recipes.addShaped("youre_an_expert_harry_162", <enderio:item_big_item_filter>, 
 [[<thermalfoundation:tool.shears_silver>, <bloodarsenal:bound_stick>, <thermalfoundation:tool.shears_silver>],
  [<bloodarsenal:bound_stick>, <densemetals:dense_uranium_ore>, <bloodarsenal:bound_stick>],
  [<thermalfoundation:tool.shears_silver>, <bloodarsenal:bound_stick>, <thermalfoundation:tool.shears_silver>]]);

//Recipe 163
recipes.remove(<taiga:skylerite_ingot>, false);
furnace.remove(<taiga:skylerite_ingot>);

recipes.addShapeless("youre_an_expert_harry_163", <taiga:skylerite_ingot>, [<theaurorian:moontemplecellgate>, <thaumicbases:overchanter>, <embers:wall_ashen_stone>, <abyssalcraft:darkethaxiumbrickslab2>]);

//Recipe 164
recipes.remove(<aether_legacy:mossy_holystone_slab>, false);
furnace.remove(<aether_legacy:mossy_holystone_slab>);

recipes.addShapeless("youre_an_expert_harry_164", <aether_legacy:mossy_holystone_slab>, [<twilightforest:steeleaf_chestplate>, <atum:desert_helmet_diamond>, <artisanworktables:artisans_punch_gold>, <appliedenergistics2:sky_stone_small_brick_stairs>]);

//Recipe 165
recipes.remove(<immersiveengineering:wirecoil:4>, false);
furnace.remove(<immersiveengineering:wirecoil:4>);

furnace.addRecipe(<immersiveengineering:wirecoil:4>, <thaumicaugmentation:eldritch_lock_impetus>);

//Recipe 166
recipes.remove(<forbidden_arcanus:mortem_boots>, false);
furnace.remove(<forbidden_arcanus:mortem_boots>);

RuneAltar.addRecipe(<forbidden_arcanus:mortem_boots>, [<quark:candle:7>, <enderio:block_fused_glass>, <harvestcraft:succotashitem>, <harvestcraft:oystersauceitem>, <abyssalcraft:abydreadbrickstairs>, <nuclearcraft:dry_earth>, <abyssalcraft:diamondu>, <artisanworktables:artisans_solderer_electrum>, <minecraft:enchanting_table>], 6000);

//Recipe 167
recipes.remove(<minecraft:lapis_block>, false);
furnace.remove(<minecraft:lapis_block>);

Apothecary.addRecipe(<minecraft:lapis_block>, [<harvestcraft:venisoncookeditem>, <harvestcraft:kohlrabiseeditem>, <embers:aspectus_copper>, <embers:pickaxe_aluminum>, <abyssalcraft:scroll:1>, <harvestcraft:raspberryitem>, <extrabotany:coregod:1>]);

//Recipe 168
recipes.remove(<artisanworktables:artisans_athame_aluminum>, false);
furnace.remove(<artisanworktables:artisans_athame_aluminum>);

recipes.addShapeless("youre_an_expert_harry_168", <artisanworktables:artisans_athame_aluminum>, [<artisanworktables:artisans_file_steel>, <twilightforest:canopy_fence>, <forbidden_arcanus:draco_arcanus_leggings>, <harvestcraft:coffeeitem>]);

//Recipe 169
recipes.remove(<tconstruct:broadsword>, false);
furnace.remove(<tconstruct:broadsword>);

recipes.addShaped("youre_an_expert_harry_169", <tconstruct:broadsword>, 
 [[<sonarcore:reinforcedstonebrickgate>, <artisanworktables:artisans_hatchet_elementium>, <sonarcore:reinforcedstonebrickgate>],
  [<artisanworktables:artisans_hatchet_elementium>, <notenoughwands:swapping_wand>, <artisanworktables:artisans_hatchet_elementium>],
  [<sonarcore:reinforcedstonebrickgate>, <artisanworktables:artisans_hatchet_elementium>, <sonarcore:reinforcedstonebrickgate>]]);

//Recipe 170
recipes.remove(<quark:stained_clay_tiles_pink_stairs>, false);
furnace.remove(<quark:stained_clay_tiles_pink_stairs>);

RuneAltar.addRecipe(<quark:stained_clay_tiles_pink_stairs>, [<twilightforest:ore_map>, <atum:palm_door>, <thaumcraft:bath_salts>, <scalinghealth:crystalore>, <tconstruct:slime_sapling:2>, <harvestcraft:wintersquashseeditem>], 10000);

//Recipe 171
recipes.remove(<harvestcraft:bakedsweetpotatoitem>, false);
furnace.remove(<harvestcraft:bakedsweetpotatoitem>);

ManaInfusion.addAlchemy(<harvestcraft:bakedsweetpotatoitem>, <artisanworktables:artisans_framing_hammer_flint>, 5644);

//Recipe 172
recipes.remove(<nuclearcraft:solar_panel_elite>, false);
furnace.remove(<nuclearcraft:solar_panel_elite>);

furnace.addRecipe(<nuclearcraft:solar_panel_elite>, <draconicevolution:potentiometer>);

//Recipe 173
recipes.remove(<midnight:rouxe_rock>, false);
furnace.remove(<midnight:rouxe_rock>);

furnace.addRecipe(<midnight:rouxe_rock>, <harvestcraft:beetsaladitem>);

//Recipe 174
recipes.remove(<minecraft:paper>, false);
furnace.remove(<minecraft:paper>);

recipes.addShaped("youre_an_expert_harry_174", <minecraft:paper>, 
 [[<ironchest:iron_shulker_box_orange:3>, <artisanworktables:artisans_knife_toughalloy>, <ironchest:iron_shulker_box_orange:3>],
  [<quark:birch_pressure_plate>, <minecraft:lime_glazed_terracotta>, <quark:birch_pressure_plate>],
  [<mca:matchmakers_ring>, <twilightforest:etched_nagastone>, <mca:matchmakers_ring>]]);

//Recipe 175
recipes.remove(<harvestcraft:grapefruityogurtitem>, false);
furnace.remove(<harvestcraft:grapefruityogurtitem>);

recipes.addShapeless("youre_an_expert_harry_175", <harvestcraft:grapefruityogurtitem>, [<twilightforest:castle_stairs:8>, <aether_legacy:golden_pendant>, <opensecurity:rfid_reader>, <galacticraftplanets:geothermal_generator>]);

//Recipe 176
recipes.remove(<harvestcraft:honeysandwichitem>, false);
furnace.remove(<harvestcraft:honeysandwichitem>);

ManaInfusion.addInfusion(<harvestcraft:honeysandwichitem>, <densemetals:dense_starsteel_ore>, 6573);

//Recipe 177
recipes.remove(<artisanworktables:artisans_sifter_manasteel>, false);
furnace.remove(<artisanworktables:artisans_sifter_manasteel>);

Apothecary.addRecipe(<artisanworktables:artisans_sifter_manasteel>, [<harvestcraft:limejellyitem>, <quark:stained_planks:15>, <quark:elder_sea_lantern>, <atum:coal_ore>, <betternether:cincinnasite>, <embers:shovel_lead>, <extrautils2:creativeenergy>, <galacticraftplanets:titanium_hoe>]);

//Recipe 178
recipes.remove(<thermalfoundation:armor.legs_platinum>, false);
furnace.remove(<thermalfoundation:armor.legs_platinum>);

recipes.addShaped("youre_an_expert_harry_178", <thermalfoundation:armor.legs_platinum>, 
 [[<nuclearcraft:fusion_electromagnet_transparent_active>, <artisanworktables:artisans_framing_hammer_flint>, <nuclearcraft:fusion_electromagnet_transparent_active>],
  [<artisanworktables:artisans_framing_hammer_flint>, <bq_standard:loot_chest>, <artisanworktables:artisans_framing_hammer_flint>],
  [<nuclearcraft:fusion_electromagnet_transparent_active>, <artisanworktables:artisans_framing_hammer_flint>, <nuclearcraft:fusion_electromagnet_transparent_active>]]);

//Recipe 179
recipes.remove(<artisanworktables:artisans_hatchet_tin>, false);
furnace.remove(<artisanworktables:artisans_hatchet_tin>);

ManaInfusion.addInfusion(<artisanworktables:artisans_hatchet_tin>, <twilightforest:ore_magnet>, 4565);

//Recipe 180
recipes.remove(<artisanworktables:artisans_framing_hammer_osmium>, false);
furnace.remove(<artisanworktables:artisans_framing_hammer_osmium>);

ManaInfusion.addAlchemy(<artisanworktables:artisans_framing_hammer_osmium>, <futuremc:stone_brick_wall>, 8614);

//Recipe 181
recipes.remove(<harvestcraft:toastedwesternitem>, false);
furnace.remove(<harvestcraft:toastedwesternitem>);

recipes.addShapeless("youre_an_expert_harry_181", <harvestcraft:toastedwesternitem>, [<twilightforest:hedge>, <botania:endereyeblock>, <atum:palm_stairs>, <enderio:block_unholy_dark_fused_glass:15>]);

//Recipe 182
recipes.remove(<minecraft:chainmail_boots>, false);
furnace.remove(<minecraft:chainmail_boots>);

recipes.addShaped("youre_an_expert_harry_182", <minecraft:chainmail_boots>, 
 [[<artisanworktables:artisans_file_toughalloy>, <minecraft:diamond_sword>, <artisanworktables:artisans_file_toughalloy>],
  [<minecraft:diamond_sword>, <atum:chiseled_wall>, <minecraft:diamond_sword>],
  [<artisanworktables:artisans_file_toughalloy>, <minecraft:diamond_sword>, <artisanworktables:artisans_file_toughalloy>]]);

//Recipe 183
recipes.remove(<artisanworktables:artisans_razor_flint>, false);
furnace.remove(<artisanworktables:artisans_razor_flint>);

Apothecary.addRecipe(<artisanworktables:artisans_razor_flint>, [<harvestcraft:braisedonionsitem>, <yurtmod:cos_shamiana_orange>, <artisanworktables:artisans_mortar_wood>, <minecraft:elytra>, <thaumicenergistics:essentia_cell_16k>, <densemetals:dense_beryllium_ore>, <ferdinandsflowers:block_stone_light:3>, <artisanworktables:artisans_spanner_iron>, <harvestcraft:beetseeditem>]);

//Recipe 184
recipes.remove(<futuremc:stripped_spruce_wood>, false);
furnace.remove(<futuremc:stripped_spruce_wood>);

Apothecary.addRecipe(<futuremc:stripped_spruce_wood>, [<artisanworktables:artisans_grimoire_stone>, <harvestcraft:perchrawitem>, <artisanworktables:artisans_athame_silver>, <midnight:nightstone>, <enderio:block_concussion_charge>, <harvestcraft:peachjellyitem>, <aether_legacy:locked_dungeon_block:2>, <aether_legacy:skyroot_fence_gate>]);

//Recipe 185
recipes.remove(<netherex:enoki_mushroom_stem>, false);
furnace.remove(<netherex:enoki_mushroom_stem>);

ManaInfusion.addInfusion(<netherex:enoki_mushroom_stem>, <bloodmagic:teleposer>, 8016);

//Recipe 186
recipes.remove(<minecraft:soul_sand>, false);
furnace.remove(<minecraft:soul_sand>);
ManaInfusion.removeRecipe(<minecraft:soul_sand>);

RuneAltar.addRecipe(<minecraft:soul_sand>, [<appliedenergistics2:memory_card>, <opensecurity:mag_card>, <embers:adhesive>, <thaumicbases:greatwoodpipe>, <embers:pipe>, <artisanworktables:artisans_hammer_bone>, <abyssalcraft:dreadiumplate>, <minecraft:red_flower:5>, <nuclearcraft:salt_fission_frame>], 12000);

//Recipe 187
recipes.remove(<taiga:psychonium_nugget>, false);
furnace.remove(<taiga:psychonium_nugget>);

furnace.addRecipe(<taiga:psychonium_nugget>, <quark:colored_flowerpot_blue>);

//Recipe 188
recipes.remove(<bloodmagic:pack_sacrifice>, false);
furnace.remove(<bloodmagic:pack_sacrifice>);

furnace.addRecipe(<bloodmagic:pack_sacrifice>, <botania:gaiahead>);

//Recipe 189
recipes.remove(<harvestcraft:melonjuiceitem>, false);
furnace.remove(<harvestcraft:melonjuiceitem>);

furnace.addRecipe(<harvestcraft:melonjuiceitem>, <minecraft:tnt>);

//Recipe 190
recipes.remove(<extrautils2:compresseddirt>, false);
furnace.remove(<extrautils2:compresseddirt>);

Apothecary.addRecipe(<extrautils2:compresseddirt>, [<bigreactors:turbinehousing>, <artisanworktables:artisans_spanner_invar>, <bloodmagic:sigil_ender_severance>]);

//Recipe 191
recipes.remove(<netherex:black_salamander_hide_boots>, false);
furnace.remove(<netherex:black_salamander_hide_boots>);

recipes.addShaped("youre_an_expert_harry_191", <netherex:black_salamander_hide_boots>, 
 [[<artisanworktables:artisans_hammer_platinum>, <harvestcraft:seedenergygelitem>, <artisanworktables:artisans_hammer_platinum>],
  [<abyssalcraft:nitre>, <futuremc:stripped_spruce_log>, <abyssalcraft:nitre>],
  [<nuclearcraft:radiation_badge>, <twilightforest:trophy>, <nuclearcraft:radiation_badge>]]);

//Recipe 192
recipes.remove(<netherex:congealed_magma_cream>, false);
furnace.remove(<netherex:congealed_magma_cream>);

recipes.addShapeless("youre_an_expert_harry_192", <netherex:congealed_magma_cream>, [<harvestcraft:chorusfruitsoupitem>, <projectred-exploration:peridot_saw>, <artisanworktables:artisans_gemcutter_copper>, <minecraft:netherbrick>]);

//Recipe 193
recipes.remove(<storagedrawers:keybutton:3>, false);
furnace.remove(<storagedrawers:keybutton:3>);

ManaInfusion.addAlchemy(<storagedrawers:keybutton:3>, <draconicevolution:wyvern_core>, 3159);

//Recipe 194
recipes.remove(<artisanworktables:artisans_hammer_nickel>, false);
furnace.remove(<artisanworktables:artisans_hammer_nickel>);

RuneAltar.addRecipe(<artisanworktables:artisans_hammer_nickel>, [<harvestcraft:lemonjellysandwichitem>, <spectrite:spectrite_ladder>, <quark:stone_slate_bricks_stairs>, <astralsorcery:blockcelestialgateway>], 6000);

// RECIPE LEVEL: 2


//Recipe 195
recipes.remove(<enderio:item_alloy_nugget:5>, false);
furnace.remove(<enderio:item_alloy_nugget:5>);

recipes.addShaped("youre_an_expert_harry_195", <enderio:item_alloy_nugget:5>, 
 [[<twilightforest:block_and_chain>, <thaumicaugmentation:impetus_gate>, <twilightforest:block_and_chain>],
  [<thaumicaugmentation:impetus_gate>, <mekanism:robit>, <thaumicaugmentation:impetus_gate>],
  [<twilightforest:block_and_chain>, <thaumicaugmentation:impetus_gate>, <twilightforest:block_and_chain>]]);

//Recipe 196
recipes.remove(<harvestcraft:raspberryjellysandwichitem>, false);
furnace.remove(<harvestcraft:raspberryjellysandwichitem>);

recipes.addShaped("youre_an_expert_harry_196", <harvestcraft:raspberryjellysandwichitem>, 
 [[<artisanworktables:artisans_handsaw_toughalloy>, <taiga:pure_nugget>, <artisanworktables:artisans_handsaw_toughalloy>],
  [<taiga:pure_nugget>, <opencomputers:hologram2>, <taiga:pure_nugget>],
  [<artisanworktables:artisans_handsaw_toughalloy>, <taiga:pure_nugget>, <artisanworktables:artisans_handsaw_toughalloy>]]);

//Recipe 197
recipes.remove(<botania:biomestoneb5slab>, false);
furnace.remove(<botania:biomestoneb5slab>);

recipes.addShaped("youre_an_expert_harry_197", <botania:biomestoneb5slab>, 
 [[<aether_legacy:aerogel_double_slab>, <thaumcraft:banner_lime>, <aether_legacy:aerogel_double_slab>],
  [<thaumcraft:banner_lime>, <artisanworktables:artisans_trowel_invar>, <thaumcraft:banner_lime>],
  [<aether_legacy:aerogel_double_slab>, <thaumcraft:banner_lime>, <aether_legacy:aerogel_double_slab>]]);

//Recipe 198
recipes.remove(<aether_legacy:locked_dungeon_block:2>, false);
furnace.remove(<aether_legacy:locked_dungeon_block:2>);

recipes.addShaped("youre_an_expert_harry_198", <aether_legacy:locked_dungeon_block:2>, 
 [[<artifacts:everlasting_cooked_salmon>, <quark:slate_speleothem>, <artifacts:everlasting_cooked_salmon>],
  [<thaumadditions:adaminite_block>, <nuclearcraft:block_ice>, <thaumadditions:adaminite_block>],
  [<abyssalcraft:corlegs>, <enderio:block_unholy_enlightened_fused_glass:7>, <abyssalcraft:corlegs>]]);

//Recipe 199
recipes.remove(<enderio:item_end_steel_pickaxe>, false);
furnace.remove(<enderio:item_end_steel_pickaxe>);

recipes.addShapeless("youre_an_expert_harry_199", <enderio:item_end_steel_pickaxe>, [<abyssalcraft:dltpplate>, <aether_legacy:present>, <densemetals:dense_nether_silver_ore>, <harvestcraft:creepercookieitem>]);

//Recipe 200
recipes.remove(<forbidden_arcanus:mortem_leggings>, false);
furnace.remove(<forbidden_arcanus:mortem_leggings>);

recipes.addShaped("youre_an_expert_harry_200", <forbidden_arcanus:mortem_leggings>, 
 [[<harvestcraft:chimichangaitem>, <tcomplement:scorched_channel>, <harvestcraft:chimichangaitem>],
  [<abyssalcraft:dltfence>, <harvestcraft:summersquashwithradishitem>, <abyssalcraft:dltfence>],
  [<artisanworktables:artisans_quill_elementium>, <enderio:block_self_resetting_lever10i>, <artisanworktables:artisans_quill_elementium>]]);

//Recipe 201
recipes.remove(<harvestcraft:sprinklescupcakeitem>, false);
furnace.remove(<harvestcraft:sprinklescupcakeitem>);

ManaInfusion.addInfusion(<harvestcraft:sprinklescupcakeitem>, <botania:miniisland:14>, 3832);

//Recipe 202
recipes.remove(<galacticraftcore:fluid_pipe_pull>, false);
furnace.remove(<galacticraftcore:fluid_pipe_pull>);

recipes.addShaped("youre_an_expert_harry_202", <galacticraftcore:fluid_pipe_pull>, 
 [[<artisanworktables:artisans_spanner_stone>, <bloodmagic:bound_pickaxe>, <artisanworktables:artisans_spanner_stone>],
  [<astralsorcery:blockflarelight>, <harvestcraft:rawtofeakitem>, <astralsorcery:blockflarelight>],
  [<atum:framed_lime_stained_glass>, <harvestcraft:jackfruititem>, <atum:framed_lime_stained_glass>]]);

//Recipe 203
recipes.remove(<artisanworktables:artisans_handsaw_manasteel>, false);
furnace.remove(<artisanworktables:artisans_handsaw_manasteel>);

ManaInfusion.addInfusion(<artisanworktables:artisans_handsaw_manasteel>, <artisanworktables:artisans_beaker_stone>, 5136);

//Recipe 204
recipes.remove(<twilightforest:steeleaf_chestplate>, false);
furnace.remove(<twilightforest:steeleaf_chestplate>);

recipes.addShaped("youre_an_expert_harry_204", <twilightforest:steeleaf_chestplate>, 
 [[<bloodmagic:living_armour_chest>, <minecraft:iron_pickaxe>, <bloodmagic:living_armour_chest>],
  [<minecraft:iron_pickaxe>, <atum:alabaster_carved_slab>, <minecraft:iron_pickaxe>],
  [<bloodmagic:living_armour_chest>, <minecraft:iron_pickaxe>, <bloodmagic:living_armour_chest>]]);

//Recipe 205
recipes.remove(<quark:stained_planks:15>, false);
furnace.remove(<quark:stained_planks:15>);

ManaInfusion.addInfusion(<quark:stained_planks:15>, <extrautils2:redstoneclock>, 3714);

//Recipe 206
recipes.remove(<midnight:dead_wood_stairs>, false);
furnace.remove(<midnight:dead_wood_stairs>);

recipes.addShaped("youre_an_expert_harry_206", <midnight:dead_wood_stairs>, 
 [[<quark:acacia_pressure_plate>, <tconstruct:seared_glass>, <quark:acacia_pressure_plate>],
  [<tconstruct:seared_glass>, <embers:field_chart>, <tconstruct:seared_glass>],
  [<quark:acacia_pressure_plate>, <tconstruct:seared_glass>, <quark:acacia_pressure_plate>]]);

//Recipe 207
recipes.remove(<harvestcraft:garlicmashedpotatoesitem>, false);
furnace.remove(<harvestcraft:garlicmashedpotatoesitem>);

furnace.addRecipe(<harvestcraft:garlicmashedpotatoesitem>, <betternether:cincinnasite_axe>);

//Recipe 208
recipes.remove(<artisanworktables:artisans_chisel_manasteel>, false);
furnace.remove(<artisanworktables:artisans_chisel_manasteel>);

recipes.addShaped("youre_an_expert_harry_208", <artisanworktables:artisans_chisel_manasteel>, 
 [[<trashcans:item_trash_can>, <theaurorian:silkberryplant>, <trashcans:item_trash_can>],
  [<harvestcraft:baconandeggsitem>, <abyssalcraft:ethaxiumlegs>, <harvestcraft:baconandeggsitem>],
  [<nuclearcraft:accelerator_electromagnet_active>, <atum:emmer>, <nuclearcraft:accelerator_electromagnet_active>]]);

//Recipe 209
recipes.remove(<harvestcraft:chickenchowmeinitem>, false);
furnace.remove(<harvestcraft:chickenchowmeinitem>);

ManaInfusion.addInfusion(<harvestcraft:chickenchowmeinitem>, <bountifulbaubles:shieldobsidian>, 3071);

//Recipe 210
recipes.remove(<botania:thirdeye>, false);
furnace.remove(<botania:thirdeye>);

ManaInfusion.addInfusion(<botania:thirdeye>, <harvestcraft:musselrawitem>, 6016);

//Recipe 211
recipes.remove(<taiga:duranite_ingot>, false);
furnace.remove(<taiga:duranite_ingot>);

recipes.addShaped("youre_an_expert_harry_211", <taiga:duranite_ingot>, 
 [[<galacticraftcore:oxygen_mask>, <aether_legacy:skyroot_pickaxe>, <galacticraftcore:oxygen_mask>],
  [<minecraft:iron_sword>, <tconstruct:smeltery_controller>, <minecraft:iron_sword>],
  [<atum:radiant_beacon>, <embers:ingot_copper>, <atum:radiant_beacon>]]);

//Recipe 212
recipes.remove(<abyssalcraft:diamondu>, false);
furnace.remove(<abyssalcraft:diamondu>);

ManaInfusion.addInfusion(<abyssalcraft:diamondu>, <midnight:deceitful_peat>, 3097);

//Recipe 213
recipes.remove(<artisanworktables:artisans_punch_gold>, false);
furnace.remove(<artisanworktables:artisans_punch_gold>);

recipes.addShaped("youre_an_expert_harry_213", <artisanworktables:artisans_punch_gold>, 
 [[<thaumcraft:crimson_praetor_helm>, <atum:limestone_hoe>, <thaumcraft:crimson_praetor_helm>],
  [<taiga:yrdeen_block>, <artisanworktables:artisans_grimoire_bone>, <taiga:yrdeen_block>],
  [<enderio:block_ender_charge>, <extrautils2:ironwood_leaves>, <enderio:block_ender_charge>]]);

//Recipe 214
recipes.remove(<nuclearcraft:dry_earth>, false);
furnace.remove(<nuclearcraft:dry_earth>);

recipes.addShaped("youre_an_expert_harry_214", <nuclearcraft:dry_earth>, 
 [[<abyssalcraft:staff>, <betternether:quartz_glass_framed_pane>, <abyssalcraft:staff>],
  [<betternether:quartz_glass_framed_pane>, <harvestcraft:anchovypepperonipizzaitem>, <betternether:quartz_glass_framed_pane>],
  [<abyssalcraft:staff>, <betternether:quartz_glass_framed_pane>, <abyssalcraft:staff>]]);

//Recipe 215
recipes.remove(<minecraft:cooked_rabbit>, false);
furnace.remove(<minecraft:cooked_rabbit>);

furnace.addRecipe(<minecraft:cooked_rabbit>, <taiga:vibranium_block>);

//Recipe 216
recipes.remove(<quark:stained_planks_light_blue_stairs>, false);
furnace.remove(<quark:stained_planks_light_blue_stairs>);

Apothecary.addRecipe(<quark:stained_planks_light_blue_stairs>, [<storagedrawers:upgrade_redstone:2>, <bigreactors:reactorcomputerport>, <bibliocraft:framingboard>, <midnight:double_nightshroom>, <dynamictreesthaumicbases:goldenoakseed>, <minecraft:redstone_torch>, <abyssalcraft:abyssalcobblestonewall>, <embers:axe_dawnstone>]);

//Recipe 217
recipes.remove(<thaumcraft:activator_rail>, false);
furnace.remove(<thaumcraft:activator_rail>);

recipes.addShaped("youre_an_expert_harry_217", <thaumcraft:activator_rail>, 
 [[<thaumicbases:thauminitelegs>, <projectred-illumination:cage_lamp:3>, <thaumicbases:thauminitelegs>],
  [<projectred-illumination:cage_lamp:3>, <minecraft:diamond_helmet>, <projectred-illumination:cage_lamp:3>],
  [<thaumicbases:thauminitelegs>, <projectred-illumination:cage_lamp:3>, <thaumicbases:thauminitelegs>]]);

//Recipe 218
recipes.remove(<forbidden_arcanus:arcane_dark_stone>, false);
furnace.remove(<forbidden_arcanus:arcane_dark_stone>);

recipes.addShapeless("youre_an_expert_harry_218", <forbidden_arcanus:arcane_dark_stone>, [<harvestcraft:lemon_sapling>, <harvestcraft:sesameseedsitem>, <betternether:cincinnasite_pickaxe>, <aether_legacy:leather_gloves>]);

//Recipe 219
recipes.remove(<abyssalcraft:nitre>, false);
furnace.remove(<abyssalcraft:nitre>);

recipes.addShaped("youre_an_expert_harry_219", <abyssalcraft:nitre>, 
 [[<thaumadditions:twilight_totem>, <thermalfoundation:armor.plate_aluminum>, <thaumadditions:twilight_totem>],
  [<thermalfoundation:tool.excavator_diamond>, <futuremc:sandstone_wall>, <thermalfoundation:tool.excavator_diamond>],
  [<appliedenergistics2:quartz_pillar>, <harvestcraft:apple_sapling>, <appliedenergistics2:quartz_pillar>]]);

//Recipe 220
recipes.remove(<harvestcraft:perchrawitem>, false);
furnace.remove(<harvestcraft:perchrawitem>);

furnace.addRecipe(<harvestcraft:perchrawitem>, <bibliocraft:bibliocreativelock>);

//Recipe 221
recipes.remove(<thaumcraft:creative_flux_sponge>, false);
furnace.remove(<thaumcraft:creative_flux_sponge>);

recipes.addShapeless("youre_an_expert_harry_221", <thaumcraft:creative_flux_sponge>, [<mekanism:compressedcarbon>, <botania:openbucket>, <tcomplement:manyullyn_helmet>, <abyssalcraft:apick>]);

//Recipe 222
recipes.remove(<artisanworktables:artisans_cutting_board_elementium>, false);
furnace.remove(<artisanworktables:artisans_cutting_board_elementium>);

furnace.addRecipe(<artisanworktables:artisans_cutting_board_elementium>, <minecraft:diamond_shovel>);

//Recipe 223
recipes.remove(<twilightforest:castle_stairs_mossy>, false);
furnace.remove(<twilightforest:castle_stairs_mossy>);

furnace.addRecipe(<twilightforest:castle_stairs_mossy>, <thaumicperiphery:caster_ember>);

//Recipe 224
recipes.remove(<appliedenergistics2:sky_compass>, false);
furnace.remove(<appliedenergistics2:sky_compass>);

recipes.addShaped("youre_an_expert_harry_224", <appliedenergistics2:sky_compass>, 
 [[<harvestcraft:pambanana>, <thaumcraft:banner_yellow>, <harvestcraft:pambanana>],
  [<thaumcraft:banner_yellow>, <botania:knockbackbelt>, <thaumcraft:banner_yellow>],
  [<harvestcraft:pambanana>, <thaumcraft:banner_yellow>, <harvestcraft:pambanana>]]);

//Recipe 225
recipes.remove(<twilightforest:trophy>, false);
furnace.remove(<twilightforest:trophy>);

recipes.addShaped("youre_an_expert_harry_225", <twilightforest:trophy>, 
 [[<atum:body_of_atum>, <thaumcraft:filter>, <atum:body_of_atum>],
  [<quark:colored_flowerpot_orange>, <minecraft:magma>, <quark:colored_flowerpot_orange>],
  [<enderio:block_painter>, <forbidden_arcanus:arcane_glass_pane>, <enderio:block_painter>]]);

//Recipe 226
recipes.remove(<extrautils2:itembuilderswand>, false);
furnace.remove(<extrautils2:itembuilderswand>);

recipes.addShaped("youre_an_expert_harry_226", <extrautils2:itembuilderswand>, 
 [[<spectrite:spectrite_arrow_special>, <atum:stoneguard_club>, <spectrite:spectrite_arrow_special>],
  [<quark:stone_limestone_slab>, <appliedenergistics2:matrix_frame>, <quark:stone_limestone_slab>],
  [<midnight:nightshroom_door>, <harvestcraft:clamchowderitem>, <midnight:nightshroom_door>]]);

//Recipe 227
recipes.remove(<arcanearchives:slaughtergleam>, false);
furnace.remove(<arcanearchives:slaughtergleam>);

furnace.remove(<immersiveengineering:metal:5>);
furnace.addRecipe(<arcanearchives:slaughtergleam>, <bigreactors:dustyellorium>);

//Recipe 228
recipes.remove(<conarm:leggings_core>, false);
furnace.remove(<conarm:leggings_core>);

ManaInfusion.addInfusion(<conarm:leggings_core>, <thermalfoundation:tool.excavator_steel>, 8175);

//Recipe 229
recipes.remove(<twilightforest:etched_nagastone>, false);
furnace.remove(<twilightforest:etched_nagastone>);

recipes.addShaped("youre_an_expert_harry_229", <twilightforest:etched_nagastone>, 
 [[<artisanworktables:artisans_athame_toughalloy>, <dynamictreesphc:pecanseed>, <artisanworktables:artisans_athame_toughalloy>],
  [<dynamictreesphc:pecanseed>, <theaurorian:ceruleanarrow>, <dynamictreesphc:pecanseed>],
  [<artisanworktables:artisans_athame_toughalloy>, <dynamictreesphc:pecanseed>, <artisanworktables:artisans_athame_toughalloy>]]);

//Recipe 230
recipes.remove(<harvestcraft:limejellyitem>, false);
furnace.remove(<harvestcraft:limejellyitem>);

recipes.addShaped("youre_an_expert_harry_230", <harvestcraft:limejellyitem>, 
 [[<astralsorcery:blockaltar:3>, <thaumcraft:fortress_chest>, <astralsorcery:blockaltar:3>],
  [<signpost:blockbasemodel4>, <quark:charred_nether_brick_stairs>, <signpost:blockbasemodel4>],
  [<taiga:obsidiorite_dust>, <arcanearchives:raw_quartz_cluster>, <taiga:obsidiorite_dust>]]);

//Recipe 231
recipes.remove(<netherex:wither_bone_leggings>, false);
furnace.remove(<netherex:wither_bone_leggings>);

recipes.addShapeless("youre_an_expert_harry_231", <netherex:wither_bone_leggings>, [<abyssalcraft:darkethaxiumbrickslab1>, <embers:block_aluminum>, <sonarcore:reinforcedstoneblock>, <theaurorian:tealavender>]);

//Recipe 232
recipes.remove(<artisanworktables:artisans_spanner_iron>, false);
furnace.remove(<artisanworktables:artisans_spanner_iron>);

recipes.addShaped("youre_an_expert_harry_232", <artisanworktables:artisans_spanner_iron>, 
 [[<thermalfoundation:armor.helmet_aluminum>, <artisanworktables:artisans_shears_invar>, <thermalfoundation:armor.helmet_aluminum>],
  [<artisanworktables:artisans_shears_invar>, <twilightforest:dark_trapdoor>, <artisanworktables:artisans_shears_invar>],
  [<thermalfoundation:armor.helmet_aluminum>, <artisanworktables:artisans_shears_invar>, <thermalfoundation:armor.helmet_aluminum>]]);

//Recipe 233
recipes.remove(<extrautils2:spike_stone>, false);
furnace.remove(<extrautils2:spike_stone>);

recipes.addShaped("youre_an_expert_harry_233", <extrautils2:spike_stone>, 
 [[<atum:alabaster>, <harvestcraft:cactussoupitem>, <atum:alabaster>],
  [<harvestcraft:cactussoupitem>, <quark:stained_planks_yellow_stairs>, <harvestcraft:cactussoupitem>],
  [<atum:alabaster>, <harvestcraft:cactussoupitem>, <atum:alabaster>]]);

//Recipe 234
recipes.remove(<quark:dark_prismarine_wall>, false);
furnace.remove(<quark:dark_prismarine_wall>);

Apothecary.addRecipe(<quark:dark_prismarine_wall>, [<astralsorcery:itemcrystalaxe>]);

//Recipe 235
recipes.remove(<quark:sandy_bricks_slab>, false);
furnace.remove(<quark:sandy_bricks_slab>);

recipes.addShaped("youre_an_expert_harry_235", <quark:sandy_bricks_slab>, 
 [[<thaumadditions:jar_mithminite>, <nuclearcraft:gelatin>, <thaumadditions:jar_mithminite>],
  [<plustic:osmiridiumnugget>, <bountifulbaubles:ringfreeaction>, <plustic:osmiridiumnugget>],
  [<embers:archaic_tile>, <thermalfoundation:tool.sickle_tin>, <embers:archaic_tile>]]);

//Recipe 236
recipes.remove(<harvestcraft:redvelvetcakeitem>, false);
furnace.remove(<harvestcraft:redvelvetcakeitem>);

recipes.addShaped("youre_an_expert_harry_236", <harvestcraft:redvelvetcakeitem>, 
 [[<draconicevolution:portal>, <tcomplement:scorched_stairs_paver>, <draconicevolution:portal>],
  [<tcomplement:scorched_stairs_paver>, <harvestcraft:blackberryitem>, <tcomplement:scorched_stairs_paver>],
  [<draconicevolution:portal>, <tcomplement:scorched_stairs_paver>, <draconicevolution:portal>]]);

//Recipe 237
recipes.remove(<twilightforest:ore_map>, false);
furnace.remove(<twilightforest:ore_map>);

recipes.addShaped("youre_an_expert_harry_237", <twilightforest:ore_map>, 
 [[<oreberries:tin_oreberry>, <atum:scepter_ptah>, <oreberries:tin_oreberry>],
  [<thaumcraft:essentia_output>, <harvestcraft:shepardspieitem>, <thaumcraft:essentia_output>],
  [<nuclearcraft:berkelium:7>, <openblocks:block_breaker>, <nuclearcraft:berkelium:7>]]);

//Recipe 238
recipes.remove(<artisanworktables:artisans_pan_boronnitride>, false);
furnace.remove(<artisanworktables:artisans_pan_boronnitride>);

furnace.addRecipe(<artisanworktables:artisans_pan_boronnitride>, <aether_legacy:phoenix_gloves>);

//Recipe 239
recipes.remove(<atum:scepter_tefnut>, false);
furnace.remove(<atum:scepter_tefnut>);

ManaInfusion.addInfusion(<atum:scepter_tefnut>, <thaumicbases:crystalblockentropy>, 4108);

//Recipe 240
recipes.remove(<artisanworktables:artisans_hammer_bone>, false);
furnace.remove(<artisanworktables:artisans_hammer_bone>);

Apothecary.addRecipe(<artisanworktables:artisans_hammer_bone>, [<openblocks:wrench>, <artisanworktables:artisans_carver_copper>, <embers:hoe_electrum>, <quark:stonebrick_mossy_wall>, <atum:feet_of_ra>]);

//Recipe 241
recipes.remove(<atum:framed_magenta_stained_glass>, false);
furnace.remove(<atum:framed_magenta_stained_glass>);

recipes.addShaped("youre_an_expert_harry_241", <atum:framed_magenta_stained_glass>, 
 [[<thaumcraft:fabric>, <atum:thin_framed_orange_stained_glass>, <thaumcraft:fabric>],
  [<quark:world_stone_bricks>, <bloodmagic:demon_pillar_cap_2:1>, <quark:world_stone_bricks>],
  [<atum:scepter_ra>, <futuremc:pufferfish_bucket>, <atum:scepter_ra>]]);

//Recipe 242
recipes.remove(<thaumcraft:stairs_silverwood>, false);
furnace.remove(<thaumcraft:stairs_silverwood>);

furnace.addRecipe(<thaumcraft:stairs_silverwood>, <thaumadditions:crystal_block>);

//Recipe 243
recipes.remove(<aether_legacy:golden_parachute>, false);
furnace.remove(<aether_legacy:golden_parachute>);

recipes.addShaped("youre_an_expert_harry_243", <aether_legacy:golden_parachute>, 
 [[<baubles:ring>, <harvestcraft:weekendpicnicitem>, <baubles:ring>],
  [<thaumcraft:mirrored_glass>, <harvestcraft:rivermudcakeitem>, <thaumcraft:mirrored_glass>],
  [<arcanearchives:gemsocket>, <abyssalcraft:coraliumcobblestonestairs>, <arcanearchives:gemsocket>]]);

//Recipe 244
recipes.remove(<harvestcraft:gumboitem>, false);
furnace.remove(<harvestcraft:gumboitem>);

recipes.addShaped("youre_an_expert_harry_244", <harvestcraft:gumboitem>, 
 [[<abyssalcraft:statetransformer>, <atum:tefnuts_rain>, <abyssalcraft:statetransformer>],
  [<harvestcraft:strawberryjellyitem>, <harvestcraft:market>, <harvestcraft:strawberryjellyitem>],
  [<immersiveengineering:stone_decoration:8>, <harvestcraft:shadedgarden>, <immersiveengineering:stone_decoration:8>]]);

//Recipe 245
recipes.remove(<scalinghealth:crystalore>, false);
furnace.remove(<scalinghealth:crystalore>);

recipes.addShaped("youre_an_expert_harry_245", <scalinghealth:crystalore>, 
 [[<minecraft:dispenser>, <notenoughwands:freezing_wand>, <minecraft:dispenser>],
  [<notenoughwands:freezing_wand>, <harvestcraft:tomatosoupitem>, <notenoughwands:freezing_wand>],
  [<minecraft:dispenser>, <notenoughwands:freezing_wand>, <minecraft:dispenser>]]);

//Recipe 246
recipes.remove(<twilightforest:arctic_chestplate>, false);
furnace.remove(<twilightforest:arctic_chestplate>);

recipes.addShaped("youre_an_expert_harry_246", <twilightforest:arctic_chestplate>, 
 [[<immersiveengineering:metal_device1>, <thaumcraft:scribing_tools>, <immersiveengineering:metal_device1>],
  [<artisanworktables:artisans_groover_iron>, <astralsorcery:itemenchantmentamulet>, <artisanworktables:artisans_groover_iron>],
  [<twilightforest:auroralized_glass>, <aether_legacy:obsidian_boots>, <twilightforest:auroralized_glass>]]);

//Recipe 247
recipes.remove(<atum:porphyry_polished_wall>, false);
furnace.remove(<atum:porphyry_polished_wall>);

Apothecary.addRecipe(<atum:porphyry_polished_wall>, [<taiga:duranite_ore>, <ore:paneGlassPurple>, <minecraft:observer>, <enderio:item_dark_steel_treetap>, <minecraft:written_book>, <thermalexpansion:machine:10>, <forbidden_arcanus:arcane_gold_door>, <quark:vertical_planks>, <harvestcraft:strawberrysmoothieitem>]);

//Recipe 248
recipes.remove(<harvestcraft:mincepieitem>, false);
furnace.remove(<harvestcraft:mincepieitem>);

recipes.addShaped("youre_an_expert_harry_248", <harvestcraft:mincepieitem>, 
 [[<thaumadditions:amber_lamp>, <extrabotany:infinitewine>, <thaumadditions:amber_lamp>],
  [<artifacts:lucky_horseshoe>, <harvestcraft:candledeco4>, <artifacts:lucky_horseshoe>],
  [<harvestcraft:fruitcrumbleitem>, <artisanworktables:artisans_pliers_electrum>, <harvestcraft:fruitcrumbleitem>]]);

//Recipe 249
recipes.remove(<quark:cobbed_stone_wall>, false);
furnace.remove(<quark:cobbed_stone_wall>);

ManaInfusion.addInfusion(<quark:cobbed_stone_wall>, <harvestcraft:greenheartfishitem>, 3376);

//Recipe 250
recipes.remove(<theaurorian:auroriantallgrass>, false);
furnace.remove(<theaurorian:auroriantallgrass>);

ManaInfusion.addInfusion(<theaurorian:auroriantallgrass>, <atum:limestone_brick_carved>, 9482);

//Recipe 251
recipes.remove(<embers:alchemy_pedestal>, false);
furnace.remove(<embers:alchemy_pedestal>);

Apothecary.addRecipe(<embers:alchemy_pedestal>, [<extrabotany:rewardbag:1>, <draconicevolution:crystal_binder>, <densemetals:dense_zirconium_ore>, <enderio:block_end_iron_bars>]);

//Recipe 252
recipes.remove(<bibliocraft:paintingframesimple:5>, false);
furnace.remove(<bibliocraft:paintingframesimple:5>);

recipes.addShapeless("youre_an_expert_harry_252", <bibliocraft:paintingframesimple:5>, [<artisanworktables:artisans_punch_elementium>, <forbidden_arcanus:edelwood_stick>, <heartdrops:heart>, <abyssalcraft:coraliumcobblestoneslab2>]);

//Recipe 253
recipes.remove(<thaumcraft:bath_salts>, false);
furnace.remove(<thaumcraft:bath_salts>);

recipes.addShapeless("youre_an_expert_harry_253", <thaumcraft:bath_salts>, [<botania:biomestonea3stairs>, <thaumicbases:thauminiteaxe>, <harvestcraft:friedgreentomatoesitem>, <midnight:shadowroot_hoe>]);

//Recipe 254
recipes.remove(<abyssalcraft:dplate>, false);
furnace.remove(<abyssalcraft:dplate>);

furnace.addRecipe(<abyssalcraft:dplate>, <harvestcraft:pamtamarind>);

//Recipe 255
recipes.remove(<psi:cad_battery>, false);
furnace.remove(<psi:cad_battery>);

Apothecary.addRecipe(<psi:cad_battery>, [<extrautils2:rainbowgenerator>, <conarm:armor_plate>, <thaumicwonders:madness_engine>]);

//Recipe 256
recipes.remove(<futuremc:netherite_boots>, false);
furnace.remove(<futuremc:netherite_boots>);

recipes.addShaped("youre_an_expert_harry_256", <futuremc:netherite_boots>, 
 [[<harvestcraft:almonditem>, <artisanworktables:artisans_sifter_gold>, <harvestcraft:almonditem>],
  [<embers:block_nickel>, <midnight:rouxe>, <embers:block_nickel>],
  [<galacticraftcore:sensor_glasses>, <embers:item_transfer>, <galacticraftcore:sensor_glasses>]]);

//Recipe 257
recipes.remove(<artisanworktables:artisans_file_toughalloy>, false);
furnace.remove(<artisanworktables:artisans_file_toughalloy>);

furnace.addRecipe(<artisanworktables:artisans_file_toughalloy>, <quark:stained_planks_magenta_slab>);

//Recipe 258
recipes.remove(<harvestcraft:grainbaititem>, false);
furnace.remove(<harvestcraft:grainbaititem>);

ManaInfusion.addInfusion(<harvestcraft:grainbaititem>, <minecraft:hay_block>, 8234);

//Recipe 259
recipes.remove(<harvestcraft:durianmilkshakeitem>, false);
furnace.remove(<harvestcraft:durianmilkshakeitem>);

recipes.addShapeless("youre_an_expert_harry_259", <harvestcraft:durianmilkshakeitem>, [<twilightforest:mangrove_slab>, <minecraft:wooden_pressure_plate>, <midnight:dead_wood_log>, <minecraft:chest_minecart>]);

//Recipe 260
recipes.remove(<ferdinandsflowers:block_dye_brickb>, false);
furnace.remove(<ferdinandsflowers:block_dye_brickb>);

Apothecary.addRecipe(<ferdinandsflowers:block_dye_brickb>, [<atum:ceramic_wall_green>, <immersiveengineering:metal_decoration0:7>, <thaumcraft:void_helm>]);

//Recipe 261
recipes.remove(<ferdinandsflowers:block_stone_light:3>, false);
furnace.remove(<ferdinandsflowers:block_stone_light:3>);

recipes.addShaped("youre_an_expert_harry_261", <ferdinandsflowers:block_stone_light:3>, 
 [[<dynamictreesphc:cherryseed>, <thaumicbases:crystalblockmixed>, <dynamictreesphc:cherryseed>],
  [<thaumicbases:crystalblockmixed>, <harvestcraft:spiceleafseeditem>, <thaumicbases:crystalblockmixed>],
  [<dynamictreesphc:cherryseed>, <thaumicbases:crystalblockmixed>, <dynamictreesphc:cherryseed>]]);

//Recipe 262
recipes.remove(<futuremc:banner_pattern:3>, false);
furnace.remove(<futuremc:banner_pattern:3>);

recipes.addShapeless("youre_an_expert_harry_262", <futuremc:banner_pattern:3>, [<thaumcraft:elemental_hoe>, <abyssalcraft:dboots>, <netherex:icy_nether_brick_fence>, <artisanworktables:artisans_cutters_boronnitride>]);

//Recipe 263
recipes.remove(<midnight:nightstone_wall>, false);
furnace.remove(<midnight:nightstone_wall>);

ManaInfusion.addInfusion(<midnight:nightstone_wall>, <atum:loot_sapphire_idol>, 8279);

//Recipe 264
recipes.remove(<artisanworktables:artisans_mortar_wood>, false);
furnace.remove(<artisanworktables:artisans_mortar_wood>);

recipes.addShaped("youre_an_expert_harry_264", <artisanworktables:artisans_mortar_wood>, 
 [[<harvestcraft:spagettiandmeatballsitem>, <quark:sandy_bricks_stairs>, <harvestcraft:spagettiandmeatballsitem>],
  [<bibliocraft:bookcasecreative:3>, <minecraft:sugar>, <bibliocraft:bookcasecreative:3>],
  [<forbidden_arcanus:seed_bullet>, <thermalfoundation:tool.fishing_rod_gold>, <forbidden_arcanus:seed_bullet>]]);

//Recipe 265
recipes.remove(<theaurorian:runestonelootkey>, false);
furnace.remove(<theaurorian:runestonelootkey>);

recipes.addShaped("youre_an_expert_harry_265", <theaurorian:runestonelootkey>, 
 [[<harvestcraft:starfruitsmoothieitem>, <bloodmagic:mimic:1>, <harvestcraft:starfruitsmoothieitem>],
  [<artisanworktables:artisans_razor_terrasteel>, <thaumicenergistics:essentia_export>, <artisanworktables:artisans_razor_terrasteel>],
  [<minecraft:glass_bottle>, <conarm:gauntlet_mat>, <minecraft:glass_bottle>]]);

//Recipe 266
recipes.remove(<harvestcraft:succotashitem>, false);
furnace.remove(<harvestcraft:succotashitem>);

ManaInfusion.addInfusion(<harvestcraft:succotashitem>, <tcomplement:knightslime_leggings>, 4553);

//Recipe 267
recipes.remove(<minecraft:spruce_fence>, false);
furnace.remove(<minecraft:spruce_fence>);

Apothecary.addRecipe(<minecraft:spruce_fence>, [<embers:ingot_nickel>, <thaumicbases:bloodyboots>, <midnight:dead_wood_button>, <quark:sandy_bricks_stairs>, <extrabotany:shadowwarriorlegs>, <extrabotany:material:9>, <galacticraftplanets:bucket_sulphuric_acid>, <nuclearcraft:legs_boron_nitride>, <forbidden_arcanus:chorus_pearl>]);

//Recipe 268
recipes.remove(<harvestcraft:hotwingsitem>, false);
furnace.remove(<harvestcraft:hotwingsitem>);

furnace.addRecipe(<harvestcraft:hotwingsitem>, <thaumicaugmentation:impetus_diffuser>);

//Recipe 269
recipes.remove(<quark:stone_wall>, false);
furnace.remove(<quark:stone_wall>);

recipes.addShapeless("youre_an_expert_harry_269", <quark:stone_wall>, [<sonarcore:stablestoneblackrimmed_pink>, <spectrite:spectrite_wither_skeleton_skull>, <taiga:valyrium_nugget>, <botania:brewvial>]);

//Recipe 270
recipes.remove(<enderio:block_unholy_dark_fused_glass:15>, false);
furnace.remove(<enderio:block_unholy_dark_fused_glass:15>);

recipes.addShaped("youre_an_expert_harry_270", <enderio:block_unholy_dark_fused_glass:15>, 
 [[<atum:deadwood_torch>, <artisanworktables:artisans_driver_gold>, <atum:deadwood_torch>],
  [<artisanworktables:artisans_driver_gold>, <harvestcraft:apricotyogurtitem>, <artisanworktables:artisans_driver_gold>],
  [<atum:deadwood_torch>, <artisanworktables:artisans_driver_gold>, <atum:deadwood_torch>]]);

//Recipe 271
recipes.remove(<harvestcraft:deluxenachoesitem>, false);
furnace.remove(<harvestcraft:deluxenachoesitem>);

recipes.addShaped("youre_an_expert_harry_271", <harvestcraft:deluxenachoesitem>, 
 [[<quark:reed_block_wall>, <thaumicperiphery:caster_elementium>, <quark:reed_block_wall>],
  [<thaumicperiphery:caster_elementium>, <harvestcraft:peanutseeditem>, <thaumicperiphery:caster_elementium>],
  [<quark:reed_block_wall>, <thaumicperiphery:caster_elementium>, <quark:reed_block_wall>]]);

//Recipe 272
recipes.remove(<nuclearcraft:geiger_block>, false);
furnace.remove(<nuclearcraft:geiger_block>);

furnace.addRecipe(<nuclearcraft:geiger_block>, <artisanworktables:artisans_file_osmium>);

//Recipe 273
recipes.remove(<atum:ceramic_stairs_brown>, false);
furnace.remove(<atum:ceramic_stairs_brown>);

recipes.addShaped("youre_an_expert_harry_273", <atum:ceramic_stairs_brown>, 
 [[<thaumadditions:chiseled_amber_block>, <enderio:block_ender_charge>, <thaumadditions:chiseled_amber_block>],
  [<taiga:ovium_dust>, <midnight:rockshroom_bricks>, <taiga:ovium_dust>],
  [<harvestcraft:starfruit_sapling>, <yurtmod:shamiana_orange>, <harvestcraft:starfruit_sapling>]]);

//Recipe 274
recipes.remove(<nuclearcraft:glowing_mushroom>, false);
furnace.remove(<nuclearcraft:glowing_mushroom>);

recipes.addShaped("youre_an_expert_harry_274", <nuclearcraft:glowing_mushroom>, 
 [[<harvestcraft:sausagerollitem>, <draconicevolution:crafting_injector>, <harvestcraft:sausagerollitem>],
  [<theaurorian:urn>, <netherex:red_nether_brick_fence>, <theaurorian:urn>],
  [<minecraft:record_mellohi>, <galacticraftplanets:rocket_t2:1>, <minecraft:record_mellohi>]]);

//Recipe 275
recipes.remove(<artisanworktables:artisans_compass_copper>, false);
furnace.remove(<artisanworktables:artisans_compass_copper>);

recipes.addShaped("youre_an_expert_harry_275", <artisanworktables:artisans_compass_copper>, 
 [[<tconstruct:seared_stairs_stone>, <botania:superlavapendant>, <tconstruct:seared_stairs_stone>],
  [<botania:superlavapendant>, <thaumicenergistics:essentia_cell_creative>, <botania:superlavapendant>],
  [<tconstruct:seared_stairs_stone>, <botania:superlavapendant>, <tconstruct:seared_stairs_stone>]]);

//Recipe 276
recipes.remove(<storagedrawers:shroud_key>, false);
furnace.remove(<storagedrawers:shroud_key>);

furnace.addRecipe(<storagedrawers:shroud_key>, <artisanworktables:artisans_spanner_tin>);

//Recipe 277
recipes.remove(<aether_legacy:aether_dirt>, false);
furnace.remove(<aether_legacy:aether_dirt>);

recipes.addShaped("youre_an_expert_harry_277", <aether_legacy:aether_dirt>, 
 [[<yurtmod:shamiana_black>, <abyssalcraft:darkcobbleslab1>, <yurtmod:shamiana_black>],
  [<galacticraftcore:solar>, <quark:gravisand>, <galacticraftcore:solar>],
  [<atum:ceramic_tile_lime>, <artisanworktables:artisans_grimoire_manasteel>, <atum:ceramic_tile_lime>]]);

//Recipe 278
recipes.remove(<midnight:nagrilite_pressure_plate>, false);
furnace.remove(<midnight:nagrilite_pressure_plate>);

recipes.addShaped("youre_an_expert_harry_278", <midnight:nagrilite_pressure_plate>, 
 [[<artisanworktables:artisans_quill_nickel>, <thaumicaugmentation:rift_monitor>, <artisanworktables:artisans_quill_nickel>],
  [<thaumicaugmentation:rift_monitor>, <harvestcraft:doughitem>, <thaumicaugmentation:rift_monitor>],
  [<artisanworktables:artisans_quill_nickel>, <thaumicaugmentation:rift_monitor>, <artisanworktables:artisans_quill_nickel>]]);

//Recipe 279
recipes.remove(<galacticraftplanets:geothermal_generator>, false);
furnace.remove(<galacticraftplanets:geothermal_generator>);

ManaInfusion.addInfusion(<galacticraftplanets:geothermal_generator>, <harvestcraft:netherwingsitem>, 3003);

//Recipe 280
recipes.remove(<embers:stamp_flat>, false);
furnace.remove(<embers:stamp_flat>);

recipes.addShaped("youre_an_expert_harry_280", <embers:stamp_flat>, 
 [[<thaumicbases:oldgold>, <artisanworktables:artisans_grimoire_terrasteel>, <thaumicbases:oldgold>],
  [<thaumcraft:void_pick>, <harvestcraft:figjellyitem>, <thaumcraft:void_pick>],
  [<artisanworktables:artisans_compass_steel>, <botania:brewery>, <artisanworktables:artisans_compass_steel>]]);

//Recipe 281
recipes.remove(<nuclearcraft:record_wanderer>, false);
furnace.remove(<nuclearcraft:record_wanderer>);

furnace.addRecipe(<nuclearcraft:record_wanderer>, <atum:lit_redstone_ore>);

//Recipe 282
recipes.remove(<sonarcore:stablestonerimmed_orange>, false);
furnace.remove(<sonarcore:stablestonerimmed_orange>);

recipes.addShaped("youre_an_expert_harry_282", <sonarcore:stablestonerimmed_orange>, 
 [[<harvestcraft:pepperjellyandcrackersitem>, <thaumicbases:bloodycloth>, <harvestcraft:pepperjellyandcrackersitem>],
  [<thaumicbases:bloodycloth>, <abyssalcraft:coraliumu>, <thaumicbases:bloodycloth>],
  [<harvestcraft:pepperjellyandcrackersitem>, <thaumicbases:bloodycloth>, <harvestcraft:pepperjellyandcrackersitem>]]);

//Recipe 283
recipes.remove(<betternether:cincinnasite_pedestal>, false);
furnace.remove(<betternether:cincinnasite_pedestal>);

ManaInfusion.addInfusion(<betternether:cincinnasite_pedestal>, <quark:turf_slab>, 7703);

//Recipe 284
recipes.remove(<aether_legacy:golden_pendant>, false);
furnace.remove(<aether_legacy:golden_pendant>);

ManaInfusion.addInfusion(<aether_legacy:golden_pendant>, <abyssalcraft:coraliumore>, 7357);

//Recipe 285
recipes.remove(<astralsorcery:blockcelestialgateway>, false);
furnace.remove(<astralsorcery:blockcelestialgateway>);

recipes.addShapeless("youre_an_expert_harry_285", <astralsorcery:blockcelestialgateway>, [<galacticraftplanets:methane_canister_partial:1>, <nuclearcraft:record_end_of_the_world>, <artisanworktables:artisans_pencil_platinum>, <appliedenergistics2:certus_quartz_pickaxe>]);

//Recipe 286
recipes.remove(<harvestcraft:coffeeitem>, false);
furnace.remove(<harvestcraft:coffeeitem>);

Apothecary.addRecipe(<harvestcraft:coffeeitem>, [<abyssalcraft:dreadportal>, <artisanworktables:artisans_chisel_aluminum>]);

//Recipe 287
recipes.remove(<draconicevolution:draconic_legs>, false);
furnace.remove(<draconicevolution:draconic_legs>);

Apothecary.addRecipe(<draconicevolution:draconic_legs>, [<thaumcraft:nitor_silver>, <taiga:abyssum_ore>, <artisanworktables:artisans_burner_flint>, <bibliocraft:markerpole>, <artisanworktables:artisans_pan_platinum>, <bountifulbaubles:trinketmixeddragonscale>, <astralsorcery:itemcape>, <storagedrawers:upgrade_redstone:2>]);

//Recipe 288
recipes.remove(<atum:chiseled_wall>, false);
furnace.remove(<atum:chiseled_wall>);

recipes.addShapeless("youre_an_expert_harry_288", <atum:chiseled_wall>, [<forbidden_arcanus:reinforced_arcane_golden_pickaxe>, <theaurorian:darkamulet>, <embers:shard_ember>, <harvestcraft:sausageinbreaditem>]);

//Recipe 289
recipes.remove(<taiga:ovium_ore>, false);
furnace.remove(<taiga:ovium_ore>);

furnace.addRecipe(<taiga:ovium_ore>, <botania:pump>);

//Recipe 290
recipes.remove(<artisanworktables:artisans_mortar_diamond>, false);
furnace.remove(<artisanworktables:artisans_mortar_diamond>);

recipes.addShapeless("youre_an_expert_harry_290", <artisanworktables:artisans_mortar_diamond>, [<quark:fire_stone_stairs>, <forbidden_arcanus:tyr_leggings>, <netherex:smooth_basalt_fence_gate>, <dynamictreesphc:hazelnutseed>]);

//Recipe 291
recipes.remove(<embers:ore_quartz>, false);
furnace.remove(<embers:ore_quartz>);

Apothecary.addRecipe(<embers:ore_quartz>, [<tcomplement:high_oven_controller>, <quark:stained_planks_gray_stairs>, <harvestcraft:huckleberryitem>, <thaumicbases:crystalblockwater>, <harvestcraft:pampaperbark>, <twilightforest:unripe_trollber>, <harvestcraft:pumpkinspicelatteitem>, <embers:pickaxe_electrum>]);

//Recipe 292
recipes.remove(<thaumcraft:placeholder_anvil>, false);
furnace.remove(<thaumcraft:placeholder_anvil>);

recipes.addShapeless("youre_an_expert_harry_292", <thaumcraft:placeholder_anvil>, [<harvestcraft:kaleseeditem>, <quark:elder_prismarine_slab>, <notenoughwands:master_protection_wand>, <artisanworktables:artisans_pencil_aluminum>]);

//Recipe 293
recipes.remove(<harvestcraft:cherryjellyitem>, false);
furnace.remove(<harvestcraft:cherryjellyitem>);

recipes.addShaped("youre_an_expert_harry_293", <harvestcraft:cherryjellyitem>, 
 [[<harvestcraft:chocovoxelsitem>, <harvestcraft:starfruitsmoothieitem>, <harvestcraft:chocovoxelsitem>],
  [<harvestcraft:starfruitsmoothieitem>, <quark:thatch_stairs>, <harvestcraft:starfruitsmoothieitem>],
  [<harvestcraft:chocovoxelsitem>, <harvestcraft:starfruitsmoothieitem>, <harvestcraft:chocovoxelsitem>]]);

//Recipe 294
recipes.remove(<twilightforest:canopy_fence>, false);
furnace.remove(<twilightforest:canopy_fence>);

recipes.addShaped("youre_an_expert_harry_294", <twilightforest:canopy_fence>, 
 [[<betternether:cincinnasite_ore>, <embers:axe_tin>, <betternether:cincinnasite_ore>],
  [<embers:axe_tin>, <harvestcraft:raspberrytrifleitem>, <embers:axe_tin>],
  [<betternether:cincinnasite_ore>, <embers:axe_tin>, <betternether:cincinnasite_ore>]]);

