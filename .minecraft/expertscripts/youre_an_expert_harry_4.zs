#priority 42
import mods.botania.RuneAltar;
import mods.botania.ElvenTrade;
import mods.botaniatweaks.AgglomerationMultiblock;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.Agglomeration;
import mods.botania.Apothecary;
import mods.botania.ManaInfusion;
//Recipe 595
recipes.remove(<artisanworktables:artisans_solderer_diamond>, false);
furnace.remove(<artisanworktables:artisans_solderer_diamond>);

furnace.addRecipe(<artisanworktables:artisans_solderer_diamond>, <quark:bark_oak_slab>);

//Recipe 596
recipes.remove(<minecraft:red_flower:5>, false);
furnace.remove(<minecraft:red_flower:5>);
ManaInfusion.removeRecipe(<minecraft:red_flower:5>);

recipes.addShaped("youre_an_expert_harry_596", <minecraft:red_flower:5>, 
 [[<artisanworktables:artisans_trowel_bronze>, <dynamictreestc:greatwoodbranchx>, <artisanworktables:artisans_trowel_bronze>],
  [<quark:blaze_lantern>, <theaurorian:silentwoodshovel>, <quark:blaze_lantern>],
  [<forbidden_arcanus:silver_dragon_scale>, <appliedenergistics2:crafting_unit>, <forbidden_arcanus:silver_dragon_scale>]]);

//Recipe 597
recipes.remove(<harvestcraft:chocolatestrawberryitem>, false);
furnace.remove(<harvestcraft:chocolatestrawberryitem>);

Apothecary.addRecipe(<harvestcraft:chocolatestrawberryitem>, [<botania:elementiumaxe>]);

//Recipe 598
recipes.remove(<abyssalcraft:abyore>, false);
furnace.remove(<abyssalcraft:abyore>);

Apothecary.addRecipe(<abyssalcraft:abyore>, [<artisanworktables:artisans_pan_gold>, <bloodmagic:blood_tank:7>, <nuclearcraft:electromagnet_supercooler_idle>, <embers:ashen_stone>, <galacticraftplanets:mars:3>]);

//Recipe 599
recipes.remove(<abyssalcraft:scroll:1>, false);
furnace.remove(<abyssalcraft:scroll:1>);

furnace.addRecipe(<abyssalcraft:scroll:1>, <enderio:block_painted_slab>);

//Recipe 600
recipes.remove(<taiga:triberium_ingot>, false);
furnace.remove(<taiga:triberium_ingot>);

recipes.addShapeless("youre_an_expert_harry_600", <taiga:triberium_ingot>, [<mekanism:basicblock2:8>, <artisanworktables:artisans_mortar_steel>, <minecraft:orange_shulker_box>, <aether_legacy:holystone_brick_stairs>]);

//Recipe 601
recipes.remove(<extrabotany:coregod:1>, false);
furnace.remove(<extrabotany:coregod:1>);

recipes.addShaped("youre_an_expert_harry_601", <extrabotany:coregod:1>, 
 [[<abyssalcraft:engraving_azathoth>, <netherex:orange_salamander_hide_helmet>, <abyssalcraft:engraving_azathoth>],
  [<netherex:orange_salamander_hide_helmet>, <minecraft:concrete_powder>, <netherex:orange_salamander_hide_helmet>],
  [<abyssalcraft:engraving_azathoth>, <netherex:orange_salamander_hide_helmet>, <abyssalcraft:engraving_azathoth>]]);

//Recipe 602
recipes.remove(<artisanworktables:artisans_needle_wood>, false);
furnace.remove(<artisanworktables:artisans_needle_wood>);

recipes.addShapeless("youre_an_expert_harry_602", <artisanworktables:artisans_needle_wood>, [<abyssalcraft:corshovel>, <harvestcraft:mustarditem>, <thaumicaugmentation:augment_vis_battery>, <thaumicwonders:void_fortress_legs>]);

//Recipe 603
recipes.remove(<thaumicaugmentation:rift_seed:1>, false);
furnace.remove(<thaumicaugmentation:rift_seed:1>);

ManaInfusion.addInfusion(<thaumicaugmentation:rift_seed:1>, <quark:iron_ladder>, 3026);

//Recipe 604
recipes.remove(<harvestcraft:tamarinditem>, false);
furnace.remove(<harvestcraft:tamarinditem>);

recipes.addShaped("youre_an_expert_harry_604", <harvestcraft:tamarinditem>, 
 [[<minecraft:iron_ingot>, <forbidden_arcanus:spectral_eye_amulet>, <minecraft:iron_ingot>],
  [<forbidden_arcanus:spectral_eye_amulet>, <harvestcraft:pepperjellyandcrackersitem>, <forbidden_arcanus:spectral_eye_amulet>],
  [<minecraft:iron_ingot>, <forbidden_arcanus:spectral_eye_amulet>, <minecraft:iron_ingot>]]);

//Recipe 605
recipes.remove(<notenoughwands:swapping_wand>, false);
furnace.remove(<notenoughwands:swapping_wand>);

recipes.addShaped("youre_an_expert_harry_605", <notenoughwands:swapping_wand>, 
 [[<thermalfoundation:armor.legs_invar>, <atum:oasis_grass>, <thermalfoundation:armor.legs_invar>],
  [<harvestcraft:apricot_sapling>, <harvestcraft:apricotyogurtitem>, <harvestcraft:apricot_sapling>],
  [<artisanworktables:artisans_pencil_wood>, <artisanworktables:artisans_tsquare_elementium>, <artisanworktables:artisans_pencil_wood>]]);

//Recipe 606
recipes.remove(<atum:fish_skeletal>, false);
furnace.remove(<atum:fish_skeletal>);

recipes.addShaped("youre_an_expert_harry_606", <atum:fish_skeletal>, 
 [[<immersivecables:connector_quartz>, <galacticraftcore:grating>, <immersivecables:connector_quartz>],
  [<galacticraftcore:grating>, <thaumicaugmentation:morphic_tool:15>, <galacticraftcore:grating>],
  [<immersivecables:connector_quartz>, <galacticraftcore:grating>, <immersivecables:connector_quartz>]]);

//Recipe 607
recipes.remove(<extrautils2:creativeenergy>, false);
furnace.remove(<extrautils2:creativeenergy>);

recipes.addShaped("youre_an_expert_harry_607", <extrautils2:creativeenergy>, 
 [[<thaumcraft:condenser_lattice_dirty>, <botania:supercloudpendant>, <thaumcraft:condenser_lattice_dirty>],
  [<botania:supercloudpendant>, <thaumicbases:blockthauminite>, <botania:supercloudpendant>],
  [<thaumcraft:condenser_lattice_dirty>, <botania:supercloudpendant>, <thaumcraft:condenser_lattice_dirty>]]);

//Recipe 608
recipes.remove(<embers:shovel_lead>, false);
furnace.remove(<embers:shovel_lead>);

ManaInfusion.addInfusion(<embers:shovel_lead>, <abyssalcraft:dreadstonecobblestonewall>, 6853);

//Recipe 609
recipes.remove(<draconicevolution:potentiometer>, false);
furnace.remove(<draconicevolution:potentiometer>);

recipes.addShapeless("youre_an_expert_harry_609", <draconicevolution:potentiometer>, [<midnight:nagrilite_shovel>, <astralsorcery:blockcustomore>, <theaurorian:silentwoodbow>, <abyssalcraft:abychunk>]);

//Recipe 610
recipes.remove(<artisanworktables:artisans_compass_nickel>, false);
furnace.remove(<artisanworktables:artisans_compass_nickel>);

recipes.addShapeless("youre_an_expert_harry_610", <artisanworktables:artisans_compass_nickel>, [<artisanworktables:artisans_shears_aluminum>, <harvestcraft:eelrawitem>, <embers:archaic_light>, <artisanworktables:artisans_shears_flint>]);

