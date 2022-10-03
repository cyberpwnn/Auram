#priority 46
import mods.botania.RuneAltar;
import mods.botania.ElvenTrade;
import mods.botaniatweaks.AgglomerationMultiblock;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.Agglomeration;
import mods.botania.Apothecary;
import mods.botania.ManaInfusion;
// RECIPE LEVEL: 6


//Recipe 0
recipes.remove(<minecraft:clay_ball>, false);
furnace.remove(<minecraft:clay_ball>);
ManaInfusion.removeRecipe(<minecraft:clay_ball>);

ElvenTrade.addRecipe([<minecraft:clay_ball>], [<tinker_io:speedupg>, <thaumcraft:amber_brick>]);

//Recipe 1
recipes.remove(<minecraft:command_block>, false);
furnace.remove(<minecraft:command_block>);

ElvenTrade.addRecipe([<minecraft:command_block>], [<quark:custom_bookshelf:2>, <aether_legacy:skyroot_bed_item>]);

//Recipe 2
recipes.remove(<minecraft:clay>, false);
furnace.remove(<minecraft:clay>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<minecraft:clay>).inputs([<abyssalcraft:whead>, <malisisdoors:big_door_oak_3x3>, <atum:ceramic_wall_black>]).manaCost(400000).multiblock(AgglomerationMultiblock.create().center(<botania:livingrock>).edge(<botania:mushroom:1>).corner(<forbidden_arcanus:cherrywood_log>).edgeReplace(<minecraft:lapis_block>).cornerReplace(<botania:livingrock>)));

// RECIPE LEVEL: 5


//Recipe 3
recipes.remove(<aether_legacy:skyroot_bed_item>, false);
furnace.remove(<aether_legacy:skyroot_bed_item>);

RuneAltar.addRecipe(<aether_legacy:skyroot_bed_item>, [<thermalfoundation:tool.hoe_invar>, <twilightforest:zombie_scepter>, <abyssalcraft:stone>, <quark:fire_stone_brick_slab>, <conarm:gauntlet_mat_attack>], 9000);

//Recipe 4
recipes.remove(<botania:mushroom:1>, false);
furnace.remove(<botania:mushroom:1>);

ElvenTrade.addRecipe([<botania:mushroom:1>], [<thaumicwonders:cinderpearl_seed>, <artisanworktables:artisans_driver_copper>]);

//Recipe 5
recipes.remove(<tinker_io:speedupg>, false);
furnace.remove(<tinker_io:speedupg>);

ElvenTrade.addRecipe([<tinker_io:speedupg>], [<quark:tallow>, <opencomputers:rack>]);

//Recipe 6
recipes.remove(<abyssalcraft:whead>, false);
furnace.remove(<abyssalcraft:whead>);

RuneAltar.addRecipe(<abyssalcraft:whead>, [<materialis:pokefennium_block>, <nuclearcraft:cooler:7>, <appliedenergistics2:drive>], 6000);

//Recipe 7
recipes.remove(<malisisdoors:big_door_oak_3x3>, false);
furnace.remove(<malisisdoors:big_door_oak_3x3>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<malisisdoors:big_door_oak_3x3>).inputs([<harvestcraft:chipsanddipitem>, <thaumicbases:goldenlogs>, <projectred-illumination:inverted_fixture_light:10>]).manaCost(200000));

//Recipe 8
recipes.remove(<thaumcraft:amber_brick>, false);
furnace.remove(<thaumcraft:amber_brick>);

recipes.addShaped("youre_an_expert_harry_8", <thaumcraft:amber_brick>, 
 [[<harvestcraft:cabbageseeditem>, <nuclearcraft:portable_ender_chest>, <thaumcraft:sapling_silverwood>],
  [<abyssalcraft:dsbutton>, <arcanearchives:shaped_quartz>, <harvestcraft:groundturkeyitem>],
  [<theaurorian:silkshroomstew>, <botanicadds:mana_lapis_block>, <artisanworktables:artisans_athame_tin>]]);

//Recipe 9
recipes.remove(<quark:custom_bookshelf:2>, false);
furnace.remove(<quark:custom_bookshelf:2>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<quark:custom_bookshelf:2>).inputs([<aether_legacy:lightning_sword>, <artisanworktables:artisans_compass_bone>, <aether_legacy:mossy_holystone_double_slab>]).manaCost(300000));

//Recipe 10
recipes.remove(<forbidden_arcanus:cherrywood_log>, false);
furnace.remove(<forbidden_arcanus:cherrywood_log>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<forbidden_arcanus:cherrywood_log>).inputs([<harvestcraft:friedpecanokraitem>, <harvestcraft:orangejellyitem>, <botania:dreamwood1slab>]).manaCost(500000).multiblock(AgglomerationMultiblock.create().center(<botania:livingrock>).edge(<artisanworktables:workstation:1>).corner(<harvestcraft:walnut_sapling>).edgeReplace(<minecraft:lapis_block>).cornerReplace(<botania:livingrock>)));

//Recipe 11
recipes.remove(<atum:ceramic_wall_black>, false);
furnace.remove(<atum:ceramic_wall_black>);

recipes.addShaped("youre_an_expert_harry_11", <atum:ceramic_wall_black>, 
 [[<quark:bark_birch_wall>, <mekanism:sawdust>, <harvestcraft:pomegranateyogurtitem>],
  [<forbidden_arcanus:pixi>, <artisanworktables:artisans_chisel_hardcarbon>, <extrautils2:angelring:1>],
  [<arcanearchives:orderstone>, <artisanworktables:artisans_athame_nickel>, <mekanism:anchorupgrade>]]);

// RECIPE LEVEL: 4


//Recipe 12
recipes.remove(<mekanism:anchorupgrade>, false);
furnace.remove(<mekanism:anchorupgrade>);

ManaInfusion.addAlchemy(<mekanism:anchorupgrade>, <aether_legacy:holystone_brick_wall>, 4339);

//Recipe 13
recipes.remove(<thaumcraft:sapling_silverwood>, false);
furnace.remove(<thaumcraft:sapling_silverwood>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<thaumcraft:sapling_silverwood>).inputs([<taiga:psychonium_nugget>, <enderio:block_not_holy_dark_fused_quartz:15>, <artisanworktables:artisans_hammer_nickel>]).manaCost(200000));

//Recipe 14
recipes.remove(<extrautils2:angelring:1>, false);
furnace.remove(<extrautils2:angelring:1>);

RuneAltar.addRecipe(<extrautils2:angelring:1>, [<minecraft:glowstone>, <dynamictreesthaumicbases:rainbowcactusbranch>, <thermalfoundation:armor.legs_platinum>, <harvestcraft:grapefruityogurtitem>, <nuclearcraft:solar_panel_elite>, <extrautils2:suncrystal>, <harvestcraft:honey>], 6000);

//Recipe 15
recipes.remove(<arcanearchives:orderstone>, false);
furnace.remove(<arcanearchives:orderstone>);

ElvenTrade.addRecipe([<arcanearchives:orderstone>], [<harvestcraft:chilipepperitem>, <quark:stone_andesite_bricks_stairs>]);

//Recipe 16
recipes.remove(<botanicadds:mana_lapis_block>, false);
furnace.remove(<botanicadds:mana_lapis_block>);
ManaInfusion.removeRecipe(<botanicadds:mana_lapis_block>);

recipes.addShaped("youre_an_expert_harry_16", <botanicadds:mana_lapis_block>, 
 [[<abyssalcraft:nitreore>, <abyssalcraft:yogsothothcoin>, <abyssalcraft:nitreore>],
  [<abyssalcraft:dsbfence>, <extrautils2:snowglobe>, <abyssalcraft:dsbfence>],
  [<harvestcraft:mintcupcakeitem>, <artisanworktables:artisans_hatchet_tin>, <harvestcraft:mintcupcakeitem>]]);

//Recipe 17
recipes.remove(<thaumicbases:goldenlogs>, false);
furnace.remove(<thaumicbases:goldenlogs>);