//Recipe 611
recipes.remove(<enderio:block_industrial_insulation>, false);
furnace.remove(<enderio:block_industrial_insulation>);

Apothecary.addRecipe(<enderio:block_industrial_insulation>, [<bloodmagic:sentient_axe>, <thermalfoundation:horse_armor_tin>, <tcomplement:scorched_stairs_creeper>]);

//Recipe 612
recipes.remove(<enderio:block_power_monitor>, false);
furnace.remove(<enderio:block_power_monitor>);

ManaInfusion.addInfusion(<enderio:block_power_monitor>, <harvestcraft:sisalseeditem>, 6180);

//Recipe 613
recipes.remove(<harvestcraft:seedenergygelitem>, false);
furnace.remove(<harvestcraft:seedenergygelitem>);

recipes.addShaped("youre_an_expert_harry_613", <harvestcraft:seedenergygelitem>, 
 [[<botania:manaweavechest>, <abyssalcraft:dltslab1>, <botania:manaweavechest>],
  [<conarm:helmet_core>, <abyssalcraft:dreadiumsword>, <conarm:helmet_core>],
  [<artisanworktables:artisans_spanner_elementium>, <thaumcraft:crystal_aqua>, <artisanworktables:artisans_spanner_elementium>]]);

//Recipe 614
recipes.remove(<futuremc:stone_brick_wall>, false);
furnace.remove(<futuremc:stone_brick_wall>);

Apothecary.addRecipe(<futuremc:stone_brick_wall>, [<thaumcraft:candle_lightblue>, <openblocks:auto_enchantment_table>, <embers:breaker>, <thaumcraft:banner_green>, <twilightforest:aurora_slab>, <nuclearcraft:rad_x>, <galacticraftcore:key>]);

//Recipe 615
recipes.remove(<abyssalcraft:abyslab1>, false);
furnace.remove(<abyssalcraft:abyslab1>);

ManaInfusion.addInfusion(<abyssalcraft:abyslab1>, <enderio:block_self_resetting_lever60>, 3713);

//Recipe 616
recipes.remove(<minecraft:egg>, false);
furnace.remove(<minecraft:egg>);

furnace.addRecipe(<minecraft:egg>, <artisanworktables:artisans_shears_boron>);

//Recipe 617
recipes.remove(<atum:palm_door>, false);
furnace.remove(<atum:palm_door>);

Apothecary.addRecipe(<atum:palm_door>, [<midnight:bogshroom>, <atum:thin_crystal_pink_stained_glass>, <embers:plate_silver>]);

//Recipe 618
recipes.remove(<abyssalcraft:abygolore>, false);
furnace.remove(<abyssalcraft:abygolore>);

furnace.addRecipe(<abyssalcraft:abygolore>, <yurtmod:cos_tepee_wall_dreamcatcher>);

//Recipe 619
recipes.remove(<netherendingores:ore_nether_modded_1:4>, false);
furnace.remove(<netherendingores:ore_nether_modded_1:4>);

furnace.addRecipe(<netherendingores:ore_nether_modded_1:4>, <harvestcraft:cheddarandsourcreampotatochipsitem>);

//Recipe 620
recipes.remove(<harvestcraft:hazelnutitem>, false);
furnace.remove(<harvestcraft:hazelnutitem>);

furnace.addRecipe(<harvestcraft:hazelnutitem>, <extrautils2:enderlilly>);

//Recipe 621
recipes.remove(<harvestcraft:stuffedduckitem>, false);
furnace.remove(<harvestcraft:stuffedduckitem>);

recipes.addShapeless("youre_an_expert_harry_621", <harvestcraft:stuffedduckitem>, [<thaumicbases:rosehipsyrup>, <harvestcraft:salmonpattiesitem>, <twilightforest:twilight_leaves:1>, <malisisdoors:curtain_brown>]);

//Recipe 622
recipes.remove(<forbidden_arcanus:edelwood_trapdoor>, false);
furnace.remove(<forbidden_arcanus:edelwood_trapdoor>);

furnace.remove(<theaurorian:auroriansteelnugget>);
furnace.addRecipe(<forbidden_arcanus:edelwood_trapdoor>, <theaurorian:auroriansteelchestplate>);

//Recipe 623
recipes.remove(<bountifulbaubles:enderdragonscale>, false);
furnace.remove(<bountifulbaubles:enderdragonscale>);

recipes.addShapeless("youre_an_expert_harry_623", <bountifulbaubles:enderdragonscale>, [<harvestcraft:chocolatepuddingitem>, <thaumadditions:jar_thaumium>, <harvestcraft:crackeritem>, <enderio:block_not_holy_fused_quartz:9>]);

//Recipe 624
recipes.remove(<quark:midori_block_wall>, false);
furnace.remove(<quark:midori_block_wall>);

ManaInfusion.addInfusion(<quark:midori_block_wall>, <ferdinandsflowers:block_sand_light>, 5173);

//Recipe 625
recipes.remove(<draconicevolution:diss_enchanter>, false);
furnace.remove(<draconicevolution:diss_enchanter>);

ManaInfusion.addInfusion(<draconicevolution:diss_enchanter>, <sonarcore:stablestone_normal>, 4884);

//Recipe 626
recipes.remove(<bloodmagic:experience_tome>, false);
furnace.remove(<bloodmagic:experience_tome>);

furnace.addRecipe(<bloodmagic:experience_tome>, <artisanworktables:artisans_mortar_nickel>);

//Recipe 627
recipes.remove(<thaumicwonders:creative_essentia_jar>, false);
furnace.remove(<thaumicwonders:creative_essentia_jar>);

recipes.addShaped("youre_an_expert_harry_627", <thaumicwonders:creative_essentia_jar>, 
 [[<thermalfoundation:tool.excavator_platinum>, <signpost:blockbasemodel1>, <thermalfoundation:tool.excavator_platinum>],
  [<signpost:blockbasemodel1>, <harvestcraft:padthaiitem>, <signpost:blockbasemodel1>],
  [<thermalfoundation:tool.excavator_platinum>, <signpost:blockbasemodel1>, <thermalfoundation:tool.excavator_platinum>]]);

//Recipe 628
recipes.remove(<quark:crystal_pane:7>, false);
furnace.remove(<quark:crystal_pane:7>);

furnace.addRecipe(<quark:crystal_pane:7>, <harvestcraft:groundbeefitem>);

//Recipe 629
recipes.remove(<dynamictreesphc:bananaseed>, false);
furnace.remove(<dynamictreesphc:bananaseed>);

furnace.addRecipe(<dynamictreesphc:bananaseed>, <botanicadds:rune_tp>);

//Recipe 630
recipes.remove(<tconstruct:brownstone_slab:7>, false);
furnace.remove(<tconstruct:brownstone_slab:7>);

recipes.addShaped("youre_an_expert_harry_630", <tconstruct:brownstone_slab:7>, 
 [[<thaumicaugmentation:starfield_glass:2>, <quark:acacia_pressure_plate>, <thaumicaugmentation:starfield_glass:2>],
  [<quark:acacia_pressure_plate>, <bloodmagic:demon_stairs_2:1>, <quark:acacia_pressure_plate>],
  [<thaumicaugmentation:starfield_glass:2>, <quark:acacia_pressure_plate>, <thaumicaugmentation:starfield_glass:2>]]);

//Recipe 631
recipes.remove(<abyssalcraft:dreadiumplate>, false);
furnace.remove(<abyssalcraft:dreadiumplate>);

recipes.addShaped("youre_an_expert_harry_631", <abyssalcraft:dreadiumplate>, 
 [[<bibliocraft:lanterngold:7>, <thaumicbases:bloodylegs>, <bibliocraft:lanterngold:7>],
  [<thaumicbases:bloodylegs>, <theaurorian:darkstonegate>, <thaumicbases:bloodylegs>],
  [<bibliocraft:lanterngold:7>, <thaumicbases:bloodylegs>, <bibliocraft:lanterngold:7>]]);