ElvenTrade.addRecipe([<thaumicbases:goldenlogs>], [<harvestcraft:broccolimacitem>, <enderio:item_big_item_filter>]);

//Recipe 18
recipes.remove(<forbidden_arcanus:pixi>, false);
furnace.remove(<forbidden_arcanus:pixi>);

recipes.addShaped("youre_an_expert_harry_18", <forbidden_arcanus:pixi>, 
 [[<thaumicbases:irongreatwood>, <twilightforest:cooked_venison>, <thaumicbases:irongreatwood>],
  [<thaumadditions:mithminite_fabric>, <densemetals:dense_nether_iron_ore>, <thaumadditions:mithminite_fabric>],
  [<astralsorcery:itemsextant>, <storagedrawers:keybutton:3>, <astralsorcery:itemsextant>]]);

//Recipe 19
recipes.remove(<thermalfoundation:tool.hoe_invar>, false);
furnace.remove(<thermalfoundation:tool.hoe_invar>);

furnace.addRecipe(<thermalfoundation:tool.hoe_invar>, <botania:icependant>);

//Recipe 20
recipes.remove(<harvestcraft:friedpecanokraitem>, false);
furnace.remove(<harvestcraft:friedpecanokraitem>);

recipes.addShaped("youre_an_expert_harry_20", <harvestcraft:friedpecanokraitem>, 
 [[<thermalfoundation:tool.bow_tin>, <harvestcraft:bakedsweetpotatoitem>, <thermalfoundation:tool.bow_tin>],
  [<harvestcraft:bakedsweetpotatoitem>, <dynamictreestc:silverwoodseed>, <harvestcraft:bakedsweetpotatoitem>],
  [<thermalfoundation:tool.bow_tin>, <harvestcraft:bakedsweetpotatoitem>, <thermalfoundation:tool.bow_tin>]]);

//Recipe 21
recipes.remove(<harvestcraft:cabbageseeditem>, false);
furnace.remove(<harvestcraft:cabbageseeditem>);

recipes.addShaped("youre_an_expert_harry_21", <harvestcraft:cabbageseeditem>, 
 [[<minecraft:chorus_fruit>, <minecraft:leather_chestplate>, <minecraft:chorus_fruit>],
  [<minecraft:leather_chestplate>, <taiga:fractum_block>, <minecraft:leather_chestplate>],
  [<minecraft:chorus_fruit>, <minecraft:leather_chestplate>, <minecraft:chorus_fruit>]]);

//Recipe 22
recipes.remove(<harvestcraft:walnut_sapling>, false);
furnace.remove(<harvestcraft:walnut_sapling>);

ManaInfusion.addAlchemy(<harvestcraft:walnut_sapling>, <quark:snow_bricks_wall>, 8504);

//Recipe 23
recipes.remove(<artisanworktables:artisans_athame_tin>, false);
furnace.remove(<artisanworktables:artisans_athame_tin>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<artisanworktables:artisans_athame_tin>).inputs([<bigreactors:dustcyanite>, <extrabotany:flyingboat:2>, <harvestcraft:herbbutterparsnipsitem>]).manaCost(400000));

//Recipe 24
recipes.remove(<mekanism:sawdust>, false);
furnace.remove(<mekanism:sawdust>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<mekanism:sawdust>).inputs([<aether_legacy:zanite_gloves>, <thermalfoundation:tool.fishing_rod_diamond>, <bloodmagic:pack_sacrifice>]).manaCost(100000));

//Recipe 25
recipes.remove(<abyssalcraft:stone>, false);
furnace.remove(<abyssalcraft:stone>);

recipes.addShaped("youre_an_expert_harry_25", <abyssalcraft:stone>, 
 [[<forbidden_arcanus:cherrywood_pressure_plate>, <bigreactors:blockludicrite>, <forbidden_arcanus:cherrywood_pressure_plate>],
  [<harvestcraft:waterfilter>, <ferdinandsflowers:block_cff_doubless:3>, <harvestcraft:waterfilter>],
  [<bibliocraft:atlasbook>, <taiga:skylerite_ingot>, <bibliocraft:atlasbook>]]);

//Recipe 26
recipes.remove(<aether_legacy:lightning_sword>, false);
furnace.remove(<aether_legacy:lightning_sword>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<aether_legacy:lightning_sword>).inputs([<minecraft:chainmail_boots>, <harvestcraft:melonjuiceitem>, <thaumicaugmentation:warded_pressure_plate_silverwood>]).manaCost(500000));

//Recipe 27
recipes.remove(<aether_legacy:mossy_holystone_double_slab>, false);
furnace.remove(<aether_legacy:mossy_holystone_double_slab>);

ElvenTrade.addRecipe([<aether_legacy:mossy_holystone_double_slab>], [<harvestcraft:marshmellowchicksitem>, <minecraft:paper>]);

//Recipe 28
recipes.remove(<artisanworktables:artisans_compass_bone>, false);
furnace.remove(<artisanworktables:artisans_compass_bone>);

ManaInfusion.addAlchemy(<artisanworktables:artisans_compass_bone>, <atum:nuits_quarter>, 7099);

//Recipe 29
recipes.remove(<quark:fire_stone_brick_slab>, false);
furnace.remove(<quark:fire_stone_brick_slab>);

recipes.addShaped("youre_an_expert_harry_29", <quark:fire_stone_brick_slab>, 
 [[<galacticraftplanets:laser_turret>, <artisanworktables:artisans_punch_invar>, <galacticraftplanets:laser_turret>],
  [<minecraft:soul_sand>, <nuclearcraft:electromagnet_supercooler_active>, <minecraft:soul_sand>],
  [<tcomplement:alloy_tank>, <mekanism:tierinstaller:2>, <tcomplement:alloy_tank>]]);

//Recipe 30
recipes.remove(<opencomputers:rack>, false);
furnace.remove(<opencomputers:rack>);

ManaInfusion.addInfusion(<opencomputers:rack>, <twilightforest:charm_of_keeping_1>, 3234);

//Recipe 31
recipes.remove(<artisanworktables:artisans_athame_nickel>, false);
furnace.remove(<artisanworktables:artisans_athame_nickel>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<artisanworktables:artisans_athame_nickel>).inputs([<minecraft:redstone_block>, <botania:miningring>, <botania:biomestonea5stairs>]).manaCost(400000));

//Recipe 32
recipes.remove(<conarm:gauntlet_mat_attack>, false);
furnace.remove(<conarm:gauntlet_mat_attack>);

recipes.addShaped("youre_an_expert_harry_32", <conarm:gauntlet_mat_attack>, 
 [[<appliedenergistics2:certus_quartz_spade>, <minecraft:log>, <appliedenergistics2:certus_quartz_spade>],
  [<thermalfoundation:tool.shovel_constantan>, <sonarcore:stablestonerimmed_blue>, <thermalfoundation:tool.shovel_constantan>],
  [<harvestcraft:carrotcakeitem>, <minecraft:leaves2:1>, <harvestcraft:carrotcakeitem>]]);

//Recipe 33
recipes.remove(<arcanearchives:shaped_quartz>, false);
furnace.remove(<arcanearchives:shaped_quartz>);

ElvenTrade.addRecipe([<arcanearchives:shaped_quartz>], [<immersiveengineering:wirecoil:4>, <quark:stone_diorite_wall>]);

//Recipe 34
recipes.remove(<artisanworktables:workstation:1>, false);
furnace.remove(<artisanworktables:workstation:1>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<artisanworktables:workstation:1>).inputs([<harvestcraft:raspberrymilkshakeitem>, <artisanworktables:artisans_framing_hammer_osmium>, <galacticraftplanets:mars_machine_t2>]).manaCost(400000));

//Recipe 35
recipes.remove(<appliedenergistics2:drive>, false);
furnace.remove(<appliedenergistics2:drive>);

RuneAltar.addRecipe(<appliedenergistics2:drive>, [<taiga:dyonite_block>, <harvestcraft:mobsoupitem>, <artisanworktables:artisans_burner_wood>, <extrautils2:compresseddirt>, <tconstruct:broadsword>, <extrabotany:redscarf>, <taiga:emberium_block>, <atum:mummy_boots>], 10000);

//Recipe 36
recipes.remove(<harvestcraft:pomegranateyogurtitem>, false);
furnace.remove(<harvestcraft:pomegranateyogurtitem>);

RuneAltar.addRecipe(<harvestcraft:pomegranateyogurtitem>, [<twilightforest:aurora_pillar>, <quark:soul_bead>, <netherex:black_salamander_hide_boots>, <embers:axe_silver>, <thaumadditions:void_thaumometer>], 7000);

//Recipe 37
recipes.remove(<theaurorian:silkshroomstew>, false);
furnace.remove(<theaurorian:silkshroomstew>);

recipes.addShaped("youre_an_expert_harry_37", <theaurorian:silkshroomstew>, 
 [[<harvestcraft:toastedwesternitem>, <harvestcraft:groundcinnamonitem>, <harvestcraft:toastedwesternitem>],
  [<harvestcraft:groundcinnamonitem>, <thermalfoundation:tool.fishing_rod_stone>, <harvestcraft:groundcinnamonitem>],
  [<harvestcraft:toastedwesternitem>, <harvestcraft:groundcinnamonitem>, <harvestcraft:toastedwesternitem>]]);

//Recipe 38
recipes.remove(<twilightforest:zombie_scepter>, false);
furnace.remove(<twilightforest:zombie_scepter>);

ManaInfusion.addAlchemy(<twilightforest:zombie_scepter>, <minecraft:sapling:2>, 8932);

//Recipe 39
recipes.remove(<harvestcraft:orangejellyitem>, false);
furnace.remove(<harvestcraft:orangejellyitem>);

RuneAltar.addRecipe(<harvestcraft:orangejellyitem>, [<thaumicbases:glieoniaseed>, <guideapi:bloodarsenal-guide>, <twilightforest:cooked_meef>, <botania:quartzstairsblaze>, <harvestcraft:blackpepperitem>, <quark:stone_diorite_slab>, <artisanworktables:artisans_sifter_manasteel>, <embers:shovel_dawnstone>, <midnight:viridshroom_stairs>], 9000);

//Recipe 40
recipes.remove(<materialis:pokefennium_block>, false);
furnace.remove(<materialis:pokefennium_block>);

recipes.addShaped("youre_an_expert_harry_40", <materialis:pokefennium_block>, 
 [[<embers:nugget_bronze>, <thaumcraft:paving_stone_barrier>, <embers:nugget_bronze>],
  [<harvestcraft:vindalooitem>, <nuclearcraft:geiger_counter>, <harvestcraft:vindalooitem>],
  [<harvestcraft:chaiteaitem>, <artisanworktables:artisans_needle_platinum>, <harvestcraft:chaiteaitem>]]);

//Recipe 41
recipes.remove(<thaumicwonders:cinderpearl_seed>, false);
furnace.remove(<thaumicwonders:cinderpearl_seed>);

Agglomeration.addRecipe(AgglomerationRecipe.create().output(<thaumicwonders:cinderpearl_seed>).inputs([<atum:ceramic_slab_cyan>, <artisanworktables:artisans_athame_aluminum>, <extrabotany:shadowkatana>]).manaCost(300000));

//Recipe 42
recipes.remove(<harvestcraft:groundturkeyitem>, false);
furnace.remove(<harvestcraft:groundturkeyitem>);

recipes.addShaped("youre_an_expert_harry_42", <harvestcraft:groundturkeyitem>, 
 [[<bloodmagic:demon_pillar_1>, <thaumcraft:effect_sap>, <bloodmagic:demon_pillar_1>],
  [<thaumcraft:effect_sap>, <thaumcraft:metal_alchemical>, <thaumcraft:effect_sap>],
  [<bloodmagic:demon_pillar_1>, <thaumcraft:effect_sap>, <bloodmagic:demon_pillar_1>]]);

//Recipe 43
recipes.remove(<projectred-illumination:inverted_fixture_light:10>, false);
furnace.remove(<projectred-illumination:inverted_fixture_light:10>);

ElvenTrade.addRecipe([<projectred-illumination:inverted_fixture_light:10>], [<minecraft:iron_horse_armor>, <betternether:reeds_fence>]);

//Recipe 44
recipes.remove(<quark:tallow>, false);
furnace.remove(<quark:tallow>);

ElvenTrade.addRecipe([<quark:tallow>], [<artisanworktables:artisans_grimoire_silver>, <netherex:enoki_mushroom_stem>]);

//Recipe 45
recipes.remove(<abyssalcraft:dsbutton>, false);
furnace.remove(<abyssalcraft:dsbutton>);

furnace.addRecipe(<abyssalcraft:dsbutton>, <forbidden_arcanus:mortem_boots>);

//Recipe 46
recipes.remove(<quark:bark_birch_wall>, false);
furnace.remove(<quark:bark_birch_wall>);

ElvenTrade.addRecipe([<quark:bark_birch_wall>], [<aether_legacy:mossy_holystone_slab>, <artisanworktables:artisans_groover_nickel>]);

//Recipe 47
recipes.remove(<nuclearcraft:portable_ender_chest>, false);
furnace.remove(<nuclearcraft:portable_ender_chest>);

recipes.addShaped("youre_an_expert_harry_47", <nuclearcraft:portable_ender_chest>, 
 [[<botania:altgrass>, <astralsorcery:blockstructural>, <botania:altgrass>],
  [<trashcans:energy_trash_can>, <artisanworktables:artisans_driver_bone>, <trashcans:energy_trash_can>],
  [<twilightforest:mangrove_door>, <midnight:tenebrum_block>, <twilightforest:mangrove_door>]]);

//Recipe 48
recipes.remove(<artisanworktables:artisans_chisel_hardcarbon>, false);
furnace.remove(<artisanworktables:artisans_chisel_hardcarbon>);

furnace.addRecipe(<artisanworktables:artisans_chisel_hardcarbon>, <netherex:congealed_magma_cream>);

//Recipe 49
recipes.remove(<nuclearcraft:cooler:7>, false);
furnace.remove(<nuclearcraft:cooler:7>);

ManaInfusion.addInfusion(<nuclearcraft:cooler:7>, <artisanworktables:artisans_knife_manasteel>, 3512);

//Recipe 50
recipes.remove(<botania:dreamwood1slab>, false);
furnace.remove(<botania:dreamwood1slab>);

furnace.addRecipe(<botania:dreamwood1slab>, <thaumicenergistics:infusion_provider>);

//Recipe 51
recipes.remove(<artisanworktables:artisans_driver_copper>, false);
furnace.remove(<artisanworktables:artisans_driver_copper>);

furnace.addRecipe(<artisanworktables:artisans_driver_copper>, <harvestcraft:figitem>);

//Recipe 52
recipes.remove(<harvestcraft:chipsanddipitem>, false);
furnace.remove(<harvestcraft:chipsanddipitem>);

recipes.addShaped("youre_an_expert_harry_52", <harvestcraft:chipsanddipitem>, 
 [[<futuremc:stripped_spruce_wood>, <harvestcraft:honeysandwichitem>, <futuremc:stripped_spruce_wood>],
  [<quark:stained_clay_tiles_pink_stairs>, <artisanworktables:artisans_razor_flint>, <quark:stained_clay_tiles_pink_stairs>],
  [<galacticraftplanets:mars_machine>, <midnight:rouxe_rock>, <galacticraftplanets:mars_machine>]]);

// RECIPE LEVEL: 3


//Recipe 53
recipes.remove(<aether_legacy:holystone_brick_wall>, false);
furnace.remove(<aether_legacy:holystone_brick_wall>);

recipes.addShaped("youre_an_expert_harry_53", <aether_legacy:holystone_brick_wall>, 
 [[<nuclearcraft:bin>, <astralsorcery:blocktreebeacon>, <nuclearcraft:bin>],
  [<astralsorcery:blocktreebeacon>, <harvestcraft:liverandonionsitem>, <astralsorcery:blocktreebeacon>],
  [<nuclearcraft:bin>, <astralsorcery:blocktreebeacon>, <nuclearcraft:bin>]]);