//Recipe 632
recipes.remove(<forbidden_arcanus:arcane_gold_block>, false);
furnace.remove(<forbidden_arcanus:arcane_gold_block>);

Apothecary.addRecipe(<forbidden_arcanus:arcane_gold_block>, [<aether_legacy:carved_stairs>, <thaumadditions:thaumic_lectern>, <botania:vineball>, <thaumicbases:redlonseed>, <enderio:block_holy_fused_glass:15>]);

//Recipe 633
recipes.remove(<atum:linen_carpet_black>, false);
furnace.remove(<atum:linen_carpet_black>);

Apothecary.addRecipe(<atum:linen_carpet_black>, [<watercan:watercan_diamond>, <artisanworktables:artisans_solderer_constantan>, <futuremc:composter>, <bountifulbaubles:spectralsilt>, <aether_legacy:yellow_cape>, <harvestcraft:okraseeditem>, <enderio:block_confusion_charge>]);

//Recipe 634
recipes.remove(<minecraft:enchanting_table>, false);
furnace.remove(<minecraft:enchanting_table>);

recipes.addShaped("youre_an_expert_harry_634", <minecraft:enchanting_table>, 
 [[<nuclearcraft:block_depleted_neptunium>, <quark:jasper_wall>, <nuclearcraft:block_depleted_neptunium>],
  [<atum:ceramic_stairs_magenta>, <galacticraftplanets:boss_spawner_mars>, <atum:ceramic_stairs_magenta>],
  [<dynamictrees:cactusseed>, <mekanism:glowpanel:7>, <dynamictrees:cactusseed>]]);

//Recipe 635
recipes.remove(<minecraft:lead>, false);
furnace.remove(<minecraft:lead>);

furnace.addRecipe(<minecraft:lead>, <extrabotany:shadowwarriorhelm>);

//Recipe 636
recipes.remove(<nuclearcraft:helium_collector_compact>, false);
furnace.remove(<nuclearcraft:helium_collector_compact>);

recipes.addShaped("youre_an_expert_harry_636", <nuclearcraft:helium_collector_compact>, 
 [[<atum:limestone_brick_carved_door>, <draconicevolution:reactor_part>, <atum:limestone_brick_carved_door>],
  [<draconicevolution:reactor_part>, <atum:arrow_trap>, <draconicevolution:reactor_part>],
  [<atum:limestone_brick_carved_door>, <draconicevolution:reactor_part>, <atum:limestone_brick_carved_door>]]);

//Recipe 637
recipes.remove(<minecraft:birch_boat>, false);
furnace.remove(<minecraft:birch_boat>);

recipes.addShaped("youre_an_expert_harry_637", <minecraft:birch_boat>, 
 [[<malisisdoors:big_door_acacia_3x3>, <minecraft:ender_eye>, <malisisdoors:big_door_acacia_3x3>],
  [<minecraft:ender_eye>, <thaumadditions:crystal_bag>, <minecraft:ender_eye>],
  [<malisisdoors:big_door_acacia_3x3>, <minecraft:ender_eye>, <malisisdoors:big_door_acacia_3x3>]]);

//Recipe 638
recipes.remove(<mekanism:shard:4>, false);
furnace.remove(<mekanism:shard:4>);

recipes.addShaped("youre_an_expert_harry_638", <mekanism:shard:4>, 
 [[<appliedenergistics2:quartz_glass>, <thaumcraft:void_pick>, <appliedenergistics2:quartz_glass>],
  [<thaumcraft:void_pick>, <thermalfoundation:armor.plate_steel>, <thaumcraft:void_pick>],
  [<appliedenergistics2:quartz_glass>, <thaumcraft:void_pick>, <appliedenergistics2:quartz_glass>]]);

//Recipe 639
recipes.remove(<artisanworktables:artisans_grimoire_stone>, false);
furnace.remove(<artisanworktables:artisans_grimoire_stone>);

recipes.addShaped("youre_an_expert_harry_639", <artisanworktables:artisans_grimoire_stone>, 
 [[<aether_legacy:holystone_wall>, <artisanworktables:artisans_framing_hammer_bronze>, <aether_legacy:holystone_wall>],
  [<abyssalcraft:abyssalnitecobblestonestairs>, <tconstruct:brownstone_stairs_tile>, <abyssalcraft:abyssalnitecobblestonestairs>],
  [<thaumadditions:vis_seeds>, <harvestcraft:soybeanitem>, <thaumadditions:vis_seeds>]]);

//Recipe 640
recipes.remove(<thermalfoundation:tool.hoe_aluminum>, false);
furnace.remove(<thermalfoundation:tool.hoe_aluminum>);

recipes.addShapeless("youre_an_expert_harry_640", <thermalfoundation:tool.hoe_aluminum>, [<appliedenergistics2:facade>, <dynamictreesphc:gooseberryseed>, <extrautils2:snowglobe:1>, <conarm:travel_belt>]);

//Recipe 641
recipes.remove(<openblocks:trophy>, false);
furnace.remove(<openblocks:trophy>);

furnace.addRecipe(<openblocks:trophy>, <botania:waterring>);

//Recipe 642
recipes.remove(<thaumicbases:greatwoodpipe>, false);
furnace.remove(<thaumicbases:greatwoodpipe>);

recipes.addShaped("youre_an_expert_harry_642", <thaumicbases:greatwoodpipe>, 
 [[<thaumicaugmentation:arcane_trapdoor_wood>, <botania:manasteelhelm>, <thaumicaugmentation:arcane_trapdoor_wood>],
  [<arcanearchives:radiant_chest>, <botania:sextant>, <arcanearchives:radiant_chest>],
  [<bigreactors:dustblutonium>, <enderio:item_me_conduit>, <bigreactors:dustblutonium>]]);

//Recipe 643
recipes.remove(<artisanworktables:artisans_beaker_platinum>, false);
furnace.remove(<artisanworktables:artisans_beaker_platinum>);

recipes.addShaped("youre_an_expert_harry_643", <artisanworktables:artisans_beaker_platinum>, 
 [[<thermalfoundation:horse_armor_invar>, <artisanworktables:artisans_punch_boronnitride>, <thermalfoundation:horse_armor_invar>],
  [<harvestcraft:shrimpokrahushpuppiesitem>, <forbidden_arcanus:golden_dragon_scale>, <harvestcraft:shrimpokrahushpuppiesitem>],
  [<openblocks:heal>, <twilightforest:time_slab>, <openblocks:heal>]]);

//Recipe 644
recipes.remove(<quark:stained_planks_orange_stairs>, false);
furnace.remove(<quark:stained_planks_orange_stairs>);

recipes.addShapeless("youre_an_expert_harry_644", <quark:stained_planks_orange_stairs>, [<harvestcraft:cornitem>, <dynamictrees:darkoakbranchx>, <atum:framed_purple_stained_glass>, <extrautils2:analogcrafter>]);

//Recipe 645
recipes.remove(<densemetals:dense_tin_ore>, false);
furnace.remove(<densemetals:dense_tin_ore>);

recipes.addShaped("youre_an_expert_harry_645", <densemetals:dense_tin_ore>, 
 [[<abyssalcraft:dreadiumboots>, <artisanworktables:artisans_needle_boron>, <abyssalcraft:dreadiumboots>],
  [<opencomputers:disassembler>, <harvestcraft:enchiladaitem>, <opencomputers:disassembler>],
  [<atum:ceramic_slab_light_blue>, <galacticraftcore:air_fan>, <atum:ceramic_slab_light_blue>]]);

//Recipe 646
recipes.remove(<atum:linen_carpet_silver>, false);
furnace.remove(<atum:linen_carpet_silver>);