//Recipe 54
recipes.remove(<atum:nuits_quarter>, false);
furnace.remove(<atum:nuits_quarter>);

recipes.addShaped("youre_an_expert_harry_54", <atum:nuits_quarter>, 
 [[<forbidden_arcanus:dark_stone_button>, <artisanworktables:artisans_trowel_wood>, <forbidden_arcanus:dark_stone_button>],
  [<artisanworktables:artisans_trowel_wood>, <botanicadds:gaiasteel_block>, <artisanworktables:artisans_trowel_wood>],
  [<forbidden_arcanus:dark_stone_button>, <artisanworktables:artisans_trowel_wood>, <forbidden_arcanus:dark_stone_button>]]);

//Recipe 55
recipes.remove(<twilightforest:aurora_pillar>, false);
furnace.remove(<twilightforest:aurora_pillar>);

recipes.addShaped("youre_an_expert_harry_55", <twilightforest:aurora_pillar>, 
 [[<harvestcraft:phoitem>, <artisanworktables:artisans_compass_nickel>, <harvestcraft:phoitem>],
  [<galacticraftplanets:desh_axe>, <mekanism:machineblock2:2>, <galacticraftplanets:desh_axe>],
  [<futuremc:banner_pattern:3>, <betternether:cincinnasite_pedestal>, <futuremc:banner_pattern:3>]]);

//Recipe 56
recipes.remove(<thermalfoundation:tool.shovel_constantan>, false);
furnace.remove(<thermalfoundation:tool.shovel_constantan>);

recipes.addShaped("youre_an_expert_harry_56", <thermalfoundation:tool.shovel_constantan>, 
 [[<twilightforest:ice_bow>, <atum:scepter_tefnut>, <twilightforest:ice_bow>],
  [<atum:porphyry_polished_wall>, <ferdinandsflowers:block_dye_brick_halfc:1>, <atum:porphyry_polished_wall>],
  [<thaumcraft:lamp_growth>, <artisanworktables:artisans_beaker_platinum>, <thaumcraft:lamp_growth>]]);

//Recipe 57
recipes.remove(<guideapi:bloodarsenal-guide>, false);
furnace.remove(<guideapi:bloodarsenal-guide>);

ManaInfusion.addAlchemy(<guideapi:bloodarsenal-guide>, <galacticraftcore:oxygen_detector>, 9528);

//Recipe 58
recipes.remove(<galacticraftplanets:mars_machine_t2>, false);
furnace.remove(<galacticraftplanets:mars_machine_t2>);

recipes.addShaped("youre_an_expert_harry_58", <galacticraftplanets:mars_machine_t2>, 
 [[<atum:framed_magenta_stained_glass>, <harvestcraft:sesameballitem>, <atum:framed_magenta_stained_glass>],
  [<harvestcraft:gumboitem>, <taiga:emberium_dust>, <harvestcraft:gumboitem>],
  [<harvestcraft:barleyseeditem>, <storagedrawers:shroud_key>, <harvestcraft:barleyseeditem>]]);

//Recipe 59
recipes.remove(<artisanworktables:artisans_needle_platinum>, false);
furnace.remove(<artisanworktables:artisans_needle_platinum>);

furnace.addRecipe(<artisanworktables:artisans_needle_platinum>, <ironchest:iron_shulker_box_lime:4>);

//Recipe 60
recipes.remove(<abyssalcraft:nitreore>, false);
furnace.remove(<abyssalcraft:nitreore>);

recipes.addShaped("youre_an_expert_harry_60", <abyssalcraft:nitreore>, 
 [[<tcomplement:melter:8>, <harvestcraft:tamarinditem>, <tcomplement:melter:8>],
  [<quark:stone_wall>, <artisanworktables:artisans_beaker_copper>, <quark:stone_wall>],
  [<botania:shimmerwoodplanks>, <sonarcore:stablestonerimmed_orange>, <botania:shimmerwoodplanks>]]);

//Recipe 61
recipes.remove(<thermalfoundation:tool.fishing_rod_diamond>, false);
furnace.remove(<thermalfoundation:tool.fishing_rod_diamond>);

recipes.addShapeless("youre_an_expert_harry_61", <thermalfoundation:tool.fishing_rod_diamond>, [<betternether:stalagnate_bark>, <atum:limestone_brick_cracked_brick>, <futuremc:suspicious_stew>, <botania:manasteelshears>]);

//Recipe 62
recipes.remove(<trashcans:energy_trash_can>, false);
furnace.remove(<trashcans:energy_trash_can>);

furnace.addRecipe(<trashcans:energy_trash_can>, <twilightforest:castle_stairs_mossy>);

//Recipe 63
recipes.remove(<botania:livingwood:5>, false);
furnace.remove(<botania:livingwood:5>);

Apothecary.addRecipe(<botania:livingwood:5>, [<atum:linen_carpet_silver>, <harvestcraft:stuffedduckitem>, <harvestcraft:eggplantseeditem>]);

//Recipe 64
recipes.remove(<thaumcraft:effect_sap>, false);
furnace.remove(<thaumcraft:effect_sap>);

recipes.addShapeless("youre_an_expert_harry_64", <thaumcraft:effect_sap>, [<minecraft:bone>, <twilightforest:steeleaf_sword>, <twilightforest:underbrick>, <artisanworktables:artisans_solderer_diamond>]);

//Recipe 65
recipes.remove(<botania:spark>, false);
furnace.remove(<botania:spark>);

recipes.addShapeless("youre_an_expert_harry_65", <botania:spark>, [<midnight:nightstone_shovel>, <atum:loot_emerald_ring>, <betternether:gray_mold>, <aether_legacy:treasure_chest>]);

//Recipe 66
recipes.remove(<forbidden_arcanus:cherrywood_pressure_plate>, false);
furnace.remove(<forbidden_arcanus:cherrywood_pressure_plate>);

Apothecary.addRecipe(<forbidden_arcanus:cherrywood_pressure_plate>, [<abyssalcraft:abyssalnitecobblestonewall>]);

//Recipe 67
recipes.remove(<quark:stone_diorite_slab>, false);
furnace.remove(<quark:stone_diorite_slab>);

Apothecary.addRecipe(<quark:stone_diorite_slab>, [<draconicevolution:draconic_legs>, <quark:sandy_bricks_slab>, <quark:andesite_speleothem>, <forbidden_arcanus:mortem_chestplate>, <thaumcraft:elemental_axe>, <twilightforest:giant_log>]);

//Recipe 68
recipes.remove(<extrautils2:suncrystal>, false);
furnace.remove(<extrautils2:suncrystal>);

recipes.addShaped("youre_an_expert_harry_68", <extrautils2:suncrystal>, 
 [[<forbidden_arcanus:arcane_dark_stone>, <enderio:item_dark_steel_hand>, <forbidden_arcanus:arcane_dark_stone>],
  [<artisanworktables:artisans_needle_wood>, <harvestcraft:pastaitem>, <artisanworktables:artisans_needle_wood>],
  [<thaumicwonders:creative_essentia_jar>, <minecraft:feather>, <thaumicwonders:creative_essentia_jar>]]);

//Recipe 69
recipes.remove(<nuclearcraft:geiger_counter>, false);
furnace.remove(<nuclearcraft:geiger_counter>);

recipes.addShaped("youre_an_expert_harry_69", <nuclearcraft:geiger_counter>, 
 [[<aether_legacy:enchanted_gravitite>, <artisanworktables:artisans_compass_toughalloy>, <aether_legacy:enchanted_gravitite>],
  [<immersiveengineering:stone_decoration_stairs_hempcrete>, <abyssalcraft:dreadiumingot>, <immersiveengineering:stone_decoration_stairs_hempcrete>],
  [<artisanworktables:artisans_cutting_board_osmium>, <abyssalcraft:corboots>, <artisanworktables:artisans_cutting_board_osmium>]]);