recipes.addShaped("youre_an_expert_harry_646", <atum:linen_carpet_silver>, 
 [[<thaumicenergistics:essentia_component_4k>, <extrabotany:infinitewine>, <thaumicenergistics:essentia_component_4k>],
  [<artifacts:everlasting_cooked_beef>, <midnight:viridshroom_fence>, <artifacts:everlasting_cooked_beef>],
  [<forbidden_arcanus:dark_stone_brick_stairs>, <abyssalcraft:dboots>, <forbidden_arcanus:dark_stone_brick_stairs>]]);

//Recipe 647
recipes.remove(<minecraft:lime_glazed_terracotta>, false);
furnace.remove(<minecraft:lime_glazed_terracotta>);

recipes.addShapeless("youre_an_expert_harry_647", <minecraft:lime_glazed_terracotta>, [<harvestcraft:kiwijuiceitem>, <minecraft:concrete:14>, <artisanworktables:artisans_trowel_flint>, <forbidden_arcanus:rune>]);

//Recipe 648
recipes.remove(<minecraft:netherbrick>, false);
furnace.remove(<minecraft:netherbrick>);

ManaInfusion.addInfusion(<minecraft:netherbrick>, <harvestcraft:holidaycakeitem>, 6715);

//Recipe 649
recipes.remove(<thaumcraft:crimson_praetor_legs>, false);
furnace.remove(<thaumcraft:crimson_praetor_legs>);

ManaInfusion.addInfusion(<thaumcraft:crimson_praetor_legs>, <theaurorian:bepsi>, 9215);

//Recipe 650
recipes.remove(<thaumcraft:cinderpearl>, false);
furnace.remove(<thaumcraft:cinderpearl>);

Apothecary.addRecipe(<thaumcraft:cinderpearl>, [<midnight:double_bogshroom>, <twilightforest:moon_dial>, <ironchest:gold_diamond_shulker_upgrade>, <arcanearchives:mindspindle>, <twilightforest:ironwood_ingot>, <abyssalcraft:dghead>, <bibliocraft:biblioredbook>, <futuremc:spruce_wood>]);

//Recipe 651
recipes.remove(<artisanworktables:artisans_file_steel>, false);
furnace.remove(<artisanworktables:artisans_file_steel>);

recipes.addShaped("youre_an_expert_harry_651", <artisanworktables:artisans_file_steel>, 
 [[<draconicevolution:dislocator>, <harvestcraft:maple_sapling>, <draconicevolution:dislocator>],
  [<artisanworktables:artisans_mortar_boronnitride>, <thaumcraft:stairs_arcane_brick>, <artisanworktables:artisans_mortar_boronnitride>],
  [<materialis:alumite_block>, <nuclearcraft:lithium:1>, <materialis:alumite_block>]]);

//Recipe 652
recipes.remove(<appliedenergistics2:nether_quartz_wrench>, false);
furnace.remove(<appliedenergistics2:nether_quartz_wrench>);

Apothecary.addRecipe(<appliedenergistics2:nether_quartz_wrench>, [<harvestcraft:sardinesinhotsauceitem>, <atum:thin_crystal_green_stained_glass>, <tconstruct:faucet>, <twilightforest:twilight_oak_stairs>, <aether_legacy:neptune_chestplate>, <botania:manaresource:7>, <thaumicperiphery:vis_phylactery>]);

//Recipe 653
recipes.remove(<minecraft:brick_stairs>, false);
furnace.remove(<minecraft:brick_stairs>);

recipes.addShaped("youre_an_expert_harry_653", <minecraft:brick_stairs>, 
 [[<quark:stained_planks:6>, <malisisdoors:curtain_red>, <quark:stained_planks:6>],
  [<malisisdoors:curtain_red>, <midnight:midnight_lever>, <malisisdoors:curtain_red>],
  [<quark:stained_planks:6>, <malisisdoors:curtain_red>, <quark:stained_planks:6>]]);

//Recipe 654
recipes.remove(<aether_legacy:treasure_chest>, false);
furnace.remove(<aether_legacy:treasure_chest>);

recipes.addShaped("youre_an_expert_harry_654", <aether_legacy:treasure_chest>, 
 [[<harvestcraft:queenbeeitem>, <theaurorian:auroriancoalore>, <harvestcraft:queenbeeitem>],
  [<theaurorian:auroriancoalore>, <atum:idol_of_labor>, <theaurorian:auroriancoalore>],
  [<harvestcraft:queenbeeitem>, <theaurorian:auroriancoalore>, <harvestcraft:queenbeeitem>]]);

//Recipe 655
recipes.remove(<harvestcraft:jamrollitem>, false);
furnace.remove(<harvestcraft:jamrollitem>);

furnace.addRecipe(<harvestcraft:jamrollitem>, <harvestcraft:applejuiceitem>);

//Recipe 656
recipes.remove(<galacticraftplanets:walkway:1>, false);
furnace.remove(<galacticraftplanets:walkway:1>);

furnace.addRecipe(<galacticraftplanets:walkway:1>, <mca:wedding_ring>);

//Recipe 657
recipes.remove(<aether_legacy:aether_grass>, false);
furnace.remove(<aether_legacy:aether_grass>);

recipes.addShaped("youre_an_expert_harry_657", <aether_legacy:aether_grass>, 
 [[<artisanworktables:artisans_trowel_flint>, <openblocks:cartographer>, <artisanworktables:artisans_trowel_flint>],
  [<openblocks:cartographer>, <harvestcraft:mulberryitem>, <openblocks:cartographer>],
  [<artisanworktables:artisans_trowel_flint>, <openblocks:cartographer>, <artisanworktables:artisans_trowel_flint>]]);

//Recipe 658
recipes.remove(<harvestcraft:beetsaladitem>, false);
furnace.remove(<harvestcraft:beetsaladitem>);

ManaInfusion.addInfusion(<harvestcraft:beetsaladitem>, <psi:spell_drive>, 8112);

//Recipe 659
recipes.remove(<botania:shimmerwoodplanks>, false);
furnace.remove(<botania:shimmerwoodplanks>);

recipes.addShaped("youre_an_expert_harry_659", <botania:shimmerwoodplanks>, 
 [[<immersiveengineering:metal_decoration1:5>, <bloodarsenal:block_blood_burned_string>, <immersiveengineering:metal_decoration1:5>],
  [<bloodarsenal:block_blood_burned_string>, <artisanworktables:artisans_hammer_osmium>, <bloodarsenal:block_blood_burned_string>],
  [<immersiveengineering:metal_decoration1:5>, <bloodarsenal:block_blood_burned_string>, <immersiveengineering:metal_decoration1:5>]]);

//Recipe 660
recipes.remove(<abyssalcraft:oblivionshard>, false);
furnace.remove(<abyssalcraft:oblivionshard>);

furnace.addRecipe(<abyssalcraft:oblivionshard>, <theaurorian:knightleggings>);

//Recipe 661
recipes.remove(<harvestcraft:grapefruitsmoothieitem>, false);
furnace.remove(<harvestcraft:grapefruitsmoothieitem>);

recipes.addShaped("youre_an_expert_harry_661", <harvestcraft:grapefruitsmoothieitem>, 
 [[<taiga:prometheum_block>, <ore:paneGlassPurple>, <taiga:prometheum_block>],
  [<harvestcraft:greenheartfishitem>, <tinker_io:ore_crusher>, <harvestcraft:greenheartfishitem>],
  [<artisanworktables:artisans_chisel_flint>, <artisanworktables:artisans_hammer_copper>, <artisanworktables:artisans_chisel_flint>]]);

//Recipe 662
recipes.remove(<astralsorcery:blockgemcrystals:3>, false);
furnace.remove(<astralsorcery:blockgemcrystals:3>);

recipes.addShaped("youre_an_expert_harry_662", <astralsorcery:blockgemcrystals:3>, 
 [[<harvestcraft:rawtofaconitem>, <harvestcraft:pearjuiceitem>, <harvestcraft:rawtofaconitem>],
  [<harvestcraft:pearjuiceitem>, <thaumcraft:nitor_magenta>, <harvestcraft:pearjuiceitem>],
  [<harvestcraft:rawtofaconitem>, <harvestcraft:pearjuiceitem>, <harvestcraft:rawtofaconitem>]]);