//Recipe 70
recipes.remove(<bloodmagic:demon_pillar_1>, false);
furnace.remove(<bloodmagic:demon_pillar_1>);

recipes.addShapeless("youre_an_expert_harry_70", <bloodmagic:demon_pillar_1>, [<arcanearchives:scintillating_inlay>, <twilightforest:steeleaf_shovel>, <harvestcraft:creamofavocadosoupitem>, <taiga:ovium_ore>]);

//Recipe 71
recipes.remove(<galacticraftplanets:laser_turret>, false);
furnace.remove(<galacticraftplanets:laser_turret>);

furnace.addRecipe(<galacticraftplanets:laser_turret>, <thaumcraft:grapple_gun>);

//Recipe 72
recipes.remove(<harvestcraft:chilipepperitem>, false);
furnace.remove(<harvestcraft:chilipepperitem>);

recipes.addShaped("youre_an_expert_harry_72", <harvestcraft:chilipepperitem>, 
 [[<atum:linen_carpet_black>, <minecraft:emerald>, <atum:linen_carpet_black>],
  [<minecraft:emerald>, <enderio:item_end_steel_pickaxe>, <minecraft:emerald>],
  [<atum:linen_carpet_black>, <minecraft:emerald>, <atum:linen_carpet_black>]]);

//Recipe 73
recipes.remove(<sonarcore:stablestonerimmed_blue>, false);
furnace.remove(<sonarcore:stablestonerimmed_blue>);

recipes.addShaped("youre_an_expert_harry_73", <sonarcore:stablestonerimmed_blue>, 
 [[<nuclearcraft:record_wanderer>, <plustic:alumiteblock>, <nuclearcraft:record_wanderer>],
  [<plustic:alumiteblock>, <theaurorian:moontemplecellkeyfragment>, <plustic:alumiteblock>],
  [<nuclearcraft:record_wanderer>, <plustic:alumiteblock>, <nuclearcraft:record_wanderer>]]);

//Recipe 74
recipes.remove(<botania:biomestonea5stairs>, false);
furnace.remove(<botania:biomestonea5stairs>);

ManaInfusion.addAlchemy(<botania:biomestonea5stairs>, <harvestcraft:hazelnutitem>, 6737);

//Recipe 75
recipes.remove(<thaumadditions:mithminite_fabric>, false);
furnace.remove(<thaumadditions:mithminite_fabric>);

ManaInfusion.addInfusion(<thaumadditions:mithminite_fabric>, <arcanearchives:slaughtergleam>, 4255);

//Recipe 76
recipes.remove(<botania:altgrass>, false);
furnace.remove(<botania:altgrass>);

ManaInfusion.addInfusion(<botania:altgrass>, <harvestcraft:timtamitem>, 6617);

//Recipe 77
recipes.remove(<thaumcraft:paving_stone_barrier>, false);
furnace.remove(<thaumcraft:paving_stone_barrier>);

Apothecary.addRecipe(<thaumcraft:paving_stone_barrier>, [<atum:linen_carpet_gray>, <harvestcraft:montecristosandwichitem>, <abyssalcraft:abyore>]);

//Recipe 78
recipes.remove(<botania:miningring>, false);
furnace.remove(<botania:miningring>);

ManaInfusion.addAlchemy(<botania:miningring>, <quark:turf_stairs>, 8420);

//Recipe 79
recipes.remove(<harvestcraft:vindalooitem>, false);
furnace.remove(<harvestcraft:vindalooitem>);

ManaInfusion.addInfusion(<harvestcraft:vindalooitem>, <quark:stained_clay_tiles_cyan_slab>, 4521);

//Recipe 80
recipes.remove(<enderio:block_not_holy_dark_fused_quartz:15>, false);
furnace.remove(<enderio:block_not_holy_dark_fused_quartz:15>);

RuneAltar.addRecipe(<enderio:block_not_holy_dark_fused_quartz:15>, [<abyssalcraft:oblivionshard>, <twilightforest:trollvidr>, <yurtmod:cos_shamiana_red>, <minecraft:brick_stairs>, <harvestcraft:jamrollitem>], 12000);

//Recipe 81
recipes.remove(<harvestcraft:blackpepperitem>, false);
furnace.remove(<harvestcraft:blackpepperitem>);

recipes.addShaped("youre_an_expert_harry_81", <harvestcraft:blackpepperitem>, 
 [[<enderio:item_owl_egg>, <ironchest:iron_shulker_box_silver:6>, <enderio:item_owl_egg>],
  [<botania:biomestoneb5slab>, <abyssalcraft:necronomicon_cor>, <botania:biomestoneb5slab>],
  [<thaumcraft:creative_flux_sponge>, <abyssalcraft:dplate>, <thaumcraft:creative_flux_sponge>]]);

//Recipe 82
recipes.remove(<taiga:fractum_block>, false);
furnace.remove(<taiga:fractum_block>);

ManaInfusion.addInfusion(<taiga:fractum_block>, <spectrite:spectrite_axe>, 6253);

//Recipe 83
recipes.remove(<bibliocraft:atlasbook>, false);
furnace.remove(<bibliocraft:atlasbook>);

recipes.addShapeless("youre_an_expert_harry_83", <bibliocraft:atlasbook>, [<harvestcraft:sprinklescupcakeitem>, <thaumadditions:fragnant_pendant>, <thaumadditions:adaminite_belt>, <harvestcraft:candleberryseeditem>]);

//Recipe 84
recipes.remove(<thaumadditions:void_thaumometer>, false);
furnace.remove(<thaumadditions:void_thaumometer>);

recipes.addShapeless("youre_an_expert_harry_84", <thaumadditions:void_thaumometer>, [<ironchest:copper_silver_chest_upgrade>, <quark:slate:1>, <thermalfoundation:tool.bow_platinum>, <futuremc:bamboo>]);

//Recipe 85
recipes.remove(<artisanworktables:artisans_knife_manasteel>, false);
furnace.remove(<artisanworktables:artisans_knife_manasteel>);

RuneAltar.addRecipe(<artisanworktables:artisans_knife_manasteel>, [<minecraft:birch_boat>, <taiga:eezo_ingot>, <dynamictreesphc:bananaseed>, <theaurorian:moonstonepickaxe>], 9000);

//Recipe 86
recipes.remove(<nuclearcraft:electromagnet_supercooler_active>, false);
furnace.remove(<nuclearcraft:electromagnet_supercooler_active>);

RuneAltar.addRecipe(<nuclearcraft:electromagnet_supercooler_active>, [<plustic:alumiteblock>, <atum:framed_orange_stained_glass>, <appliedenergistics2:chiseled_quartz_stairs>, <conarm:leggings_core>, <taiga:basalt_nugget>, <nuclearcraft:rtg_plutonium>, <harvestcraft:cherryjellyitem>], 12000);

//Recipe 87
recipes.remove(<dynamictreestc:silverwoodseed>, false);
furnace.remove(<dynamictreestc:silverwoodseed>);

recipes.addShapeless("youre_an_expert_harry_87", <dynamictreestc:silverwoodseed>, [<harvestcraft:garlicmashedpotatoesitem>, <harvestcraft:grainbaititem>, <appliedenergistics2:fluid_storage_cell_4k>, <netherex:wither_bone_chestplate>]);

//Recipe 88
recipes.remove(<harvestcraft:groundcinnamonitem>, false);
furnace.remove(<harvestcraft:groundcinnamonitem>);

ManaInfusion.addAlchemy(<harvestcraft:groundcinnamonitem>, <taiga:pure_ingot>, 5185);

//Recipe 89
recipes.remove(<botania:terraplate>, false);
furnace.remove(<botania:terraplate>);

recipes.addShaped("youre_an_expert_harry_89", <botania:terraplate>, 
 [[<artisanworktables:artisans_cutting_board_elementium>, <dynamictreesphc:figseed>, <artisanworktables:artisans_cutting_board_elementium>],
  [<harvestcraft:deluxenachoesitem>, <atum:alabaster_brick_smooth>, <harvestcraft:deluxenachoesitem>],
  [<harvestcraft:tatertotsitem>, <aether_legacy:aether_dirt>, <harvestcraft:tatertotsitem>]]);