//Recipe 663
recipes.remove(<twilightforest:hedge>, false);
furnace.remove(<twilightforest:hedge>);

recipes.addShaped("youre_an_expert_harry_663", <twilightforest:hedge>, 
 [[<taiga:lumix_nugget>, <yurtmod:cos_tepee_wall_sun>, <taiga:lumix_nugget>],
  [<abyssalcraft:aplate>, <astralsorcery:blockcollectorcrystal>, <abyssalcraft:aplate>],
  [<tconstruct:large_plate>, <yurtmod:tepee_wall_hope>, <tconstruct:large_plate>]]);

//Recipe 664
recipes.remove(<quark:jasper_speleothem>, false);
furnace.remove(<quark:jasper_speleothem>);

Apothecary.addRecipe(<quark:jasper_speleothem>, [<quark:grate>, <sonarcore:stablestoneblackrimmed_green>, <thaumcraft:banner_crimson_cult>, <theaurorian:auroriansteelshovel>, <thaumcraft:smelter_aux>, <botania:pavement4slab>, <artisanworktables:artisans_spanner_osmium>, <thaumicbases:ironspike>, <netherex:soul_glass_pane>]);

//Recipe 665
recipes.remove(<harvestcraft:carrotcake>, false);
furnace.remove(<harvestcraft:carrotcake>);

Apothecary.addRecipe(<harvestcraft:carrotcake>, [<artisanworktables:artisans_mortar_osmium>]);

//Recipe 666
recipes.remove(<harvestcraft:dandelionsaladitem>, false);
furnace.remove(<harvestcraft:dandelionsaladitem>);

Apothecary.addRecipe(<harvestcraft:dandelionsaladitem>, [<artisanworktables:artisans_hammer_tin>]);

//Recipe 667
recipes.remove(<harvestcraft:raspberryitem>, false);
furnace.remove(<harvestcraft:raspberryitem>);

recipes.addShapeless("youre_an_expert_harry_667", <harvestcraft:raspberryitem>, [<botania:managlass>, <twilightforest:mine_button>, <taiga:cyberium_dust>, <sonarcore:stablestone_blue>]);

//Recipe 668
recipes.remove(<plustic:alumiteblock>, false);
furnace.remove(<plustic:alumiteblock>);

furnace.addRecipe(<plustic:alumiteblock>, <tcomplement:scorched_stairs_brick_fancy>);

//Recipe 669
recipes.remove(<harvestcraft:chorusfruitsoupitem>, false);
furnace.remove(<harvestcraft:chorusfruitsoupitem>);

Apothecary.addRecipe(<harvestcraft:chorusfruitsoupitem>, [<tconstruct:seared_stairs_brick_cracked>]);

//Recipe 670
recipes.remove(<forbidden_arcanus:arcane_carved_dark_stone_bricks>, false);
furnace.remove(<forbidden_arcanus:arcane_carved_dark_stone_bricks>);

furnace.addRecipe(<forbidden_arcanus:arcane_carved_dark_stone_bricks>, <bountiful:bountyboarditem>);

//Recipe 671
recipes.remove(<atum:linen_cloth>, false);
furnace.remove(<atum:linen_cloth>);

furnace.addRecipe(<atum:linen_cloth>, <taiga:vibranium_ingot>);

//Recipe 672
recipes.remove(<harvestcraft:venisoncookeditem>, false);
furnace.remove(<harvestcraft:venisoncookeditem>);

recipes.addShaped("youre_an_expert_harry_672", <harvestcraft:venisoncookeditem>, 
 [[<harvestcraft:glisteningsaladitem>, <twilightforest:twilight_oak_stairs>, <harvestcraft:glisteningsaladitem>],
  [<taiga:cyberium_block>, <artifacts:lucky_horseshoe>, <taiga:cyberium_block>],
  [<thaumcraft:slab_greatwood>, <artisanworktables:artisans_spanner_manasteel>, <thaumcraft:slab_greatwood>]]);

//Recipe 673
recipes.remove(<theaurorian:silentwoodaxe>, false);
furnace.remove(<theaurorian:silentwoodaxe>);

recipes.addShaped("youre_an_expert_harry_673", <theaurorian:silentwoodaxe>, 
 [[<harvestcraft:gingerchickenitem>, <abyssalcraft:cobblestone:3>, <harvestcraft:gingerchickenitem>],
  [<thaumicbases:enderlogs>, <harvestcraft:bbqchickenbiscuititem>, <thaumicbases:enderlogs>],
  [<embers:diffraction_barrel>, <galacticraftcore:air_vent>, <embers:diffraction_barrel>]]);

// RECIPE LEVEL: 1


//Recipe 674
recipes.remove(<artisanworktables:artisans_mortar_nickel>, false);
furnace.remove(<artisanworktables:artisans_mortar_nickel>);

furnace.addRecipe(<artisanworktables:artisans_mortar_nickel>, <theaurorian:moonlightforge>);

//Recipe 675
recipes.remove(<harvestcraft:pamcoconut>, false);
furnace.remove(<harvestcraft:pamcoconut>);

Apothecary.addRecipe(<harvestcraft:pamcoconut>, [<artisanworktables:artisans_mortar_platinum>, <minecraft:ice>, <tconstruct:pickaxe>, <botania:glasspick>]);

//Recipe 676
recipes.remove(<botania:openbucket>, false);
furnace.remove(<botania:openbucket>);

recipes.addShapeless("youre_an_expert_harry_676", <botania:openbucket>, [<extrautils2:magicapple>, <twilightforest:giant_pickaxe>, <minecraft:pink_shulker_box>, <harvestcraft:walnutitem>]);

//Recipe 677
recipes.remove(<thaumcraft:slab_arcane_stone>, false);
furnace.remove(<thaumcraft:slab_arcane_stone>);

Apothecary.addRecipe(<thaumcraft:slab_arcane_stone>, [<mekanism:biofuel>, <forbidden_arcanus:mortem_helmet>]);

//Recipe 678
recipes.remove(<quark:iron_plate_slab>, false);
furnace.remove(<quark:iron_plate_slab>);

recipes.addShapeless("youre_an_expert_harry_678", <quark:iron_plate_slab>, [<harvestcraft:cottonitem>, <opencomputers:chameliumblock>, <tconstruct:kama_head>, <abyssalcraft:transmutationgem>]);

//Recipe 679
recipes.remove(<embers:caminite_lever>, false);
furnace.remove(<embers:caminite_lever>);

Apothecary.addRecipe(<embers:caminite_lever>, [<tcomplement:materials:20>, <artisanworktables:artisans_knife_silver>]);

//Recipe 680
recipes.remove(<nuclearcraft:cocoa_butter>, false);
furnace.remove(<nuclearcraft:cocoa_butter>);

furnace.addRecipe(<nuclearcraft:cocoa_butter>, <botania:cellblock>);

//Recipe 681
recipes.remove(<galacticraftplanets:desh_chestplate>, false);
furnace.remove(<galacticraftplanets:desh_chestplate>);

recipes.addShapeless("youre_an_expert_harry_681", <galacticraftplanets:desh_chestplate>, [<bigreactors:turbinecontroller>, <extrabotany:blockorichalcos>, <taiga:niob_nugget>, <twilightforest:mine_plate>]);

//Recipe 682
recipes.remove(<abyssalcraft:azathothcoin>, false);
furnace.remove(<abyssalcraft:azathothcoin>);

furnace.addRecipe(<abyssalcraft:azathothcoin>, <embers:inferno_forge>);

//Recipe 683
recipes.remove(<nuclearcraft:salt_mixer_idle>, false);
furnace.remove(<nuclearcraft:salt_mixer_idle>);