//Recipe 90
recipes.remove(<minecraft:iron_horse_armor>, false);
furnace.remove(<minecraft:iron_horse_armor>);

recipes.addShaped("youre_an_expert_harry_90", <minecraft:iron_horse_armor>, 
 [[<harvestcraft:cheeseburgeritem>, <embers:heat_coil>, <harvestcraft:cheeseburgeritem>],
  [<embers:heat_coil>, <atum:burning_trap>, <embers:heat_coil>],
  [<harvestcraft:cheeseburgeritem>, <embers:heat_coil>, <harvestcraft:cheeseburgeritem>]]);

//Recipe 91
recipes.remove(<appliedenergistics2:certus_quartz_spade>, false);
furnace.remove(<appliedenergistics2:certus_quartz_spade>);

furnace.addRecipe(<appliedenergistics2:certus_quartz_spade>, <thermalfoundation:armor.legs_constantan>);

//Recipe 92
recipes.remove(<dynamictreesthaumicbases:rainbowcactusbranch>, false);
furnace.remove(<dynamictreesthaumicbases:rainbowcactusbranch>);

recipes.addShapeless("youre_an_expert_harry_92", <dynamictreesthaumicbases:rainbowcactusbranch>, [<quark:midori_block_wall>, <bountifulbaubles:enderdragonscale>, <artisanworktables:artisans_file_flint>, <ironchest:iron_shulker_box_pink:3>]);

//Recipe 93
recipes.remove(<twilightforest:mangrove_door>, false);
furnace.remove(<twilightforest:mangrove_door>);

Apothecary.addRecipe(<twilightforest:mangrove_door>, [<artisanworktables:artisans_punch_boron>, <forbidden_arcanus:arcane_carved_dark_stone_bricks>, <atum:linen_cloth>, <thaumicwonders:placeholder_adv_alch_construct>, <aether_legacy:aether_grass>, <harvestcraft:manjuuitem>, <nuclearcraft:milk_chocolate>, <psi:cad_battery>, <thermalfoundation:tool.shears_copper>]);

//Recipe 94
recipes.remove(<artisanworktables:artisans_groover_nickel>, false);
furnace.remove(<artisanworktables:artisans_groover_nickel>);

furnace.remove(<minecraft:leather>);
furnace.addRecipe(<artisanworktables:artisans_groover_nickel>, <minecraft:leather_leggings>);

//Recipe 95
recipes.remove(<botania:pylon:2>, false);
furnace.remove(<botania:pylon:2>);

recipes.addShapeless("youre_an_expert_harry_95", <botania:pylon:2>, [<enderio:block_enhanced_wireless_charger>, <abyssalcraft:abyslab1>, <aether_legacy:golden_parachute>, <atum:porphyry_tiled_slab>]);

//Recipe 96
recipes.remove(<thaumicaugmentation:warded_pressure_plate_silverwood>, false);
furnace.remove(<thaumicaugmentation:warded_pressure_plate_silverwood>);

recipes.addShapeless("youre_an_expert_harry_96", <thaumicaugmentation:warded_pressure_plate_silverwood>, [<immersiveengineering:fluorescent_tube>, <thaumcraft:loot_crate_uncommon>, <embers:ore_quartz>, <mekanism:mufflingupgrade>]);

//Recipe 97
recipes.remove(<thaumicenergistics:infusion_provider>, false);
furnace.remove(<thaumicenergistics:infusion_provider>);

Apothecary.addRecipe(<thaumicenergistics:infusion_provider>, [<enderio:block_simple_stirling_generator>, <twilightforest:firefly_jar>, <theaurorian:bossspawnermoonqueen>, <quark:stained_planks_light_blue_stairs>]);

//Recipe 98
recipes.remove(<densemetals:dense_nether_iron_ore>, false);
furnace.remove(<densemetals:dense_nether_iron_ore>);

ManaInfusion.addInfusion(<densemetals:dense_nether_iron_ore>, <harvestcraft:pamstarfruit>, 7888);

//Recipe 99
recipes.remove(<minecraft:leather_chestplate>, false);
furnace.remove(<minecraft:leather_chestplate>);

recipes.addShaped("youre_an_expert_harry_99", <minecraft:leather_chestplate>, 
 [[<thaumcraft:crimson_blade>, <draconicevolution:diss_enchanter>, <thaumcraft:crimson_blade>],
  [<draconicevolution:diss_enchanter>, <taiga:tiberium_dust>, <draconicevolution:diss_enchanter>],
  [<thaumcraft:crimson_blade>, <draconicevolution:diss_enchanter>, <thaumcraft:crimson_blade>]]);

//Recipe 100
recipes.remove(<astralsorcery:blockstructural>, false);
furnace.remove(<astralsorcery:blockstructural>);

furnace.addRecipe(<astralsorcery:blockstructural>, <galacticraftplanets:walkway:1>);

//Recipe 101
recipes.remove(<botania:pylon:1>, false);
furnace.remove(<botania:pylon:1>);

recipes.addShapeless("youre_an_expert_harry_101", <botania:pylon:1>, [<forbidden_arcanus:edelwood_trapdoor>, <thaumcraft:cinderpearl>, <forbidden_arcanus:chiseled_arcane_base_block>, <enderio:item_alloy_nugget:5>]);

//Recipe 102
recipes.remove(<harvestcraft:chaiteaitem>, false);
furnace.remove(<harvestcraft:chaiteaitem>);

RuneAltar.addRecipe(<harvestcraft:chaiteaitem>, [<atum:thin_framed_purple_stained_glass>, <tconstruct:slime_congealed:2>, <plustic:centrifuge:1>, <botania:twigwand>, <artisanworktables:artisans_pan_boronnitride>, <embers:alchemy_pedestal>, <betternether:barrel_cactus>, <abyssalcraft:abydreadore>, <atum:crystal_silver_stained_glass>], 9000);

//Recipe 103
recipes.remove(<extrabotany:redscarf>, false);
furnace.remove(<extrabotany:redscarf>);

recipes.addShaped("youre_an_expert_harry_103", <extrabotany:redscarf>, 
 [[<artisanworktables:artisans_solderer_diamond>, <minecraft:pumpkin>, <artisanworktables:artisans_solderer_diamond>],
  [<minecraft:pumpkin>, <minecraft:stone_stairs>, <minecraft:pumpkin>],
  [<artisanworktables:artisans_solderer_diamond>, <minecraft:pumpkin>, <artisanworktables:artisans_solderer_diamond>]]);

//Recipe 104
recipes.remove(<artisanworktables:artisans_punch_invar>, false);
furnace.remove(<artisanworktables:artisans_punch_invar>);

ManaInfusion.addInfusion(<artisanworktables:artisans_punch_invar>, <artisanworktables:artisans_beaker_flint>, 9870);

//Recipe 105
recipes.remove(<minecraft:iron_block>, false);
furnace.remove(<minecraft:iron_block>);
ElvenTrade.removeRecipe(<minecraft:iron_block>);
RuneAltar.addRecipe(<minecraft:iron_block>, [<futuremc:netherite_boots>, <embers:shovel_lead>, <artisanworktables:artisans_gemcutter_osmium>, <minecraft:emerald_ore>, <nuclearcraft:glowing_mushroom>], 11000);

//Recipe 106
recipes.remove(<botania:livingwood>, false);
furnace.remove(<botania:livingwood>);

ManaInfusion.addInfusion(<botania:livingwood>, <thermalfoundation:tool.hoe_aluminum>, 3452);

//Recipe 107
recipes.remove(<twilightforest:cooked_venison>, false);
furnace.remove(<twilightforest:cooked_venison>);

recipes.addShapeless("youre_an_expert_harry_107", <twilightforest:cooked_venison>, [<artisanworktables:artisans_compass_diamond>, <taiga:duranite_ingot>, <theaurorian:aurorianslimeboots>, <midnight:nightstone_wall>]);