furnace.addRecipe(<nuclearcraft:salt_mixer_idle>, <atum:scepter_isis>);

//Recipe 684
recipes.remove(<aether_legacy:gravitite_pickaxe>, false);
furnace.remove(<aether_legacy:gravitite_pickaxe>);

furnace.addRecipe(<aether_legacy:gravitite_pickaxe>, <artisanworktables:artisans_solderer_bronze>);

//Recipe 685
recipes.remove(<harvestcraft:vinegaritem>, false);
furnace.remove(<harvestcraft:vinegaritem>);

Apothecary.addRecipe(<harvestcraft:vinegaritem>, [<minecraft:wheat_seeds>, <quark:colored_flowerpot_purple>, <twilightforest:knightmetal_sword>, <thaumcraft:thaumium_axe>, <theaurorian:umbraingot>, <minecraft:poisonous_potato>, <minecraft:pink_shulker_box>, <embers:block_lead>, <harvestcraft:cinnamonitem>]);

//Recipe 686
recipes.remove(<embers:sealed_planks>, false);
furnace.remove(<embers:sealed_planks>);

Apothecary.addRecipe(<embers:sealed_planks>, [<harvestcraft:meringuecookieitem>]);

//Recipe 687
recipes.remove(<bountifulbaubles:shieldobsidian>, false);
furnace.remove(<bountifulbaubles:shieldobsidian>);

furnace.remove(<abyssalcraft:cingot>);
furnace.addRecipe(<bountifulbaubles:shieldobsidian>, <abyssalcraft:cchunk>);

//Recipe 688
recipes.remove(<twilightforest:twilight_leaves:1>, false);
furnace.remove(<twilightforest:twilight_leaves:1>);

Apothecary.addRecipe(<twilightforest:twilight_leaves:1>, [<bloodmagic:ritual_controller>, <projectred-exploration:peridot_hoe>, <artisanworktables:artisans_cutters_steel>, <harvestcraft:bbqsauceitem>, <extrautils2:goldenlasso>, <atum:ceramic_stairs_red>, <storagedrawers:controller>, <aether_legacy:holystone_slab>]);

//Recipe 689
recipes.remove(<taiga:valyrium_nugget>, false);
furnace.remove(<taiga:valyrium_nugget>);

recipes.addShapeless("youre_an_expert_harry_689", <taiga:valyrium_nugget>, [<paragongems:block_sapphire_ore>, <zerocore:debugtool>, <quark:stained_clay_tiles_green_stairs>, <nuclearcraft:voltaic_pile_elite>]);

//Recipe 690
recipes.remove(<botanicadds:rune_tp>, false);
furnace.remove(<botanicadds:rune_tp>);
RuneAltar.removeRecipe(<botanicadds:rune_tp>);

Apothecary.addRecipe(<botanicadds:rune_tp>, [<harvestcraft:candledeco16>, <storagedrawers:tape>, <artisanworktables:artisans_trowel_bone>, <artisanworktables:artisans_hatchet_nickel>, <plustic:mirionblock>, <harvestcraft:roastedchestnutitem>]);

//Recipe 691
recipes.remove(<quark:stone_jasper_slab>, false);
furnace.remove(<quark:stone_jasper_slab>);

Apothecary.addRecipe(<quark:stone_jasper_slab>, [<galacticraftcore:panel_lighting:1>]);

//Recipe 692
recipes.remove(<tconstruct:slimesling:4>, false);
furnace.remove(<tconstruct:slimesling:4>);

Apothecary.addRecipe(<tconstruct:slimesling:4>, [<nuclearcraft:dissolver_active>]);

//Recipe 693
recipes.remove(<aether_legacy:dungeon_trap:5>, false);
furnace.remove(<aether_legacy:dungeon_trap:5>);

recipes.addShapeless("youre_an_expert_harry_693", <aether_legacy:dungeon_trap:5>, [<harvestcraft:summerradishsaladitem>, <openblocks:generic_unstackable>, <theaurorian:moonstonenugget>, <artisanworktables:artisans_athame_diamond>]);

//Recipe 694
recipes.remove(<atum:tar_trap>, false);
furnace.remove(<atum:tar_trap>);

Apothecary.addRecipe(<atum:tar_trap>, [<embers:jet_augment>, <nuclearcraft:crystallizer_active>, <abyssalcraft:cthulhucharm>, <opensecurity:keypad>, <aether_legacy:gummy_swet:1>, <sonarcore:reinforceddirtfence>, <harvestcraft:quesadillaitem>, <sonarcore:stablestone_black>, <twilightforest:armor_shard>]);

//Recipe 695
recipes.remove(<projectred-illumination:fallout_lamp>, false);
furnace.remove(<projectred-illumination:fallout_lamp>);

recipes.addShapeless("youre_an_expert_harry_695", <projectred-illumination:fallout_lamp>, [<artisanworktables:artisans_driver_invar>, <artisanworktables:artisans_pan_iron>, <abyssalcraft:wastelandsthorn>, <thaumicaugmentation:research_notes>]);

//Recipe 696
recipes.remove(<abyssalcraft:darkethaxiumbrickstairs>, false);
furnace.remove(<abyssalcraft:darkethaxiumbrickstairs>);

recipes.addShapeless("youre_an_expert_harry_696", <abyssalcraft:darkethaxiumbrickstairs>, [<taiga:basalt_dust>, <minecraft:record_11>, <malisisdoors:rustyladder>, <quark:limestone_wall>]);

//Recipe 697
recipes.remove(<harvestcraft:rawtofaconitem>, false);
furnace.remove(<harvestcraft:rawtofaconitem>);

furnace.addRecipe(<harvestcraft:rawtofaconitem>, <theaurorian:umbrastonecracked>);

//Recipe 698
recipes.remove(<nuclearcraft:fuel_neptunium:2>, false);
furnace.remove(<nuclearcraft:fuel_neptunium:2>);

Apothecary.addRecipe(<nuclearcraft:fuel_neptunium:2>, [<harvestcraft:riceseeditem>, <aether_legacy:zanite_axe>, <thaumcraft:celestial_notes:2>, <netherex:fiery_netherrack_path>, <thaumadditions:recharge_charm>, <abyssalcraft:ethaxiumsword>, <twilightforest:arctic_helmet>]);

//Recipe 699
recipes.remove(<harvestcraft:cheddarandsourcreampotatochipsitem>, false);
furnace.remove(<harvestcraft:cheddarandsourcreampotatochipsitem>);

recipes.addShapeless("youre_an_expert_harry_699", <harvestcraft:cheddarandsourcreampotatochipsitem>, [<psi:material>, <notenoughwands:displacement_wand>, <artisanworktables:artisans_hatchet_lead>, <thermalfoundation:glass:4>]);

//Recipe 700
recipes.remove(<thermalfoundation:tool.sickle_tin>, false);
furnace.remove(<thermalfoundation:tool.sickle_tin>);

furnace.addRecipe(<thermalfoundation:tool.sickle_tin>, <tconstruct:slime_leaves:1>);

//Recipe 701
recipes.remove(<artisanworktables:artisans_compass_boronnitride>, false);
furnace.remove(<artisanworktables:artisans_compass_boronnitride>);

furnace.addRecipe(<artisanworktables:artisans_compass_boronnitride>, <harvestcraft:porklettucewrapitem>);

//Recipe 702
recipes.remove(<thaumcraft:smelter_thaumium>, false);
furnace.remove(<thaumcraft:smelter_thaumium>);

Apothecary.addRecipe(<thaumcraft:smelter_thaumium>, [<atum:thin_crystal_brown_stained_glass>, <harvestcraft:mcpamitem>, <ferdinandsflowers:block_stonebrick_light:2>, <midnight:shadowroot_log>, <quark:stained_clay_tiles_orange_slab>, <ore:paneGlassPurple>, <extrautils2:resonator>, <thaumcraft:focus_1>]);