//Recipe 108
recipes.remove(<thaumcraft:metal_alchemical>, false);
furnace.remove(<thaumcraft:metal_alchemical>);

Apothecary.addRecipe(<thaumcraft:metal_alchemical>, [<abyssalcraft:darkethaxiumbrick>, <quark:dark_prismarine_wall>, <galacticraftplanets:desh_helmet>, <quark:prismarine_slab>]);

//Recipe 109
recipes.remove(<artisanworktables:artisans_driver_bone>, false);
furnace.remove(<artisanworktables:artisans_driver_bone>);

recipes.addShaped("youre_an_expert_harry_109", <artisanworktables:artisans_driver_bone>, 
 [[<harvestcraft:hotwingsitem>, <thermalexpansion:satchel:32000>, <harvestcraft:hotwingsitem>],
  [<thermalexpansion:satchel:32000>, <extrautils2:spike_stone>, <thermalexpansion:satchel:32000>],
  [<harvestcraft:hotwingsitem>, <thermalexpansion:satchel:32000>, <harvestcraft:hotwingsitem>]]);

//Recipe 110
recipes.remove(<quark:snow_bricks_wall>, false);
furnace.remove(<quark:snow_bricks_wall>);

recipes.addShaped("youre_an_expert_harry_110", <quark:snow_bricks_wall>, 
 [[<thaumcraft:slab_ancient>, <taiga:triberium_ingot>, <thaumcraft:slab_ancient>],
  [<minecraft:spruce_fence>, <netherendingores:ore_nether_modded_1:4>, <minecraft:spruce_fence>],
  [<embers:ember_siphon>, <artisanworktables:artisans_driver_nickel>, <embers:ember_siphon>]]);

//Recipe 111
recipes.remove(<abyssalcraft:yogsothothcoin>, false);
furnace.remove(<abyssalcraft:yogsothothcoin>);

RuneAltar.addRecipe(<abyssalcraft:yogsothothcoin>, [<atum:ceramic_stairs_brown>, <thaumcraft:activator_rail>, <harvestcraft:rawtofenisonitem>, <harvestcraft:orangechickenitem>], 9000);

//Recipe 112
recipes.remove(<harvestcraft:waterfilter>, false);
furnace.remove(<harvestcraft:waterfilter>);

ManaInfusion.addAlchemy(<harvestcraft:waterfilter>, <appliedenergistics2:fluix_stairs>, 3900);

//Recipe 113
recipes.remove(<extrautils2:snowglobe>, false);
furnace.remove(<extrautils2:snowglobe>);

recipes.addShaped("youre_an_expert_harry_113", <extrautils2:snowglobe>, 
 [[<quark:jasper_speleothem>, <harvestcraft:lettuceseeditem>, <quark:jasper_speleothem>],
  [<harvestcraft:lettuceseeditem>, <thaumicbases:thaumspike>, <harvestcraft:lettuceseeditem>],
  [<quark:jasper_speleothem>, <harvestcraft:lettuceseeditem>, <quark:jasper_speleothem>]]);

//Recipe 114
recipes.remove(<twilightforest:cooked_meef>, false);
furnace.remove(<twilightforest:cooked_meef>);

recipes.addShapeless("youre_an_expert_harry_114", <twilightforest:cooked_meef>, [<twilightforest:borer_essence>, <twilightforest:lifedrain_scepter>, <netherex:wither_bone_leggings>, <taiga:seismum_nugget>]);

//Recipe 115
recipes.remove(<botania:alfheimportal>, false);
furnace.remove(<botania:alfheimportal>);

recipes.addShaped("youre_an_expert_harry_115", <botania:alfheimportal>, 
 [[<yurtmod:cos_tepee_wall_creeper>, <quark:stained_planks_orange_stairs>, <yurtmod:cos_tepee_wall_creeper>],
  [<atum:framed_pink_stained_glass>, <artisanworktables:artisans_handsaw_manasteel>, <atum:framed_pink_stained_glass>],
  [<astralsorcery:blockgemcrystals:3>, <tconstruct:dried_clay_slab:1>, <astralsorcery:blockgemcrystals:3>]]);

//Recipe 116
recipes.remove(<minecraft:beacon>, false);
furnace.remove(<minecraft:beacon>);

ManaInfusion.addAlchemy(<minecraft:beacon>, <abyssalcraft:abygolore>, 8502);

//Recipe 117
recipes.remove(<quark:stone_andesite_bricks_stairs>, false);
furnace.remove(<quark:stone_andesite_bricks_stairs>);

recipes.addShaped("youre_an_expert_harry_117", <quark:stone_andesite_bricks_stairs>, 
 [[<harvestcraft:springrollitem>, <bigreactors:reactorpowertaptesla>, <harvestcraft:springrollitem>],
  [<opensecurity:mag_secure_door>, <twilightforest:arctic_leggings>, <opensecurity:mag_secure_door>],
  [<embers:stamp_flat>, <theaurorian:runestonelootkey>, <embers:stamp_flat>]]);

//Recipe 118
recipes.remove(<harvestcraft:figitem>, false);
furnace.remove(<harvestcraft:figitem>);

furnace.addRecipe(<harvestcraft:figitem>, <harvestcraft:nutellaitem>);

//Recipe 119
recipes.remove(<embers:shovel_dawnstone>, false);
furnace.remove(<embers:shovel_dawnstone>);

ManaInfusion.addAlchemy(<embers:shovel_dawnstone>, <dynamictreesphc:peppercornseed>, 6785);

//Recipe 120
recipes.remove(<atum:mummy_boots>, false);
furnace.remove(<atum:mummy_boots>);

ManaInfusion.addInfusion(<atum:mummy_boots>, <harvestcraft:garlicsteakitem>, 4603);

//Recipe 121
recipes.remove(<harvestcraft:raspberrymilkshakeitem>, false);
furnace.remove(<harvestcraft:raspberrymilkshakeitem>);

Apothecary.addRecipe(<harvestcraft:raspberrymilkshakeitem>, [<galacticraftcore:fluid_pipe_pull>, <thaumicaugmentation:rift_seed:1>]);

//Recipe 122
recipes.remove(<thermalfoundation:tool.fishing_rod_stone>, false);
furnace.remove(<thermalfoundation:tool.fishing_rod_stone>);

furnace.addRecipe(<thermalfoundation:tool.fishing_rod_stone>, <minecraft:gold_nugget>);

//Recipe 123
recipes.remove(<atum:ceramic_slab_cyan>, false);
furnace.remove(<atum:ceramic_slab_cyan>);

RuneAltar.addRecipe(<atum:ceramic_slab_cyan>, [<artisanworktables:artisans_cutters_platinum>, <artisanworktables:artisans_solderer_gold>, <enderio:block_industrial_insulation>, <harvestcraft:redvelvetcakeitem>, <forbidden_arcanus:arcane_gold_block>, <tconstruct:bow_string>, <appliedenergistics2:nether_quartz_wrench>], 10000);

//Recipe 124
recipes.remove(<extrabotany:flyingboat:2>, false);
furnace.remove(<extrabotany:flyingboat:2>);

Apothecary.addRecipe(<extrabotany:flyingboat:2>, [<embers:plate_nickel>, <harvestcraft:durianmilkshakeitem>, <tconstruct:dried_clay>, <artisanworktables:artisans_hammer_silver>, <atum:ceramic_stairs_yellow>, <atum:fish_skeletal>]);

//Recipe 125
recipes.remove(<bigreactors:blockludicrite>, false);
furnace.remove(<bigreactors:blockludicrite>);

ManaInfusion.addAlchemy(<bigreactors:blockludicrite>, <netherex:lively_nether_brick>, 3892);

//Recipe 126
recipes.remove(<mekanism:tierinstaller:2>, false);
furnace.remove(<mekanism:tierinstaller:2>);

ManaInfusion.addAlchemy(<mekanism:tierinstaller:2>, <nuclearcraft:pickaxe_hard_carbon>, 6482);