//Recipe 703
recipes.remove(<thermalfoundation:tool.hoe_constantan>, false);
furnace.remove(<thermalfoundation:tool.hoe_constantan>);

furnace.addRecipe(<thermalfoundation:tool.hoe_constantan>, <thaumcraft:dioptra>);

//Recipe 704
recipes.remove(<aether_legacy:aerogel>, false);
furnace.remove(<aether_legacy:aerogel>);

Apothecary.addRecipe(<aether_legacy:aerogel>, [<botania:dirtrod>, <harvestcraft:vanillaicecreamitem>, <taiga:auram_dust>, <harvestcraft:vanillaconchasbreaditem>, <harvestcraft:steamedspinachitem>, <danknull:dank_null_panel_4>, <abyssalcraft:engraving_shubniggurath>]);

//Recipe 705
recipes.remove(<botania:biomestonea11slab>, false);
furnace.remove(<botania:biomestonea11slab>);

Apothecary.addRecipe(<botania:biomestonea11slab>, [<harvestcraft:figyogurtitem>, <artisanworktables:artisans_cutters_flint>, <artifacts:night_vision_goggles>, <enderio:item_advanced_item_filter>]);

//Recipe 706
recipes.remove(<harvestcraft:candledeco4>, false);
furnace.remove(<harvestcraft:candledeco4>);

recipes.addShapeless("youre_an_expert_harry_706", <harvestcraft:candledeco4>, [<loreexpansion:lore_scrap>, <notenoughwands:potion_wand>, <harvestcraft:cookedtofabbititem>, <taiga:palladium_dust>]);

//Recipe 707
recipes.remove(<harvestcraft:candledeco3>, false);
furnace.remove(<harvestcraft:candledeco3>);

Apothecary.addRecipe(<harvestcraft:candledeco3>, [<netherex:lively_nether_brick_fence_gate>, <appliedenergistics2:energy_cell>, <nuclearcraft:boots_hazmat>, <botania:cacophonium>, <taiga:palladium_block>]);

//Recipe 708
recipes.remove(<harvestcraft:clamchowderitem>, false);
furnace.remove(<harvestcraft:clamchowderitem>);

recipes.addShapeless("youre_an_expert_harry_708", <harvestcraft:clamchowderitem>, [<aether_legacy:holiday_leaves:1>, <minecraft:prismarine:2>, <harvestcraft:meringuerouladeitem>, <thermalfoundation:armor.helmet_constantan>]);

//Recipe 709
recipes.remove(<atum:thin_crystal_red_stained_glass>, false);
furnace.remove(<atum:thin_crystal_red_stained_glass>);

furnace.addRecipe(<atum:thin_crystal_red_stained_glass>, <artisanworktables:artisans_pan_lead>);

//Recipe 710
recipes.remove(<artisanworktables:artisans_tsquare_copper>, false);
furnace.remove(<artisanworktables:artisans_tsquare_copper>);

furnace.addRecipe(<artisanworktables:artisans_tsquare_copper>, <atum:deadwood_branch>);

//Recipe 711
recipes.remove(<abyssalcraft:engraver_on>, false);
furnace.remove(<abyssalcraft:engraver_on>);

Apothecary.addRecipe(<abyssalcraft:engraver_on>, [<harvestcraft:walnutraisinbreaditem>, <tconstruct:dried_brick_stairs>, <botania:livingrock0slab>, <draconicevolution:draconium_capacitor:1>]);

//Recipe 712
recipes.remove(<atum:iron_dagger>, false);
furnace.remove(<atum:iron_dagger>);

recipes.addShapeless("youre_an_expert_harry_712", <atum:iron_dagger>, [<paragongems:block_agate_ore>, <minecraft:light_weighted_pressure_plate>, <botania:biomestoneb3stairs>, <minecraft:coal_ore>]);

//Recipe 713
recipes.remove(<appliedenergistics2:quartz_glass>, false);
furnace.remove(<appliedenergistics2:quartz_glass>);

furnace.addRecipe(<appliedenergistics2:quartz_glass>, <astralsorcery:blockaltar:2>);

//Recipe 714
recipes.remove(<thaumadditions:aura_disperser>, false);
furnace.remove(<thaumadditions:aura_disperser>);

Apothecary.addRecipe(<thaumadditions:aura_disperser>, [<appliedenergistics2:nether_quartz_cutting_knife>, <abyssalcraft:ahelmet>, <aether_legacy:obsidian_chestplate>, <thaumadditions:taintkin_lit>]);

//Recipe 715
recipes.remove(<galacticraftcore:cargo:4>, false);
furnace.remove(<galacticraftcore:cargo:4>);

Apothecary.addRecipe(<galacticraftcore:cargo:4>, [<abyssalcraft:engraving_nyarlathotep>, <tconstruct:knife_blade>, <taiga:solarium_nugget>]);

//Recipe 716
recipes.remove(<nuclearcraft:ground_cocoa_nibs>, false);
furnace.remove(<nuclearcraft:ground_cocoa_nibs>);

furnace.addRecipe(<nuclearcraft:ground_cocoa_nibs>, <psi:psimetal_exosuit_leggings>);

//Recipe 717
recipes.remove(<dynamictrees:cactusseed>, false);
furnace.remove(<dynamictrees:cactusseed>);

furnace.addRecipe(<dynamictrees:cactusseed>, <artisanworktables:artisans_burner_bone>);

//Recipe 718
recipes.remove(<arcanearchives:raw_quartz_cluster>, false);
furnace.remove(<arcanearchives:raw_quartz_cluster>);

Apothecary.addRecipe(<arcanearchives:raw_quartz_cluster>, [<minecraft:flint_and_steel>, <artisanworktables:artisans_handsaw_gold>, <abyssalcraft:ccluster3>, <dynamictreesphc:jackfruitseed>, <bloodarsenal:blood_infused_iron_sickle>, <artisanworktables:artisans_grimoire_steel>]);

//Recipe 719
recipes.remove(<forbidden_arcanus:chorus_pearl>, false);
furnace.remove(<forbidden_arcanus:chorus_pearl>);

recipes.addShapeless("youre_an_expert_harry_719", <forbidden_arcanus:chorus_pearl>, [<thermalfoundation:tool.sickle_constantan>, <thaumcraft:focus_2>, <tcomplement:melter>, <harvestcraft:icecreamitem>]);

//Recipe 720
recipes.remove(<embers:field_chart>, false);
furnace.remove(<embers:field_chart>);

furnace.addRecipe(<embers:field_chart>, <artisanworktables:artisans_knife_silver>);

//Recipe 721
recipes.remove(<artisanworktables:artisans_hatchet_aluminum>, false);
furnace.remove(<artisanworktables:artisans_hatchet_aluminum>);

furnace.addRecipe(<artisanworktables:artisans_hatchet_aluminum>, <projectred-exploration:wool_gin>);

//Recipe 722
recipes.remove(<abyssalcraft:antidote>, false);
furnace.remove(<abyssalcraft:antidote>);

recipes.addShapeless("youre_an_expert_harry_722", <abyssalcraft:antidote>, [<immersiveengineering:blueprint>, <galacticraftcore:unlit_torch_stone_lit>, <artisanworktables:artisans_pan_stone>, <thaumadditions:adaminite_smelter>]);

//Recipe 723
recipes.remove(<harvestcraft:soybeanitem>, false);
furnace.remove(<harvestcraft:soybeanitem>);

furnace.addRecipe(<harvestcraft:soybeanitem>, <thaumicbases:sweedseed>);

//Recipe 724
recipes.remove(<harvestcraft:sesameseedsitem>, false);
furnace.remove(<harvestcraft:sesameseedsitem>);

Apothecary.addRecipe(<harvestcraft:sesameseedsitem>, [<theaurorian:aurorianitesword>, <bibliocraft:armorstand:2>, <artisanworktables:artisans_lens_boron>, <quark:stonebrick_mossy_stairs>, <draconicevolution:debugger>, <theaurorian:aurorianporkcooked>, <ferdinandsflowers:block_dye_brick:11>]);

//Recipe 725
recipes.remove(<artisanworktables:artisans_spanner_diamond>, false);
furnace.remove(<artisanworktables:artisans_spanner_diamond>);

furnace.addRecipe(<artisanworktables:artisans_spanner_diamond>, <botania:biomestonea0stairs>);

//Recipe 726
recipes.remove(<minecraft:concrete_powder>, false);
furnace.remove(<minecraft:concrete_powder>);

recipes.addShapeless("youre_an_expert_harry_726", <minecraft:concrete_powder>, [<taiga:astrium_block>, <abyssalcraft:psdl>, <enderio:item_limited_item_filter>, <midnight:rockshroom_bricks_stairs>]);

//Recipe 727
recipes.remove(<extrabotany:deathring>, false);
furnace.remove(<extrabotany:deathring>);
RuneAltar.removeRecipe(<extrabotany:deathring>);

recipes.addShapeless("youre_an_expert_harry_727", <extrabotany:deathring>, [<abyssalcraft:chickenp>, <dynamictrees:sprucebranch>, <atum:linen_green>, <harvestcraft:eggsbenedictitem>]);

//Recipe 728
recipes.remove(<atum:desert_wolf_iron_armor>, false);
furnace.remove(<atum:desert_wolf_iron_armor>);

Apothecary.addRecipe(<atum:desert_wolf_iron_armor>, [<artisanworktables:artisans_shears_silver>, <artisanworktables:artisans_carver_steel>, <artisanworktables:artisans_gemcutter_silver>, <artisanworktables:artisans_knife_invar>, <thaumcraft:stone_eldritch_tile>, <extrautils2:bagofholding>, <embers:axe_bronze>, <aether_legacy:dungeon_trap>, <immersiveengineering:material:3>]);

//Recipe 729
recipes.remove(<thaumadditions:jar_thaumium>, false);
furnace.remove(<thaumadditions:jar_thaumium>);

furnace.remove(<minecraft:cooked_fish>);
furnace.addRecipe(<thaumadditions:jar_thaumium>, <harvestcraft:tunarawitem>);

//Recipe 730
recipes.remove(<atum:framed_lime_stained_glass>, false);
furnace.remove(<atum:framed_lime_stained_glass>);

Apothecary.addRecipe(<atum:framed_lime_stained_glass>, [<harvestcraft:pearsmoothieitem>, <artisanworktables:artisans_grimoire_boronnitride>, <nuclearcraft:chemical_reactor_idle>, <nuclearcraft:nitrogen_collector>, <tconstruct:seared_stairs_brick_fancy>]);

//Recipe 731
recipes.remove(<abyssalcraft:corshovel>, false);
furnace.remove(<abyssalcraft:corshovel>);

furnace.addRecipe(<abyssalcraft:corshovel>, <densemetals:dense_iridium_ore>);

//Recipe 732
recipes.remove(<opensecurity:rolldoor_element>, false);
furnace.remove(<opensecurity:rolldoor_element>);

recipes.addShapeless("youre_an_expert_harry_732", <opensecurity:rolldoor_element>, [<harvestcraft:pamlemon>, <thaumicenergistics:essentia_cell_64k>, <artifacts:shiny_red_balloon>, <ore:paneGlassPurple>]);

//Recipe 733
recipes.remove(<quark:stained_clay_tiles_red_stairs>, false);
furnace.remove(<quark:stained_clay_tiles_red_stairs>);

Apothecary.addRecipe(<quark:stained_clay_tiles_red_stairs>, [<atum:cracked_brick_wall>, <danknull:danknull_dock>, <artisanworktables:artisans_tsquare_bronze>, <quark:bark_dark_oak_wall>]);

//Recipe 734
recipes.remove(<harvestcraft:rhubarbitem>, false);
furnace.remove(<harvestcraft:rhubarbitem>);

recipes.addShapeless("youre_an_expert_harry_734", <harvestcraft:rhubarbitem>, [<immersivepetroleum:dummy>, <enderio:block_simple_sag_mill>, <thaumcraft:shimmerleaf>, <harvestcraft:cherryjellysandwichitem>]);

//Recipe 735
recipes.remove(<botania:elementiumaxe>, false);
furnace.remove(<botania:elementiumaxe>);

Apothecary.addRecipe(<botania:elementiumaxe>, [<harvestcraft:imitationcrabsticksitem>, <harvestcraft:oatsseeditem>, <quark:stained_clay_tiles_gray_slab>, <aether_legacy:legacy>, <appliedenergistics2:quantum_link>, <enderio:block_not_unholy_enlightened_fused_glass:8>]);

//Recipe 736
recipes.remove(<watercan:watercan_diamond>, false);
furnace.remove(<watercan:watercan_diamond>);

furnace.addRecipe(<watercan:watercan_diamond>, <spectrite:spectrite_blaze_powder>);

//Recipe 737
recipes.remove(<conarm:travel_slowfall>, false);
furnace.remove(<conarm:travel_slowfall>);

recipes.addShapeless("youre_an_expert_harry_737", <conarm:travel_slowfall>, [<thaumcraft:levitator>, <opencomputers:waypoint>, <botania:ghostrail>, <nuclearcraft:sword_tough>]);

//Recipe 738
recipes.remove(<extrautils2:enderlilly>, false);
furnace.remove(<extrautils2:enderlilly>);

Apothecary.addRecipe(<extrautils2:enderlilly>, [<harvestcraft:bubbleteaitem>, <thaumcraft:banner_blue>, <theaurorian:scrapper>, <tconstruct:seared_stairs_brick_square>, <densemetals:dense_lead_ore>, <appliedenergistics2:fluid_storage_cell_64k>, <taiga:proxii_ingot>, <nuclearcraft:heat_exchanger_controller>]);

//Recipe 739
recipes.remove(<quark:world_stone_bricks>, false);
furnace.remove(<quark:world_stone_bricks>);

recipes.addShapeless("youre_an_expert_harry_739", <quark:world_stone_bricks>, [<quark:stained_clay_tiles_green_stairs>, <snad:snad:1>, <minecraft:rail>, <enderio:block_painted_stair>]);

//Recipe 740
recipes.remove(<astralsorcery:itemcelestialcrystal>, false);
furnace.remove(<astralsorcery:itemcelestialcrystal>);

Apothecary.addRecipe(<astralsorcery:itemcelestialcrystal>, [<atum:limestone_brick_large>, <atum:disenchanting_scroll>, <thaumicwonders:structure_diviner>, <atum:ceramic_wall_pink>, <nuclearcraft:irradiator_idle>, <bloodmagic:inscription_tool:4>, <appliedenergistics2:smooth_sky_stone_block>, <mekanism:plasticfence:13>, <taiga:solarium_nugget>]);

//Recipe 741
recipes.remove(<quark:stained_clay_tiles_red_slab>, false);
furnace.remove(<quark:stained_clay_tiles_red_slab>);

furnace.addRecipe(<quark:stained_clay_tiles_red_slab>, <yurtmod:yurt_roof>);

//Recipe 742
recipes.remove(<botania:quartztypeelf:2>, false);
furnace.remove(<botania:quartztypeelf:2>);

furnace.addRecipe(<botania:quartztypeelf:2>, <galacticraftplanets:miner_base>);

//Recipe 743
recipes.remove(<artisanworktables:artisans_grimoire_bone>, false);
furnace.remove(<artisanworktables:artisans_grimoire_bone>);

recipes.addShapeless("youre_an_expert_harry_743", <artisanworktables:artisans_grimoire_bone>, [<thaumcraft:taint_log>, <opencomputers:case2>, <extrautils2:pipe>, <atum:thin_crystal_gray_stained_glass>]);