//Recipe 127
recipes.remove(<quark:stone_diorite_wall>, false);
furnace.remove(<quark:stone_diorite_wall>);

recipes.addShapeless("youre_an_expert_harry_127", <quark:stone_diorite_wall>, [<harvestcraft:cashewitem>, <atum:linen_thread>, <ferdinandsflowers:block_dye_brickb>, <harvestcraft:raspberryjellysandwichitem>]);

//Recipe 128
recipes.remove(<thermalfoundation:tool.bow_tin>, false);
furnace.remove(<thermalfoundation:tool.bow_tin>);

ManaInfusion.addAlchemy(<thermalfoundation:tool.bow_tin>, <quark:biome_cobblestone:1>, 4457);

//Recipe 129
recipes.remove(<tcomplement:alloy_tank>, false);
furnace.remove(<tcomplement:alloy_tank>);

ManaInfusion.addInfusion(<tcomplement:alloy_tank>, <harvestcraft:chickenchowmeinitem>, 5184);

//Recipe 130
recipes.remove(<harvestcraft:mobsoupitem>, false);
furnace.remove(<harvestcraft:mobsoupitem>);

recipes.addShaped("youre_an_expert_harry_130", <harvestcraft:mobsoupitem>, 
 [[<futuremc:netherite_axe>, <artifacts:whoopie_cushion>, <futuremc:netherite_axe>],
  [<artifacts:whoopie_cushion>, <betternether:bone_wall>, <artifacts:whoopie_cushion>],
  [<futuremc:netherite_axe>, <artifacts:whoopie_cushion>, <futuremc:netherite_axe>]]);

//Recipe 131
recipes.remove(<embers:nugget_bronze>, false);
furnace.remove(<embers:nugget_bronze>);

ManaInfusion.addInfusion(<embers:nugget_bronze>, <thaumcraft:crimson_praetor_legs>, 5206);

//Recipe 132
recipes.remove(<harvestcraft:mintcupcakeitem>, false);
furnace.remove(<harvestcraft:mintcupcakeitem>);

recipes.addShaped("youre_an_expert_harry_132", <harvestcraft:mintcupcakeitem>, 
 [[<atum:loot_gold_broach>, <nuclearcraft:hoe_hard_carbon>, <atum:loot_gold_broach>],
  [<nuclearcraft:hoe_hard_carbon>, <harvestcraft:museliitem>, <nuclearcraft:hoe_hard_carbon>],
  [<atum:loot_gold_broach>, <nuclearcraft:hoe_hard_carbon>, <atum:loot_gold_broach>]]);

//Recipe 133
recipes.remove(<aether_legacy:zanite_gloves>, false);
furnace.remove(<aether_legacy:zanite_gloves>);

recipes.addShaped("youre_an_expert_harry_133", <aether_legacy:zanite_gloves>, 
 [[<tcomplement:scorched_stairs_stone>, <harvestcraft:mincepieitem>, <tcomplement:scorched_stairs_stone>],
  [<appliedenergistics2:nether_quartz_wrench>, <harvestcraft:deluxecheeseburgeritem>, <appliedenergistics2:nether_quartz_wrench>],
  [<minecraft:cooked_rabbit>, <thaumcraft:placeholder_anvil>, <minecraft:cooked_rabbit>]]);

//Recipe 134
recipes.remove(<twilightforest:charm_of_keeping_1>, false);
furnace.remove(<twilightforest:charm_of_keeping_1>);

ManaInfusion.addAlchemy(<twilightforest:charm_of_keeping_1>, <harvestcraft:mochidessertitem>, 9741);

//Recipe 135
recipes.remove(<midnight:tenebrum_block>, false);
furnace.remove(<midnight:tenebrum_block>);

Apothecary.addRecipe(<midnight:tenebrum_block>, [<betternether:nether_mycelium>, <artisanworktables:artisans_pliers_osmium>, <densemetals:dense_lapis_ore>, <quark:crystal_pane:7>, <twilightforest:arctic_chestplate>, <sonarcore:reinforceddirtbrickfence>, <theaurorian:auroriantallgrasslight>, <opencomputers:card:4>]);

//Recipe 136
recipes.remove(<bigreactors:dustcyanite>, false);
furnace.remove(<bigreactors:dustcyanite>);

recipes.addShaped("youre_an_expert_harry_136", <bigreactors:dustcyanite>, 
 [[<thaumicbases:mixedingot>, <theaurorian:auroriantallgrass>, <thaumicbases:mixedingot>],
  [<theaurorian:darkstonekey>, <midnight:tenebrum_shovel>, <theaurorian:darkstonekey>],
  [<thaumcraft:stairs_silverwood>, <harvestcraft:caramelicecreamitem>, <thaumcraft:stairs_silverwood>]]);

//Recipe 137
recipes.remove(<ferdinandsflowers:block_cff_doubless:3>, false);
furnace.remove(<ferdinandsflowers:block_cff_doubless:3>);

RuneAltar.addRecipe(<ferdinandsflowers:block_cff_doubless:3>, [<artisanworktables:artisans_punch_iron>], 6000);

//Recipe 138
recipes.remove(<minecraft:leaves2:1>, false);
furnace.remove(<minecraft:leaves2:1>);
ManaInfusion.removeRecipe(<minecraft:leaves2:1>);

recipes.addShaped("youre_an_expert_harry_138", <minecraft:leaves2:1>, 
 [[<botania:thirdeye>, <appliedenergistics2:sky_compass>, <botania:thirdeye>],
  [<bloodmagic:item_demon_crystal:2>, <tconstruct:brownstone_slab:7>, <bloodmagic:item_demon_crystal:2>],
  [<forbidden_arcanus:bottle_block>, <atum:desert_chest_iron>, <forbidden_arcanus:bottle_block>]]);

//Recipe 139
recipes.remove(<embers:axe_silver>, false);
furnace.remove(<embers:axe_silver>);

RuneAltar.addRecipe(<embers:axe_silver>, [<enderio:item_broken_spawner>, <nuclearcraft:geiger_block>, <artisanworktables:artisans_cutting_board_toughalloy>, <midnight:dead_wood_stairs>], 5000);

//Recipe 140
recipes.remove(<minecraft:glowstone>, false);
furnace.remove(<minecraft:glowstone>);

furnace.addRecipe(<minecraft:glowstone>, <netherex:smooth_basalt_wall>);

//Recipe 141
recipes.remove(<botania:icependant>, false);
furnace.remove(<botania:icependant>);

ManaInfusion.addAlchemy(<botania:icependant>, <harvestcraft:chocolatestrawberryitem>, 3868);

//Recipe 142
recipes.remove(<thaumicbases:irongreatwood>, false);
furnace.remove(<thaumicbases:irongreatwood>);

RuneAltar.addRecipe(<thaumicbases:irongreatwood>, [<harvestcraft:deluxenachoesitem>, <aether_legacy:gummy_swet>, <bibliocraft:paintingframesimple:5>, <minecraft:silver_glazed_terracotta>], 6000);

//Recipe 143
recipes.remove(<harvestcraft:herbbutterparsnipsitem>, false);
furnace.remove(<harvestcraft:herbbutterparsnipsitem>);

recipes.addShapeless("youre_an_expert_harry_143", <harvestcraft:herbbutterparsnipsitem>, [<artisanworktables:artisans_chisel_manasteel>, <extrautils2:trashcanenergy>, <draconicevolution:wyvern_axe>, <enderio:block_power_monitor>]);

//Recipe 144
recipes.remove(<betternether:reeds_fence>, false);
furnace.remove(<betternether:reeds_fence>);

ManaInfusion.addInfusion(<betternether:reeds_fence>, <artisanworktables:artisans_knife_constantan>, 9228);

//Recipe 145
recipes.remove(<thaumicbases:glieoniaseed>, false);
furnace.remove(<thaumicbases:glieoniaseed>);

furnace.addRecipe(<thaumicbases:glieoniaseed>, <hammercore:quartz_bordered_cobblestone>);

