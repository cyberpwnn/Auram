const fs = require("fs");
var validSkills = [ "mining", "building", "excavation", "woodcutting", "farming", "agility", "endurance", "combat", "archery", "smithing", "flying", "swimming", "fishing", "crafting", "magic", "slayer", "hunter", "taming", "cooking", "alchemy" ];
const validKeys = [ "skills", "req_wear", "req_tool", "req_weapon", "req_use", "req_entity_interact", "req_place", "req_break", "req_craft", "req_biome", "req_dimension_travel", "req_kill", "xp_value_general", "xp_value_break", "xp_value_craft", "xp_value_place", "xp_value_breed", "xp_value_tame", "xp_value_kill", "xp_value_smelt", "xp_value_cook", "xp_value_trigger", "xp_value_brew", "xp_value_grow", "xp_value_right_click", "info_ore", "info_log", "info_plant", "info_smelt", "info_cook", "info_brew", "biome_effect_negative", "biome_effect_positive", "biome_mob_multiplier", "xp_bonus_biome", "xp_bonus_held", "xp_bonus_worn", "xp_bonus_dimension", "xp_multiplier_dimension", "xp_multiplier_entity", "fish_pool", "fish_enchant_pool", "mob_rare_drop", "level_up_command", "player_specific", "block_specific", "item_specific", "vein_blacklist" ];
const validKeys2 = [ "salvage", "treasure", "req_use_enchantment" ];
const validInfo = [ "extraChance" ];
const validSkillsInfo = [ "color", "noAfkPenalty" ];
const validSalvage = [ "salvageMax", "baseChance", "chancePerLevel", "maxChance", "xpPerItem", "levelReq" ];
const validBiomeMobMultiplier = [ "speedBonus", "damageBonus", "hpBonus" ];
const validFishPool = [ "startWeight", "startLevel", "endWeight", "endLevel", "enchantLevelReq", "xp", "minCount", "maxCount" ];
const validFishEnchantPool = [ "levelReq", "levelPerLevel", "chancePerLevel", "maxChance", "maxLevel" ];
const validTreasure = [ "startChance", "startLevel", "endChance", "endLevel", "xpPerItem", "minCount", "maxCount" ];
const validInfoKeys = [ "info_ore", "info_log", "info_plant", "info_smelt", "info_cook", "info_brew" ];
const validPlayerSpecific = [ "ignoreReq" ];
const validBlockSpecific = [ "growsUpwards", "salvageStation" ];
const validItemSpecific = [ "meleeWeapon", "archeryWeapon", "magicWeapon", "gunWeapon", "autoValueOffsetWear", "autoValueOffsetWeapon", "autoValueOffsetTool" ];

const blacklistChars = [ ' ', ',', '\\' ];
const jsonConstructor = {}.constructor;

var data1Count = 0, data2Count = 0;

var corrupt = false;
if( !fs.existsSync( "./oldData/" ) )
	 fs.mkdirSync( "./oldData/" );
oldData = {};
oldData2 = {};
validKeys.forEach( key =>
{
	var path = `./oldData/${key}.json`;
	if( fs.existsSync( path ) )
	{
		try
		{
			oldData[ key ] = require( path );
		}
		catch( e )
		{
			console.log( `${path} is corrupted! Please fix, or remove the file before reattempting` );
			corrupt = true;
		}
	}
});
validKeys2.forEach( key =>
{
	var path = `./oldData/${key}.json`;
	if( fs.existsSync( path ) )
	{
		try
		{
			oldData2[ key ] = require( path );
		}
		catch( e )
		{
			console.log( `${path} is corrupted! Please fix, or remove the file before reattempting` );
			corrupt = true;
		}
	}
});
if( corrupt )
	return;
dupes = 0, dupes2 = 0;
if( !fs.existsSync( "./data/" ) )
	fs.mkdirSync( "./data/" );
data = {};
data2 = {};

//#FORGE
{
addData( "xp_value_craft", 	"#forge:storage_blocks",									{ "crafting": 0 } );
addData( "xp_value_smelt", 	"#forge:ores/aluminum",										{ "smithing": 12.5 } );
addData( "info_smelt", 		"#forge:ores/aluminum",										{ "extraChance": 0.5 } );
addData( "req_break", 		"#forge:ores/aluminum",										{ "mining": 25 } );
addData( "xp_value_break", 	"#forge:ores/aluminum",										{ "mining": 14 } );
addData( "info_ore", 		"#forge:ores/aluminum",										{ "extraChance": 0.45 } );
addData( "xp_value_smelt", 	"#forge:ores/coal",											{ "smithing": 8 } );
addData( "info_smelt", 		"#forge:ores/coal",											{ "extraChance": 1 } );
addData( "xp_value_break", 	"#forge:ores/coal",											{ "mining": 2 } );
addData( "info_ore", 		"#forge:ores/coal",											{ "extraChance": 1 } );
addData2( "treasure", "#forge:ores/coal", "minecraft:diamond",
{
	"startChance": 0.01,
	"startLevel": 1,
	"endChance": 0.1,
	"endLevel": 200,
	"xpPerItem": 100,
	"minCount": 1,
	"maxCount": 1
});
addData2( "treasure", "#minecraft:leaves", "minecraft:apple",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 4.5,
	"minCount": 1,
	"maxCount": 3
});
addData2( "treasure", "#minecraft:leaves", "minecraft:golden_apple",
{
	"startChance": 0.01,
	"startLevel": 25,
	"endChance": 0.1,
	"endLevel": 150,
	"xpPerItem": 333,
	"minCount": 1,
	"maxCount": 1
});
addData2( "treasure", "#minecraft:leaves", "minecraft:enchanted_golden_apple",
{
	"startChance": 0.0025,
	"startLevel": 50,
	"endChance": 0.025,
	"endLevel": 150,
	"xpPerItem": 666,
	"minCount": 1,
	"maxCount": 1
});

addData2( "treasure", "minecraft:dirt", "minecraft:cake",
{
	"startChance": 0.001523,
	"startLevel": 1,
	"endChance": 0.03251,
	"endLevel": 150,
	"xpPerItem": 1523,
	"minCount": 1,
	"maxCount": 1
});

addData( "xp_value_right_click", "minecraft:exampleitem",								{ "magic": 10 } );

addData( "xp_multiplier_entity", "minecraft:giant",										{ "combat": 1.523 } );
addData( "xp_value_smelt", 	"#forge:ores/copper",										{ "smithing": 7.5 } );
addData( "info_smelt", 		"#forge:ores/copper",										{ "extraChance": 0.8 } );
addData( "req_break", 		"#forge:ores/copper",										{ "mining": 12 } );
addData( "xp_value_break", 	"#forge:ores/copper",										{ "mining": 6.5 } );
addData( "info_ore", 		"#forge:ores/copper",										{ "extraChance": 0.8 } );
addData( "xp_value_smelt", 	"#forge:ores/diamond",										{ "smithing": 35 } );
addData( "info_smelt", 		"#forge:ores/diamond",										{ "extraChance": 0.25 } );
addData( "info_ore", 		"#forge:ores/diamond",										{ "extraChance": 0.33 } );
addData( "req_break", 		"#forge:ores/diamond",										{ "mining": 45 } );
addData( "xp_value_break", 	"#forge:ores/diamond",										{ "mining": 35 } );
addData( "xp_value_smelt", 	"#forge:ores/emerald",										{ "smithing": 60 } );
addData( "info_smelt", 		"#forge:ores/emerald",										{ "extraChance": 0.2 } );
addData( "info_ore", 		"#forge:ores/emerald",										{ "extraChance": 0.75 } );
addData( "req_break", 		"#forge:ores/emerald",										{ "mining": 50 } );
addData( "xp_value_break", 	"#forge:ores/emerald",										{ "mining": 60 } );
addData( "xp_value_smelt", 	"#forge:ores/netherite_scrap",								{ "smithing": 333 } );
addData( "info_smelt", 		"#forge:ores/netherite_scrap",								{ "extraChance": 0.1523 } );
addData( "info_ore", 		"#forge:ores/netherite_scrap",								{ "extraChance": 0.2 } );
addData( "req_break", 		"#forge:ores/netherite_scrap",								{ "mining": 60 } );
addData( "xp_value_break", 	"#forge:ores/netherite_scrap",								{ "mining": 200 } );

addData2( "salvage", "#forge:ores/emerald", "minecraft:zombie_villager_spawn_egg",
{
	"salvageMax": 1,
	"baseChance": 25,
	"chancePerLevel": 0,
	"maxChance": 25,
	"xpPerItem": 50,
	"levelReq": 1
} );
addData( "xp_value_smelt", 	"#forge:ores/gold",											{ "smithing": 18 } );
addData( "info_smelt", 		"#forge:ores/gold",											{ "extraChance": 0.5 } );
addData( "info_ore", 		"#forge:ores/gold",											{ "extraChance": 0.5 } );
addData( "req_break", 		"#forge:ores/gold",											{ "mining": 32 } );
addData( "xp_value_break", 	"#forge:ores/gold",											{ "mining": 22 } );
addData( "xp_value_smelt", 	"#forge:ores/iron",											{ "smithing": 12 } );
addData( "info_smelt", 		"#forge:ores/iron",											{ "extraChance": 1 } );
addData( "req_break", 		"#forge:ores/iron",											{ "mining": 15 } );
addData( "xp_value_break", 	"#forge:ores/iron",											{ "mining": 12 } );
addData( "info_ore", 		"#forge:ores/iron",											{ "extraChance": 0.75 } );
addData( "xp_value_smelt", 	"#forge:ores/lapis",										{ "smithing": 25 } );
addData( "info_smelt", 		"#forge:ores/lapis",										{ "extraChance": 2.5 } );
addData( "info_ore", 		"#forge:ores/lapis",										{ "extraChance": 1.5 } );
addData( "req_break", 		"#forge:ores/lapis",										{ "mining": 28 } );
addData( "xp_value_break", 	"#forge:ores/lapis",										{ "mining": 5 } );
addData( "xp_value_smelt", 	"#forge:ores/nickel",										{ "smithing": 8.5 } );
addData( "info_smelt", 		"#forge:ores/nickel",										{ "extraChance": 0.7 } );
addData( "req_break", 		"#forge:ores/nickel",										{ "mining": 17 } );
addData( "xp_value_break", 	"#forge:ores/nickel",										{ "mining": 8 } );
addData( "info_ore", 		"#forge:ores/nickel",										{ "extraChance": 0.6 } );
addData( "xp_value_smelt", 	"#forge:ores/quartz",										{ "smithing": 8 } );
addData( "info_smelt", 		"#forge:ores/quartz",										{ "extraChance": 1 } );
addData( "req_break", 		"#forge:ores/quartz",										{ "mining": 20 } );
addData( "xp_value_break", 	"#forge:ores/quartz",										{ "mining": 1.5 } );
addData( "info_ore", 		"#forge:ores/quartz",										{ "extraChance": 0.55 } );
addData( "xp_value_smelt", 	"#forge:ores/redstone",										{ "smithing": 15 } );
addData( "info_smelt", 		"#forge:ores/redstone",										{ "extraChance": 2 } );
addData( "info_ore", 		"#forge:ores/redstone",										{ "extraChance": 2 } );
addData( "req_break", 		"#forge:ores/redstone",										{ "mining": 30 } );
addData( "xp_value_break", 	"#forge:ores/redstone",										{ "mining": 1.5 } );
addData( "xp_value_smelt", 	"#forge:ores/silver",										{ "smithing": 11 } );
addData( "info_smelt", 		"#forge:ores/silver",										{ "extraChance": 0.55 } );
addData( "req_break", 		"#forge:ores/silver",										{ "mining": 27 } );
addData( "xp_value_break", 	"#forge:ores/silver",										{ "mining": 13 } );
addData( "info_ore", 		"#forge:ores/silver",										{ "extraChance": 0.40 } );
addData( "xp_value_smelt", 	"#forge:ores/tin",											{ "smithing": 6.5 } );
addData( "info_smelt", 		"#forge:ores/tin",											{ "extraChance": 0.85 } );
addData( "req_break", 		"#forge:ores/tin",											{ "mining": 8 } );
addData( "xp_value_break", 	"#forge:ores/tin",											{ "mining": 7.5 } );
addData( "info_ore", 		"#forge:ores/tin",											{ "extraChance": 0.8 } );
addData( "xp_value_smelt", 	"#forge:ores/zinc",											{ "smithing": 16 } );
addData( "info_smelt", 		"#forge:ores/zinc",											{ "extraChance": 0.7 } );
addData( "req_break", 		"#forge:ores/zinc",											{ "mining": 34 } );
addData( "xp_value_break", 	"#forge:ores/zinc",											{ "mining": 22 } );
addData( "info_ore", 		"#forge:ores/zinc",											{ "extraChance": 0.75 } );
addData( "xp_value_smelt", "#forge:sandstone",											{ "smithing": 3 } );
addData( "req_place", "#forge:saplings",												{ "farming": 5, "woodcutting": 10 } );
addData( "xp_value_grow", "#forge:saplings",											{ "farming": 10 } );
addData( "xp_value_smelt", "#forge:stone",												{ "smithing": 1 } );
addData2( "treasure", "#forge:stone", "minecraft:iron_nugget",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 5,
	"minCount": 1,
	"maxCount": 3
} );
}

//#MINECRAFT
{
addData( "skills", "farming", { "noAfkPenalty": 1 } );
addData( "skills", "smithing", { "noAfkPenalty": 1 } );
addData( "skills", "cooking", { "noAfkPenalty": 1 } );
addData( "skills", "alchemy", { "noAfkPenalty": 1 } );

addData( "req_entity_interact", "minecraft:giant", { "flying": 69 } );

addData2( "salvage", "#minecraft:leaves", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 30,
	"chancePerLevel": 1.5,
	"maxChance": 75,
	"xpPerItem": 1,
	"levelReq": 1
});
addData2( "salvage", "#minecraft:leaves", "minecraft:apple",
{
	"salvageMax": 1,
	"baseChance": 0,
	"chancePerLevel": 0.2,
	"maxChance": 5,
	"xpPerItem": 1,
	"levelReq": 1
});
addData( "xp_value_break", "#minecraft:logs",											{ "woodcutting": 8 } );
addData( "xp_value_smelt", "#minecraft:logs",											{ "smithing": 0.25 } );
addData( "info_smelt", "#minecraft:logs",												{ "extraChance": 1 } );
addData( "info_log", "#minecraft:logs",													{ "extraChance": 1 } );
addData( "req_place", "#minecraft:saplings",											{ "farming": 5, "woodcutting": 10 } );
addData( "xp_value_grow", "#minecraft:saplings",										{ "farming": 10 } );
}
//UUID_GOES_HER
{
addData( "player_specific", "UUID_GOES_HERE",											{ "ignoreReq": 1 } );
}
//AIOTBOTANIA
{
addData2( "salvage", "aiotbotania:livingrock_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "aiotbotania:livingrock_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "aiotbotania:livingrock_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "aiotbotania:livingrock_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "aiotbotania:livingrock_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "aiotbotania:livingwood_axe", "botania:livingwood",
{
	"salvageMax": 5,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
});
addData2( "salvage", "aiotbotania:livingwood_hoe", "botania:livingwood",
{
	"salvageMax": 4,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
});
addData2( "salvage", "aiotbotania:livingwood_pickaxe", "botania:livingwood",
{
	"salvageMax": 5,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
});
addData2( "salvage", "aiotbotania:livingwood_shovel", "botania:livingwood",
{
	"salvageMax": 3,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
});
addData2( "salvage", "aiotbotania:livingwood_sword", "botania:livingwood",
{
	"salvageMax": 4,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
});
}
//ALL_DIMENSION
{
addData( "vein_blacklist", "all_dimensions",											{ "minecraft:furnace": 0, "minecraft:chest": 0, "minecraft:trapped_chest": 0, "minecraft:shulker_box": 0, "minecraft:barrel": 0, "minecraft:dropper": 0, "minecraft:dispenser": 0 } );
addData( "xp_multiplier_dimension", "all_dimensions",									{ "engineering": 1.0 } );
addData( "xp_bonus_dimension", "all_dimensions",										{  } );
}
//APPLIEDENERGISTICS2
{
addData( "req_craft", "appliedenergistics2:128_cubed_spatial_cell_component",			{ "crafting": 70 } );
addData( "req_craft", "appliedenergistics2:128_cubed_spatial_storage_cell",				{ "crafting": 70 } );
addData( "req_craft", "appliedenergistics2:16_cubed_spatial_cell_component",			{ "crafting": 65 } );
addData( "req_craft", "appliedenergistics2:16_cubed_spatial_storage_cell",				{ "crafting": 65 } );
addData( "req_craft", "appliedenergistics2:16k_cell_component",							{ "crafting": 40, "smithing": 25 } );
addData( "xp_value_craft", "appliedenergistics2:16k_cell_component",					{ "crafting": 40, "smithing": 25 } );
addData( "req_place", "appliedenergistics2:16k_crafting_storage",						{ "building": 40 } );
addData( "req_craft", "appliedenergistics2:16k_crafting_storage",						{ "crafting": 40, "smithing": 25 } );
addData( "xp_value_craft", "appliedenergistics2:16k_crafting_storage",					{ "crafting": 40, "smithing": 20 } );
addData( "req_craft", "appliedenergistics2:16k_fluid_cell_component",					{ "crafting": 35, "smithing": 15 } );
addData( "xp_value_craft", "appliedenergistics2:16k_fluid_cell_component",				{ "crafting": 35, "smithing": 15 } );
addData( "req_craft", "appliedenergistics2:16k_fluid_storage_cell",						{ "crafting": 35, "smithing": 15 } );
addData( "req_craft", "appliedenergistics2:16k_storage_cell",							{ "crafting": 40, "smithing": 25 } );
addData( "req_craft", "appliedenergistics2:1k_cell_component",							{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "appliedenergistics2:1k_cell_component",						{ "crafting": 20, "smithing": 10 } );
addData( "req_place", "appliedenergistics2:1k_crafting_storage",						{ "building": 20 } );
addData( "xp_value_craft", "appliedenergistics2:1k_crafting_storage",					{ "crafting": 20, "smithing": 10 } );
addData( "req_craft", "appliedenergistics2:1k_fluid_cell_component",					{ "crafting": 15, "smithing": 5 } );
addData( "xp_value_craft", "appliedenergistics2:1k_fluid_cell_component",				{ "crafting": 15, "smithing": 5 } );
addData( "req_craft", "appliedenergistics2:1k_fluid_storage_cell",						{ "crafting": 15, "smithing": 5 } );
addData( "req_craft", "appliedenergistics2:1k_storage_cell",							{ "crafting": 20, "smithing": 10 } );
addData( "req_craft", "appliedenergistics2:2_cubed_spatial_cell_component",				{ "crafting": 60 } );
addData( "req_craft", "appliedenergistics2:2_cubed_spatial_storage_cell",				{ "crafting": 60 } );
addData( "req_craft", "appliedenergistics2:4k_cell_component",							{ "crafting": 30, "smithing": 15 } );
addData( "xp_value_craft", "appliedenergistics2:4k_cell_component",						{ "crafting": 30, "smithing": 15 } );
addData( "req_place", "appliedenergistics2:4k_crafting_storage",						{ "building": 30 } );
addData( "req_craft", "appliedenergistics2:4k_crafting_storage",						{ "crafting": 30, "smithing": 15 } );
addData( "xp_value_craft", "appliedenergistics2:4k_crafting_storage",					{ "crafting": 30, "smithing": 15 } );
addData( "req_craft", "appliedenergistics2:4k_fluid_cell_component",					{ "crafting": 25, "smithing": 10 } );
addData( "xp_value_craft", "appliedenergistics2:4k_fluid_cell_component",				{ "crafting": 25, "smithing": 10 } );
addData( "req_craft", "appliedenergistics2:4k_fluid_storage_cell",						{ "crafting": 25, "smithing": 10 } );
addData( "req_craft", "appliedenergistics2:4k_storage_cell",							{ "crafting": 30, "smithing": 15 } );
addData( "req_craft", "appliedenergistics2:64k_cell_component",							{ "crafting": 50, "smithing": 35 } );
addData( "xp_value_craft", "appliedenergistics2:64k_cell_component",					{ "crafting": 50, "smithing": 35 } );
addData( "req_place", "appliedenergistics2:64k_crafting_storage",						{ "building": 50 } );
addData( "req_craft", "appliedenergistics2:64k_crafting_storage",						{ "crafting": 50, "smithing": 35 } );
addData( "xp_value_craft", "appliedenergistics2:64k_crafting_storage",					{ "crafting": 50, "smithing": 25 } );
addData( "req_craft", "appliedenergistics2:64k_fluid_cell_component",					{ "crafting": 45, "smithing": 25 } );
addData( "xp_value_craft", "appliedenergistics2:64k_fluid_cell_component",				{ "crafting": 45, "smithing": 25 } );
addData( "req_craft", "appliedenergistics2:64k_fluid_storage_cell",						{ "crafting": 45, "smithing": 25 } );
addData( "req_craft", "appliedenergistics2:64k_storage_cell",							{ "crafting": 50, "smithing": 35 } );
addData( "xp_value_craft", "appliedenergistics2:advanced_card",							{ "crafting": 45 } );
addData( "req_place", "appliedenergistics2:annihilation_plane",							{ "building": 42 } );
addData( "req_craft", "appliedenergistics2:annihilation_plane",							{ "crafting": 50, "smithing": 42 } );
addData( "xp_value_craft", "appliedenergistics2:annihilation_plane",					{ "crafting": 50, "smithing": 42 } );
addData( "xp_value_craft", "appliedenergistics2:basic_card",							{ "crafting": 30 } );
addData( "req_use", "appliedenergistics2:biometric_card",								{ "smithing": 30 } );
addData( "req_weapon", "appliedenergistics2:certus_quartz_axe",							{ "combat": 35 } );
addData( "req_tool", "appliedenergistics2:certus_quartz_axe",							{ "woodcutting": 30 } );
addData( "xp_value_craft", "appliedenergistics2:certus_quartz_axe",						{ "crafting": 90, "smithing": 18 } );
addData2( "salvage", "appliedenergistics2:certus_quartz_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "xp_value_smelt", "appliedenergistics2:certus_quartz_dust",					{ "smithing": 16 } );
addData( "req_tool", "appliedenergistics2:certus_quartz_hoe",							{ "farming": 30 } );
addData( "xp_value_craft", "appliedenergistics2:certus_quartz_hoe",						{ "crafting": 60, "smithing": 12 } );
addData2( "salvage", "appliedenergistics2:certus_quartz_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "req_weapon", "appliedenergistics2:certus_quartz_pickaxe",						{ "combat": 30 } );
addData( "req_tool", "appliedenergistics2:certus_quartz_pickaxe",						{ "mining": 30 } );
addData( "xp_value_craft", "appliedenergistics2:certus_quartz_pickaxe",					{ "crafting": 90, "smithing": 18 } );
addData2( "salvage", "appliedenergistics2:certus_quartz_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "req_weapon", "appliedenergistics2:certus_quartz_shovel",						{ "combat": 30 } );
addData( "req_tool", "appliedenergistics2:certus_quartz_shovel",						{ "excavation": 30 } );
addData( "xp_value_craft", "appliedenergistics2:certus_quartz_shovel",					{ "crafting": 30, "smithing": 6 } );
addData2( "salvage", "appliedenergistics2:certus_quartz_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "req_weapon", "appliedenergistics2:certus_quartz_sword",						{ "combat": 30 } );
addData( "xp_value_craft", "appliedenergistics2:certus_quartz_sword",					{ "crafting": 60, "smithing": 12 } );
addData2( "salvage", "appliedenergistics2:certus_quartz_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "xp_value_break", "appliedenergistics2:charged_quartz_ore",					{ "mining": 20 } );
addData( "req_craft", "appliedenergistics2:charger",									{ "crafting": 50 } );
addData( "req_use", "appliedenergistics2:charger",										{ "crafting": 50, "smithing": 40 } );
addData( "xp_value_craft", "appliedenergistics2:charger",								{ "crafting": 60, "smithing": 25 } );
addData( "xp_value_craft", "appliedenergistics2:chest",									{ "crafting": 60, "smithing": 20 } );
addData( "req_craft", "appliedenergistics2:condenser",									{ "crafting": 55 } );
addData( "req_use", "appliedenergistics2:condenser",									{ "crafting": 55 } );
addData( "req_place", "appliedenergistics2:condenser",									{ "building": 35 } );
addData( "xp_value_craft", "appliedenergistics2:condenser",								{ "crafting": 25 } );
addData( "req_place", "appliedenergistics2:controller",									{ "building": 20 } );
addData( "req_craft", "appliedenergistics2:controller",									{ "crafting": 40, "smithing": 20 } );
addData( "xp_value_craft", "appliedenergistics2:controller",							{ "crafting": 120, "smithing": 30 } );
addData( "req_place", "appliedenergistics2:crafting_accelerator",						{ "building": 30 } );
addData( "xp_value_craft", "appliedenergistics2:crafting_accelerator",					{ "crafting": 30, "smithing": 25 } );
addData( "req_place", "appliedenergistics2:crafting_terminal",							{ "building": 35 } );
addData( "req_craft", "appliedenergistics2:crafting_terminal",							{ "crafting": 35 } );
addData( "req_use", "appliedenergistics2:crafting_terminal",							{ "crafting": 35, "smithing": 30 } );
addData( "xp_value_craft", "appliedenergistics2:crafting_terminal",						{ "crafting": 45, "smithing": 15 } );
addData( "req_place", "appliedenergistics2:drive",										{ "building": 25 } );
addData( "req_craft", "appliedenergistics2:drive",										{ "crafting": 50, "smithing": 25 } );
addData( "req_use", "appliedenergistics2:drive",										{ "crafting": 50, "smithing": 25 } );
addData( "xp_value_craft", "appliedenergistics2:drive",									{ "crafting": 90, "smithing": 35 } );
addData( "req_place", "appliedenergistics2:export_bus",									{ "building": 35 } );
addData( "xp_value_craft", "appliedenergistics2:export_bus",							{ "crafting": 35 } );
addData( "req_place", "appliedenergistics2:fluid_annihilation_plane",					{ "building": 35 } );
addData( "req_craft", "appliedenergistics2:fluid_annihilation_plane",					{ "crafting": 40, "smithing": 35 } );
addData( "xp_value_craft", "appliedenergistics2:fluid_annihilation_plane",				{ "crafting": 40, "smithing": 35 } );
addData( "req_place", "appliedenergistics2:fluid_export_bus",							{ "building": 30 } );
addData( "xp_value_craft", "appliedenergistics2:fluid_export_bus",						{ "crafting": 30 } );
addData( "req_place", "appliedenergistics2:fluid_formation_plane",						{ "building": 32 } );
addData( "req_craft", "appliedenergistics2:fluid_formation_plane",						{ "crafting": 40, "smithing": 32 } );
addData( "xp_value_craft", "appliedenergistics2:fluid_formation_plane",					{ "crafting": 40, "smithing": 32 } );
addData( "req_place", "appliedenergistics2:fluid_import_bus",							{ "building": 30 } );
addData( "xp_value_craft", "appliedenergistics2:fluid_import_bus",						{ "crafting": 30 } );
addData( "req_place", "appliedenergistics2:fluid_interface",							{ "building": 30 } );
addData( "req_craft", "appliedenergistics2:fluid_interface",							{ "crafting": 40, "smithing": 30 } );
addData( "xp_value_craft", "appliedenergistics2:fluid_interface",						{ "crafting": 40, "smithing": 30 } );
addData( "req_place", "appliedenergistics2:fluid_storage_bus",							{ "building": 20 } );
addData( "xp_value_craft", "appliedenergistics2:fluid_storage_bus",						{ "crafting": 20 } );
addData( "req_place", "appliedenergistics2:fluid_terminal",								{ "building": 30 } );
addData( "req_craft", "appliedenergistics2:fluid_terminal",								{ "crafting": 40, "smithing": 30 } );
addData( "req_use", "appliedenergistics2:fluid_terminal",								{ "crafting": 40, "smithing": 30 } );
addData( "xp_value_craft", "appliedenergistics2:fluid_terminal",						{ "crafting": 45, "smithing": 15 } );
addData( "req_place", "appliedenergistics2:formation_plane",							{ "building": 40 } );
addData( "req_craft", "appliedenergistics2:formation_plane",							{ "crafting": 45, "smithing": 40 } );
addData( "xp_value_craft", "appliedenergistics2:formation_plane",						{ "crafting": 45, "smithing": 40 } );
addData( "xp_value_smelt", "appliedenergistics2:gold_dust",								{ "smithing": 16 } );
addData( "req_place", "appliedenergistics2:import_bus",									{ "building": 35 } );
addData( "xp_value_craft", "appliedenergistics2:import_bus",							{ "crafting": 35 } );
addData( "req_craft", "appliedenergistics2:inscriber",									{ "crafting": 45 } );
addData( "req_use", "appliedenergistics2:inscriber",									{ "crafting": 45, "smithing": 35 } );
addData( "xp_value_craft", "appliedenergistics2:inscriber",								{ "crafting": 140, "smithing": 50 } );
addData( "req_place", "appliedenergistics2:interface",									{ "building": 40 } );
addData( "req_craft", "appliedenergistics2:interface",									{ "crafting": 50, "smithing": 40 } );
addData( "xp_value_craft", "appliedenergistics2:interface",								{ "crafting": 50, "smithing": 40 } );
addData( "req_place", "appliedenergistics2:interface_terminal",							{ "building": 40 } );
addData( "req_craft", "appliedenergistics2:interface_terminal",							{ "crafting": 50, "smithing": 40 } );
addData( "req_use", "appliedenergistics2:interface_terminal",							{ "crafting": 40, "smithing": 40 } );
addData( "xp_value_craft", "appliedenergistics2:interface_terminal",					{ "crafting": 45, "smithing": 15 } );
addData( "req_place", "appliedenergistics2:io_port",									{ "building": 35 } );
addData( "req_craft", "appliedenergistics2:io_port",									{ "crafting": 60, "smithing": 35 } );
addData( "req_use", "appliedenergistics2:io_port",										{ "crafting": 60, "smithing": 35 } );
addData( "xp_value_craft", "appliedenergistics2:io_port",								{ "crafting": 60, "smithing": 20 } );
addData( "xp_value_smelt", "appliedenergistics2:iron_dust",								{ "smithing": 24 } );
addData( "req_use", "appliedenergistics2:memory_card",									{ "smithing": 40 } );
addData( "req_place", "appliedenergistics2:molecular_assembler",						{ "building": 40 } );
addData( "req_craft", "appliedenergistics2:molecular_assembler",						{ "crafting": 40, "smithing": 30 } );
addData( "xp_value_craft", "appliedenergistics2:molecular_assembler",					{ "crafting": 40, "smithing": 15 } );
addData( "req_weapon", "appliedenergistics2:nether_quartz_axe",							{ "combat": 23 } );
addData( "req_tool", "appliedenergistics2:nether_quartz_axe",							{ "woodcutting": 17 } );
addData( "xp_value_craft", "appliedenergistics2:nether_quartz_axe",						{ "crafting": 30, "smithing": 6 } );
addData2( "salvage", "appliedenergistics2:nether_quartz_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "xp_value_smelt", "appliedenergistics2:nether_quartz_dust",					{ "smithing": 12 } );
addData( "req_tool", "appliedenergistics2:nether_quartz_hoe",							{ "farming": 17 } );
addData( "xp_value_craft", "appliedenergistics2:nether_quartz_hoe",						{ "crafting": 20, "smithing": 4 } );
addData2( "salvage", "appliedenergistics2:nether_quartz_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "req_weapon", "appliedenergistics2:nether_quartz_pickaxe",						{ "combat": 17 } );
addData( "req_tool", "appliedenergistics2:nether_quartz_pickaxe",						{ "mining": 17 } );
addData( "xp_value_craft", "appliedenergistics2:nether_quartz_pickaxe",					{ "crafting": 30, "smithing": 6 } );
addData2( "salvage", "appliedenergistics2:nether_quartz_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "req_weapon", "appliedenergistics2:nether_quartz_shovel",						{ "combat": 17 } );
addData( "req_tool", "appliedenergistics2:nether_quartz_shovel",						{ "excavation": 17 } );
addData( "xp_value_craft", "appliedenergistics2:nether_quartz_shovel",					{ "crafting": 10, "smithing": 2 } );
addData2( "salvage", "appliedenergistics2:nether_quartz_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "req_weapon", "appliedenergistics2:nether_quartz_sword",						{ "combat": 17 } );
addData( "xp_value_craft", "appliedenergistics2:nether_quartz_sword",					{ "crafting": 20, "smithing": 4 } );
addData2( "salvage", "appliedenergistics2:nether_quartz_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData( "req_use", "appliedenergistics2:network_tool",									{ "smithing": 25 } );
addData( "req_place", "appliedenergistics2:pattern_terminal",							{ "building": 30 } );
addData( "req_craft", "appliedenergistics2:pattern_terminal",							{ "crafting": 30 } );
addData( "req_use", "appliedenergistics2:pattern_terminal",								{ "crafting": 30, "smithing": 35 } );
addData( "xp_value_craft", "appliedenergistics2:pattern_terminal",						{ "crafting": 45, "smithing": 15 } );
addData( "req_place", "appliedenergistics2:quartz_growth_accelerator",					{ "building": 30 } );
addData( "req_craft", "appliedenergistics2:quartz_growth_accelerator",					{ "crafting": 50, "smithing": 30 } );
addData( "req_use", "appliedenergistics2:quartz_growth_accelerator",					{ "crafting": 50, "smithing": 30 } );
addData( "xp_value_craft", "appliedenergistics2:quartz_growth_accelerator",				{ "crafting": 50, "smithing": 30 } );
addData( "xp_value_break", "appliedenergistics2:quartz_ore",							{ "mining": 8 } );
addData( "req_use", "appliedenergistics2:security_station",								{ "crafting": 35, "smithing": 15 } );
addData( "req_place", "appliedenergistics2:security_station",							{ "building": 15 } );
addData( "xp_value_craft", "appliedenergistics2:security_station",						{ "crafting": 250, "smithing": 40 } );
addData( "req_use", "appliedenergistics2:spatial_io_port",								{ "crafting": 40, "smithing": 30 } );
addData( "req_craft", "appliedenergistics2:spatial_io_port",							{ "crafting": 40, "smithing": 30 } );
addData( "req_place", "appliedenergistics2:spatial_io_port",							{ "building": 30 } );
addData( "req_craft", "appliedenergistics2:spatial_pylon",								{ "crafting": 60, "smithing": 30 } );
addData( "req_place", "appliedenergistics2:spatial_pylon",								{ "building": 50 } );
addData( "req_place", "appliedenergistics2:storage_bus",								{ "building": 25 } );
addData( "xp_value_craft", "appliedenergistics2:storage_bus",							{ "crafting": 25 } );
addData( "req_place", "appliedenergistics2:terminal",									{ "building": 25 } );
addData( "req_craft", "appliedenergistics2:terminal",									{ "crafting": 35 } );
addData( "req_use", "appliedenergistics2:terminal",										{ "crafting": 35, "smithing": 25 } );
addData( "xp_value_craft", "appliedenergistics2:terminal",								{ "crafting": 35, "smithing": 15 } );
addData( "req_place", "appliedenergistics2:vibration_chamber",							{ "building": 10 } );
addData( "req_craft", "appliedenergistics2:vibration_chamber",							{ "crafting": 10, "smithing": 5 } );
addData( "xp_value_craft", "appliedenergistics2:vibration_chamber",						{ "crafting": 10, "smithing": 10 } );
addData( "req_craft", "appliedenergistics2:wireless_access_point",						{ "crafting": 50, "smithing": 25 } );
addData( "req_place", "appliedenergistics2:wireless_access_point",						{ "building": 25 } );
addData( "xp_value_craft", "appliedenergistics2:wireless_access_point",					{ "crafting": 25 } );
addData( "req_craft", "appliedenergistics2:wireless_booster",							{ "crafting": 35, "smithing": 30 } );
addData( "xp_value_craft", "appliedenergistics2:wireless_booster",						{ "crafting": 35, "smithing": 25 } );
addData( "req_craft", "appliedenergistics2:wireless_receiver",							{ "crafting": 50, "smithing": 25 } );
addData( "req_place", "appliedenergistics2:wireless_receiver",							{ "building": 25 } );
addData( "xp_value_craft", "appliedenergistics2:wireless_receiver",						{ "crafting": 25 } );
addData( "req_craft", "appliedenergistics2:wireless_terminal",							{ "crafting": 80, "smithing": 50 } );
addData( "req_use", "appliedenergistics2:wireless_terminal",							{ "crafting": 70, "smithing": 50 } );
addData( "xp_value_craft", "appliedenergistics2:wireless_terminal",						{ "crafting": 250, "smithing": 80 } );
}
//AQUACULTURE
{
addData( "xp_value_general", "aquaculture:arapaima",									{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:arrau_turtle",								{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:atlantic_cod",								{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:atlantic_halibut",							{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:atlantic_herring",							{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:bayad",										{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:blackfish",									{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:bluegill",									{ "fishing": 25 } );
addData( "xp_value_craft", "aquaculture:bobber",										{ "fishing": 20 } );
addData( "xp_value_general", "aquaculture:boulti",										{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:box_turtle",									{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:brown_shrooma",								{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:brown_trout",									{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:capitaine",									{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:carp",										{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:catfish",										{ "fishing": 25 } );
addData( "xp_value_craft", "aquaculture:diamond_fillet_knife",							{ "crafting": 20 } );
addData2( "salvage", "aquaculture:diamond_fishing_rod", "minecraft:string",
{
	"salvageMax": 2,
	"baseChance": 45,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 7,
	"levelReq": 1
} );
addData( "fish_pool", "aquaculture:diamond_fishing_rod",								{ "startWeight": 5, "startLevel": 1, "endWeight": 130, "endLevel": 130, "xp": 65, "enchantLevelReq": 10 } );
addData( "req_use", "aquaculture:diamond_fishing_rod",									{ "fishing": 20 } );
addData( "xp_value_craft", "aquaculture:diamond_hook",									{ "fishing": 10 } );
addData( "xp_value_craft", "aquaculture:double_hook",									{ "fishing": 15 } );
addData( "xp_value_craft", "aquaculture:fishing_line",									{ "fishing": 10 } );
addData( "xp_value_general", "aquaculture:frog",										{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:gar",											{ "fishing": 25 } );
addData( "xp_value_craft", "aquaculture:gold_fillet_knife",								{ "crafting": 15, "smithing": 10 } );
addData2( "salvage", "aquaculture:gold_fishing_rod", "minecraft:string",
{
	"salvageMax": 2,
	"baseChance": 45,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 7,
	"levelReq": 1
} );
addData( "fish_pool", "aquaculture:gold_fishing_rod",									{ "startWeight": 10, "startLevel": 1, "endWeight": 120, "endLevel": 120, "xp": 55, "enchantLevelReq": 10 } );
addData( "req_use", "aquaculture:gold_fishing_rod",										{ "fishing": 15 } );
addData( "xp_value_craft", "aquaculture:gold_hook",										{ "fishing": 5 } );
addData( "xp_value_general", "aquaculture:goldfish",									{ "fishing": 25 } );
addData( "xp_value_craft", "aquaculture:heavy_hook",									{ "fishing": 15 } );
addData( "xp_value_craft", "aquaculture:iron_fillet_knife",								{ "crafting": 10, "smithing": 10 } );
addData2( "salvage", "aquaculture:iron_fishing_rod", "minecraft:string",
{
	"salvageMax": 2,
	"baseChance": 45,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 7,
	"levelReq": 1
} );
addData( "fish_pool", "aquaculture:iron_fishing_rod",									{ "startWeight": 20, "startLevel": 1, "endWeight": 110, "endLevel": 110, "xp": 45, "enchantLevelReq": 10 } );
addData( "req_use", "aquaculture:iron_fishing_rod",										{ "fishing": 10 } );
addData( "xp_value_craft", "aquaculture:iron_hook",										{ "fishing": 5 } );
addData( "xp_value_brew", "aquaculture:jellyfish",										{ "alchemy": 6 } );
addData( "info_brew", "aquaculture:jellyfish",											{ "extraChance": 0.25 } );
addData( "xp_value_general", "aquaculture:jellyfish",									{ "fishing": 25 } );
addData( "xp_value_brew", "aquaculture:leech",											{ "alchemy": 6 } );
addData( "info_brew", "aquaculture:leech",												{ "extraChance": 0.25 } );
addData( "xp_value_general", "aquaculture:leech",										{ "fishing": 25 } );
addData( "xp_value_craft", "aquaculture:light_hook",									{ "fishing": 15 } );
addData( "xp_value_general", "aquaculture:minnow",										{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:muskellunge",									{ "fishing": 25 } );
addData( "req_tool", "aquaculture:neptunium_axe",										{ "woodcutting": 30 } );
addData( "xp_value_craft", "aquaculture:neptunium_axe",									{ "crafting": 600, "smithing": 120 } );
addData( "xp_bonus_held", "aquaculture:neptunium_axe",									{ "swimming": 2.5 } );
addData( "fish_pool", "aquaculture:neptunium_axe",										{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_weapon", "aquaculture:neptunium_axe",										{ "combat": 75 } );
addData( "req_wear", "aquaculture:neptunium_boots",										{ "endurance": 45 } );
addData( "xp_value_craft", "aquaculture:neptunium_boots",								{ "crafting": 600, "smithing": 160 } );
addData( "fish_pool", "aquaculture:neptunium_boots",									{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_use", "aquaculture:neptunium_bow",										{ "agility": 10, "archery": 15 } );
addData( "fish_pool", "aquaculture:neptunium_bow",										{ "startWeight": 50, "startLevel": 1, "endWeight": 25, "endLevel": 100, "xp": 35, "enchantLevelReq": 10 } );
addData( "item_specific", "aquaculture:neptunium_bow",					{ "archeryWeapon": 1} );
addData( "req_wear", "aquaculture:neptunium_chestplate",								{ "endurance": 45 } );
addData( "xp_value_craft", "aquaculture:neptunium_chestplate",							{ "crafting": 1400, "smithing": 320 } );
addData( "fish_pool", "aquaculture:neptunium_chestplate",								{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "xp_value_craft", "aquaculture:neptunium_fillet_knife",						{ "crafting": 30, "smithing": 10 } );
addData( "req_weapon", "aquaculture:neptunium_fillet_knife",							{ "combat": 5 } );
addData2( "salvage", "aquaculture:neptunium_fishing_rod", "minecraft:string",
{
	"salvageMax": 2,
	"baseChance": 45,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 7,
	"levelReq": 1
} );
addData( "fish_pool", "aquaculture:neptunium_fishing_rod",								{ "startWeight": 0, "startLevel": 1, "endWeight": 140, "endLevel": 140, "xp": 75, "enchantLevelReq": 10 } );
addData( "req_use", "aquaculture:neptunium_fishing_rod",								{ "fishing": 30 } );
addData( "req_wear", "aquaculture:neptunium_helmet",									{ "endurance": 45 } );
addData( "xp_value_craft", "aquaculture:neptunium_helmet",								{ "crafting": 800, "smithing": 200 } );
addData( "fish_pool", "aquaculture:neptunium_helmet",									{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "aquaculture:neptunium_hoe",										{ "farming": 40 } );
addData( "xp_value_craft", "aquaculture:neptunium_hoe",									{ "crafting": 400, "smithing": 80 } );
addData( "xp_bonus_held", "aquaculture:neptunium_hoe",									{ "farming": 20, "swimming": 2.5 } );
addData( "fish_pool", "aquaculture:neptunium_hoe",										{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "aquaculture:neptunium_leggings",									{ "endurance": 45 } );
addData( "xp_value_craft", "aquaculture:neptunium_leggings",							{ "crafting": 1200, "smithing": 280 } );
addData( "fish_pool", "aquaculture:neptunium_leggings",									{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "aquaculture:neptunium_pickaxe",									{ "mining": 30 } );
addData( "xp_value_craft", "aquaculture:neptunium_pickaxe",								{ "crafting": 600, "smithing": 120 } );
addData( "xp_bonus_held", "aquaculture:neptunium_pickaxe",								{ "swimming": 2.5 } );
addData( "fish_pool", "aquaculture:neptunium_pickaxe",									{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "aquaculture:neptunium_shovel",									{ "excavation": 30 } );
addData( "xp_value_craft", "aquaculture:neptunium_shovel",								{ "crafting": 200, "smithing": 40 } );
addData( "xp_bonus_held", "aquaculture:neptunium_shovel",								{ "swimming": 2.5 } );
addData( "fish_pool", "aquaculture:neptunium_shovel",									{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_weapon", "aquaculture:neptunium_sword",									{ "combat": 70 } );
addData( "xp_value_craft", "aquaculture:neptunium_sword",								{ "crafting": 500, "smithing": 90 } );
addData( "fish_pool", "aquaculture:neptunium_sword",									{ "startWeight": 0, "startLevel": 90, "endWeight": 4, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "xp_value_craft", "aquaculture:nether_star_hook",								{ "fishing": 20 } );
addData( "xp_value_craft", "aquaculture:note_hook",										{ "fishing": 15 } );
addData( "xp_value_general", "aquaculture:pacific_halibut",								{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:perch",										{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:pink_salmon",									{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:piranha",										{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:pollock",										{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:rainbow_trout",								{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:red_grouper",									{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:red_shrooma",									{ "fishing": 25 } );
addData( "xp_value_craft", "aquaculture:redstone_hook",									{ "fishing": 15 } );
addData( "xp_value_general", "aquaculture:smallmouth_bass",								{ "fishing": 25 } );
addData( "xp_value_general", "aquaculture:starshell_turtle",							{ "fishing": 25 } );
addData( "xp_value_craft", "aquaculture:stone_fillet_knife",							{ "crafting": 5 } );
addData( "xp_value_craft", "aquaculture:sushi",											{ "cooking": 15 } );
addData( "xp_value_general", "aquaculture:synodontis",									{ "fishing": 25 } );
addData( "req_use", "aquaculture:tackle_box",											{ "fishing": 20 } );
addData( "xp_value_general", "aquaculture:tambaqui",									{ "fishing": 25 } );
addData( "xp_value_smelt", "aquaculture:tin_can",										{ "smithing": 12 } );
addData( "info_smelt", "aquaculture:tin_can",											{ "extraChance": 15 } );
addData2( "salvage", "aquaculture:tin_can", "minecraft:iron_nugget",
{
	"salvageMax": 12,
	"baseChance": 35,
	"chancePerLevel": 1.25,
	"maxChance": 90,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "xp_value_general", "aquaculture:tuna",										{ "fishing": 25 } );
addData( "xp_value_craft", "aquaculture:turtle_soup",									{ "cooking": 35 } );
addData( "xp_value_craft", "aquaculture:wooden_fillet_knife",							{ "crafting": 1 } );
}
//ARS_NOUVEAU
{
addData( "xp_value_break", "ars_nouveau:arcane_ore",				{ "mining": 13.5 } );
addData( "xp_value_smelt", "ars_nouveau:arcane_ore",				{ "smithing": 15 } );
addData( "info_ore", "ars_nouveau:arcane_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", 	   "ars_nouveau:arcane_ore",				{ "extraChance": 0.75 } );
addData( "xp_value_break", "ars_nouveau:blue_archwood_log",			{ "woodcutting": 7.5 } );
addData( "xp_value_break", "ars_nouveau:blue_archwood_wood",		{ "woodcutting": 7.5 } );
addData( "xp_value_grow", "ars_nouveau:blue_archwood_sapling",		{ "farming": 23.5 } );
addData( "req_place", "ars_nouveau:blue_archwood_sapling",			{ "farming": 30, "woodcutting": 25 } );
addData( "xp_value_break", "ars_nouveau:green_archwood_log",		{ "woodcutting": 7.25 } );
addData( "xp_value_break", "ars_nouveau:green_archwood_wood",		{ "woodcutting": 7.25 } );
addData( "xp_value_grow", "ars_nouveau:green_archwood_sapling",		{ "farming": 21.5 } );
addData( "req_place", "ars_nouveau:green_archwood_sapling",			{ "farming": 25, "woodcutting": 20 } );
addData( "xp_value_break", "ars_nouveau:purple_archwood_log",		{ "woodcutting": 7.615 } );
addData( "xp_value_break", "ars_nouveau:purple_archwood_wood",		{ "woodcutting": 7.615 } );
addData( "xp_value_grow", "ars_nouveau:purple_archwood_sapling",	{ "farming": 26.5 } );
addData( "req_place", "ars_nouveau:purple_archwood_sapling",		{ "farming": 35, "woodcutting": 30 } );
addData( "xp_value_break", "ars_nouveau:red_archwood_log",			{ "woodcutting": 7.35 } );
addData( "xp_value_break", "ars_nouveau:red_archwood_wood",			{ "woodcutting": 7.35 } );
addData( "xp_value_grow", "ars_nouveau:red_archwood_sapling",		{ "farming": 22.5 } );
addData( "req_place", "ars_nouveau:red_archwood_sapling",			{ "farming": 30, "woodcutting": 20 } );
addData( "xp_value_grow",  "ars_nouveau:mana_bloom_crop",			{ "farming": 14 } );
addData( "xp_value_break", "ars_nouveau:mana_bloom_crop",			{ "farming": 3 } );
addData( "xp_value_craft", "ars_nouveau:mana_gem",					{ "crafting": 0 } );
addData( "xp_value_craft", "ars_nouveau:mana_gem_block",			{ "crafting": 0 } );
addData( "item_specific", "ars_nouveau:spell_bow",						{ "archeryWeapon": 1, "magicWeapon": 1} );
addData( "req_weapon", "ars_nouveau:spell_bow",							{ "archery": 30, "agility": 30, "magic": 30} );

addData( "req_use", "ars_nouveau:novice_spell_book",					{ "mining": 30, "woodcutting": 30, "excavation": 30, "combat": 30 } );
addData( "xp_bonus_worn", "ars_nouveau:novice_boots",				{ "magic": 2 } );
addData( "xp_bonus_worn", "ars_nouveau:novice_leggings",			{ "magic": 2.5 } );
addData( "xp_bonus_worn", "ars_nouveau:novice_robes",				{ "magic": 3 } );
addData( "xp_bonus_worn", "ars_nouveau:novice_hood",				{ "magic": 2.5 } );

addData( "req_use", "ars_nouveau:apprentice_spell_book",				{ "mining": 45, "woodcutting": 45, "excavation": 35, "combat": 45, "magic": 45 } );
addData( "xp_bonus_worn", "ars_nouveau:apprentice_boots",				{ "magic": 3 } );
addData( "xp_bonus_worn", "ars_nouveau:apprentice_leggings",			{ "magic": 3.5 } );
addData( "xp_bonus_worn", "ars_nouveau:apprentice_robes",				{ "magic": 4 } );
addData( "xp_bonus_worn", "ars_nouveau:apprentice_hood",				{ "magic": 3.5 } );

addData( "req_use", "ars_nouveau:archmage_spell_book",					{ "mining": 60, "woodcutting": 50, "excavation": 45, "combat": 60, "magic": 60 } );
addData( "xp_bonus_worn", "ars_nouveau:archmage_boots",				{ "magic": 4.5 } );
addData( "xp_bonus_worn", "ars_nouveau:archmage_leggings",			{ "magic": 5.5 } );
addData( "xp_bonus_worn", "ars_nouveau:archmage_robes",				{ "magic": 6.5 } );
addData( "xp_bonus_worn", "ars_nouveau:archmage_hood",				{ "magic": 5.5 } );

addData( "req_use", "ars_nouveau:glyph_fortune",				{ "mining": 45, "magic": 55 } );
addData( "req_use", "ars_nouveau:glyph_amplify",				{ "mining": 40, "magic": 35 } );
addData( "req_use", "ars_nouveau:glyph_heal",					{ "magic": 65 } );

addData( "xp_bonus_held", "ars_nouveau:apprentice_spell_book",	{ "magic": 10} );
addData( "xp_bonus_held", "ars_nouveau:archmage_spell_book",	{ "magic": 20} );
}
//ARTIFACTS
{
addData( "xp_value_kill", "artifacts:mimic",										{ "combat": 45 } );
}
//ASTRALSORCERY
{
addData( "info_ore", "astralsorcery:aquamarine_sand_ore",			{ "extraChance": 1.5} );
addData( "info_smelt", "astralsorcery:aquamarine_sand_ore",				{ "extraChance": 2.5} );
addData( "xp_value_break", "astralsorcery:aquamarine_sand_ore",				{ "excavation": 5, "magic": 2} );
addData( "xp_value_smelt", "astralsorcery:aquamarine_sand_ore",				{ "smithing": 15, "magic": 2} );
addData( "info_ore", "astralsorcery:rock_crystal_ore",				{ "extraChance": 0.75} );
addData( "xp_value_break", "astralsorcery:rock_crystal_ore",				{ "mining": 22, "magic": 35} );
addData( "info_ore", "astralsorcery:starmetal_ore",					{ "extraChance": 0.5} );
addData( "info_smelt", "astralsorcery:starmetal_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "astralsorcery:starmetal_ore",					{ "mining": 12, "magic": 22} );
addData( "xp_value_smelt", "astralsorcery:starmetal_ore",					{ "smithing": 18, "magic": 20} );
}
//AUTUMNITY
{
addData( "xp_value_break", "autumnity:maple_log",										{ "woodcutting": 13 } );
addData( "xp_value_smelt", "autumnity:maple_log",										{ "smithing": 0.25 } );
addData( "info_log", "autumnity:maple_log",												{ "extraChance": 1.25 } );
addData( "req_place", "autumnity:maple_sapling",										{ "farming": 25, "woodcutting": 35 } );
addData( "xp_value_grow", "autumnity:maple_sapling",									{ "farming": 25 } );
addData( "xp_value_break", "autumnity:maple_wood",										{ "woodcutting": 13 } );
addData( "info_log", "autumnity:maple_wood",											{ "extraChance": 1.25 } );
addData( "req_place", "autumnity:orange_maple_sapling",									{ "farming": 35, "woodcutting": 45 } );
addData( "xp_value_grow", "autumnity:orange_maple_sapling",								{ "farming": 35 } );
addData( "req_place", "autumnity:red_maple_sapling",									{ "farming": 30, "woodcutting": 50 } );
addData( "xp_value_grow", "autumnity:red_maple_sapling",								{ "farming": 30 } );
addData( "xp_value_break", "autumnity:sappy_maple_log",									{ "woodcutting": 13 } );
addData( "xp_value_smelt", "autumnity:sappy_maple_log",									{ "smithing": 0.25 } );
addData( "info_log", "autumnity:sappy_maple_log",										{ "extraChance": 1.35 } );
addData( "xp_value_break", "autumnity:sappy_maple_wood",								{ "woodcutting": 13 } );
addData( "info_log", "autumnity:sappy_maple_wood",										{ "extraChance": 1.35 } );
addData( "req_place", "autumnity:yellow_maple_sapling",									{ "farming": 30, "woodcutting": 40 } );
addData( "xp_value_grow", "autumnity:yellow_maple_sapling",								{ "farming": 30 } );
}
//BETTERANIMALSPLUS
{
addData( "xp_value_kill", "betteranimalsplus:badger",									{ "slayer": 30 } );
addData( "xp_value_kill", "betteranimalsplus:blackbear",								{ "slayer": 30 } );
addData( "xp_value_kill", "betteranimalsplus:boar",										{ "slayer": 10 } );
addData( "xp_value_kill", "betteranimalsplus:bobbit_worm",								{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:brownbear",								{ "slayer": 30 } );
addData( "xp_value_kill", "betteranimalsplus:coyote",									{ "slayer": 10 } );
addData( "xp_value_kill", "betteranimalsplus:crab",										{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:deer",										{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:eel_freshwater",							{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:eel_saltwater",							{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:feralwolf",								{ "slayer": 10 } );
addData( "xp_value_kill", "betteranimalsplus:goat",										{ "slayer": 10 } );
addData( "xp_value_kill", "betteranimalsplus:goose",									{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:hirschgeist",								{ "slayer": 100 } );
addData( "xp_value_kill", "betteranimalsplus:horseshoecrab",							{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:jellyfish",								{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:lammergeier",								{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:lamprey",									{ "slayer": 10 } );
addData( "xp_value_kill", "betteranimalsplus:moose",									{ "slayer": 10 } );
addData( "xp_value_kill", "betteranimalsplus:nautilus",									{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:pheasant",									{ "slayer": 3 } );
addData( "xp_value_kill", "betteranimalsplus:reindeer",									{ "slayer": 10 } );
addData( "xp_value_kill", "betteranimalsplus:shark",									{ "slayer": 30 } );
addData( "xp_value_kill", "betteranimalsplus:songbird",									{ "slayer": 2 } );
addData( "xp_value_kill", "betteranimalsplus:squirrel",									{ "slayer": 2 } );
addData( "xp_value_kill", "betteranimalsplus:tarantula",								{ "slayer": 20 } );
addData( "xp_value_kill", "betteranimalsplus:turkey",									{ "slayer": 5 } );
addData( "xp_value_kill", "betteranimalsplus:walrus",									{ "slayer": 30 } );
addData( "xp_value_kill", "betteranimalsplus:whale",									{ "slayer": 30 } );
addData( "xp_value_kill", "betteranimalsplus:zotzpyre",									{ "slayer": 12 } );
}
//BIGGERREACTORS
{
addData( "xp_value_smelt", "biggerreactors:blutonium_dust",					{ "smithing": 18} );
addData( "xp_value_smelt", "biggerreactors:cyanite_dust",					{ "smithing": 18} );
addData( "xp_value_smelt", "biggerreactors:graphite_dust",					{ "smithing": 12} );
addData( "xp_value_smelt", "biggerreactors:ludicrite_dust",					{ "smithing": 35} );
}
//BIGREACTORS
{
addData( "info_ore", "bigreactors:anglesite_ore",					{ "extraChance": 0.35} );
addData( "info_smelt", "bigreactors:anglesite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "bigreactors:anglesite_ore",						{ "mining": 35} );
addData( "xp_value_smelt", "bigreactors:anglesite_ore",						{ "smithing": 18} );
addData( "info_ore", "bigreactors:benitoite_ore",					{ "extraChance": 0.35} );
addData( "info_smelt", "bigreactors:benitoite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "bigreactors:benitoite_ore",						{ "mining": 35} );
addData( "xp_value_smelt", "bigreactors:benitoite_ore",						{ "smithing": 18} );
addData( "info_ore", "bigreactors:yellorite_ore",					{ "extraChance": 0.35} );
addData( "info_smelt", "bigreactors:yellorite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "bigreactors:yellorite_ore",						{ "mining": 28} );
addData( "xp_value_smelt", "bigreactors:yellorite_ore",						{ "smithing": 18} );
addData( "xp_value_smelt", "bigreactors:yellorium_dust",					{ "smithing": 16} );
}
//BIOMESOPLENTY
{
addData( "xp_value_break", "biomesoplenty:cherry_log",									{ "woodcutting": 15 } );
addData( "xp_value_smelt", "biomesoplenty:cherry_log",									{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:cherry_log",										{ "extraChance": 1 } );
addData( "xp_value_break", "biomesoplenty:cherry_wood",									{ "woodcutting": 15 } );
addData( "info_log", "biomesoplenty:cherry_wood",										{ "extraChance": 1 } );
addData( "xp_value_break", "biomesoplenty:dead_log",									{ "woodcutting": 6 } );
addData( "xp_value_smelt", "biomesoplenty:dead_log",									{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:dead_log",											{ "extraChance": 1.75 } );
addData( "req_place", "biomesoplenty:dead_sapling",										{ "farming": 15, "woodcutting": 15 } );
addData( "xp_value_grow", "biomesoplenty:dead_sapling",									{ "farming": 3 } );
addData( "xp_value_break", "biomesoplenty:dead_wood",									{ "woodcutting": 6 } );
addData( "info_log", "biomesoplenty:dead_wood",											{ "extraChance": 1.75 } );
addData( "xp_value_break", "biomesoplenty:fir_log",										{ "woodcutting": 8 } );
addData( "xp_value_smelt", "biomesoplenty:fir_log",										{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:fir_log",											{ "extraChance": 0.7 } );
addData( "req_place", "biomesoplenty:fir_sapling",										{ "farming": 35, "woodcutting": 35 } );
addData( "xp_value_grow", "biomesoplenty:fir_sapling",									{ "farming": 20 } );
addData( "xp_value_break", "biomesoplenty:fir_wood",									{ "woodcutting": 8 } );
addData( "info_log", "biomesoplenty:fir_wood",											{ "extraChance": 0.7 } );
addData( "req_place", "biomesoplenty:flowering_oak_sapling",							{ "farming": 30, "woodcutting": 20 } );
addData( "xp_value_grow", "biomesoplenty:flowering_oak_sapling",						{ "farming": 15 } );
addData( "xp_value_break", "biomesoplenty:hellbark_log",								{ "woodcutting": 10 } );
addData( "xp_value_smelt", "biomesoplenty:hellbark_log",								{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:hellbark_log",										{ "extraChance": 1.1 } );
addData( "req_place", "biomesoplenty:hellbark_sapling",									{ "farming": 25, "woodcutting": 5 } );
addData( "xp_value_grow", "biomesoplenty:hellbark_sapling",								{ "farming": 25 } );
addData( "xp_value_break", "biomesoplenty:hellbark_wood",								{ "woodcutting": 10 } );
addData( "info_log", "biomesoplenty:hellbark_wood",										{ "extraChance": 1.1 } );
addData( "biome_effect_positive", "biomesoplenty:highland",								{ "minecraft:speed": 0 } );
addData( "xp_value_break", "biomesoplenty:jacaranda_log",								{ "woodcutting": 9 } );
addData( "xp_value_smelt", "biomesoplenty:jacaranda_log",								{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:jacaranda_log",										{ "extraChance": 1 } );
addData( "req_place", "biomesoplenty:jacaranda_sapling",								{ "farming": 45, "woodcutting": 20 } );
addData( "xp_value_grow", "biomesoplenty:jacaranda_sapling",							{ "farming": 30 } );
addData( "xp_value_break", "biomesoplenty:jacaranda_wood",								{ "woodcutting": 9 } );
addData( "info_log", "biomesoplenty:jacaranda_wood",									{ "extraChance": 1 } );
addData( "xp_value_break", "biomesoplenty:magic_log",									{ "woodcutting": 15, "magic": 5 } );
addData( "xp_value_smelt", "biomesoplenty:magic_log",									{ "smithing": 0.15, "magic": 0.05 } );
addData( "info_log", "biomesoplenty:magic_log",											{ "extraChance": 1.2 } );
addData( "req_place", "biomesoplenty:magic_sapling",									{ "farming": 45, "woodcutting": 45 } );
addData( "xp_value_grow", "biomesoplenty:magic_sapling",								{ "farming": 20, "magic": 20 } );
addData( "xp_value_break", "biomesoplenty:magic_wood",									{ "woodcutting": 15, "magic": 5 } );
addData( "info_log", "biomesoplenty:magic_wood",										{ "extraChance": 1.2 } );
addData( "xp_value_break", "biomesoplenty:mahogany_log",								{ "woodcutting": 8 } );
addData( "xp_value_smelt", "biomesoplenty:mahogany_log",								{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:mahogany_log",										{ "extraChance": 0.85 } );
addData( "req_place", "biomesoplenty:mahogany_sapling",									{ "farming": 25, "woodcutting": 35 } );
addData( "xp_value_grow", "biomesoplenty:mahogany_sapling",								{ "farming": 40 } );
addData( "xp_value_break", "biomesoplenty:mahogany_wood",								{ "woodcutting": 8 } );
addData( "info_log", "biomesoplenty:mahogany_wood",										{ "extraChance": 0.85 } );
addData( "req_place", "biomesoplenty:maple_sapling",									{ "farming": 25, "woodcutting": 50 } );
addData( "xp_value_grow", "biomesoplenty:maple_sapling",								{ "farming": 40 } );
addData( "xp_value_smelt", "biomesoplenty:mud_ball",									{ "smithing": 1.2 } );
addData( "info_smelt", "biomesoplenty:mud_ball",										{ "extraChance": 1.2 } );
addData( "req_place", "biomesoplenty:orange_autumn_sapling",							{ "farming": 45, "woodcutting": 25 } );
addData( "xp_value_grow", "biomesoplenty:orange_autumn_sapling",						{ "farming": 30 } );
addData( "req_place", "biomesoplenty:origin_sapling",									{ "farming": 10, "woodcutting": 15 } );
addData( "xp_value_grow", "biomesoplenty:origin_sapling",								{ "farming": 5 } );
addData( "xp_value_break", "biomesoplenty:palm_log",									{ "woodcutting": 12 } );
addData( "xp_value_smelt", "biomesoplenty:palm_log",									{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:palm_log",											{ "extraChance": 1.5 } );
addData( "req_place", "biomesoplenty:palm_sapling",										{ "farming": 15, "woodcutting": 15 } );
addData( "xp_value_grow", "biomesoplenty:palm_sapling",									{ "farming": 40 } );
addData( "xp_value_break", "biomesoplenty:palm_wood",									{ "woodcutting": 12 } );
addData( "info_log", "biomesoplenty:palm_wood",											{ "extraChance": 1.5 } );
addData( "req_place", "biomesoplenty:pink_cherry_sapling",								{ "farming": 40, "woodcutting": 20 } );
addData( "xp_value_grow", "biomesoplenty:pink_cherry_sapling",							{ "farming": 35 } );
addData( "req_place", "biomesoplenty:rainbow_birch_sapling",							{ "farming": 50, "woodcutting": 25 } );
addData( "xp_value_grow", "biomesoplenty:rainbow_birch_sapling",						{ "farming": 35 } );
addData( "xp_value_break", "biomesoplenty:redwood_log",									{ "woodcutting": 7 } );
addData( "xp_value_smelt", "biomesoplenty:redwood_log",									{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:redwood_log",										{ "extraChance": 0.8 } );
addData( "req_place", "biomesoplenty:redwood_sapling",									{ "farming": 30, "woodcutting": 40 } );
addData( "xp_value_grow", "biomesoplenty:redwood_sapling",								{ "farming": 25 } );
addData( "xp_value_break", "biomesoplenty:redwood_wood",								{ "woodcutting": 7 } );
addData( "info_log", "biomesoplenty:redwood_wood",										{ "extraChance": 0.8 } );
addData( "xp_value_break", "biomesoplenty:umbran_log",									{ "woodcutting": 9 } );
addData( "xp_value_smelt", "biomesoplenty:umbran_log",									{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:umbran_log",										{ "extraChance": 1 } );
addData( "req_place", "biomesoplenty:umbran_sapling",									{ "farming": 30, "woodcutting": 55 } );
addData( "xp_value_grow", "biomesoplenty:umbran_sapling",								{ "farming": 30 } );
addData( "xp_value_break", "biomesoplenty:umbran_wood",									{ "woodcutting": 9 } );
addData( "info_log", "biomesoplenty:umbran_wood",										{ "extraChance": 1 } );
addData( "req_place", "biomesoplenty:white_cherry_sapling",								{ "farming": 35, "woodcutting": 25 } );
addData( "xp_value_grow", "biomesoplenty:white_cherry_sapling",							{ "farming": 35 } );
addData( "xp_value_break", "biomesoplenty:white_sand",									{ "excavation": 1.3 } );
addData( "xp_value_smelt", "biomesoplenty:white_sand",									{ "smithing": 1 } );
addData( "xp_value_break", "biomesoplenty:willow_log",									{ "woodcutting": 14 } );
addData( "xp_value_smelt", "biomesoplenty:willow_log",									{ "smithing": 0.25 } );
addData( "info_log", "biomesoplenty:willow_log",										{ "extraChance": 1.25 } );
addData( "req_place", "biomesoplenty:willow_sapling",									{ "farming": 30, "woodcutting": 45 } );
addData( "xp_value_grow", "biomesoplenty:willow_sapling",								{ "farming": 35 } );
addData( "xp_value_break", "biomesoplenty:willow_wood",									{ "woodcutting": 14 } );
addData( "info_log", "biomesoplenty:willow_wood",										{ "extraChance": 1.25 } );
addData( "req_place", "biomesoplenty:yellow_autumn_sapling",							{ "farming": 35, "woodcutting": 25 } );
addData( "xp_value_grow", "biomesoplenty:yellow_autumn_sapling",						{ "farming": 30 } );
}
//BLOODMAGIC
{
addData( "info_smelt", "bloodmagic:goldsand",							{ "extraChance": 0.5} );
addData( "xp_value_smelt", "bloodmagic:goldsand",							{ "smithing": 16} );
addData( "info_smelt", "bloodmagic:ironsand",							{ "extraChance": 1} );
addData( "xp_value_smelt", "bloodmagic:ironsand",							{ "smithing": 12} );
addData( "info_smelt", "bloodmagic:sand_hellforged",					{ "extraChance": 0.5} );
addData( "xp_value_smelt", "bloodmagic:sand_hellforged",					{ "smithing": 18, "magic": 4} );
addData( "info_smelt", "bloodmagic:sand_netherite",						{ "extraChance": 0.15} );
addData( "xp_value_smelt", "bloodmagic:sand_netherite",						{ "smithing": 60} );
}
//BNO
{
addData( "info_ore", "bno:netheraluminum_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "bno:netheraluminum_ore",						{ "extraChance": 0.75} );
addData( "xp_value_break", "bno:netheraluminum_ore",						{ "mining": 8} );
addData( "xp_value_smelt", "bno:netheraluminum_ore",						{ "smithing": 12} );
addData( "info_ore", "bno:nethercoal_ore",							{ "extraChance": 1} );
addData( "info_smelt", "bno:nethercoal_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "bno:nethercoal_ore",							{ "mining": 4} );
addData( "xp_value_smelt", "bno:nethercoal_ore",							{ "smithing": 8} );
addData( "info_ore", "bno:nethercopper_ore",						{ "extraChance": 0.8} );
addData( "info_smelt", "bno:nethercopper_ore",							{ "extraChance": 0.85} );
addData( "xp_value_break", "bno:nethercopper_ore",							{ "mining": 7} );
addData( "xp_value_smelt", "bno:nethercopper_ore",							{ "smithing": 7} );
addData( "info_ore", "bno:netherdiamond_ore",						{ "extraChance": 0.33} );
addData( "info_smelt", "bno:netherdiamond_ore",							{ "extraChance": 0.25} );
addData( "xp_value_break", "bno:netherdiamond_ore",							{ "mining": 35} );
addData( "xp_value_smelt", "bno:netherdiamond_ore",							{ "smithing": 35} );
addData( "info_ore", "bno:netheremerald_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "bno:netheremerald_ore",							{ "extraChance": 0.2} );
addData( "xp_value_break", "bno:netheremerald_ore",							{ "mining": 60} );
addData( "xp_value_smelt", "bno:netheremerald_ore",							{ "smithing": 60} );
addData( "info_ore", "bno:netheriron_ore",							{ "extraChance": 0.75} );
addData( "info_smelt", "bno:netheriron_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "bno:netheriron_ore",							{ "mining": 12} );
addData( "xp_value_smelt", "bno:netheriron_ore",							{ "smithing": 12} );
addData( "info_ore", "bno:netherlapis_ore",							{ "extraChance": 1.5} );
addData( "info_smelt", "bno:netherlapis_ore",							{ "extraChance": 2.5} );
addData( "xp_value_break", "bno:netherlapis_ore",							{ "mining": 5} );
addData( "xp_value_smelt", "bno:netherlapis_ore",							{ "smithing": 25} );
addData( "info_ore", "bno:netherlead_ore",							{ "extraChance": 0.5} );
addData( "info_smelt", "bno:netherlead_ore",							{ "extraChance": 0.75} );
addData( "xp_value_break", "bno:netherlead_ore",							{ "mining": 20} );
addData( "xp_value_smelt", "bno:netherlead_ore",							{ "smithing": 18} );
addData( "info_ore", "bno:nethernickel_ore",						{ "extraChance": 0.35} );
addData( "info_smelt", "bno:nethernickel_ore",							{ "extraChance": 0.35} );
addData( "xp_value_break", "bno:nethernickel_ore",							{ "mining": 28} );
addData( "xp_value_smelt", "bno:nethernickel_ore",							{ "smithing": 28} );
addData( "info_ore", "bno:netherosmium_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "bno:netherosmium_ore",							{ "extraChance": 0.75} );
addData( "xp_value_break", "bno:netherosmium_ore",							{ "mining": 16} );
addData( "xp_value_smelt", "bno:netherosmium_ore",							{ "smithing": 12} );
addData( "info_ore", "bno:netherredstone_ore",						{ "extraChance": 2} );
addData( "info_smelt", "bno:netherredstone_ore",						{ "extraChance": 2} );
addData( "xp_value_break", "bno:netherredstone_ore",						{ "mining": 1.5} );
addData( "xp_value_smelt", "bno:netherredstone_ore",						{ "smithing": 15} );
addData( "info_ore", "bno:nethersilver_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "bno:nethersilver_ore",							{ "extraChance": 0.5} );
addData( "xp_value_break", "bno:nethersilver_ore",							{ "mining": 22} );
addData( "xp_value_smelt", "bno:nethersilver_ore",							{ "smithing": 18} );
addData( "info_ore", "bno:nethertin_ore",							{ "extraChance": 0.75} );
addData( "info_smelt", "bno:nethertin_ore",								{ "extraChance": 1} );
addData( "xp_value_break", "bno:nethertin_ore",								{ "mining": 10} );
addData( "xp_value_smelt", "bno:nethertin_ore",								{ "smithing": 12} );
addData( "info_ore", "bno:netheruranium_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "bno:netheruranium_ore",							{ "extraChance": 0.35} );
addData( "xp_value_break", "bno:netheruranium_ore",							{ "mining": 22} );
addData( "xp_value_smelt", "bno:netheruranium_ore",							{ "smithing": 18} );
}
//BOTANIA
{
addData( "item_specific", "botania:crystal",							{ "archeryWeapon": 1} );
addData( "req_weapon", "botania:crystal_bow",							{ "archery": 15, "magic": 5} );
addData2( "salvage", "botania:elementium_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:elementium_boots", "botania:elementium_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:elementium_chestplate", "botania:elementium_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:elementium_helmet", "botania:elementium_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:elementium_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:elementium_horse_armor", "botania:elementium_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:elementium_leggings", "botania:elementium_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:elementium_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:elementium_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:elementium_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData( "item_specific", "botania:livingwood_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "botania:livingwood_bow",						{ "archery": 10, "magic": 1} );
addData2( "salvage", "botania:manasteel_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:manasteel_boots", "botania:manasteel_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:manasteel_chestplate", "botania:manasteel_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:manasteel_helmet", "botania:manasteel_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:manasteel_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:manasteel_horse_armor", "botania:manasteel_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:manasteel_leggings", "botania:manasteel_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "botania:manasteel_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:manasteel_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:manasteel_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "botania:terrasteel_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_boots", "botania:terrasteel",
{
	"salvageMax": 4,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_chestplate", "botania:terrasteel",
{
	"salvageMax": 8,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_helmet", "botania:terrasteel",
{
	"salvageMax": 5,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_horse_armor", "botania:terrasteel",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_leggings", "botania:terrasteel",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "botania:terrasteel_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
}
//BOTANIAADDITIONS
{
addData( "item_specific", "botaniaadditions:terra_bow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "botaniaadditions:terra_bow",					{ "archery": 15, "magic": 5} );
}
//BOUNTIFULBAUBLES
{
addData( "req_wear", "bountifulbaubles:amulet_cross",									{ "magic": 2 } );
addData( "req_wear", "bountifulbaubles:ankh_charm",										{ "endurance": 5 } );
addData( "req_wear", "bountifulbaubles:apple",											{ "endurance": 5 } );
addData( "req_wear", "bountifulbaubles:balloon",										{ "agility": 10 } );
addData( "req_wear", "bountifulbaubles:bezoar",											{ "endurance": 10 } );
addData( "req_wear", "bountifulbaubles:black_dragon_scale",								{ "endurance": 10 } );
addData( "req_wear", "bountifulbaubles:broken_heart",									{ "endurance": 15 } );
addData( "xp_value_craft", "bountifulbaubles:disintegration_tablet",					{ "crafting": 20, "magic": 10 } );
addData( "req_wear", "bountifulbaubles:gloves_dexterity",								{ "agility": 5 } );
addData( "req_wear", "bountifulbaubles:gloves_digging_diamond",							{ "endurance": 15, "excavation": 40, "woodcutting": 40, "mining": 40, "farming": 30 } );
addData( "req_wear", "bountifulbaubles:gloves_digging_iron",							{ "endurance": 10, "excavation": 20, "woodcutting": 20, "mining": 20, "farming": 20 } );
addData( "req_wear", "bountifulbaubles:lucky_horseshoe",								{ "endurance": 15 } );
addData( "req_wear", "bountifulbaubles:magic_mirror",									{ "magic": 2 } );
addData( "req_wear", "bountifulbaubles:mixed_dragon_scale",								{ "endurance": 15 } );
addData( "req_wear", "bountifulbaubles:obsidian_skull",									{ "endurance": 10 } );
addData( "req_wear", "bountifulbaubles:phylactery_charm",								{ "magic": 20 } );
addData( "req_wear", "bountifulbaubles:ring_free_action",								{ "agility": 10 } );
addData( "req_wear", "bountifulbaubles:ring_overclocking",								{ "agility": 10 } );
addData( "req_wear", "bountifulbaubles:shield_ankh",									{ "endurance": 5 } );
addData( "req_wear", "bountifulbaubles:shield_cobalt",									{ "endurance": 5 } );
addData( "req_wear", "bountifulbaubles:shield_obsidian",								{ "endurance": 5 } );
addData( "req_wear", "bountifulbaubles:shulker_heart",									{ "agility": 10 } );
addData( "xp_value_craft", "bountifulbaubles:spectral_silt",							{ "crafting": 5, "magic": 5 } );
addData( "req_wear", "bountifulbaubles:sunglasses",										{ "endurance": 5 } );
addData( "req_wear", "bountifulbaubles:vitamins",										{ "endurance": 5 } );
addData( "req_place", "bountifulbaubles:water_candle",									{ "magic": 10 } );
}
//BYG
{
addData( "req_place", "byg:baobab_sapling",												{ "farming": 60, "woodcutting": 50 } );
}
//CHARM
{
addData( "fish_enchant_pool", "charm:curse_break",										{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "charm:homing",											{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "charm:magnetic",											{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "xp_value_break", "charm:nether_gold_deposit",									{ "mining": 2 } );
addData( "xp_value_smelt", "charm:nether_gold_deposit",									{ "smithing": 22 } );
addData( "info_smelt", "charm:nether_gold_deposit",										{ "extraChance": 0.75 } );
addData( "xp_value_break", "charm:pig_iron_ore",										{ "mining": 12 } );
addData( "xp_value_smelt", "charm:pig_iron_ore",										{ "smithing": 22 } );
addData( "info_smelt", "charm:pig_iron_ore",											{ "extraChance": 0.75 } );
addData( "info_ore", "charm:pig_iron_ore",												{ "extraChance": 0.75 } );
addData( "fish_enchant_pool", "charm:salvage",											{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
}
//COLORFULTOOLS
{
addData( "req_weapon", "colorfultools:blackwooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:bluewooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:brownwooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:cyanwooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:graywooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:greenwooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:lightbluewooden_sword",			{ "combat": 5} );
addData( "req_weapon", "colorfultools:lightgraywooden_sword",			{ "combat": 5} );
addData( "req_weapon", "colorfultools:limewooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:magentawooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:orangewooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:pinkwooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:purplewooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:redwooden_sword",					{ "combat": 5} );
addData( "req_weapon", "colorfultools:whitewooden_sword",				{ "combat": 5} );
addData( "req_weapon", "colorfultools:wooden_sword",					{ "combat": 5} );
addData( "req_weapon", "colorfultools:yellowwooden_sword",				{ "combat": 5} );
}
//COMBUSTIVEFISHING
{
addData( "req_use", "combustivefishing:blazing_fishing_rod",							{ "fishing": 40 } );
addData( "req_weapon", "combustivefishing:searing_sword",								{ "combat": 60 } );
}
//CRAFTANDHUNT
{
addData2( "salvage", "craftandhunt:blaze_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:blaze_boots", "craftandhunt:blaze_glass",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:blaze_chestplate", "craftandhunt:blaze_glass",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:blaze_helmet", "craftandhunt:blaze_glass",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:blaze_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:blaze_horse_armor", "craftandhunt:blaze_glass",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:blaze_leggings", "craftandhunt:blaze_glass",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:blaze_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:blaze_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:blaze_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:bone_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:bone_boots", "minecraft:bone",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:bone_chestplate", "minecraft:bone",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:bone_helmet", "minecraft:bone",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:bone_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:bone_horse_armor", "minecraft:bone",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:bone_leggings", "minecraft:bone",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:bone_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:bone_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:bone_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:horror_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:horror_boots", "craftandhunt:parasite_starved",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:horror_chestplate", "craftandhunt:parasite_starved",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:horror_helmet", "craftandhunt:parasite_starved",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:horror_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:horror_horse_armor", "craftandhunt:parasite_starved",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:horror_leggings", "craftandhunt:parasite_starved",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:horror_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:horror_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:horror_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shark_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shark_boots", "craftandhunt:thrasher_tooth",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shark_chestplate", "craftandhunt:thrasher_tooth",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shark_helmet", "craftandhunt:thrasher_tooth",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shark_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shark_horse_armor", "craftandhunt:thrasher_tooth",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shark_leggings", "craftandhunt:thrasher_tooth",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shark_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shark_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shark_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shell_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shell_boots", "minecraft:scute",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shell_chestplate", "minecraft:scute",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shell_helmet", "minecraft:scute",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shell_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shell_horse_armor", "minecraft:scute",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shell_leggings", "minecraft:scute",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shell_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shell_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shell_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shulker_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shulker_boots", "minecraft:shulker_shell",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shulker_chestplate", "minecraft:shulker_shell",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shulker_helmet", "minecraft:shulker_shell",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shulker_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shulker_horse_armor", "minecraft:shulker_shell",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shulker_leggings", "minecraft:shulker_shell",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:shulker_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shulker_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:shulker_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:spider_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:spider_boots", "craftandhunt:spider_chitin",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:spider_chestplate", "craftandhunt:spider_chitin",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:spider_helmet", "craftandhunt:spider_chitin",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:spider_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:spider_horse_armor", "craftandhunt:spider_chitin",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:spider_leggings", "craftandhunt:spider_chitin",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "craftandhunt:spider_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:spider_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:spider_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "craftandhunt:wither_axe", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_boots", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_chestplate", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_helmet", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_hoe", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_horse_armor", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_leggings", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_pickaxe", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_shovel", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "craftandhunt:wither_sword", "minecraft:wither_skeleton_skull",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
}
//CREATE
{
addData2( "salvage", "create:controller_rail", "minecraft:gold_ingot",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "req_craft", "create:adjustable_crate",										{ "crafting": 20 } );
addData( "xp_value_craft", "create:adjustable_crate",									{ "crafting": 10 } );
addData( "req_place", "create:adjustable_crate",										{ "building": 10 } );
addData( "req_craft", "create:adjustable_pulley",										{ "crafting": 25 } );
addData( "xp_value_craft", "create:adjustable_pulley",									{ "crafting": 10.8 } );
addData( "req_place", "create:adjustable_pulley",										{ "building": 10 } );
addData( "req_craft", "create:adjustable_pulse_repeater",								{ "crafting": 25 } );
addData( "xp_value_craft", "create:adjustable_pulse_repeater",							{ "crafting": 18 } );
addData( "req_place", "create:adjustable_pulse_repeater",								{ "building": 10 } );
addData( "req_craft", "create:adjustable_repeater",										{ "crafting": 20 } );
addData( "xp_value_craft", "create:adjustable_repeater",								{ "crafting": 10 } );
addData( "req_place", "create:adjustable_repeater",										{ "building": 10 } );
addData( "req_craft", "create:analog_lever",											{ "crafting": 20 } );
addData( "xp_value_craft", "create:analog_lever",										{ "crafting": 10 } );
addData( "req_place", "create:analog_lever",											{ "building": 10 } );
addData( "req_craft", "create:andesite_alloy",											{ "crafting": 10, "smithing": 5 } );
addData( "xp_value_craft", "create:andesite_alloy",										{ "crafting": 3 } );
addData( "req_craft", "create:andesite_casing",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:andesite_casing",									{ "crafting": 8.8 } );
addData( "req_place", "create:andesite_casing",											{ "building": 10 } );
addData( "req_craft", "create:attribute_filter",										{ "crafting": 15, "smithing": 5 } );
addData( "xp_value_craft", "create:attribute_filter",									{ "crafting": 6.5 } );
addData( "req_craft", "create:basin",													{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:basin",												{ "crafting": 12 } );
addData( "req_place", "create:basin",													{ "building": 10 } );
addData( "req_craft", "create:belt_connector",											{ "crafting": 10 } );
addData( "xp_value_craft", "create:belt_connector",										{ "crafting": 10 } );
addData( "req_place", "create:belt_connector",											{ "building": 10 } );
addData( "req_craft", "create:belt_observer",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:belt_observer",										{ "crafting": 10 } );
addData( "req_place", "create:belt_observer",											{ "building": 10 } );
addData( "req_craft", "create:belt_tunnel",												{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:belt_tunnel",										{ "crafting": 10 } );
addData( "req_place", "create:belt_tunnel",												{ "building": 10 } );
addData( "xp_value_craft", "create:brass_block",										{ "crafting": 0 } );
addData( "req_craft", "create:brass_casing",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:brass_casing",										{ "crafting": 8.8 } );
addData( "req_place", "create:brass_casing",											{ "building": 10 } );
addData( "req_craft", "create:brass_hand",												{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:brass_hand",											{ "crafting": 7 } );
addData( "xp_value_craft", "create:brass_ingot",										{ "crafting": 0 } );
addData( "xp_value_craft", "create:brass_nugget",										{ "crafting": 0 } );
addData( "req_craft", "create:cart_assembler",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:cart_assembler",										{ "crafting": 20.3 } );
addData( "req_place", "create:cart_assembler",											{ "building": 10 } );
addData( "req_craft", "create:clockwork_bearing",										{ "crafting": 20 } );
addData( "xp_value_craft", "create:clockwork_bearing",									{ "crafting": 6.4 } );
addData( "req_place", "create:clockwork_bearing",										{ "building": 10 } );
addData( "req_craft", "create:clutch",													{ "crafting": 20 } );
addData( "xp_value_craft", "create:clutch",												{ "crafting": 4 } );
addData( "req_place", "create:clutch",													{ "building": 10 } );
addData( "req_craft", "create:cogwheel",												{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:cogwheel",											{ "crafting": 4.1 } );
addData( "req_place", "create:cogwheel",												{ "building": 10 } );
addData( "xp_value_craft", "create:copper_block",										{ "crafting": 0 } );
addData( "req_craft", "create:copper_casing",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:copper_casing",										{ "crafting": 8.8 } );
addData( "req_place", "create:copper_casing",											{ "building": 10 } );
addData( "xp_value_craft", "create:copper_ingot",										{ "crafting": 0 } );
addData( "xp_value_craft", "create:copper_nugget",										{ "crafting": 0 } );
addData( "req_craft", "create:crafter_slot_cover",										{ "crafting": 10, "smithing": 5 } );
addData( "xp_value_craft", "create:crafter_slot_cover",									{ "crafting": 3 } );
addData( "info_smelt", "create:crushed_aluminum_ore",					{ "extraChance": 0.75} );
addData( "xp_value_smelt", "create:crushed_aluminum_ore",					{ "smithing": 10} );
addData( "xp_value_smelt", "create:crushed_brass_ore",									{ "smithing": 23.5 } );
addData( "info_smelt", "create:crushed_brass_ore",										{ "extraChance": 0.4 } );
addData( "xp_value_smelt", "create:crushed_copper_ore",									{ "smithing": 6.5 } );
addData( "info_smelt", "create:crushed_copper_ore",										{ "extraChance": 0.95 } );
addData( "xp_value_smelt", "create:crushed_gold_ore",									{ "smithing": 17 } );
addData( "info_smelt", "create:crushed_gold_ore",										{ "extraChance": 0.6 } );
addData( "xp_value_smelt", "create:crushed_iron_ore",									{ "smithing": 11 } );
addData( "info_smelt", "create:crushed_iron_ore",										{ "extraChance": 1.1 } );
addData( "info_smelt", "create:crushed_lead_ore",						{ "extraChance": 0.8} );
addData( "xp_value_smelt", "create:crushed_lead_ore",						{ "smithing": 16} );
addData( "info_smelt", "create:crushed_nickel_ore",						{ "extraChance": 0.4} );
addData( "xp_value_smelt", "create:crushed_nickel_ore",						{ "smithing": 26} );
addData( "info_smelt", "create:crushed_osmium_ore",						{ "extraChance": 0.8} );
addData( "xp_value_smelt", "create:crushed_osmium_ore",						{ "smithing": 10} );
addData( "info_smelt", "create:crushed_platinum_ore",					{ "extraChance": 0.4} );
addData( "xp_value_smelt", "create:crushed_platinum_ore",					{ "smithing": 26} );
addData( "info_smelt", "create:crushed_silver_ore",						{ "extraChance": 0.6} );
addData( "xp_value_smelt", "create:crushed_silver_ore",						{ "smithing": 16} );
addData( "info_smelt", "create:crushed_tin_ore",						{ "extraChance": 0.95} );
addData( "xp_value_smelt", "create:crushed_tin_ore",						{ "smithing": 11} );
addData( "info_smelt", "create:crushed_uranium_ore",					{ "extraChance": 0.35} );
addData( "xp_value_smelt", "create:crushed_uranium_ore",					{ "smithing": 18} );
addData( "xp_value_smelt", "create:crushed_zinc_ore",									{ "smithing": 15 } );
addData( "info_smelt", "create:crushed_zinc_ore",										{ "extraChance": 0.8 } );
addData( "req_craft", "create:cuckoo_clock",											{ "crafting": 20 } );
addData( "xp_value_craft", "create:cuckoo_clock",										{ "crafting": 16.7 } );
addData( "req_place", "create:cuckoo_clock",											{ "building": 10 } );
addData( "xp_value_break", "create:dark_scoria",										{ "mining": 0.4 } );
addData2( "treasure", "create:dark_scoria", "minecraft:iron_nugget",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 5,
	"minCount": 2,
	"maxCount": 2
} );
addData( "req_tool", "create:deforester",												{ "woodcutting": 92 } );
addData( "req_weapon", "create:deforester",												{ "combat": 75 } );
addData( "req_craft", "create:deforester",												{ "crafting": 30, "smithing": 30 } );
addData( "xp_value_craft", "create:deforester",											{ "crafting": 120 } );
addData( "req_craft", "create:deployer",												{ "crafting": 20 } );
addData( "xp_value_craft", "create:deployer",											{ "crafting": 20.3 } );
addData( "req_place", "create:deployer",												{ "building": 10 } );
addData( "xp_value_break", "create:dolomite",											{ "mining": 0.25 } );
addData2( "salvage", "create:dolomite", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 55,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData2( "treasure", "create:dolomite", "minecraft:iron_nugget",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 5,
	"minCount": 1,
	"maxCount": 3
} );
addData( "req_craft", "create:electron_tube",											{ "crafting": 10, "smithing": 5 } );
addData( "xp_value_craft", "create:electron_tube",										{ "crafting": 6 } );
addData( "req_craft", "create:empty_schematic",											{ "crafting": 5 } );
addData( "xp_value_craft", "create:empty_schematic",									{ "crafting": 6.2 } );
addData( "req_craft", "create:encased_belt",											{ "crafting": 20 } );
addData( "req_place", "create:encased_belt",											{ "building": 10 } );
addData( "req_craft", "create:encased_fan",												{ "crafting": 20 } );
addData( "xp_value_craft", "create:encased_fan",										{ "crafting": 6 } );
addData( "req_place", "create:encased_fan",												{ "building": 10 } );
addData( "req_craft", "create:encased_shaft",											{ "crafting": 20 } );
addData( "xp_value_craft", "create:encased_shaft",										{ "crafting": 5 } );
addData( "req_place", "create:encased_shaft",											{ "building": 10 } );
addData( "xp_bonus_worn", "create:extendo_grip",						{ "building": 10, "combat": 10, "mining": 10} );

addData( "req_craft", "create:extractor",												{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:extractor",											{ "crafting": 12.5 } );
addData( "req_place", "create:extractor",												{ "building": 10 } );
addData( "req_craft", "create:filter",													{ "crafting": 10, "smithing": 5 } );
addData( "xp_value_craft", "create:filter",												{ "crafting": 6.5 } );
addData( "req_craft", "create:funnel",													{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:funnel",												{ "crafting": 8.8 } );
addData( "req_place", "create:funnel",													{ "building": 10 } );
addData( "xp_value_break", "create:gabbro",												{ "mining": 0.35 } );
addData2( "salvage", "create:gabbro", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 40,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData2( "treasure", "create:gabbro", "minecraft:iron_nugget",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 5,
	"minCount": 1,
	"maxCount": 3
} );
addData( "req_craft", "create:gearbox",													{ "crafting": 20 } );
addData( "xp_value_craft", "create:gearbox",											{ "crafting": 5 } );
addData( "req_place", "create:gearbox",													{ "building": 10 } );
addData( "req_craft", "create:gearshift",												{ "crafting": 20 } );
addData( "xp_value_craft", "create:gearshift",											{ "crafting": 4 } );
addData( "req_place", "create:gearshift",												{ "building": 10 } );
addData( "req_wear", "create:goggles",													{ "crafting": 25 } );
addData( "req_craft", "create:goggles",													{ "crafting": 25, "smithing": 10 } );
addData( "xp_value_craft", "create:goggles",											{ "crafting": 10 } );
addData( "req_craft", "create:hand_crank",												{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:hand_crank",											{ "crafting": 2 } );
addData( "req_place", "create:hand_crank",												{ "building": 10 } );
addData( "req_craft", "create:handheld_blockzapper",									{ "crafting": 30, "smithing": 30 } );
addData( "xp_value_craft", "create:handheld_blockzapper",								{ "crafting": 120 } );
addData( "req_craft", "create:large_cogwheel",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:large_cogwheel",										{ "crafting": 6.2 } );
addData( "req_place", "create:large_cogwheel",											{ "building": 10 } );
addData( "xp_value_break", "create:limestone",											{ "mining": 0.3 } );
addData2( "salvage", "create:limestone", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 50,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData2( "treasure", "create:limestone", "minecraft:iron_nugget",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 5,
	"minCount": 1,
	"maxCount": 2
} );
addData( "req_craft", "create:linear_chassis",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:linear_chassis",										{ "crafting": 12.5 } );
addData( "req_place", "create:linear_chassis",											{ "building": 10 } );
addData( "req_craft", "create:linked_extractor",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:linked_extractor",									{ "crafting": 10 } );
addData( "req_place", "create:linked_extractor",										{ "building": 10 } );
addData( "req_craft", "create:linked_transposer",										{ "crafting": 20 } );
addData( "xp_value_craft", "create:linked_transposer",									{ "crafting": 10 } );
addData( "req_place", "create:linked_transposer",										{ "building": 10 } );
addData( "req_craft", "create:mechanical_bearing",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:mechanical_bearing",									{ "crafting": 6.4 } );
addData( "req_place", "create:mechanical_bearing",										{ "building": 10 } );
addData( "req_craft", "create:mechanical_crafter",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:mechanical_crafter",									{ "crafting": 20.3 } );
addData( "req_place", "create:mechanical_crafter",										{ "building": 10 } );
addData( "req_craft", "create:mechanical_drill",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:mechanical_drill",									{ "crafting": 20.3 } );
addData( "req_place", "create:mechanical_drill",										{ "building": 10 } );
addData( "req_craft", "create:mechanical_harvester",									{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:mechanical_harvester",								{ "crafting": 20.3 } );
addData( "req_place", "create:mechanical_harvester",									{ "building": 10 } );
addData( "req_craft", "create:mechanical_mixer",										{ "crafting": 20 } );
addData( "xp_value_craft", "create:mechanical_mixer",									{ "crafting": 20.3 } );
addData( "req_place", "create:mechanical_mixer",										{ "building": 10 } );
addData( "req_craft", "create:mechanical_piston",										{ "crafting": 20 } );
addData( "xp_value_craft", "create:mechanical_piston",									{ "crafting": 20.3 } );
addData( "req_place", "create:mechanical_piston",										{ "building": 10 } );
addData( "req_craft", "create:mechanical_plough",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:mechanical_plough",									{ "crafting": 20.3 } );
addData( "req_place", "create:mechanical_plough",										{ "building": 10 } );
addData( "req_craft", "create:mechanical_press",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:mechanical_press",									{ "crafting": 20.3 } );
addData( "req_place", "create:mechanical_press",										{ "building": 10 } );
addData( "req_craft", "create:mechanical_saw",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:mechanical_saw",										{ "crafting": 20.3 } );
addData( "req_place", "create:mechanical_saw",											{ "building": 10 } );
addData( "req_craft", "create:millstone",												{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:millstone",											{ "crafting": 8.8 } );
addData( "req_place", "create:millstone",												{ "building": 10 } );
addData( "xp_value_break", "create:natural_scoria",										{ "mining": 0.65 } );
addData2( "treasure", "create:natural_scoria", "minecraft:iron_nugget",
{
	"startChance": 0.1,
	"startLevel": 25,
	"endChance": 2,
	"endLevel": 200,
	"xpPerItem": 5,
	"minCount": 2,
	"maxCount": 4
} );
addData( "req_craft", "create:nozzle",													{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:nozzle",												{ "crafting": 4.7 } );
addData( "req_place", "create:nozzle",													{ "building": 10 } );
addData( "req_craft", "create:piston_extension_pole",									{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:piston_extension_pole",								{ "crafting": 3 } );
addData( "req_place", "create:piston_extension_pole",									{ "building": 10 } );
addData( "xp_value_break", "create:polished_dark_scoria",								{ "mining": 0.4 } );
addData( "xp_value_break", "create:polished_dolomite",									{ "mining": 0.25 } );
addData( "xp_value_break", "create:polished_gabbro",									{ "mining": 0.35 } );
addData( "xp_value_break", "create:polished_limestone",									{ "mining": 0.3 } );
addData( "xp_value_break", "create:polished_scoria",									{ "mining": 0.35 } );
addData( "xp_value_break", "create:polished_weathered_limestone",						{ "mining": 0.3 } );
addData( "req_craft", "create:portable_storage_interface",								{ "crafting": 20 } );
addData( "xp_value_craft", "create:portable_storage_interface",							{ "crafting": 12.5 } );
addData( "req_place", "create:portable_storage_interface",								{ "building": 10 } );
addData( "req_craft", "create:powered_latch",											{ "crafting": 20 } );
addData( "xp_value_craft", "create:powered_latch",										{ "crafting": 8.8 } );
addData( "req_place", "create:powered_latch",											{ "building": 10 } );
addData( "req_craft", "create:powered_toggle_latch",									{ "crafting": 20 } );
addData( "xp_value_craft", "create:powered_toggle_latch",								{ "crafting": 10.6 } );
addData( "req_place", "create:powered_toggle_latch",									{ "building": 10 } );
addData( "req_craft", "create:propeller",												{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:propeller",											{ "crafting": 7 } );
addData( "req_craft", "create:pulse_repeater",											{ "crafting": 20 } );
addData( "xp_value_craft", "create:pulse_repeater",										{ "crafting": 10 } );
addData( "req_place", "create:pulse_repeater",											{ "building": 10 } );
addData( "req_craft", "create:radial_chassis",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:radial_chassis",										{ "crafting": 8.8 } );
addData( "req_place", "create:radial_chassis",											{ "building": 10 } );
addData( "req_craft", "create:red_sand_paper",											{ "crafting": 5 } );
addData( "xp_value_craft", "create:red_sand_paper",										{ "crafting": 5 } );
addData( "req_use", "create:red_sand_paper",											{ "smithing": 5 } );
addData( "req_craft", "create:redstone_contact",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:redstone_contact",									{ "crafting": 10 } );
addData( "req_place", "create:redstone_contact",										{ "building": 10 } );
addData( "req_craft", "create:redstone_link",											{ "crafting": 30, "building": 20 } );
addData( "req_place", "create:redstone_link",											{ "building": 20 } );
addData( "req_use", "create:redstone_link",												{ "crafting": 30 } );
addData( "xp_value_craft", "create:redstone_link",										{ "crafting": 10 } );
addData( "req_craft", "create:rope_pulley",												{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:rope_pulley",										{ "crafting": 8.8 } );
addData( "req_place", "create:rope_pulley",												{ "building": 10 } );
addData( "req_craft", "create:rotation_speed_controller",								{ "crafting": 25 } );
addData( "xp_value_craft", "create:rotation_speed_controller",							{ "crafting": 20.3 } );
addData( "req_place", "create:rotation_speed_controller",								{ "building": 10 } );
addData( "req_craft", "create:sand_paper",												{ "crafting": 5 } );
addData( "xp_value_craft", "create:sand_paper",											{ "crafting": 5 } );
addData( "req_use", "create:sand_paper",												{ "smithing": 5 } );
addData( "req_craft", "create:schematic_and_quill",										{ "crafting": 5 } );
addData( "xp_value_craft", "create:schematic_and_quill",								{ "crafting": 8.5 } );
addData( "req_craft", "create:schematic_table",											{ "crafting": 20 } );
addData( "xp_value_craft", "create:schematic_table",									{ "crafting": 10.4 } );
addData( "req_place", "create:schematic_table",											{ "building": 10 } );
addData( "req_craft", "create:schematicannon",											{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:schematicannon",										{ "crafting": 50 } );
addData( "req_place", "create:schematicannon",											{ "building": 20 } );
addData( "xp_value_break", "create:scoria",												{ "mining": 0.35 } );
addData2( "treasure", "create:scoria", "minecraft:iron_nugget",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 5,
	"minCount": 1,
	"maxCount": 3
} );
addData( "req_craft", "create:secondary_linear_chassis",								{ "crafting": 20, "smithing": 10 } );
addData( "req_place", "create:secondary_linear_chassis",								{ "building": 10 } );
addData( "req_craft", "create:sequenced_gearshift",										{ "crafting": 20 } );
addData( "xp_value_craft", "create:sequenced_gearshift",								{ "crafting": 12.5 } );
addData( "req_place", "create:sequenced_gearshift",										{ "building": 10 } );
addData( "req_craft", "create:shaft",													{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:shaft",												{ "crafting": 3.25 } );
addData( "req_place", "create:shaft",													{ "building": 10 } );
addData( "req_craft", "create:speedometer",												{ "crafting": 20 } );
addData( "xp_value_craft", "create:speedometer",										{ "crafting": 4 } );
addData( "req_place", "create:speedometer",												{ "building": 10 } );
addData( "req_craft", "create:sticky_mechanical_piston",								{ "crafting": 20 } );
addData( "xp_value_craft", "create:sticky_mechanical_piston",							{ "crafting": 12.3 } );
addData( "req_place", "create:sticky_mechanical_piston",								{ "building": 10 } );
addData( "req_craft", "create:stockpile_switch",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:stockpile_switch",									{ "crafting": 10 } );
addData( "req_place", "create:stockpile_switch",										{ "building": 10 } );
addData( "req_craft", "create:stressometer",											{ "crafting": 20 } );
addData( "req_place", "create:stressometer",											{ "building": 10 } );
addData( "req_craft", "create:super_glue",												{ "crafting": 10 } );
addData( "xp_value_craft", "create:super_glue",											{ "crafting": 5 } );
addData( "req_use", "create:super_glue",												{ "building": 5 } );
addData( "req_craft", "create:transposer",												{ "crafting": 20 } );
addData( "xp_value_craft", "create:transposer",											{ "crafting": 10 } );
addData( "req_place", "create:transposer",												{ "building": 10 } );
addData( "req_craft", "create:tree_fertilizer",											{ "crafting": 10, "farming": 10 } );
addData( "xp_value_craft", "create:tree_fertilizer",									{ "crafting": 10.4 } );
addData( "req_use", "create:tree_fertilizer",											{ "farming": 10 } );
addData( "req_craft", "create:turntable",												{ "crafting": 20 } );
addData( "xp_value_craft", "create:turntable",											{ "crafting": 5.3 } );
addData( "req_place", "create:turntable",												{ "building": 10 } );
addData( "req_craft", "create:vertical_gearbox",										{ "crafting": 20 } );
addData( "req_place", "create:vertical_gearbox",										{ "building": 10 } );
addData( "req_craft", "create:wand_of_symmetry",										{ "crafting": 30, "smithing": 30 } );
addData( "xp_value_craft", "create:wand_of_symmetry",									{ "crafting": 100 } );
addData( "req_place", "create:wand_of_symmetry",										{ "building": 20 } );
addData( "req_craft", "create:water_wheel",												{ "crafting": 20 } );
addData( "xp_value_craft", "create:water_wheel",										{ "crafting": 14.5 } );
addData( "req_place", "create:water_wheel",												{ "building": 10 } );
addData( "xp_value_break", "create:weathered_limestone",								{ "mining": 0.3 } );
addData2( "salvage", "create:weathered_limestone", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 40,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData2( "treasure", "create:weathered_limestone", "minecraft:iron_nugget",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 5,
	"minCount": 1,
	"maxCount": 1
} );
addData( "req_craft", "create:whisk",													{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_craft", "create:whisk",												{ "crafting": 7 } );
addData( "req_use", "create:wrench",													{ "crafting": 15 } );
addData( "req_craft", "create:wrench",													{ "crafting": 10, "smithing": 10 } );
addData( "xp_value_craft", "create:wrench",												{ "crafting": 10 } );
addData( "xp_value_craft", "create:zinc_block",											{ "crafting": 0 } );
addData( "xp_value_craft", "create:zinc_ingot",											{ "crafting": 0 } );
addData( "xp_value_craft", "create:zinc_nugget",										{ "crafting": 0 } );
}
//CREATEPLUS
{
addData( "req_wear", "createplus:goggle_chainmail_helmet",				{ "endurance": 20, "crafting": 25} );

addData( "xp_bonus_worn", "createplus:goggle_chainmail_helmet",			{ "combat": 5} );

addData( "req_wear", "createplus:goggle_diamond_helmet",				{ "endurance": 40, "crafting": 25} );

addData( "xp_bonus_worn", "createplus:goggle_diamond_helmet",			{ "magic": 2.5} );

addData( "req_wear", "createplus:goggle_golden_helmet",					{ "endurance": 10, "crafting": 25} );

addData( "xp_bonus_worn", "createplus:goggle_golden_helmet",			{ "mining": 5, "endurance": 5} );

addData( "req_wear", "createplus:goggle_iron_helmet",					{ "endurance": 30, "crafting": 25} );

addData( "xp_bonus_worn", "createplus:goggle_iron_helmet",				{ "smithing": 5} );

addData( "req_wear", "createplus:goggle_leather_helmet",				{ "endurance": 5, "crafting": 25} );

addData( "xp_bonus_worn", "createplus:goggle_leather_helmet",			{ "woodcutting": 2.5, "agility": 2.5, "farming": 2.5, "fishing": 2.5} );

addData( "req_wear", "createplus:goggle_netherite_helmet",				{ "endurance": 60, "crafting": 25} );

addData( "req_wear", "createplus:goggle_turtle_helmet",					{ "swimming": 5, "endurance": 15, "crafting": 25} );

addData( "xp_bonus_worn", "createplus:goggle_turtle_helmet",			{ "swimming": 15, "fishing": 7.5} );

}
//CYCLIC
{
addData2( "salvage", "cyclic:netherbrick_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:netherbrick_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:netherbrick_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:netherbrick_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:netherbrick_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:sandstone_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:sandstone_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:sandstone_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:sandstone_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
addData2( "salvage", "cyclic:sandstone_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
});
}
//DOOMWEAPON.CONSUME.INMORTA
{
addData( "xp_value_trigger", "doomweapon.consume.inmortal",								{ "magic": 90 } );
}
//DOOMWEAPON.CONSUME.INVISIBL
{
addData( "xp_value_trigger", "doomweapon.consume.invisible",							{ "magic": 35 } );
}
//DOOMWEAPON.CONSUME.MEG
{
addData( "xp_value_trigger", "doomweapon.consume.mega",									{ "magic": 105 } );
}
//DOOMWEAPON.CONSUME.POWE
{
addData( "xp_value_trigger", "doomweapon.consume.power",								{ "magic": 60 } );
}
//DOOMWEAPON.CONSUME.SOU
{
addData( "xp_value_trigger", "doomweapon.consume.soul",									{ "magic": 50 } );
}
//DOOMWEAPON
{
addData( "req_tool", "doomweapon:argent_axe",											{ "woodcutting": 80 } );
addData( "req_tool", "doomweapon:argent_hoe",											{ "farming": 80 } );
addData( "req_tool", "doomweapon:argent_paxel",											{ "woodcutting": 80, "excavation": 80, "mining": 80 } );
addData( "req_tool", "doomweapon:argent_pickaxe",										{ "mining": 80 } );
addData( "req_tool", "doomweapon:argent_shovel",										{ "excavation": 80 } );
addData( "req_weapon", "doomweapon:argent_sword",										{ "combat": 90, "endurance": 90, "agility": 90 } );
addData( "req_wear", "doomweapon:astro_doom_boots",										{ "endurance":  80, "combat":  70, "agility": 60 } );
addData( "req_wear", "doomweapon:astro_doom_chestplate",								{ "endurance":  80, "combat":  70, "agility": 60 } );
addData( "req_wear", "doomweapon:astro_doom_helmet",									{ "endurance":  80, "combat":  70, "agility": 60 } );
addData( "req_wear", "doomweapon:astro_doom_leggings",									{ "endurance":  80, "combat":  70, "agility": 60 } );
addData( "req_weapon", "doomweapon:axe_marauder_closed",								{ "combat": 80, "endurance": 80, "agility": 90 } );
addData( "req_weapon", "doomweapon:axe_marauder_open",									{ "combat": 80, "endurance": 80, "agility": 90 } );
addData( "req_weapon", "doomweapon:ballista",											{ "combat": 80, "archery": 80, "endurance": 80 } );
addData( "req_weapon", "doomweapon:bfg9000",											{ "combat": 120, "archery": 99, "endurance": 99 } );
addData( "req_weapon", "doomweapon:chaingun",											{ "combat": 80, "archery": 80, "endurance": 80 } );
addData( "req_weapon", "doomweapon:chainsaw",											{ "combat": 90, "endurance": 90, "agility": 90 } );
addData( "req_wear", "doomweapon:classic_black_chestplate",								{ "endurance": 83, "combat": 73, "agility": 70 } );
addData( "req_wear", "doomweapon:classic_bronze_chestplate",							{ "endurance": 83, "combat": 73, "agility": 70 } );
addData( "req_wear", "doomweapon:classic_bronze_leggings",								{ "endurance": 83, "combat": 73, "agility": 70 } );
addData( "req_wear", "doomweapon:classic_doom_boots",									{ "endurance": 83, "combat": 70, "agility": 70 } );
addData( "req_wear", "doomweapon:classic_doom_chestplate",								{ "endurance": 83, "combat": 70, "agility": 70 } );
addData( "req_wear", "doomweapon:classic_doom_helmet",									{ "endurance": 83, "combat": 70, "agility": 70 } );
addData( "req_wear", "doomweapon:classic_doom_leggings",								{ "endurance": 83, "combat": 70, "agility": 70 } );
addData( "req_wear", "doomweapon:classic_red_chestplate",								{ "endurance": 83, "combat": 70, "agility": 70 } );
addData( "req_wear", "doomweapon:classic_red_leggings",									{ "endurance": 83, "combat": 73, "agility": 70 } );
addData( "req_wear", "doomweapon:crimson_doom_boots",									{ "endurance": 84, "combat": 74, "agility": 70 } );
addData( "req_wear", "doomweapon:crimson_doom_chestplate",								{ "endurance": 84, "combat": 74, "agility": 70 } );
addData( "req_wear", "doomweapon:crimson_doom_helmet",									{ "endurance": 84, "combat": 74, "agility": 70 } );
addData( "req_wear", "doomweapon:crimson_doom_leggings",								{ "endurance": 84, "combat": 74, "agility": 70 } );
addData( "req_weapon", "doomweapon:cruciblesword",										{ "combat": 80, "endurance": 80, "agility": 90 } );
addData( "req_weapon", "doomweapon:cruciblesword_closed",								{ "combat": 80, "endurance": 80, "agility": 90 } );
addData( "req_wear", "doomweapon:cultist_doom_boots",									{ "endurance": 85, "combat": 75, "agility": 70 } );
addData( "req_wear", "doomweapon:cultist_doom_chestplate",								{ "endurance": 85, "combat": 75, "agility": 70 } );
addData( "req_wear", "doomweapon:cultist_doom_helmet",									{ "endurance": 84, "combat": 74, "agility": 70 } );
addData( "req_wear", "doomweapon:cultist_doom_leggings",								{ "endurance": 85, "combat": 75, "agility": 70 } );
addData( "req_wear", "doomweapon:demonic_doom_boots",									{ "endurance": 86, "combat": 76, "agility": 70 } );
addData( "req_wear", "doomweapon:demonic_doom_chestplate",								{ "endurance": 86, "combat": 76, "agility": 70 } );
addData( "req_wear", "doomweapon:demonic_doom_helmet",									{ "endurance": 86, "combat": 76, "agility": 70 } );
addData( "req_wear", "doomweapon:demonic_doom_leggings",								{ "endurance": 86, "combat": 76, "agility": 70 } );
addData( "req_wear", "doomweapon:doomicorn_doom_boots",									{ "endurance": 87, "combat": 77, "agility": 70 } );
addData( "req_wear", "doomweapon:doomicorn_doom_chestplate",							{ "endurance": 87, "combat": 77, "agility": 70 } );
addData( "req_wear", "doomweapon:doomicorn_doom_helmet",								{ "endurance": 87, "combat": 77, "agility": 70 } );
addData( "req_wear", "doomweapon:doomicorn_doom_leggings",								{ "endurance": 87, "combat": 77, "agility": 70 } );
addData( "req_wear", "doomweapon:ember_doom_boots",										{ "endurance": 88, "combat": 78, "agility": 70 } );
addData( "req_wear", "doomweapon:ember_doom_chestplate",								{ "endurance": 88, "combat": 78, "agility": 70 } );
addData( "req_wear", "doomweapon:ember_doom_helmet",									{ "endurance": 88, "combat": 78, "agility": 70 } );
addData( "req_wear", "doomweapon:ember_doom_leggings",									{ "endurance": 88, "combat": 78, "agility": 70 } );
addData( "req_wear", "doomweapon:gold_doom_boots",										{ "endurance": 89, "combat": 79, "agility": 70 } );
addData( "req_wear", "doomweapon:gold_doom_chestplate",									{ "endurance": 89, "combat": 79, "agility": 70 } );
addData( "req_wear", "doomweapon:gold_doom_helmet",										{ "endurance": 89, "combat": 79, "agility": 70 } );
addData( "req_wear", "doomweapon:gold_doom_leggings",									{ "endurance": 89, "combat": 79, "agility": 70 } );
addData( "req_wear", "doomweapon:maykr_doom_boots",										{ "endurance": 90, "combat": 80, "agility": 80 } );
addData( "req_wear", "doomweapon:maykr_doom_chestplate",								{ "endurance": 90, "combat": 80, "agility": 80 } );
addData( "req_wear", "doomweapon:maykr_doom_helmet",									{ "endurance": 90, "combat": 80, "agility": 80 } );
addData( "req_wear", "doomweapon:maykr_doom_leggings",									{ "endurance": 90, "combat": 80, "agility": 80 } );
addData( "req_wear", "doomweapon:midnight_doom_boots",									{ "endurance": 91, "combat": 81, "agility": 80 } );
addData( "req_wear", "doomweapon:midnight_doom_chestplate",								{ "endurance": 91, "combat": 81, "agility": 80 } );
addData( "req_wear", "doomweapon:midnight_doom_helmet",									{ "endurance": 91, "combat": 81, "agility": 80 } );
addData( "req_wear", "doomweapon:midnight_doom_leggings",								{ "endurance": 91, "combat": 81, "agility": 80 } );
addData( "req_wear", "doomweapon:nightmare_doom_boots",									{ "endurance": 93, "combat": 83, "agility": 80 } );
addData( "req_wear", "doomweapon:nightmare_doom_chestplate",							{ "endurance": 93, "combat": 83, "agility": 80 } );
addData( "req_wear", "doomweapon:nightmare_doom_helmet",								{ "endurance": 93, "combat": 83, "agility": 80 } );
addData( "req_wear", "doomweapon:nightmare_doom_leggings",								{ "endurance": 93, "combat": 83, "agility": 80 } );
addData( "req_wear", "doomweapon:painter_doom_boots",									{ "endurance": 94, "combat": 84, "agility": 80 } );
addData( "req_wear", "doomweapon:painter_doom_chestplate",								{ "endurance": 94, "combat": 84, "agility": 80 } );
addData( "req_wear", "doomweapon:painter_doom_helmet",									{ "endurance": 94, "combat": 84, "agility": 80 } );
addData( "req_wear", "doomweapon:painter_doom_leggings",								{ "endurance": 94, "combat": 84, "agility": 80 } );
addData( "req_wear", "doomweapon:phobos_doom_boots",									{ "endurance": 95, "combat": 85, "agility": 80 } );
addData( "req_wear", "doomweapon:phobos_doom_chestplate",								{ "endurance": 95, "combat": 85, "agility": 80 } );
addData( "req_wear", "doomweapon:phobos_doom_helmet",									{ "endurance": 95, "combat": 85, "agility": 80 } );
addData( "req_wear", "doomweapon:phobos_doom_leggings",									{ "endurance": 95, "combat": 85, "agility": 80 } );
addData( "req_weapon", "doomweapon:pistol",												{ "combat": 90, "archery": 90, "endurance": 90 } );
addData( "req_weapon", "doomweapon:plasmagun",											{ "combat": 90, "archery": 90, "endurance": 80 } );
addData( "req_wear", "doomweapon:praetor_doom_boots",									{ "endurance": 96, "combat": 86, "agility": 80 } );
addData( "req_wear", "doomweapon:praetor_doom_chestplate",								{ "endurance": 96, "combat": 86, "agility": 80 } );
addData( "req_wear", "doomweapon:praetor_doom_helmet",									{ "endurance": 96, "combat": 86, "agility": 80 } );
addData( "req_wear", "doomweapon:praetor_doom_leggings",								{ "endurance": 96, "combat": 86, "agility": 80 } );
addData( "req_wear", "doomweapon:purplepony_doom_boots",								{ "endurance": 97, "combat": 87, "agility": 80 } );
addData( "req_wear", "doomweapon:purplepony_doom_chestplate",							{ "endurance": 97, "combat": 87, "agility": 80 } );
addData( "req_wear", "doomweapon:purplepony_doom_helmet",								{ "endurance": 97, "combat": 87, "agility": 80 } );
addData( "req_wear", "doomweapon:purplepony_doom_leggings",								{ "endurance": 97, "combat": 87, "agility": 80 } );
addData( "req_wear", "doomweapon:redneck_doom_boots",									{ "endurance": 92, "combat": 82, "agility": 80 } );
addData( "req_wear", "doomweapon:redneck_doom_leggings",								{ "endurance": 92, "combat": 82, "agility": 80 } );
addData( "req_weapon", "doomweapon:rocketlauncher",										{ "combat": 80, "archery": 80, "endurance": 80 } );
addData( "req_wear", "doomweapon:sentinel_doom_boots",									{ "endurance": 98, "combat": 88, "agility": 80 } );
addData( "req_wear", "doomweapon:sentinel_doom_chestplate",								{ "endurance": 98, "combat": 88, "agility": 80 } );
addData( "req_wear", "doomweapon:sentinel_doom_helmet",									{ "endurance": 98, "combat": 88, "agility": 80 } );
addData( "req_wear", "doomweapon:sentinel_doom_leggings",								{ "endurance": 98, "combat": 88, "agility": 80 } );
addData( "req_weapon", "doomweapon:shotgun",											{ "combat": 90, "archery": 90 } );
addData( "req_weapon", "doomweapon:supershotgun",										{ "combat": 80, "archery": 80 } );
addData( "req_wear", "doomweapon:zombie_doom_boots",									{ "endurance":  99, "combat": 89, "agility": 90 } );
addData( "req_wear", "doomweapon:zombie_doom_chestplate",								{ "endurance":  99, "combat": 89, "agility": 90 } );
addData( "req_wear", "doomweapon:zombie_doom_helmet",									{ "endurance":  99, "combat": 89, "agility": 90 } );
addData( "req_wear", "doomweapon:zombie_doom_leggings",									{ "endurance":  99, "combat": 89, "agility": 90 } );
}
//DRUIDCRAFT
{
addData( "info_ore", "druidcraft:amber_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "druidcraft:amber_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "druidcraft:amber_ore",							{ "mining": 22, "magic": 12} );
addData( "xp_value_smelt", "druidcraft:amber_ore",							{ "smithing": 12, "magic": 2} );
addData( "info_ore", "druidcraft:fiery_glass_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "druidcraft:fiery_glass_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "druidcraft:fiery_glass_ore",					{ "mining": 22, "magic": 12} );
addData( "xp_value_smelt", "druidcraft:fiery_glass_ore",					{ "smithing": 12, "magic": 2} );
addData( "info_ore", "druidcraft:moonstone_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "druidcraft:moonstone_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "druidcraft:moonstone_ore",						{ "mining": 22, "magic": 12} );
addData( "xp_value_smelt", "druidcraft:moonstone_ore",						{ "smithing": 12, "magic": 2} );
addData( "info_ore", "druidcraft:rockroot_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "druidcraft:rockroot_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "druidcraft:rockroot_ore",						{ "mining": 22, "magic": 12} );
addData( "xp_value_smelt", "druidcraft:rockroot_ore",						{ "smithing": 12, "magic": 2} );
}
//DUNGEONS_GEAR
{
addData( "fish_enchant_pool", "dungeons_gear:accelerate",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:altruistic",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:ancient_bow",						{ "archery": 25} );
addData( "item_specific", "dungeons_gear:ancient_bow",					{ "archeryWeapon": 1} );
addData( "fish_enchant_pool", "dungeons_gear:anima_conduit",							{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_wear", "dungeons_gear:archers_hood",										{ "endurance": 20 } );
addData( "req_wear", "dungeons_gear:archers_vest",										{ "endurance": 20 } );
addData( "req_weapon", "dungeons_gear:auto_crossbow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:auto_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:azure_seeker",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:azure_seeker",					{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:baby_crossbow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:baby_crossbow",				{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:battle_robe",										{ "endurance": 20 } );
addData( "req_weapon", "dungeons_gear:battlestaff",										{ "combat": 10 } );
addData( "req_weapon", "dungeons_gear:battlestaff_of_terror",							{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:betterfly_crossbow",								{ "archery": 25 } );
addData( "req_weapon", "dungeons_gear:bonebow",											{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:bonebow",						{ "archeryWeapon": 1} );
addData( "fish_enchant_pool", "dungeons_gear:bonus_shot",								{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "item_specific", "dungeons_gear:bow_of_lost_souls",			{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:bow_of_lost_souls",								{ "archery": 25 } );
addData( "req_weapon", "dungeons_gear:broadsword",										{ "combat": 20 } );
addData( "fish_enchant_pool", "dungeons_gear:burning",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:burst_crossbow",					{ "archery": 30} );
addData( "item_specific", "dungeons_gear:burst_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:butterfly_crossbow",				{ "archery": 25} );
addData( "item_specific", "dungeons_gear:butterfly_crossbow",			{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:cave_crawler_chestplate",							{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:cave_crawler_chestplate",						{ "slayer": 5 } );
addData( "req_wear", "dungeons_gear:cave_crawler_helmet",								{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:cave_crawler_helmet",							{ "slayer": 5 } );
addData( "fish_enchant_pool", "dungeons_gear:chain_reaction",							{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:chains",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_wear", "dungeons_gear:champions_chestplate",								{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:champions_helmet",									{ "endurance": 30 } );
addData( "fish_enchant_pool", "dungeons_gear:chilling",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:claymore",										{ "combat": 20 } );
addData( "fish_enchant_pool", "dungeons_gear:committed",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:cooldown",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:corrupted_crossbow",				{ "archery": 30} );
addData( "item_specific", "dungeons_gear:corrupted_crossbow",			{ "archeryWeapon": 1} );
addData( "fish_enchant_pool", "dungeons_gear:cowardice",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:critical_hit",								{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_wear", "dungeons_gear:curious_chestplate",								{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:curious_helmet",									{ "endurance": 30 } );
addData( "req_weapon", "dungeons_gear:cursed_axe",										{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:cutless",											{ "combat": 10 } );
addData( "req_weapon", "dungeons_gear:dagger",											{ "combat": 5 } );
addData( "req_weapon", "dungeons_gear:dancers_sword",									{ "combat": 35 } );
addData( "req_wear", "dungeons_gear:dark_chestplate",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:dark_chestplate",								{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:dark_helmet",										{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:dark_helmet",									{ "slayer": 10 } );
addData( "req_weapon", "dungeons_gear:dark_katana",										{ "combat": 35 } );
addData( "fish_enchant_pool", "dungeons_gear:deflect",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:doom_crossbow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:doom_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:double_axe",										{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:dual_crossbow",									{ "archery": 15 } );
addData( "item_specific", "dungeons_gear:dual_crossbow",				{ "archeryWeapon": 1} );
addData( "fish_enchant_pool", "dungeons_gear:echo",										{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:electrified",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:elite_power_bow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:elite_power_bow",				{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:ember_hat",											{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:ember_robe",										{ "endurance": 30 } );
addData( "fish_enchant_pool", "dungeons_gear:enigma_resonator",							{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:eternal_knife",									{ "combat": 35 } );
addData( "xp_bonus_held", "dungeons_gear:eternal_knife",								{ "hunter": 40 } );
addData( "req_wear", "dungeons_gear:evocation_hat",										{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:evocation_robe",									{ "endurance": 30 } );
addData( "fish_enchant_pool", "dungeons_gear:exploding",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:exploding_crossbow",								{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:exploding_crossbow",			{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:fang_of_frost",									{ "combat": 20 } );
addData( "req_weapon", "dungeons_gear:feral_soul_crossbow",								{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:feral_soul_crossbow",			{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:fighters_binding",								{ "combat": 15 } );
addData( "fish_enchant_pool", "dungeons_gear:final_shout",								{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:fire_trail",								{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:firebolt_thrower",								{ "archery": 35 } );
addData( "item_specific", "dungeons_gear:firebolt_thrower",				{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:firebrand",										{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:flail",											{ "combat": 35 } );
addData( "fish_enchant_pool", "dungeons_gear:food_reserves",							{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:fortune_spear",									{ "combat": 25 } );
addData( "req_wear", "dungeons_gear:fox_hood",											{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:fox_vest",											{ "endurance": 40 } );
addData( "fish_enchant_pool", "dungeons_gear:freezing",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:frenzied",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_wear", "dungeons_gear:frost_bite_chestplate",								{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:frost_bite_chestplate",						{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:frost_bite_helmet",									{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:frost_bite_helmet",							{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:frost_chestplate",									{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:frost_helmet",										{ "endurance": 40 } );
addData( "req_weapon", "dungeons_gear:frost_scythe",									{ "combat": 35 } );
addData( "xp_bonus_held", "dungeons_gear:frost_scythe",									{ "magic": 20 } );
addData( "req_wear", "dungeons_gear:full_metal_chestplate",								{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:full_metal_helmet",									{ "endurance": 40 } );
addData( "fish_enchant_pool", "dungeons_gear:fuse_shot",								{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:gauntlet",										{ "combat": 10 } );
addData( "req_weapon", "dungeons_gear:glaive",											{ "combat": 15 } );
addData( "req_weapon", "dungeons_gear:glaive_bane",										{ "combat": 35 } );
addData( "fish_enchant_pool", "dungeons_gear:gravity",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:gravity_pulse",							{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:great_hammer",									{ "combat": 15 } );
addData( "req_wear", "dungeons_gear:grim_chestplate",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:grim_chestplate",								{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:grim_helmet",										{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:grim_helmet",									{ "slayer": 10 } );
addData( "fish_enchant_pool", "dungeons_gear:growing",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:growing_staff",									{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:guardian_bow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:guardian_bow",					{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:guards_chestplate",									{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:guards_helmet",										{ "endurance": 30 } );
addData( "req_weapon", "dungeons_gear:hammer_of_gravity",								{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:harp_crossbow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:harp_crossbow",				{ "archeryWeapon": 1} );
addData( "xp_bonus_held", "dungeons_gear:harvester",									{ "hunter": 10, "magic": 10 } );
addData( "req_weapon", "dungeons_gear:haunted_bow",						{ "archery": 25} );
addData( "item_specific", "dungeons_gear:haunted_bow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:hawkbrand",										{ "combat": 25 } );
addData( "fish_enchant_pool", "dungeons_gear:health_synergy",							{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:heartstealer",									{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:heavy_crossbow",									{ "archery": 15 } );
addData( "item_specific", "dungeons_gear:heavy_crossbow",				{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:heroes_chestplate",									{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:heroes_helmet",										{ "endurance": 40 } );
addData( "req_weapon", "dungeons_gear:highland_axe",									{ "combat": 35 } );
addData( "req_wear", "dungeons_gear:highland_chestplate",								{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:highland_helmet",									{ "endurance": 40 } );
addData( "req_weapon", "dungeons_gear:hunter_bow",										{ "archery": 10 } );
addData( "req_weapon", "dungeons_gear:hunters_promise",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:hunters_promise",				{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:hunters_vest",										{ "endurance": 10 } );
addData( "req_weapon", "dungeons_gear:hunting_bow",						{ "archery": 10} );
addData( "item_specific", "dungeons_gear:hunting_bow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:imploding_crossbow",				{ "archery": 30} );
addData( "item_specific", "dungeons_gear:imploding_crossbow",			{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:jailors_scythe",									{ "combat": 35 } );
addData( "xp_bonus_held", "dungeons_gear:jailors_scythe",								{ "hunter": 20 } );
addData( "req_weapon", "dungeons_gear:katana",											{ "combat": 15 } );
addData( "fish_enchant_pool", "dungeons_gear:leeching",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "item_specific", "dungeons_gear:lighting_harp_crossbow",		{ "archeryWeapon": 1} );
addData( "item_specific", "dungeons_gear:lightning_harp_crossbow",		{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:lightning_harp_crossbow",							{ "archery": 35 } );
addData( "xp_bonus_held", "dungeons_gear:lightning_rod",								{ "hunter": 10 } );
addData( "req_weapon", "dungeons_gear:longbow",											{ "archery": 10 } );
addData( "item_specific", "dungeons_gear:longbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:love_spell_bow",					{ "archery": 15, "magic": 5} );
addData( "item_specific", "dungeons_gear:love_spell_bow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:mace",											{ "combat": 15 } );
addData( "req_weapon", "dungeons_gear:master_bow",										{ "archery": 25 } );
addData( "req_weapon", "dungeons_gear:masters_bow",										{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:masters_bow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:masters_katana",									{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:mauler",											{ "combat": 25 } );
addData( "item_specific", "dungeons_gear:mechanical_shorbow",			{ "archeryWeapon": 1} );
addData( "item_specific", "dungeons_gear:mechanical_shortbow",			{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:mechanical_shortbow",								{ "archery": 25 } );
addData( "req_wear", "dungeons_gear:mercenary_chestplate",								{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:mercenary_helmet",									{ "endurance": 30 } );
addData( "req_weapon", "dungeons_gear:moon_dagger",										{ "combat": 25 } );
addData( "req_weapon", "dungeons_gear:nameless_blade",									{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:nightmares_bite",									{ "combat": 25 } );
addData( "req_weapon", "dungeons_gear:nocturnal_bow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:nocturnal_bow",				{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:ocelot_hood",										{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:ocelot_vest",										{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:phantom_chestplate",								{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:phantom_chestplate",							{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:phantom_helmet",									{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:phantom_helmet",								{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:plate_chestplate",									{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:plate_helmet",										{ "endurance": 40 } );
addData( "fish_enchant_pool", "dungeons_gear:poison_cloud",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:potion_barrier",							{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:power_bow",										{ "archery": 15 } );
addData( "item_specific", "dungeons_gear:power_bow",					{ "archeryWeapon": 1} );
addData( "fish_enchant_pool", "dungeons_gear:prospector",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:purple_storm",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:purple_storm",					{ "archeryWeapon": 1} );
addData( "fish_enchant_pool", "dungeons_gear:radiance",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:radiance_shot",							{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:rampaging",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:rapid_crossbow",									{ "archery": 15 } );
addData( "item_specific", "dungeons_gear:rapid_crossbow",				{ "archeryWeapon": 1} );
addData( "fish_enchant_pool", "dungeons_gear:recycler",									{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:red_snake",										{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:red_snake",					{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:reinforced_mail_chestplate",						{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:reinforced_mail_helmet",							{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:renegade_chestplate",								{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:renegade_helmet",									{ "endurance": 40 } );
addData( "fish_enchant_pool", "dungeons_gear:replenish",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:ricochet",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_wear", "dungeons_gear:royal_guard_chestplate",							{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:royal_guard_chestplate",						{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:royal_guard_helmet",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:royal_guard_helmet", {"slayer": 10}, );
addData( "item_specific", "dungeons_gear:saberwing",					{ "archeryWeapon": 1} );
addData( "item_specific", "dungeons_gear:sabrewing",					{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:sabrewing",										{ "archery": 25 } );
addData( "req_wear", "dungeons_gear:scale_mail_chestplate",								{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:scale_mail_helmet",									{ "endurance": 30 } );
addData( "req_weapon", "dungeons_gear:scatter_crossbow",								{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:scatter_crossbow",				{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:shadow_walker_hood",								{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:shadow_walker_vest",								{ "endurance": 30 } );
addData( "fish_enchant_pool", "dungeons_gear:shockwave",								{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:shortbow",										{ "archery": 10 } );
addData( "item_specific", "dungeons_gear:shortbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:sickle",											{ "combat": 10 } );
addData( "req_weapon", "dungeons_gear:slayer_crossbow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:slayer_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:snow_bow",										{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:snow_bow",						{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:snow_chestplate",									{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:snow_helmet",										{ "endurance": 30 } );
addData( "fish_enchant_pool", "dungeons_gear:snowball",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:soul_bow",						{ "archery": 10} );
addData( "item_specific", "dungeons_gear:soul_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:soul_crossbow",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:soul_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:soul_fist",										{ "combat": 25 } );
addData( "xp_bonus_held", "dungeons_gear:soul_fist",									{ "agility": 20 } );
addData( "xp_bonus_held", "dungeons_gear:soul_healer",									{ "magic": 10, "hunter": 10 } );
addData( "req_wear", "dungeons_gear:soul_hood",											{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:soul_hood",									{ "endurance": 5, "slayer": 10, "magic": 5 } );
addData( "req_weapon", "dungeons_gear:soul_hunter_crossbow",			{ "archery": 30} );
addData( "item_specific", "dungeons_gear:soul_hunter_crossbow",			{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:soul_knife",										{ "combat": 35 } );
addData( "xp_bonus_held", "dungeons_gear:soul_knife",									{ "hunter": 20 } );
addData( "req_wear", "dungeons_gear:soul_robe",											{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:soul_robe",									{ "endurance": 5, "slayer": 10, "magic": 5 } );
addData( "req_weapon", "dungeons_gear:soul_scythe",										{ "combat": 35 } );
addData( "xp_bonus_held", "dungeons_gear:soul_scythe",									{ "hunter": 10 } );
addData( "fish_enchant_pool", "dungeons_gear:soul_siphon",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_wear", "dungeons_gear:souldancer_hood",									{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:souldancer_hood",								{ "endurance": 10, "slayer": 10, "magic": 5 } );
addData( "req_wear", "dungeons_gear:souldancer_robe",									{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:souldancer_robe",								{ "endurance": 10, "slayer": 10, "magic": 5 } );
addData( "req_weapon", "dungeons_gear:spear",											{ "combat": 15 } );
addData( "fish_enchant_pool", "dungeons_gear:speed_synergy",							{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_wear", "dungeons_gear:spelunker_chestplate",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:spelunker_chestplate",							{ "slayer": 5, "mining": 5 } );
addData( "req_wear", "dungeons_gear:spelunker_helmet",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:spelunker_helmet",								{ "slayer": 5, "mining": 5 } );
addData( "req_wear", "dungeons_gear:spider_hood",										{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:spider_vest",										{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:splendid_robe",										{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:stalwart_chestplate",								{ "endurance": 40 } );
addData( "req_wear", "dungeons_gear:stalwart_helmet",									{ "endurance": 40 } );
addData( "req_weapon", "dungeons_gear:stormlander",										{ "combat": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:stunning",									{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:suns_grace",										{ "combat": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:supercharge",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:surprise_gift",							{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:swiftfooted",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:swirling",									{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "fish_enchant_pool", "dungeons_gear:tempo_theft",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:the_green_menace",								{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:the_green_menace",				{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:the_last_laugh",									{ "combat": 25 } );
addData( "req_weapon", "dungeons_gear:the_pink_scoundrel",								{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:the_pink_scoundrel",			{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:the_slicer",										{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:the_slicer",					{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:thief_hood",										{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:thief_vest",										{ "endurance": 30 } );
addData( "fish_enchant_pool", "dungeons_gear:thundering",								{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_wear", "dungeons_gear:titans_shroud_chestplate",							{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:titans_shroud_chestplate",						{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:titans_shroud_helmet",								{ "endurance": 40 } );
addData( "xp_bonus_worn", "dungeons_gear:titans_shroud_helmet",							{ "slayer": 10 } );
addData( "req_weapon", "dungeons_gear:trickbow",										{ "archery": 15 } );
addData( "item_specific", "dungeons_gear:trickbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:truthseeker",										{ "combat": 35 } );
addData( "xp_bonus_held", "dungeons_gear:truthseeker",									{ "hunter": 20 } );
addData( "req_weapon", "dungeons_gear:twin_bow",										{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:twin_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "dungeons_gear:venom_glaive",									{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:vine_whip",										{ "combat": 35 } );
addData( "req_weapon", "dungeons_gear:voidcaller",										{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:voidcaller",					{ "archeryWeapon": 1} );
addData( "fish_enchant_pool", "dungeons_gear:weakening",								{ "levelReq": 25, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:whip",											{ "combat": 15 } );
addData( "req_weapon", "dungeons_gear:whirlwind",										{ "combat": 55 } );
addData( "fish_enchant_pool", "dungeons_gear:wild_rage",								{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_weapon", "dungeons_gear:winters_touch",									{ "archery": 25 } );
addData( "item_specific", "dungeons_gear:winters_touch",				{ "archeryWeapon": 1} );
addData( "req_wear", "dungeons_gear:wither_chestplate",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:wither_chestplate",							{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:wither_helmet",										{ "endurance": 30 } );
addData( "xp_bonus_worn", "dungeons_gear:wither_helmet",								{ "slayer": 10 } );
addData( "req_wear", "dungeons_gear:wolf_hood",											{ "endurance": 30 } );
addData( "req_wear", "dungeons_gear:wolf_vest",											{ "endurance": 30 } );
}
//EIDOLON
{
addData( "info_smelt", "eidolon:pewter_blend",							{ "extraChance": 0.5} );
addData( "xp_value_smelt", "eidolon:pewter_blend",							{ "smithing": 12, "magic": 2} );
}
//ELEMENTALCRAFT
{
addData( "info_ore", "elementalcraft:crystalore",					{ "extraChance": 0.5} );
addData( "info_smelt", "elementalcraft:crystalore",						{ "extraChance": 1} );
addData( "xp_value_break", "elementalcraft:crystalore",						{ "mining": 16, "magic": 8} );
addData( "xp_value_smelt", "elementalcraft:crystalore",						{ "smithing": 12} );
addData( "info_smelt", "elementalcraft:pure_ore",						{ "extraChance": 1} );
addData( "xp_value_smelt", "elementalcraft:pure_ore",						{ "smithing": 12} );
}
//ENDERSTORAGE
{
addData( "req_craft", "enderstorage:ender_chest",										{ "smithing": 40 } );
addData( "req_place", "enderstorage:ender_chest",										{ "building": 30 } );
addData( "req_use", "enderstorage:ender_chest",											{ "building": 30 } );
addData( "xp_value_craft", "enderstorage:ender_chest",									{ "smithing": 80, "magic": 10 } );
addData( "req_craft", "enderstorage:ender_pouch",										{ "crafting": 50 } );
addData( "req_use", "enderstorage:ender_pouch",											{ "magic": 5 } );
addData( "xp_value_craft", "enderstorage:ender_pouch",									{ "crafting": 90, "magic": 15 } );
addData( "req_craft", "enderstorage:ender_tank",										{ "smithing": 50 } );
addData( "req_place", "enderstorage:ender_tank",										{ "building": 40 } );
addData( "req_use", "enderstorage:ender_tank",											{ "building": 40 } );
addData( "xp_value_craft", "enderstorage:ender_tank",									{ "smithing": 40, "magic": 5 } );
}
//ENDREBORN
{
addData( "req_weapon", "endreborn:end_stone_axe",										{ "combat": 20 } );
addData( "req_tool", "endreborn:end_stone_axe",											{ "woodcutting": 20 } );
addData( "xp_value_craft", "endreborn:end_stone_axe",									{ "crafting": 15, "smithing": 3 } );
addData( "req_tool", "endreborn:end_stone_hoe",											{ "farming": 20 } );
addData( "xp_value_craft", "endreborn:end_stone_hoe",									{ "crafting": 10, "smithing": 2 } );
addData( "xp_bonus_held", "endreborn:end_stone_hoe",									{ "farming": 5 } );
addData( "req_weapon", "endreborn:end_stone_pickaxe",									{ "combat": 20 } );
addData( "req_tool", "endreborn:end_stone_pickaxe",										{ "mining": 20 } );
addData( "xp_value_craft", "endreborn:end_stone_pickaxe",								{ "crafting": 15, "smithing": 3 } );
addData( "req_weapon", "endreborn:end_stone_shovel",									{ "combat": 20 } );
addData( "req_tool", "endreborn:end_stone_shovel",										{ "excavation": 20 } );
addData( "xp_value_craft", "endreborn:end_stone_shovel",								{ "crafting": 5, "smithing": 1 } );
addData( "req_weapon", "endreborn:end_stone_sword",										{ "combat": 20 } );
addData( "xp_value_craft", "endreborn:end_stone_sword",									{ "crafting": 10, "smithing": 2 } );
addData( "xp_value_smelt", "endreborn:end_wolframium_ore",								{ "smithing": 14 } );
addData( "info_smelt", "endreborn:end_wolframium_ore",									{ "extraChance": 1.2 } );
addData( "xp_value_break", "endreborn:end_wolframium_ore",								{ "mining": 14 } );
addData( "info_ore", "endreborn:end_wolframium_ore",									{ "extraChance": 1.2 } );
addData( "req_wear", "endreborn:ender_boots",											{ "endurance": 45 } );
addData( "xp_value_craft", "endreborn:ender_boots",										{ "crafting": 100, "smithing": 20 } );
addData( "req_craft", "endreborn:ender_transmitter",									{ "crafting": 80 } );
addData( "req_weapon", "endreborn:endorium_axe",										{ "combat": 60 } );
addData( "req_tool", "endreborn:endorium_axe",											{ "woodcutting": 60 } );
addData( "xp_value_craft", "endreborn:endorium_axe",									{ "crafting": 30, "smithing": 6 } );
addData( "xp_value_craft", "endreborn:endorium_block",									{ "crafting": 0 } );
addData( "req_tool", "endreborn:endorium_hoe",											{ "farming": 60 } );
addData( "xp_value_craft", "endreborn:endorium_hoe",									{ "crafting": 20, "smithing": 4 } );
addData( "xp_bonus_held", "endreborn:endorium_hoe",										{ "farming": 30 } );
addData( "xp_value_craft", "endreborn:endorium_ingot",									{ "crafting": 0 } );
addData( "xp_value_craft", "endreborn:endorium_nugget",									{ "crafting": 0 } );
addData( "req_weapon", "endreborn:endorium_pickaxe",									{ "combat": 60 } );
addData( "req_tool", "endreborn:endorium_pickaxe",										{ "mining": 60 } );
addData( "xp_value_craft", "endreborn:endorium_pickaxe",								{ "crafting": 30, "smithing": 6 } );
addData( "req_weapon", "endreborn:endorium_shovel",										{ "combat": 60 } );
addData( "req_tool", "endreborn:endorium_shovel",										{ "excavation": 60 } );
addData( "xp_value_craft", "endreborn:endorium_shovel",									{ "crafting": 10, "smithing": 2 } );
addData( "req_weapon", "endreborn:endorium_sword",										{ "combat": 60 } );
addData( "xp_value_craft", "endreborn:endorium_sword",									{ "crafting": 20, "smithing": 4 } );
addData( "xp_value_break", "endreborn:obsidian_ore",									{ "mining": 50 } );
addData( "info_ore", "endreborn:obsidian_ore",											{ "extraChance": 0.8 } );
addData( "xp_value_smelt", "endreborn:quartz_ore",										{ "smithing": 13 } );
addData( "xp_value_break", "endreborn:quartz_ore",										{ "mining": 13 } );
addData( "info_ore", "endreborn:quartz_ore",											{ "extraChance": 0.9 } );
addData( "req_weapon", "endreborn:wolframium_axe",										{ "combat": 45 } );
addData( "req_tool", "endreborn:wolframium_axe",										{ "woodcutting": 35 } );
addData( "xp_value_craft", "endreborn:wolframium_axe",									{ "crafting": 150, "smithing": 30 } );
addData( "xp_value_craft", "endreborn:wolframium_block",								{ "crafting": 0 } );
addData( "req_wear", "endreborn:wolframium_boots",										{ "endurance": 32 } );
addData( "xp_value_craft", "endreborn:wolframium_boots",								{ "crafting": 80, "smithing": 16 } );
addData( "req_wear", "endreborn:wolframium_chestplate",									{ "endurance": 32 } );
addData( "xp_value_craft", "endreborn:wolframium_chestplate",							{ "crafting": 160, "smithing": 32 } );
addData( "req_wear", "endreborn:wolframium_helmet",										{ "endurance": 32 } );
addData( "xp_value_craft", "endreborn:wolframium_helmet",								{ "crafting": 100, "smithing": 20 } );
addData( "req_tool", "endreborn:wolframium_hoe",										{ "farming": 35 } );
addData( "xp_value_craft", "endreborn:wolframium_hoe",									{ "crafting": 100, "smithing": 20 } );
addData( "xp_bonus_held", "endreborn:wolframium_hoe",									{ "farming": 15 } );
addData( "xp_value_smelt", "endreborn:wolframium_horse_armor",							{ "smithing": 20 } );
addData( "info_smelt", "endreborn:wolframium_horse_armor",								{ "extraChance": 50 } );
addData( "xp_value_craft", "endreborn:wolframium_ingot",								{ "crafting": 0 } );
addData( "req_wear", "endreborn:wolframium_leggings",									{ "endurance": 32 } );
addData( "xp_value_craft", "endreborn:wolframium_leggings",								{ "crafting": 140, "smithing": 28 } );
addData( "xp_value_craft", "endreborn:wolframium_nugget",								{ "crafting": 0 } );
addData( "xp_value_smelt", "endreborn:wolframium_ore",									{ "smithing": 12 } );
addData( "xp_value_break", "endreborn:wolframium_ore",									{ "mining": 12 } );
addData( "info_ore", "endreborn:wolframium_ore",										{ "extraChance": 0.9 } );
addData( "req_weapon", "endreborn:wolframium_pickaxe",									{ "combat": 35 } );
addData( "req_tool", "endreborn:wolframium_pickaxe",									{ "mining": 35 } );
addData( "xp_value_craft", "endreborn:wolframium_pickaxe",								{ "crafting": 150, "smithing": 30 } );
addData( "req_weapon", "endreborn:wolframium_shovel",									{ "combat": 35 } );
addData( "req_tool", "endreborn:wolframium_shovel",										{ "excavation": 35 } );
addData( "xp_value_craft", "endreborn:wolframium_shovel",								{ "crafting": 50, "smithing": 10 } );
addData( "req_weapon", "endreborn:wolframium_sword",									{ "combat": 35 } );
addData( "xp_value_craft", "endreborn:wolframium_sword",								{ "crafting": 100, "smithing": 20 } );
}
//ENGINEERIN
{
addData( "skills", "engineering", { "color": 0xffffff } );
}
//ENIGMATICLEGACY
{
addData2( "salvage", "enigmaticlegacy:etherium_axe", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 3,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "enigmaticlegacy:etherium_boots", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 4,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "enigmaticlegacy:etherium_chestplate", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 8,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "enigmaticlegacy:etherium_helmet", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 5,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "enigmaticlegacy:etherium_hoe", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 2,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "enigmaticlegacy:etherium_horse_armor", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "enigmaticlegacy:etherium_leggings", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "info_ore", "enigmaticlegacy:etherium_ore",				{ "extraChance": 0.5} );
addData( "info_smelt", "enigmaticlegacy:etherium_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "enigmaticlegacy:etherium_ore",					{ "mining": 22} );
addData( "xp_value_smelt", "enigmaticlegacy:etherium_ore",					{ "smithing": 18} );
addData2( "salvage", "enigmaticlegacy:etherium_pickaxe", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 3,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "enigmaticlegacy:etherium_shovel", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "enigmaticlegacy:etherium_sword", "enigmaticlegacy:etherium_ingot",
{
	"salvageMax": 2,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
}
//EXPANDED_COMBAT
{
addData( "item_specific", "expanded_combat:diamond_bow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "expanded_combat:diamond_bow",					{ "archery": 10} );
addData( "item_specific", "expanded_combat:diamond_bow_half",			{ "archeryWeapon": 1} );
addData( "req_weapon", "expanded_combat:diamond_bow_half",				{ "archery": 10} );
addData( "item_specific", "expanded_combat:gold_bow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "expanded_combat:gold_bow",						{ "archery": 20} );
addData( "item_specific", "expanded_combat:gold_bow_half",				{ "archeryWeapon": 1} );
addData( "req_weapon", "expanded_combat:gold_bow_half",					{ "archery": 20} );
addData( "item_specific", "expanded_combat:iron_bow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "expanded_combat:iron_bow",						{ "archery": 5} );
addData( "item_specific", "expanded_combat:iron_bow_half",				{ "archeryWeapon": 1} );
addData( "req_weapon", "expanded_combat:iron_bow_half",					{ "archery": 1} );
addData( "item_specific", "expanded_combat:netherite_bow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "expanded_combat:netherite_bow",					{ "archery": 15} );
}
//EXTENDEDNETHER
{
addData( "req_tool", "extendednether:netherite_axe",									{ "woodcutting": 60 } );
addData( "req_weapon", "extendednether:netherite_axe",									{ "combat": 65 } );
addData( "xp_value_craft", "extendednether:netherite_axe",								{ "crafting": 600, "smithing": 120 } );
addData( "fish_pool", "extendednether:netherite_axe",									{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "extendednether:netherite_boots",									{ "endurance": 60 } );
addData( "xp_value_craft", "extendednether:netherite_boots",							{ "crafting": 800, "smithing": 160 } );
addData( "fish_pool", "extendednether:netherite_boots",									{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "extendednether:netherite_chestplate",								{ "endurance": 60 } );
addData( "xp_value_craft", "extendednether:netherite_chestplate",						{ "crafting": 1600, "smithing": 320 } );
addData( "fish_pool", "extendednether:netherite_chestplate",							{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "extendednether:netherite_helmet",									{ "endurance": 60 } );
addData( "xp_value_craft", "extendednether:netherite_helmet",							{ "crafting": 1000, "smithing": 200 } );
addData( "fish_pool", "extendednether:netherite_helmet",								{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "extendednether:netherite_hoe",									{ "farming": 40 } );
addData( "xp_bonus_held", "extendednether:netherite_hoe",								{ "farming": 15 } );
addData( "xp_value_craft", "extendednether:netherite_hoe",								{ "crafting": 400, "smithing": 80 } );
addData( "fish_pool", "extendednether:netherite_hoe",									{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "extendednether:netherite_leggings",								{ "endurance": 60 } );
addData( "xp_value_craft", "extendednether:netherite_leggings",							{ "crafting": 1400, "smithing": 280 } );
addData( "fish_pool", "extendednether:netherite_leggings",								{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "extendednether:netherite_pickaxe",								{ "mining": 60 } );
addData( "req_weapon", "extendednether:netherite_pickaxe",								{ "combat": 60 } );
addData( "xp_value_craft", "extendednether:netherite_pickaxe",							{ "crafting": 600, "smithing": 120 } );
addData( "fish_pool", "extendednether:netherite_pickaxe",								{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "extendednether:netherite_shovel",									{ "excavation": 60 } );
addData( "req_weapon", "extendednether:netherite_shovel",								{ "combat": 60 } );
addData( "xp_value_craft", "extendednether:netherite_shovel",							{ "crafting": 200, "smithing": 40 } );
addData( "fish_pool", "extendednether:netherite_shovel",								{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_weapon", "extendednether:netherite_sword",								{ "combat": 60 } );
addData( "xp_value_craft", "extendednether:netherite_sword",							{ "crafting": 400, "smithing": 80 } );
addData( "fish_pool", "extendednether:netherite_sword",									{ "startWeight": 0, "startLevel": 100, "endWeight": 3, "endLevel": 400, "xp": 350, "enchantLevelReq": 120 } );
}
//EXTRAANVILS
{
addData2( "salvage", "extraanvils:chipped_diamond_anvil", "minecraft:diamond_block",
{
	"salvageMax": 2,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 20
} );
addData2( "salvage", "extraanvils:chipped_gold_anvil", "minecraft:gold_block",
{
	"salvageMax": 2,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 20
} );
addData2( "salvage", "extraanvils:damaged_diamond_anvil", "minecraft:diamond_block",
{
	"salvageMax": 1,
	"baseChance": 5,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData2( "salvage", "extraanvils:damaged_gold_anvil", "minecraft:gold_block",
{
	"salvageMax": 1,
	"baseChance": 5,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "xp_value_craft", "extraanvils:diamond_anvil",									{ "crafting": 930, "smithing": 186 } );
addData2( "salvage", "extraanvils:diamond_anvil", "minecraft:diamond_block",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 30
} );
addData( "xp_value_craft", "extraanvils:gold_anvil",									{ "crafting": 500, "smithing": 100 } );
addData2( "salvage", "extraanvils:gold_anvil", "minecraft:gold_block",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 30
} );
addData( "xp_value_craft", "extraanvils:stone_anvil",									{ "crafting": 20, "smithing": 10 } );
}
//EXTRABOWS
{
addData( "item_specific", "extrabows:diamond_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "extrabows:diamond_bow",							{ "archery": 15} );
addData( "item_specific", "extrabows:electric_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "extrabows:electric_bow",						{ "archery": 15} );
addData( "item_specific", "extrabows:emerald_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "extrabows:emerald_bow",							{ "archery": 15} );
addData( "item_specific", "extrabows:golden_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "extrabows:golden_bow",							{ "archery": 10} );
addData( "item_specific", "extrabows:iron_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "extrabows:iron_bow",							{ "archery": 10} );
addData( "item_specific", "extrabows:stone_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "extrabows:stone_bow",							{ "archery": 5} );
}
//FISHIN
{
addData( "level_up_command", "fishing",													{ "give >player< minecraft:cookie >level<": 100 } );
}
//FOODEXPANSION
{
addData( "xp_value_craft", "foodexpansion:bacon_and_egg",								{ "cooking": 15 } );
addData( "xp_value_cook", "foodexpansion:bat_wing",										{ "cooking": 7.5 } );
addData( "xp_value_craft", "foodexpansion:beetroot_noodles",							{ "cooking": 35 } );
addData( "xp_value_craft", "foodexpansion:blaze_cream",									{ "cooking": 35 } );
addData( "xp_value_craft", "foodexpansion:cactus_fruit",								{ "cooking": 10 } );
addData( "xp_value_craft", "foodexpansion:carrot_pie",									{ "cooking": 20 } );
addData( "xp_value_craft", "foodexpansion:carrot_seed_soup",							{ "cooking": 35 } );
addData( "xp_value_craft", "foodexpansion:chocolate_bar",								{ "cooking": 20 } );
addData( "xp_value_craft", "foodexpansion:compressed_flesh",							{ "cooking": 5 } );
addData( "xp_value_craft", "foodexpansion:dough",										{ "cooking": 10 } );
addData( "xp_value_craft", "foodexpansion:jelly",										{ "cooking": 15 } );
addData( "xp_value_craft", "foodexpansion:lollipop",									{ "cooking": 5 } );
addData( "xp_value_craft", "foodexpansion:melon_salad",									{ "cooking": 35 } );
addData( "xp_value_craft", "foodexpansion:nether_wart_soup",							{ "cooking": 35 } );
addData( "xp_value_craft", "foodexpansion:spider_soup",									{ "cooking": 35 } );
}
//FORBIDDEN_ARCANUS
{
addData( "info_smelt", "forbidden_arcanus:arcane_crystal",				{ "extraChance": 1} );
addData( "xp_value_smelt", "forbidden_arcanus:arcane_crystal",				{ "smithing": 12, "magic": 6} );
addData( "info_ore", "forbidden_arcanus:arcane_crystal_ore",		{ "extraChance": 0.75} );
addData( "info_smelt", "forbidden_arcanus:arcane_crystal_ore",			{ "extraChance": 1} );
addData( "xp_value_break", "forbidden_arcanus:arcane_crystal_ore",			{ "mining": 12, "magic": 6} );
addData( "xp_value_smelt", "forbidden_arcanus:arcane_crystal_ore",			{ "smithing": 12, "magic": 6} );
addData( "info_smelt", "forbidden_arcanus:dark_runestone",				{ "extraChance": 1} );
addData( "xp_value_smelt", "forbidden_arcanus:dark_runestone",				{ "smithing": 10, "magic": 12} );
addData( "info_smelt", "forbidden_arcanus:edelwood_log",				{ "extraChance": 1} );
addData( "xp_value_smelt", "forbidden_arcanus:edelwood_log",				{ "smithing": 8, "magic": 16} );
addData( "info_smelt", "forbidden_arcanus:obsidian_with_iron",			{ "extraChance": 1} );
addData( "xp_value_smelt", "forbidden_arcanus:obsidian_with_iron",			{ "smithing": 12, "magic": 6} );
addData( "info_smelt", "forbidden_arcanus:runestone",					{ "extraChance": 1} );
addData( "xp_value_smelt", "forbidden_arcanus:runestone",					{ "smithing": 8, "magic": 10} );
}
//FUNMOD
{
addData( "item_specific", "funmod:bow_of_unendingfire",					{ "archeryWeapon": 1} );
addData( "req_weapon", "funmod:bow_of_unendingfire",					{ "archery": 120} );
addData( "item_specific", "funmod:divine_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "funmod:divine_bow",								{ "archery": 125} );
addData( "item_specific", "funmod:dragon_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "funmod:dragon_bow",								{ "archery": 150} );
addData( "item_specific", "funmod:predator",							{ "archeryWeapon": 1} );
addData( "req_weapon", "funmod:predator",								{ "archery": 125} );
}
//GEMSNJEWELS
{
addData( "item_specific", "gemsnjewels:fast_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "gemsnjewels:fast_bow",							{ "archery": 5} );
}
//GOOD_NIGHTS_SLEEP
{
addData( "info_ore", "good_nights_sleep:necrum_ore",				{ "extraChance": 0.5} );
addData( "info_smelt", "good_nights_sleep:necrum_ore",					{ "extraChance": 0.5} );
addData( "xp_value_break", "good_nights_sleep:necrum_ore",					{ "mining": 16, "magic": 4} );
addData( "xp_value_smelt", "good_nights_sleep:necrum_ore",					{ "smithing": 18, "magic": 4} );
addData( "info_ore", "good_nights_sleep:negatite_ore",				{ "extraChance": 0.25} );
addData( "info_smelt", "good_nights_sleep:negatite_ore",				{ "extraChance": 0.25} );
addData( "xp_value_break", "good_nights_sleep:negatite_ore",				{ "mining": 22, "magic": 8} );
addData( "xp_value_smelt", "good_nights_sleep:negatite_ore",				{ "smithing": 10, "magic": 20} );
addData( "info_ore", "good_nights_sleep:positite_ore",				{ "extraChance": 0.25} );
addData( "info_smelt", "good_nights_sleep:positite_ore",				{ "extraChance": 0.25} );
addData( "xp_value_break", "good_nights_sleep:positite_ore",				{ "mining": 22, "magic": 8} );
addData( "xp_value_smelt", "good_nights_sleep:positite_ore",				{ "smithing": 10, "magic": 20} );
addData( "info_ore", "good_nights_sleep:rainbow_ore",				{ "extraChance": 0.5} );
addData( "info_smelt", "good_nights_sleep:rainbow_ore",					{ "extraChance": 0.5} );
addData( "xp_value_break", "good_nights_sleep:rainbow_ore",					{ "mining": 16, "magic": 4} );
addData( "xp_value_smelt", "good_nights_sleep:rainbow_ore",					{ "smithing": 18, "magic": 4} );
addData( "info_ore", "good_nights_sleep:zitrite_ore",				{ "extraChance": 0.5} );
addData( "info_smelt", "good_nights_sleep:zitrite_ore",					{ "extraChance": 0.5} );
addData( "xp_value_break", "good_nights_sleep:zitrite_ore",					{ "mining": 12, "magic": 2} );
addData( "xp_value_smelt", "good_nights_sleep:zitrite_ore",					{ "smithing": 12, "magic": 4} );
}
//HARCOREBATTLETOWERS
{
addData( "req_weapon", "harcorebattletowers:double_headed_evil_axe",					{ "combat": 85 } );
addData( "req_wear", "harcorebattletowers:evil_armorbody",								{ "endurance": 85 } );
addData( "req_wear", "harcorebattletowers:evil_armorboots",								{ "endurance": 85 } );
addData( "req_wear", "harcorebattletowers:evil_armorhelmet",							{ "endurance": 85 } );
addData( "req_wear", "harcorebattletowers:evil_armorlegs",								{ "endurance": 85 } );
addData( "req_weapon", "harcorebattletowers:evil_dagger",								{ "combat": 80 } );
}
//ICEANDFIRE
{
addData( "xp_value_kill", "iceandfire:amphithere",										{ "combat": 35 } );
addData( "info_ore", "iceandfire:amythest_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "iceandfire:amythest_ore",						{ "extraChance": 1.2} );
addData( "xp_value_break", "iceandfire:amythest_ore",						{ "mining": 25} );
addData( "xp_value_smelt", "iceandfire:amythest_ore",						{ "smithing": 35} );
addData( "req_wear", "iceandfire:armor_amythest_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_amythest_chestplate",							{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_amythest_helmet",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_amythest_leggings",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_black_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_black_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_black_helmet",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_black_leggings",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_blue_boots",										{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_blue_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_blue_helmet",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_blue_leggings",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_bronze_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_bronze_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_bronze_helmet",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_bronze_leggings",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_copper_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_copper_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_copper_helmet",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_copper_leggings",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_copper_metal_boots",								{ "endurance": 10 } );
addData( "xp_bonus_worn", "iceandfire:armor_copper_metal_boots",						{ "combat": 5 } );
addData( "req_wear", "iceandfire:armor_copper_metal_chestplate",						{ "endurance": 10 } );
addData( "xp_bonus_worn", "iceandfire:armor_copper_metal_chestplate",					{ "combat": 5 } );
addData( "req_wear", "iceandfire:armor_copper_metal_helmet",							{ "endurance": 10 } );
addData( "xp_bonus_worn", "iceandfire:armor_copper_metal_helmet",						{ "combat": 5 } );
addData( "req_wear", "iceandfire:armor_copper_metal_leggings",							{ "endurance": 10 } );
addData( "xp_bonus_worn", "iceandfire:armor_copper_metal_leggings",						{ "combat": 5 } );
addData( "req_wear", "iceandfire:armor_electric_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_electric_chestplate",							{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_electric_helmet",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_electric_leggings",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_gray_boots",										{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_gray_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_gray_helmet",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_gray_leggings",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_green_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_green_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_green_helmet",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_green_leggings",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_red_boots",										{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_red_chestplate",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_red_helmet",										{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_red_leggings",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_sapphire_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_sapphire_chestplate",							{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_sapphire_helmet",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_sapphire_leggings",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_silver_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_silver_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_silver_helmet",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_silver_leggings",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_silver_metal_boots",								{ "endurance": 20 } );
addData( "xp_bonus_worn", "iceandfire:armor_silver_metal_boots",						{ "endurance": 2.5, "combat": 5, "magic": 2.5 } );
addData( "req_wear", "iceandfire:armor_silver_metal_chestplate",						{ "endurance": 20 } );
addData( "xp_bonus_worn", "iceandfire:armor_silver_metal_chestplate",					{ "endurance": 2.5, "combat": 5, "magic": 2.5 } );
addData( "req_wear", "iceandfire:armor_silver_metal_helmet",							{ "endurance": 20 } );
addData( "xp_bonus_worn", "iceandfire:armor_silver_metal_helmet",						{ "endurance": 2.5, "combat": 5, "magic": 2.5 } );
addData( "req_wear", "iceandfire:armor_silver_metal_leggings",							{ "endurance": 20 } );
addData( "xp_bonus_worn", "iceandfire:armor_silver_metal_leggings",						{ "endurance": 2.5, "combat": 5, "magic": 2.5 } );
addData( "req_wear", "iceandfire:armor_white_boots",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_white_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_white_helmet",									{ "endurance": 60 } );
addData( "req_wear", "iceandfire:armor_white_leggings",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:blindfold",										{ "endurance": 5 } );
addData( "xp_value_kill", "iceandfire:cockatrice",										{ "combat": 35 } );
addData( "req_weapon", "iceandfire:copper_axe",											{ "combat": 15 } );
addData( "req_tool", "iceandfire:copper_axe",											{ "woodcutting": 10 } );
addData2( "salvage", "iceandfire:copper_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "iceandfire:copper_boots", "iceandfire:copper_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "iceandfire:copper_chestplate", "iceandfire:copper_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "iceandfire:copper_helmet", "iceandfire:copper_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData( "req_tool", "iceandfire:copper_hoe",											{ "farming": 10 } );
addData2( "salvage", "iceandfire:copper_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "iceandfire:copper_horse_armor", "iceandfire:copper_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "iceandfire:copper_leggings", "iceandfire:copper_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData( "info_ore", "iceandfire:copper_ore",						{ "extraChance": 0.8} );
addData( "info_smelt", "iceandfire:copper_ore",							{ "extraChance": 0.85} );
addData( "xp_value_break", "iceandfire:copper_ore",							{ "mining": 7} );
addData( "xp_value_smelt", "iceandfire:copper_ore",							{ "smithing": 7} );
addData( "req_weapon", "iceandfire:copper_pickaxe",										{ "combat": 15 } );
addData( "req_tool", "iceandfire:copper_pickaxe",										{ "mining": 10 } );
addData2( "salvage", "iceandfire:copper_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData( "req_weapon", "iceandfire:copper_shovel",										{ "combat": 15 } );
addData( "req_tool", "iceandfire:copper_shovel",										{ "excavation": 10 } );
addData2( "salvage", "iceandfire:copper_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData( "req_weapon", "iceandfire:copper_sword",										{ "combat": 15 } );
addData2( "salvage", "iceandfire:copper_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData( "xp_value_kill", "iceandfire:cyclops",											{ "combat": 100 } );
addData( "xp_value_kill", "iceandfire:deathworm",										{ "combat": 35 } );
addData( "req_wear", "iceandfire:deathworm_red_boots",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_red_boots",								{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_red_chestplate",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_red_chestplate",						{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_red_helmet",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_red_helmet",							{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_red_leggings",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_red_leggings",							{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_white_boots",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_white_boots",							{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_white_chestplate",							{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_white_chestplate",						{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_white_helmet",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_white_helmet",							{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_white_leggings",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_white_leggings",						{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_yellow_boots",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_yellow_boots",							{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_yellow_chestplate",							{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_yellow_chestplate",						{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_yellow_helmet",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_yellow_helmet",							{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_wear", "iceandfire:deathworm_yellow_leggings",							{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:deathworm_yellow_leggings",						{ "agility": 5, "excavation": 5, "combat": 2.5 } );
addData( "req_weapon", "iceandfire:dragonbone_axe",										{ "combat": 35 } );
addData( "req_tool", "iceandfire:dragonbone_axe",										{ "woodcutting": 35 } );
addData2( "salvage", "iceandfire:dragonbone_axe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "iceandfire:dragonbone_boots", "iceandfire:dragonbone",
{
	"salvageMax": 4,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:dragonbone_bow",						{ "archery": 5} );
addData( "item_specific", "iceandfire:dragonbone_bow",					{ "archeryWeapon": 1} );
addData2( "salvage", "iceandfire:dragonbone_chestplate", "iceandfire:dragonbone",
{
	"salvageMax": 8,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "iceandfire:dragonbone_helmet", "iceandfire:dragonbone",
{
	"salvageMax": 5,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_tool", "iceandfire:dragonbone_hoe",										{ "farming": 35 } );
addData2( "salvage", "iceandfire:dragonbone_hoe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "iceandfire:dragonbone_horse_armor", "iceandfire:dragonbone",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "iceandfire:dragonbone_leggings", "iceandfire:dragonbone",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:dragonbone_pickaxe",									{ "combat": 35 } );
addData( "req_tool", "iceandfire:dragonbone_pickaxe",									{ "mining": 35 } );
addData2( "salvage", "iceandfire:dragonbone_pickaxe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:dragonbone_shovel",									{ "combat": 35 } );
addData( "req_tool", "iceandfire:dragonbone_shovel",									{ "excavation": 35 } );
addData2( "salvage", "iceandfire:dragonbone_shovel", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:dragonbone_sword",									{ "combat": 35 } );
addData2( "salvage", "iceandfire:dragonbone_sword", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:dragonbone_sword_fire",								{ "combat": 50 } );
addData( "req_weapon", "iceandfire:dragonbone_sword_ice",								{ "combat": 50 } );
addData( "req_weapon", "iceandfire:dragonbone_sword_lightning",							{ "combat": 50 } );
addData( "req_weapon", "iceandfire:dragonsteel_fire_axe",								{ "combat": 60 } );
addData( "req_tool", "iceandfire:dragonsteel_fire_axe",									{ "woodcutting": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_axe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_fire_boots",								{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_boots", "iceandfire:dragonsteel_fire_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_fire_chestplate",							{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_chestplate", "iceandfire:dragonsteel_fire_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_fire_helmet",								{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_helmet", "iceandfire:dragonsteel_fire_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_fire_hoe",									{ "farming": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_hoe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData2( "salvage", "iceandfire:dragonsteel_fire_horse_armor", "iceandfire:dragonsteel_fire_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_fire_leggings",							{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_leggings", "iceandfire:dragonsteel_fire_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_fire_pickaxe",								{ "mining": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_pickaxe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_fire_shovel",								{ "excavation": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_shovel", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_weapon", "iceandfire:dragonsteel_fire_sword",								{ "combat": 60 } );
addData2( "salvage", "iceandfire:dragonsteel_fire_sword", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_weapon", "iceandfire:dragonsteel_ice_axe",								{ "combat": 60 } );
addData( "req_tool", "iceandfire:dragonsteel_ice_axe",									{ "woodcutting": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_axe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_ice_boots",								{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_boots", "iceandfire:dragonsteel_ice_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_ice_chestplate",							{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_chestplate", "iceandfire:dragonsteel_ice_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_ice_helmet",								{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_helmet", "iceandfire:dragonsteel_ice_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_ice_hoe",									{ "farming": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_hoe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData2( "salvage", "iceandfire:dragonsteel_ice_horse_armor", "iceandfire:dragonsteel_ice_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_ice_leggings",								{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_leggings", "iceandfire:dragonsteel_ice_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_ice_pickaxe",								{ "mining": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_pickaxe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_ice_shovel",								{ "excavation": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_shovel", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_weapon", "iceandfire:dragonsteel_ice_sword",								{ "combat": 60 } );
addData2( "salvage", "iceandfire:dragonsteel_ice_sword", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_weapon", "iceandfire:dragonsteel_lightning_axe",							{ "combat": 60 } );
addData( "req_tool", "iceandfire:dragonsteel_lightning_axe",							{ "woodcutting": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_axe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_lightning_boots",							{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_boots", "iceandfire:dragonsteel_lightning_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_lightning_chestplate",						{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_chestplate", "iceandfire:dragonsteel_lightning_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_lightning_helmet",							{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_helmet", "iceandfire:dragonsteel_lightning_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_lightning_hoe",							{ "farming": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_hoe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData2( "salvage", "iceandfire:dragonsteel_lightning_horse_armor", "iceandfire:dragonsteel_lightning_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_wear", "iceandfire:dragonsteel_lightning_leggings",						{ "endurance": 70 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_leggings", "iceandfire:dragonsteel_lightning_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_lightning_pickaxe",						{ "mining": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_pickaxe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_tool", "iceandfire:dragonsteel_lightning_shovel",							{ "excavation": 35 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_shovel", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "req_weapon", "iceandfire:dragonsteel_lightning_sword",						{ "combat": 60 } );
addData2( "salvage", "iceandfire:dragonsteel_lightning_sword", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 50
});
addData( "xp_value_kill", "iceandfire:dread_beast",										{ "combat": 35 } );
addData( "xp_value_kill", "iceandfire:dread_ghoul",										{ "combat": 35 } );
addData( "xp_value_kill", "iceandfire:dread_horse",										{ "combat": 35 } );
addData( "xp_value_kill", "iceandfire:dread_knight",									{ "combat": 35 } );
addData( "req_weapon", "iceandfire:dread_knight_sword",									{ "combat": 50 } );
addData( "xp_value_kill", "iceandfire:dread_lich",										{ "combat": 50 } );
addData( "xp_value_kill", "iceandfire:dread_lich_skull",								{ "combat": 50 } );
addData( "req_weapon", "iceandfire:dread_queen_sword",									{ "combat": 50 } );
addData( "xp_value_kill", "iceandfire:dread_scuttler",									{ "combat": 60 } );
addData( "req_weapon", "iceandfire:dread_sword",										{ "combat": 20 } );
addData( "xp_value_kill", "iceandfire:dread_thrall",									{ "combat": 35 } );
addData( "xp_bonus_worn", "iceandfire:earplugs",										{ "endurance": 5, "farming": 2.5, "woodcutting": 2.5 } );
addData( "xp_value_kill", "iceandfire:fire_dragon",										{ "combat": 1000 } );
addData( "xp_value_tame", "iceandfire:fire_dragon",			{ "taming": 65} );
addData( "req_wear", "iceandfire:forest_troll_leather_boots",							{ "endurance": 25 } );
addData( "req_wear", "iceandfire:forest_troll_leather_chestplate",						{ "endurance": 25 } );
addData( "req_wear", "iceandfire:forest_troll_leather_helmet",							{ "endurance": 25 } );
addData( "req_wear", "iceandfire:forest_troll_leather_leggings",						{ "endurance": 25 } );
addData( "req_wear", "iceandfire:frost_troll_leather_boots",							{ "endurance": 25 } );
addData( "req_wear", "iceandfire:frost_troll_leather_chestplate",						{ "endurance": 25 } );
addData( "req_wear", "iceandfire:frost_troll_leather_helmet",							{ "endurance": 25 } );
addData( "req_wear", "iceandfire:frost_troll_leather_leggings",							{ "endurance": 25 } );
addData( "info_smelt", "iceandfire:frozen_cobblestone",					{ "extraChance": 1} );
addData( "xp_value_smelt", "iceandfire:frozen_cobblestone",					{ "smithing": 2} );
addData( "info_smelt", "iceandfire:frozen_grass_path",					{ "extraChance": 1} );
addData( "xp_value_smelt", "iceandfire:frozen_grass_path",					{ "smithing": 2} );
addData( "info_smelt", "iceandfire:frozen_stone",						{ "extraChance": 1} );
addData( "xp_value_smelt", "iceandfire:frozen_stone",						{ "smithing": 2} );
addData( "xp_value_kill", "iceandfire:gorgon",											{ "combat": 40 } );
addData( "xp_value_kill", "iceandfire:hippocampus",										{ "combat": 25 } );
addData( "xp_value_tame", "iceandfire:hippocampus",			{ "taming": 30} );
addData( "xp_value_kill", "iceandfire:hippogryph",										{ "combat": 35 } );
addData( "xp_value_tame", "iceandfire:hippogryph",			{ "taming": 40} );
addData( "req_weapon", "iceandfire:hippogryph_sword",									{ "combat": 25 } );
addData( "xp_value_kill", "iceandfire:hydra",											{ "combat": 100 } );
addData( "xp_value_kill", "iceandfire:ice_dragon",										{ "combat": 1000 } );
addData( "xp_value_tame", "iceandfire:ice_dragon",			{ "taming": 75} );
addData( "xp_value_kill", "iceandfire:lightning_dragon",								{ "combat": 1000 } );
addData( "xp_value_tame", "iceandfire:lightning_dragon",	{ "taming": 100} );
addData( "req_wear", "iceandfire:mountain_troll_leather_boots",							{ "endurance": 25 } );
addData( "req_wear", "iceandfire:mountain_troll_leather_chestplate",					{ "endurance": 25 } );
addData( "req_wear", "iceandfire:mountain_troll_leather_helmet",						{ "endurance": 25 } );
addData( "req_wear", "iceandfire:mountain_troll_leather_leggings",						{ "endurance": 25 } );
addData( "req_tool", "iceandfire:mymrex_jungle_axe",									{ "woodcutting": 15 } );
addData( "req_tool", "iceandfire:mymrex_jungle_hoe",									{ "farming": 15 } );
addData( "req_tool", "iceandfire:myrmex_desert_axe",									{ "woodcutting": 15 } );
addData2( "salvage", "iceandfire:myrmex_desert_axe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_wear", "iceandfire:myrmex_desert_boots",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:myrmex_desert_boots",								{ "agility": 5, "farming": 5, "combat": 2.5 } );
addData2( "salvage", "iceandfire:myrmex_desert_boots", "iceandfire:myrmex_desert_chitin",
{
	"salvageMax": 4,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_wear", "iceandfire:myrmex_desert_chestplate",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:myrmex_desert_chestplate",						{ "agility": 5, "farming": 5, "combat": 2.5 } );
addData2( "salvage", "iceandfire:myrmex_desert_chestplate", "iceandfire:myrmex_desert_chitin",
{
	"salvageMax": 8,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_wear", "iceandfire:myrmex_desert_helmet",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:myrmex_desert_helmet",							{ "agility": 5, "farming": 5, "combat": 5 } );
addData2( "salvage", "iceandfire:myrmex_desert_helmet", "iceandfire:myrmex_desert_chitin",
{
	"salvageMax": 5,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_tool", "iceandfire:myrmex_desert_hoe",									{ "farming": 15 } );
addData2( "salvage", "iceandfire:myrmex_desert_hoe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "iceandfire:myrmex_desert_horse_armor", "iceandfire:myrmex_desert_chitin",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_wear", "iceandfire:myrmex_desert_leggings",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:myrmex_desert_leggings",							{ "agility": 5, "farming": 5, "combat": 2.5 } );
addData2( "salvage", "iceandfire:myrmex_desert_leggings", "iceandfire:myrmex_desert_chitin",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_tool", "iceandfire:myrmex_desert_pickaxe",								{ "mining": 15 } );
addData2( "salvage", "iceandfire:myrmex_desert_pickaxe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_tool", "iceandfire:myrmex_desert_shovel",									{ "excavation": 15 } );
addData2( "salvage", "iceandfire:myrmex_desert_shovel", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:myrmex_desert_sword",								{ "combat": 20 } );
addData2( "salvage", "iceandfire:myrmex_desert_sword", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:myrmex_desert_sword_venom",							{ "combat": 20 } );
addData2( "salvage", "iceandfire:myrmex_jungle_axe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_wear", "iceandfire:myrmex_jungle_boots",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:myrmex_jungle_boots",								{ "agility": 5, "farming": 5, "combat": 2.5 } );
addData2( "salvage", "iceandfire:myrmex_jungle_boots", "iceandfire:myrmex_jungle_chitin",
{
	"salvageMax": 4,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_wear", "iceandfire:myrmex_jungle_chestplate",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:myrmex_jungle_chestplate",						{ "agility": 5, "farming": 5, "combat": 2.5 } );
addData2( "salvage", "iceandfire:myrmex_jungle_chestplate", "iceandfire:myrmex_jungle_chitin",
{
	"salvageMax": 8,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_wear", "iceandfire:myrmex_jungle_helmet",									{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:myrmex_jungle_helmet",							{ "agility": 5, "farming": 5, "combat": 5 } );
addData2( "salvage", "iceandfire:myrmex_jungle_helmet", "iceandfire:myrmex_jungle_chitin",
{
	"salvageMax": 5,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "iceandfire:myrmex_jungle_hoe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "iceandfire:myrmex_jungle_horse_armor", "iceandfire:myrmex_jungle_chitin",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_wear", "iceandfire:myrmex_jungle_leggings",								{ "endurance": 30 } );
addData( "xp_bonus_worn", "iceandfire:myrmex_jungle_leggings",							{ "agility": 5, "farming": 5, "combat": 2.5 } );
addData2( "salvage", "iceandfire:myrmex_jungle_leggings", "iceandfire:myrmex_jungle_chitin",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData( "req_tool", "iceandfire:myrmex_jungle_pickaxe",								{ "mining": 15 } );
addData2( "salvage", "iceandfire:myrmex_jungle_pickaxe", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_tool", "iceandfire:myrmex_jungle_shovel",									{ "excavation": 15 } );
addData2( "salvage", "iceandfire:myrmex_jungle_shovel", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:myrmex_jungle_sword",								{ "combat": 20 } );
addData2( "salvage", "iceandfire:myrmex_jungle_sword", "iceandfire:witherbone",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData( "req_weapon", "iceandfire:myrmex_jungle_sword_venom",							{ "combat": 20 } );
addData( "xp_value_kill", "iceandfire:myrmex_queen",									{ "combat": 100 } );
addData( "xp_value_kill", "iceandfire:myrmex_royal",									{ "combat": 100 } );
addData( "xp_value_kill", "iceandfire:myrmex_sentinel",									{ "combat": 45 } );
addData( "xp_value_kill", "iceandfire:myrmex_soldier",									{ "combat": 45 } );
addData( "xp_value_kill", "iceandfire:myrmex_swarmer",									{ "combat": 35 } );
addData( "xp_value_kill", "iceandfire:myrmex_worker",									{ "combat": 35 } );
addData( "xp_value_kill", "iceandfire:pixie",											{ "combat": 35 } );
addData( "info_ore", "iceandfire:sapphire_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "iceandfire:sapphire_ore",						{ "extraChance": 1.2} );
addData( "xp_value_break", "iceandfire:sapphire_ore",						{ "mining": 30} );
addData( "xp_value_smelt", "iceandfire:sapphire_ore",						{ "smithing": 35} );
addData( "xp_value_kill", "iceandfire:sea_serpent",										{ "combat": 1000 } );
addData( "req_wear", "iceandfire:sheep_boots",											{ "endurance": 5 } );
addData( "xp_bonus_worn", "iceandfire:sheep_boots",										{ "endurance": 2.5, "farming": 5, "woodcutting": 2.5 } );
addData( "req_wear", "iceandfire:sheep_chestplate",										{ "endurance": 5 } );
addData( "xp_bonus_worn", "iceandfire:sheep_chestplate",								{ "endurance": 2.5, "farming": 5, "woodcutting": 2.5 } );
addData( "req_wear", "iceandfire:sheep_helmet",											{ "endurance": 5 } );
addData( "xp_bonus_worn", "iceandfire:sheep_helmet",									{ "endurance": 2.5, "farming": 5, "woodcutting": 2.5 } );
addData( "req_wear", "iceandfire:sheep_leggings",										{ "endurance": 5 } );
addData( "xp_bonus_worn", "iceandfire:sheep_leggings",									{ "endurance": 2.5, "farming": 5, "woodcutting": 2.5 } );
addData( "req_weapon", "iceandfire:silver_axe",											{ "combat": 25 } );
addData( "req_tool", "iceandfire:silver_axe",											{ "woodcutting": 15 } );
addData2( "salvage", "iceandfire:silver_axe", "thermal:silver_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "iceandfire:silver_boots", "thermal:silver_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "iceandfire:silver_chestplate", "thermal:silver_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "iceandfire:silver_helmet", "thermal:silver_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "req_tool", "iceandfire:silver_hoe",											{ "farming": 15 } );
addData2( "salvage", "iceandfire:silver_hoe", "thermal:silver_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "iceandfire:silver_horse_armor", "thermal:silver_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "iceandfire:silver_leggings", "thermal:silver_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "info_ore", "iceandfire:silver_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "iceandfire:silver_ore",							{ "extraChance": 0.5} );
addData( "xp_value_break", "iceandfire:silver_ore",							{ "mining": 22} );
addData( "xp_value_smelt", "iceandfire:silver_ore",							{ "smithing": 18} );
addData( "req_weapon", "iceandfire:silver_pickaxe",										{ "combat": 20 } );
addData( "req_tool", "iceandfire:silver_pickaxe",										{ "mining": 15 } );
addData2( "salvage", "iceandfire:silver_pickaxe", "thermal:silver_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "req_weapon", "iceandfire:silver_shovel",										{ "combat": 20 } );
addData( "req_tool", "iceandfire:silver_shovel",										{ "excavation": 15 } );
addData2( "salvage", "iceandfire:silver_shovel", "thermal:silver_ingot",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "req_weapon", "iceandfire:silver_sword",										{ "combat": 20 } );
addData2( "salvage", "iceandfire:silver_sword", "thermal:silver_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "xp_value_kill", "iceandfire:siren",											{ "combat": 40 } );
addData( "xp_value_kill", "iceandfire:stymphalian_bird",								{ "combat": 35 } );
addData( "req_wear", "iceandfire:tide_blue_boots",										{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_blue_boots",									{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_blue_chestplate",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_blue_chestplate",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_blue_helmet",										{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_blue_helmet",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_blue_leggings",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_blue_leggings",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_bronze_boots",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_bronze_boots",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_bronze_chestplate",								{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_bronze_chestplate",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_bronze_helmet",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_bronze_helmet",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_bronze_leggings",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_bronze_leggings",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_deepblue_boots",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_deepblue_boots",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_deepblue_chestplate",								{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_deepblue_chestplate",						{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_deepblue_helmet",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_deepblue_helmet",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_deepblue_leggings",								{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_deepblue_leggings",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_green_boots",										{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_green_boots",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_green_chestplate",								{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_green_chestplate",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_green_helmet",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_green_helmet",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_green_leggings",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_green_leggings",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_purple_boots",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_purple_boots",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_purple_chestplate",								{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_purple_chestplate",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_purple_helmet",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_purple_helmet",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_purple_leggings",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_purple_leggings",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_red_boots",										{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_red_boots",									{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_red_chestplate",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_red_chestplate",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_red_helmet",										{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_red_helmet",									{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_red_leggings",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_red_leggings",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_teal_boots",										{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_teal_boots",									{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_teal_chestplate",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_teal_chestplate",							{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_teal_helmet",										{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_teal_helmet",								{ "swimming": 5 } );
addData( "req_wear", "iceandfire:tide_teal_leggings",									{ "endurance": 60 } );
addData( "xp_bonus_worn", "iceandfire:tide_teal_leggings",								{ "swimming": 5 } );
addData( "req_weapon", "iceandfire:tide_trident",										{ "combat": 50 } );
addData( "xp_value_kill", "iceandfire:troll",											{ "combat": 50 } );
addData( "req_weapon", "iceandfire:troll_weapon_axe",									{ "combat": 30 } );
addData( "req_weapon", "iceandfire:troll_weapon_column",								{ "combat": 30 } );
addData( "req_weapon", "iceandfire:troll_weapon_column_forest",							{ "combat": 30 } );
addData( "req_weapon", "iceandfire:troll_weapon_column_frost",							{ "combat": 30 } );
addData( "req_weapon", "iceandfire:troll_weapon_hammer",								{ "combat": 30 } );
addData( "req_weapon", "iceandfire:troll_weapon_trunk",									{ "combat": 30 } );
addData( "req_weapon", "iceandfire:troll_weapon_trunk_frost",							{ "combat": 30 } );
}
//ILIKEWOOD
{
addData( "req_tool", "ilikewood:acacia_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:acacia_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:acacia_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:acacia_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:acacia_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:acacia_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:acacia_shovel",					{ "excavation": 1} );
addData( "req_weapon", "ilikewood:acacia_sword",						{ "combat": 5} );
addData( "req_tool", "ilikewood:birch_axe",						{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:birch_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:birch_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:birch_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:birch_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:birch_pickaxe",					{ "mining": 1} );
addData( "req_tool", "ilikewood:birch_shovel",					{ "excavation": 1} );
addData( "req_weapon", "ilikewood:birch_sword",							{ "combat": 5} );
addData( "req_tool", "ilikewood:cherry_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:cherry_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:cherry_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:cherry_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:cherry_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:cherry_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:cherry_shovel",					{ "excavation": 1} );
addData( "req_weapon", "ilikewood:cherry_sword",						{ "combat": 5} );
addData( "req_tool", "ilikewood:crimson_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:crimson_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:crimson_bow",							{ "archery": 5, "agility": 20} );
addData( "item_specific", "ilikewood:crimson_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:crimson_crossbow",					{ "archery": 20} );
addData( "req_tool", "ilikewood:crimson_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:crimson_shovel",				{ "excavation": 1} );
addData( "req_tool", "ilikewood:dark_oak_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:dark_oak_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:dark_oak_bow",						{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:dark_oak_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:dark_oak_crossbow",					{ "archery": 10} );
addData( "req_tool", "ilikewood:dark_oak_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:dark_oak_shovel",				{ "excavation": 1} );
addData( "req_weapon", "ilikewood:dark_oak_sword",						{ "combat": 5} );
addData( "req_tool", "ilikewood:dead_axe",						{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:dead_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:dead_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:dead_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:dead_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:dead_pickaxe",					{ "mining": 1} );
addData( "req_tool", "ilikewood:dead_shovel",					{ "excavation": 1} );
addData( "req_tool", "ilikewood:diamond_acacia_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_acacia_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_acacia_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_birch_axe",				{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_birch_pickaxe",			{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_birch_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_cherry_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_cherry_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_cherry_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_crimson_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_crimson_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_crimson_shovel",		{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_dark_oak_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_dark_oak_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_dark_oak_shovel",		{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_dead_axe",				{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_dead_pickaxe",			{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_dead_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_fir_axe",				{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_fir_pickaxe",			{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_fir_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_hellbark_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_hellbark_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_hellbark_shovel",		{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_jacaranda_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_jacaranda_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_jacaranda_shovel",		{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_jungle_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_jungle_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_jungle_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_magic_axe",				{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_magic_pickaxe",			{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_magic_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_mahogany_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_mahogany_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_mahogany_shovel",		{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_oak_axe",				{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_oak_pickaxe",			{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_oak_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_palm_axe",				{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_palm_pickaxe",			{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_palm_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_redwood_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_redwood_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_redwood_shovel",		{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_spruce_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_spruce_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_spruce_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_umbran_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_umbran_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_umbran_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_warped_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_warped_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_warped_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:diamond_willow_axe",			{ "woodcutting": 40} );
addData( "req_tool", "ilikewood:diamond_willow_pickaxe",		{ "mining": 40} );
addData( "req_tool", "ilikewood:diamond_willow_shovel",			{ "excavation": 40} );
addData( "req_tool", "ilikewood:fir_axe",						{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:fir_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:fir_bow",								{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:fir_crossbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:fir_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:fir_pickaxe",					{ "mining": 1} );
addData( "req_tool", "ilikewood:fir_shovel",					{ "excavation": 1} );
addData( "req_tool", "ilikewood:golden_acacia_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_acacia_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_acacia_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_birch_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_birch_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_birch_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_cherry_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_cherry_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_cherry_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_crimson_axe",			{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_crimson_pickaxe",		{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_crimson_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_dark_oak_axe",			{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_dark_oak_pickaxe",		{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_dark_oak_shovel",		{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_dead_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_dead_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_dead_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_fir_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_fir_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_fir_shovel",				{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_hellbark_axe",			{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_hellbark_pickaxe",		{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_hellbark_shovel",		{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_jacaranda_axe",			{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_jacaranda_pickaxe",		{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_jacaranda_shovel",		{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_jungle_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_jungle_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_jungle_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_magic_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_magic_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_magic_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_mahogany_axe",			{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_mahogany_pickaxe",		{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_mahogany_shovel",		{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_oak_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_oak_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_oak_shovel",				{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_palm_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_palm_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_palm_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_redwood_axe",			{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_redwood_pickaxe",		{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_redwood_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_spruce_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_spruce_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_spruce_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_umbran_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_umbran_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_umbran_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_warped_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_warped_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_warped_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:golden_willow_axe",				{ "woodcutting": 30} );
addData( "req_tool", "ilikewood:golden_willow_pickaxe",			{ "mining": 30} );
addData( "req_tool", "ilikewood:golden_willow_shovel",			{ "excavation": 30} );
addData( "req_tool", "ilikewood:hellbark_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:hellbark_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:hellbark_bow",						{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:hellbark_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:hellbark_crossbow",					{ "archery": 10} );
addData( "req_tool", "ilikewood:hellbark_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:hellbark_shovel",				{ "excavation": 1} );
addData( "req_tool", "ilikewood:iron_acacia_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_acacia_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_acacia_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_birch_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_birch_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_birch_shovel",				{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_cherry_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_cherry_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_cherry_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_crimson_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_crimson_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_crimson_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_dark_oak_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_dark_oak_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_dark_oak_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_dead_axe",					{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_dead_pickaxe",				{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_dead_shovel",				{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_fir_axe",					{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_fir_pickaxe",				{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_fir_shovel",				{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_hellbark_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_hellbark_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_hellbark_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_jacaranda_axe",			{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_jacaranda_pickaxe",		{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_jacaranda_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_jungle_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_jungle_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_jungle_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_magic_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_magic_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_magic_shovel",				{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_mahogany_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_mahogany_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_mahogany_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_oak_axe",					{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_oak_pickaxe",				{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_oak_shovel",				{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_palm_axe",					{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_palm_pickaxe",				{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_palm_shovel",				{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_redwood_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_redwood_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_redwood_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_spruce_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_spruce_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_spruce_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_umbran_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_umbran_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_umbran_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_warped_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_warped_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_warped_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:iron_willow_axe",				{ "woodcutting": 20} );
addData( "req_tool", "ilikewood:iron_willow_pickaxe",			{ "mining": 20} );
addData( "req_tool", "ilikewood:iron_willow_shovel",			{ "excavation": 20} );
addData( "req_tool", "ilikewood:jacaranda_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:jacaranda_bow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:jacaranda_bow",						{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:jacaranda_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:jacaranda_crossbow",					{ "archery": 10} );
addData( "req_tool", "ilikewood:jacaranda_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:jacaranda_shovel",				{ "excavation": 1} );
addData( "req_tool", "ilikewood:jungle_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:jungle_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:jungle_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:jungle_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:jungle_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:jungle_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:jungle_shovel",					{ "excavation": 1} );
addData( "req_weapon", "ilikewood:jungle_sword",						{ "combat": 5} );
addData( "req_tool", "ilikewood:magic_axe",						{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:magic_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:magic_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:magic_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:magic_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:magic_pickaxe",					{ "mining": 1} );
addData( "req_tool", "ilikewood:magic_shovel",					{ "excavation": 1} );
addData( "req_tool", "ilikewood:mahogany_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:mahogany_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:mahogany_bow",						{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:mahogany_crossbow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:mahogany_crossbow",					{ "archery": 10} );
addData( "req_tool", "ilikewood:mahogany_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:mahogany_shovel",				{ "excavation": 1} );
addData( "req_tool", "ilikewood:netherite_acacia_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_acacia_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_acacia_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_birch_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_birch_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_birch_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_cherry_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_cherry_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_cherry_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_crimson_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_crimson_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_crimson_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_dark_oak_axe",		{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_dark_oak_pickaxe",	{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_dark_oak_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_dead_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_dead_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_dead_shovel",			{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_fir_axe",				{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_fir_pickaxe",			{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_fir_shovel",			{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_hellbark_axe",		{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_hellbark_pickaxe",	{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_hellbark_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_jacaranda_axe",		{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_jacaranda_pickaxe",	{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_jacaranda_shovel",	{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_jungle_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_jungle_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_jungle_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_magic_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_magic_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_magic_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_mahogany_axe",		{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_mahogany_pickaxe",	{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_mahogany_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_oak_axe",				{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_oak_pickaxe",			{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_oak_shovel",			{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_palm_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_palm_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_palm_shovel",			{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_redwood_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_redwood_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_redwood_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_spruce_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_spruce_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_spruce_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_umbran_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_umbran_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_umbran_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_warped_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_warped_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_warped_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:netherite_willow_axe",			{ "woodcutting": 60} );
addData( "req_tool", "ilikewood:netherite_willow_pickaxe",		{ "mining": 60} );
addData( "req_tool", "ilikewood:netherite_willow_shovel",		{ "excavation": 60} );
addData( "req_tool", "ilikewood:oak_axe",						{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:oak_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:oak_bow",								{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:oak_crossbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:oak_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:oak_pickaxe",					{ "mining": 1} );
addData( "req_tool", "ilikewood:oak_shovel",					{ "excavation": 1} );
addData( "req_weapon", "ilikewood:oak_sword",							{ "combat": 5} );
addData( "req_tool", "ilikewood:palm_axe",						{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:palm_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:palm_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:palm_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:palm_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:palm_pickaxe",					{ "mining": 1} );
addData( "req_tool", "ilikewood:palm_shovel",					{ "excavation": 1} );
addData( "req_tool", "ilikewood:redwood_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:redwood_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:redwood_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:redwood_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:redwood_crossbow",					{ "archery": 10} );
addData( "req_tool", "ilikewood:redwood_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:redwood_shovel",				{ "excavation": 1} );
addData( "req_tool", "ilikewood:spruce_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:spruce_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:spruce_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:spruce_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:spruce_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:spruce_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:spruce_shovel",					{ "excavation": 1} );
addData( "req_weapon", "ilikewood:spruce_sword",						{ "combat": 5} );
addData( "req_tool", "ilikewood:stone_acacia_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_acacia_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_acacia_shovel",			{ "excavation": 10} );
addData( "req_weapon", "ilikewood:stone_acacia_sword",					{ "combat": 10} );
addData( "req_tool", "ilikewood:stone_birch_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_birch_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_birch_shovel",			{ "excavation": 10} );
addData( "req_weapon", "ilikewood:stone_birch_sword",					{ "combat": 10} );
addData( "req_tool", "ilikewood:stone_cherry_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_cherry_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_cherry_shovel",			{ "excavation": 10} );
addData( "req_weapon", "ilikewood:stone_cherry_sword",					{ "combat": 10} );
addData( "req_tool", "ilikewood:stone_crimson_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_crimson_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_crimson_shovel",			{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_dark_oak_axe",			{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_dark_oak_pickaxe",		{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_dark_oak_shovel",			{ "excavation": 10} );
addData( "req_weapon", "ilikewood:stone_dark_oak_sword",				{ "combat": 10} );
addData( "req_tool", "ilikewood:stone_dead_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_dead_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_dead_shovel",				{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_fir_axe",					{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_fir_pickaxe",				{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_fir_shovel",				{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_hellbark_axe",			{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_hellbark_pickaxe",		{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_hellbark_shovel",			{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_jacaranda_axe",			{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_jacaranda_pickaxe",		{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_jacaranda_shovel",		{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_jungle_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_jungle_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_jungle_shovel",			{ "excavation": 10} );
addData( "req_weapon", "ilikewood:stone_jungle_sword",					{ "combat": 10} );
addData( "req_tool", "ilikewood:stone_magic_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_magic_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_magic_shovel",			{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_mahogany_axe",			{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_mahogany_pickaxe",		{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_mahogany_shovel",			{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_oak_axe",					{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_oak_pickaxe",				{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_oak_shovel",				{ "excavation": 10} );
addData( "req_weapon", "ilikewood:stone_oak_sword",						{ "combat": 10} );
addData( "req_tool", "ilikewood:stone_palm_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_palm_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_palm_shovel",				{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_redwood_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_redwood_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_redwood_shovel",			{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_spruce_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_spruce_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_spruce_shovel",			{ "excavation": 10} );
addData( "req_weapon", "ilikewood:stone_spruce_sword",					{ "combat": 10} );
addData( "req_tool", "ilikewood:stone_umbran_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_umbran_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_umbran_shovel",			{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_warped_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_warped_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_warped_shovel",			{ "excavation": 10} );
addData( "req_tool", "ilikewood:stone_willow_axe",				{ "woodcutting": 10} );
addData( "req_tool", "ilikewood:stone_willow_pickaxe",			{ "mining": 10} );
addData( "req_tool", "ilikewood:stone_willow_shovel",			{ "excavation": 10} );
addData( "req_tool", "ilikewood:umbran_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:umbran_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:umbran_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:umbran_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:umbran_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:umbran_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:umbran_shovel",					{ "excavation": 1} );
addData( "req_tool", "ilikewood:warped_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:warped_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:warped_bow",							{ "archery": 5, "agility": 20} );
addData( "item_specific", "ilikewood:warped_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:warped_crossbow",						{ "archery": 20} );
addData( "req_tool", "ilikewood:warped_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:warped_shovel",					{ "excavation": 1} );
addData( "req_tool", "ilikewood:willow_axe",					{ "woodcutting": 1} );
addData( "item_specific", "ilikewood:willow_bow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:willow_bow",							{ "archery": 1, "agility": 20} );
addData( "item_specific", "ilikewood:willow_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "ilikewood:willow_crossbow",						{ "archery": 10} );
addData( "req_tool", "ilikewood:willow_pickaxe",				{ "mining": 1} );
addData( "req_tool", "ilikewood:willow_shovel",					{ "excavation": 1} );
}
//IMMERSIVEENGINEERING
{
addData( "xp_value_smelt", "immersiveengineering:dust_gold",				{ "smithing": 16} );
addData( "xp_value_smelt", "immersiveengineering:dust_hop_graphite",		{ "smithing": 22} );
addData( "xp_value_smelt", "immersiveengineering:dust_iron",				{ "smithing": 12} );
}
//IRONCHEST
{
addData( "req_place", "ironchest:copper_chest",											{ "building": 10 } );
addData( "req_craft", "ironchest:copper_chest",											{ "smithing": 10 } );
addData( "req_use", "ironchest:copper_chest",											{ "building": 10 } );
addData( "xp_value_craft", "ironchest:copper_chest",									{ "smithing": 10 } );
addData( "req_use", "ironchest:copper_to_iron_chest_upgrade",							{ "building": 20 } );
addData( "req_craft", "ironchest:copper_to_iron_chest_upgrade",							{ "smithing": 20 } );
addData( "xp_value_craft", "ironchest:copper_to_iron_chest_upgrade",					{ "smithing": 20 } );
addData( "req_use", "ironchest:copper_to_silver_chest_upgrade",							{ "building": 20 } );
addData( "req_craft", "ironchest:copper_to_silver_chest_upgrade",						{ "smithing": 20 } );
addData( "xp_value_craft", "ironchest:copper_to_silver_chest_upgrade",					{ "smithing": 20 } );
addData( "req_place", "ironchest:crystal_chest",										{ "building": 50 } );
addData( "req_craft", "ironchest:crystal_chest",										{ "smithing": 50 } );
addData( "req_use", "ironchest:crystal_chest",											{ "building": 50 } );
addData( "xp_value_craft", "ironchest:crystal_chest",									{ "smithing": 50 } );
addData( "req_place", "ironchest:diamond_chest",										{ "building": 40 } );
addData( "req_craft", "ironchest:diamond_chest",										{ "smithing": 40 } );
addData( "req_use", "ironchest:diamond_chest",											{ "building": 40 } );
addData( "xp_value_craft", "ironchest:diamond_chest",									{ "smithing": 40 } );
addData( "req_use", "ironchest:diamond_to_crystal_chest_upgrade",						{ "building": 50 } );
addData( "req_craft", "ironchest:diamond_to_crystal_chest_upgrade",						{ "smithing": 50 } );
addData( "xp_value_craft", "ironchest:diamond_to_crystal_chest_upgrade",				{ "smithing": 50 } );
addData( "req_use", "ironchest:diamond_to_obsidian_chest_upgrade",						{ "building": 50 } );
addData( "req_craft", "ironchest:diamond_to_obsidian_chest_upgrade",					{ "smithing": 50 } );
addData( "xp_value_craft", "ironchest:diamond_to_obsidian_chest_upgrade",				{ "smithing": 50 } );
addData( "req_place", "ironchest:gold_chest",											{ "building": 30 } );
addData( "req_craft", "ironchest:gold_chest",											{ "smithing": 30 } );
addData( "req_use", "ironchest:gold_chest",												{ "building": 30 } );
addData( "xp_value_craft", "ironchest:gold_chest",										{ "smithing": 30 } );
addData( "req_use", "ironchest:gold_to_diamond_chest_upgrade",							{ "building": 40 } );
addData( "req_craft", "ironchest:gold_to_diamond_chest_upgrade",						{ "smithing": 40 } );
addData( "xp_value_craft", "ironchest:gold_to_diamond_chest_upgrade",					{ "smithing": 40 } );
addData( "req_place", "ironchest:iron_chest",											{ "building": 20 } );
addData( "req_craft", "ironchest:iron_chest",											{ "smithing": 20 } );
addData( "req_use", "ironchest:iron_chest",												{ "building": 20 } );
addData( "xp_value_craft", "ironchest:iron_chest",										{ "smithing": 20 } );
addData( "req_use", "ironchest:iron_to_gold_chest_upgrade",								{ "building": 30 } );
addData( "req_craft", "ironchest:iron_to_gold_chest_upgrade",							{ "smithing": 30 } );
addData( "xp_value_craft", "ironchest:iron_to_gold_chest_upgrade",						{ "smithing": 30 } );
addData( "req_place", "ironchest:obsidian_chest",										{ "building": 50 } );
addData( "req_craft", "ironchest:obsidian_chest",										{ "smithing": 50 } );
addData( "req_use", "ironchest:obsidian_chest",											{ "building": 50 } );
addData( "xp_value_craft", "ironchest:obsidian_chest",									{ "smithing": 50 } );
addData( "req_place", "ironchest:silver_chest",											{ "building": 20 } );
addData( "req_craft", "ironchest:silver_chest",											{ "smithing": 20 } );
addData( "req_use", "ironchest:silver_chest",											{ "building": 20 } );
addData( "xp_value_craft", "ironchest:silver_chest",									{ "smithing": 20 } );
addData( "req_use", "ironchest:silver_to_gold_chest_upgrade",							{ "building": 30 } );
addData( "req_craft", "ironchest:silver_to_gold_chest_upgrade",							{ "smithing": 30 } );
addData( "xp_value_craft", "ironchest:silver_to_gold_chest_upgrade",					{ "smithing": 30 } );
addData( "req_use", "ironchest:wood_to_copper_chest_upgrade",							{ "building": 10 } );
addData( "req_craft", "ironchest:wood_to_copper_chest_upgrade",							{ "smithing": 10 } );
addData( "xp_value_craft", "ironchest:wood_to_copper_chest_upgrade",					{ "smithing": 10 } );
addData( "req_use", "ironchest:wood_to_iron_chest_upgrade",								{ "building": 20 } );
addData( "req_craft", "ironchest:wood_to_iron_chest_upgrade",							{ "smithing": 20 } );
addData( "xp_value_craft", "ironchest:wood_to_iron_chest_upgrade",						{ "smithing": 20 } );
}
//LYCANITESMOBS
{
addData( "xp_value_kill", "lycanitesmobs:abaia",										{ "combat": 30 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantcrystal",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstone",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstone_slab",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstone_stairs",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonebrick",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonebrick_fence",					{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonebrick_slab",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonebrick_stairs",					{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonebrick_wall",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonechiseled",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonepillar",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonepolished",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonetile",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonetile_slab",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:aberrantstonetile_stairs",					{ "building": 100 } );
addData( "req_use", "lycanitesmobs:aberrationtreat",									{ "combat": 10, "crafting": 10, "taming": 10 } );
addData( "xp_value_craft", "lycanitesmobs:aberrationtreat",								{ "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:abtu",											{ "combat": 30 } );
addData( "req_use", "lycanitesmobs:acidsplashcharge",									{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:acidsplashcharge",							{ "magic": 100, "taming": 100 } );
addData( "req_use", "lycanitesmobs:aetherwavecharge",									{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:aetherwavecharge",							{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:afrit",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:aglebemu",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:amalgalich",									{ "combat": 900 } );
addData( "xp_value_craft", "lycanitesmobs:amber_cake",									{ "cooking": 50 } );
addData( "req_use", "lycanitesmobs:aquatictreat",										{ "fishing": 10, "taming": 10, "crafting": 10 } );
addData( "xp_value_craft", "lycanitesmobs:aquatictreat",								{ "crafting": 100 } );
addData( "req_use", "lycanitesmobs:arcanelaserstormcharge",								{ "combat": 50, "taming": 30, "magic": 30 } );
addData( "xp_value_craft", "lycanitesmobs:arcanelaserstormcharge",						{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:archvile",										{ "combat": 200 } );
addData( "xp_value_kill", "lycanitesmobs:argus",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:arisaur",										{ "farming": 20 } );
addData( "xp_value_kill", "lycanitesmobs:arix",											{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:arthropodtreat",										{ "cooking": 10, "crafting": 10, "taming": 10 } );
addData( "xp_value_craft", "lycanitesmobs:arthropodtreat",								{ "cooking": 100, "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:asmodeus",										{ "combat": 900 } );
addData( "xp_value_kill", "lycanitesmobs:aspid",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:astaroth",										{ "combat": 200 } );
addData( "req_use", "lycanitesmobs:aviantreat",											{ "cooking": 10, "crafting": 10 } );
addData( "xp_value_craft", "lycanitesmobs:aviantreat",									{ "cooking": 100, "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:banshee",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:barghest",										{ "combat": 10 } );
addData( "xp_value_craft", "lycanitesmobs:battle_burrito",								{ "cooking": 50 } );
addData( "req_use", "lycanitesmobs:beasttreat",											{ "taming": 30, "cooking": 50 } );
addData( "xp_value_craft", "lycanitesmobs:beasttreat",									{ "cooking": 100 } );
addData( "xp_value_kill", "lycanitesmobs:behemoth",										{ "combat": 200 } );
addData( "xp_value_kill", "lycanitesmobs:beholder",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:belph",										{ "combat": 200 } );
addData( "xp_value_craft", "lycanitesmobs:blood_chili",									{ "crafting": 50 } );
addData( "req_use", "lycanitesmobs:bloodleechcharge",									{ "taming": 30, "magic": 50, "combat": 50 } );
addData( "xp_value_craft", "lycanitesmobs:bloodleechcharge",							{ "magic": 100 } );
addData( "req_use", "lycanitesmobs:bloodsummoningstaff",								{ "magic": 50, "magic": 50, "combat": 50 } );
addData( "xp_value_craft", "lycanitesmobs:bloodsummoningstaff",							{ "magic": 100, "magic": 100, "crafting": 100 } );
addData( "req_use", "lycanitesmobs:boulderblastcharge",									{ "mining": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:boulderblastcharge",							{ "smithing": 100 } );
addData( "xp_value_craft", "lycanitesmobs:bulwark_burger",								{ "crafting": 50 } );
addData( "xp_value_kill", "lycanitesmobs:cacodemon",									{ "combat": 200 } );
addData( "xp_value_craft", "lycanitesmobs:caecilian_ramen",								{ "cooking": 50 } );
addData( "xp_value_kill", "lycanitesmobs:calpod",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:chaosorbcharge",										{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:chaosorbcharge",								{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:chupacabra",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:cinder",										{ "combat": 10 } );
addData( "xp_value_craft", "lycanitesmobs:cleansingcrystal",							{ "combat": 90, "crafting": 90 } );
addData( "xp_value_kill", "lycanitesmobs:clink",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:cockatrice",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:conba",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:crusk",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:cryptkeeper",									{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:crystalshardcharge",									{ "taming": 30, "crafting": 50 } );
addData( "xp_value_craft", "lycanitesmobs:crystalshardcharge",							{ "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:darkling",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:dawon",										{ "combat": 10 } );
addData( "xp_value_craft", "lycanitesmobs:demoncrystal",								{ "building": 100 } );
addData( "req_use", "lycanitesmobs:demonicblastcharge",									{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:demonicblastcharge",							{ "magic": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstone",									{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstone_slab",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstone_stairs",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonebrick",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonebrick_fence",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonebrick_slab",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonebrick_stairs",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonebrick_wall",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonechiseled",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonepillar",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonepolished",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonetile",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonetile_slab",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:demonstonetile_stairs",						{ "building": 100 } );
addData( "req_use", "lycanitesmobs:demontreat",											{ "magic": 10, "farming": 10 } );
addData( "xp_value_craft", "lycanitesmobs:demontreat",									{ "magic": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertcrystal",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstone",									{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstone_slab",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstone_stairs",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonebrick",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonebrick_fence",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonebrick_slab",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonebrick_stairs",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonebrick_wall",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonechiseled",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonepillar",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonepolished",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonetile",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonetile_slab",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:desertstonetile_stairs",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:devil_lasagna",								{ "cooking": 50 } );
addData( "req_use", "lycanitesmobs:devilstarcharge",									{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:devilstarcharge",								{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:djinn",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:dragontreat",										{ "combat": 50, "crafting": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:dragontreat",									{ "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:dweller",										{ "combat": 30 } );
addData( "xp_value_kill", "lycanitesmobs:eechetik",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:embercharge",										{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:embercharge",									{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:ent",											{ "woodcutting": 20 } );
addData( "xp_value_kill", "lycanitesmobs:epion",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:equipment_infuser",									{ "combat": 30, "magic": 30, "crafting": 30 } );
addData( "req_use", "lycanitesmobs:equipmentforge_greater",								{ "combat": 70, "crafting": 70 } );
addData( "req_use", "lycanitesmobs:equipmentforge_lesser",								{ "combat": 30, "crafting": 30 } );
addData( "req_use", "lycanitesmobs:equipmentforge_master",								{ "combat": 60, "smithing": 60 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_goldscepterhead",				{ "crafting": 20 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_ironaxehead",					{ "smithing": 60 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_ironhilt",						{ "smithing": 60, "crafting": 60 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_ironpaxel",						{ "smithing": 60 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_ironpikejoint",					{ "smithing": 60 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_ironrod",						{ "smithing": 60, "crafting": 60 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_woodenhilt",					{ "crafting": 60 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_woodenpaxel",					{ "crafting": 60 } );
addData( "xp_value_craft", "lycanitesmobs:equipmentpart_woodenrod",						{ "crafting": 60 } );
addData( "xp_value_kill", "lycanitesmobs:erepede",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:ettin",										{ "combat": 10 } );
addData( "xp_value_craft", "lycanitesmobs:explorers_risotto",							{ "cooking": 50 } );
addData( "xp_value_kill", "lycanitesmobs:eyewig",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:feradon",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:frostboltcharge",									{ "taming": 30, "magic": 20 } );
addData( "xp_value_craft", "lycanitesmobs:frostboltcharge",								{ "magic": 100, "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:frostweaver",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:geist",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:geken",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:geonach",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:ghoul",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:gnekk",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:gorger",										{ "combat": 200 } );
addData( "xp_value_kill", "lycanitesmobs:gorgomite",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:grue",											{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:hellfireballcharge",									{ "taming": 30, "magic": 50 } );
addData( "xp_value_craft", "lycanitesmobs:hellfireballcharge",							{ "taming": 100, "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:herma",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:ignibus",										{ "combat": 500 } );
addData( "xp_value_craft", "lycanitesmobs:immunizer",									{ "combat": 90, "crafting": 90 } );
addData( "req_use", "lycanitesmobs:imptreat",											{ "cooking": 10, "taming": 10 } );
addData( "xp_value_craft", "lycanitesmobs:imptreat",									{ "cooking": 100 } );
addData( "xp_value_kill", "lycanitesmobs:ioray",										{ "combat": 30 } );
addData( "xp_value_kill", "lycanitesmobs:jabberwock",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:jengu",										{ "combat": 30 } );
addData( "xp_value_kill", "lycanitesmobs:joustalpha",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:khalk",										{ "combat": 200 } );
addData( "xp_value_kill", "lycanitesmobs:kobold",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:krake",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:lacedon",										{ "combat": 30 } );
addData( "xp_value_craft", "lycanitesmobs:lapis_fish_and_chips",						{ "cooking": 50 } );
addData( "req_use", "lycanitesmobs:lifedraincharge",									{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:lifedraincharge",								{ "magic": 100 } );
addData( "req_use", "lycanitesmobs:lightballcharge",									{ "combat": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:lightballcharge",								{ "combat": 100 } );
addData( "xp_value_kill", "lycanitesmobs:lobber",										{ "combat": 200 } );
addData( "req_use", "lycanitesmobs:lobdarklingscharge",									{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:lobdarklingscharge",							{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:lurker",										{ "combat": 10 } );
addData( "xp_value_craft", "lycanitesmobs:lushcrystal",									{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstone",									{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstone_slab",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstone_stairs",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonebrick",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonebrick_fence",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonebrick_slab",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonebrick_stairs",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonebrick_wall",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonechiseled",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonepillar",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonepolished",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonetile",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonetile_slab",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:lushstonetile_stairs",						{ "building": 100 } );
addData( "xp_value_kill", "lycanitesmobs:makaalpha",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:manticore",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:maug",											{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:morock",										{ "combat": 250 } );
addData( "xp_value_craft", "lycanitesmobs:moss_pie",									{ "cooking": 50 } );
addData( "xp_value_craft", "lycanitesmobs:pale_soup",									{ "cooking": 50 } );
addData( "xp_value_craft", "lycanitesmobs:paleo_salad",									{ "cooking": 50 } );
addData( "xp_value_craft", "lycanitesmobs:peaks_kebab",									{ "cooking": 50 } );
addData( "xp_value_kill", "lycanitesmobs:pinky",										{ "combat": 200 } );
addData( "xp_value_kill", "lycanitesmobs:pixen",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:planttreat",											{ "farming": 50, "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:planttreat",									{ "farming": 100, "magic": 100 } );
addData( "xp_value_craft", "lycanitesmobs:propolis",									{ "building": 100 } );
addData( "xp_value_kill", "lycanitesmobs:quetzodracl",									{ "combat": 30 } );
addData( "xp_value_kill", "lycanitesmobs:quillbeast",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:rahovart",										{ "combat": 900 } );
addData( "xp_value_kill", "lycanitesmobs:raiko",										{ "combat": 30 } );
addData( "xp_value_kill", "lycanitesmobs:reaper",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:reiver",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:remobra",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:roa",											{ "combat": 30 } );
addData( "xp_value_kill", "lycanitesmobs:roc",											{ "combat": 30 } );
addData( "xp_value_kill", "lycanitesmobs:salamander",									{ "combat": 200 } );
addData( "req_use", "lycanitesmobs:savagesummoningstaff",								{ "magic": 50, "taming": 30, "combat": 50 } );
addData( "xp_value_craft", "lycanitesmobs:savagesummoningstaff",						{ "magic": 100, "crafting": 100 } );
addData( "xp_value_craft", "lycanitesmobs:searing_taco",								{ "cooking": 50 } );
addData( "xp_value_craft", "lycanitesmobs:seashell_maki",								{ "crafting": 50 } );
addData( "xp_value_kill", "lycanitesmobs:serpix",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:shade",										{ "combat": 10 } );
addData( "xp_value_craft", "lycanitesmobs:shadowcrystal",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstone",									{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstone_slab",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstone_stairs",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonebrick",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonebrick_fence",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonebrick_slab",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonebrick_stairs",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonebrick_wall",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonechiseled",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonepillar",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonepolished",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonetile",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonetile_slab",						{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:shadowstonetile_stairs",						{ "building": 100 } );
addData( "xp_value_kill", "lycanitesmobs:shambler",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:skylus",										{ "combat": 30 } );
addData( "xp_value_craft", "lycanitesmobs:soulcubeaberrant",							{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:soulcubedemonic",								{ "building": 100 } );
addData( "xp_value_craft", "lycanitesmobs:soulcubeundead",								{ "building": 100 } );
addData( "req_use", "lycanitesmobs:soulgazer",											{ "crafting": 50, "combat": 50 } );
addData( "xp_value_craft", "lycanitesmobs:soulgazer",									{ "crafting": 100 } );
addData( "req_use", "lycanitesmobs:soulkey",											{ "crafting": 60, "combat": 60 } );
addData( "xp_value_craft", "lycanitesmobs:soulkey",										{ "crafting": 200 } );
addData( "req_use", "lycanitesmobs:soulkeydiamond",										{ "crafting": 50, "combat": 50 } );
addData( "xp_value_craft", "lycanitesmobs:soulkeydiamond",								{ "crafting": 100 } );
addData( "req_use", "lycanitesmobs:soulkeyemerald",										{ "crafting": 60, "combat": 60 } );
addData( "xp_value_craft", "lycanitesmobs:soulkeyemerald",								{ "crafting": 150 } );
addData( "req_use", "lycanitesmobs:soulstone",											{ "taming": 30, "crafting": 50, "magic": 30 } );
addData( "xp_value_craft", "lycanitesmobs:soulstone",									{ "taming": 100, "crafting": 100, "magic": 100 } );
addData( "req_use", "lycanitesmobs:spectralboltcharge",									{ "taming": 30, "magic": 50 } );
addData( "xp_value_craft", "lycanitesmobs:spectralboltcharge",							{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:spectre",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:spriggan",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:stablesummoningstaff",								{ "taming": 30, "crafting": 50 } );
addData( "xp_value_craft", "lycanitesmobs:stablesummoningstaff",						{ "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:strider",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:sturdysummoningstaff",								{ "smithing": 50, "taming": 30, "magic": 30 } );
addData( "xp_value_craft", "lycanitesmobs:sturdysummoningstaff",						{ "smithing": 100, "magic": 100 } );
addData( "xp_value_craft", "lycanitesmobs:summoningpedestal",							{ "building": 100 } );
addData( "req_use", "lycanitesmobs:summoningstaff",										{ "magic": 10 } );
addData( "xp_value_craft", "lycanitesmobs:summoningstaff",								{ "magic": 100, "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:sutiramu",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:sylph",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:tarantula",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:thresher",										{ "combat": 30 } );
addData( "req_use", "lycanitesmobs:throwingscythecharge",								{ "crafting": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:throwingscythecharge",						{ "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:treant",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:tremor",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:triffid",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:trite",										{ "combat": 200 } );
addData( "xp_value_kill", "lycanitesmobs:troll",										{ "combat": 10 } );
addData( "xp_value_craft", "lycanitesmobs:tropical_curry",								{ "cooking": 50 } );
addData( "req_use", "lycanitesmobs:tundracharge",										{ "taming": 30, "magic": 20 } );
addData( "xp_value_craft", "lycanitesmobs:tundracharge",								{ "magic": 100, "magic": 100 } );
addData( "req_use", "lycanitesmobs:undeadtreat",										{ "combat": 10, "crafting": 10, "taming": 10 } );
addData( "xp_value_craft", "lycanitesmobs:undeadtreat",									{ "crafting": 100 } );
addData( "xp_value_kill", "lycanitesmobs:uvaraptor",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:vapula",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:venomshotcharge",									{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:venomshotcharge",								{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:ventoraptor",									{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:vespid",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:vespidqueen",									{ "combat": 10 } );
addData( "xp_value_craft", "lycanitesmobs:veswax",										{ "building": 100 } );
addData( "xp_value_kill", "lycanitesmobs:volcan",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:warg",											{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:wendigo",										{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:whirlwindcharge",									{ "magic": 50, "taming": 30 } );
addData( "xp_value_craft", "lycanitesmobs:whirlwindcharge",								{ "magic": 100 } );
addData( "xp_value_kill", "lycanitesmobs:wildkin",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:wisp",											{ "combat": 10 } );
addData( "req_use", "lycanitesmobs:wormtreat",											{ "farming": 50, "taming": 30, "cooking": 35 } );
addData( "xp_value_craft", "lycanitesmobs:wormtreat",									{ "farming": 100, "cooking": 100 } );
addData( "xp_value_kill", "lycanitesmobs:wraamon",										{ "combat": 250 } );
addData( "xp_value_kill", "lycanitesmobs:wraith",										{ "combat": 200 } );
addData( "xp_value_kill", "lycanitesmobs:xaphan",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:zephyr",										{ "combat": 10 } );
addData( "xp_value_kill", "lycanitesmobs:zoataur",										{ "combat": 100 } );
}
//MEKANISM
{
addData( "xp_value_smelt", "mekanism:dust_netherite",						{ "smithing": 60} );
addData( "xp_value_smelt", "mekanism:dust_osmium",							{ "smithing": 8} );
addData( "xp_value_smelt", "mekanism:dust_quartz",							{ "smithing": 16} );
addData( "info_ore", "mekanism:fluorite_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "mekanism:fluorite_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "mekanism:fluorite_ore",							{ "mining": 10} );
addData( "xp_value_smelt", "mekanism:fluorite_ore",							{ "smithing": 15} );
addData( "info_ore", "mekanism:osmium_ore",							{ "extraChance": 0.5} );
addData( "info_smelt", "mekanism:osmium_ore",							{ "extraChance": 0.75} );
addData( "xp_value_break", "mekanism:osmium_ore",							{ "mining": 16} );
addData( "xp_value_smelt", "mekanism:osmium_ore",							{ "smithing": 12} );
}
//MEKANISMTOOLS
{
addData2( "salvage", "mekanismtools:bronze_axe", "thermal:bronze_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_boots", "thermal:bronze_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_chestplate", "thermal:bronze_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_helmet", "thermal:bronze_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_hoe", "thermal:bronze_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_horse_armor", "thermal:bronze_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_leggings", "thermal:bronze_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_pickaxe", "thermal:bronze_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_shovel", "thermal:bronze_ingot",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:bronze_sword", "thermal:bronze_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:lapis_lazuli_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_boots", "minecraft:lapis_lazuli",
{
	"salvageMax": 4,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_chestplate", "minecraft:lapis_lazuli",
{
	"salvageMax": 8,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_helmet", "minecraft:lapis_lazuli",
{
	"salvageMax": 5,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_horse_armor", "minecraft:lapis_lazuli",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_leggings", "minecraft:lapis_lazuli",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 75,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:lapis_lazuli_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
});
addData2( "salvage", "mekanismtools:osmium_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_boots", "mekanism:ingot_osmium",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_chestplate", "mekanism:ingot_osmium",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_helmet", "mekanism:ingot_osmium",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_horse_armor", "mekanism:ingot_osmium",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_leggings", "mekanism:ingot_osmium",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:osmium_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:refined_glowstone_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_boots", "mekanism:ingot_refined_glowstone",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_chestplate", "mekanism:ingot_refined_glowstone",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_helmet", "mekanism:ingot_refined_glowstone",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_horse_armor", "mekanism:ingot_refined_glowstone",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_leggings", "mekanism:ingot_refined_glowstone",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_glowstone_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_boots", "mekanism:ingot_refined_obsidian",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_chestplate", "mekanism:ingot_refined_obsidian",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_helmet", "mekanism:ingot_refined_obsidian",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_horse_armor", "mekanism:ingot_refined_obsidian",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_leggings", "mekanism:ingot_refined_obsidian",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:refined_obsidian_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 45
});
addData2( "salvage", "mekanismtools:steel_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_boots", "mekanism:ingot_steel",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_chestplate", "mekanism:ingot_steel",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_helmet", "mekanism:ingot_steel",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_horse_armor", "mekanism:ingot_steel",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_leggings", "mekanism:ingot_steel",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "mekanismtools:steel_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
}
//MINECOLONIES
{
addData( "req_use", "minecolonies:blockhuttownhall",									{ "mining": 15, "woodcutting": 15, "excavation": 15, "building": 15, "farming": 15, "fishing": 15, "combat": 15, "smithing": 15, "crafting": 15, "cooking": 15 } );
addData( "req_weapon", "minecolonies:chiefsword",										{ "combat": 35 } );
addData( "req_weapon", "minecolonies:iron_scimitar",									{ "combat": 15 } );
addData( "req_weapon", "minecolonies:pharaoscepter",									{ "archery": 75 } );
addData( "req_wear", "minecolonies:pirate_boots",										{ "endurance": 30 } );
addData( "req_wear", "minecolonies:pirate_cap",											{ "endurance": 45 } );
addData( "req_wear", "minecolonies:pirate_chest",										{ "endurance": 45 } );
addData( "req_wear", "minecolonies:pirate_hat",											{ "endurance": 30 } );
addData( "req_wear", "minecolonies:pirate_leggins",										{ "endurance": 30 } );
addData( "req_wear", "minecolonies:pirate_legs",										{ "endurance": 45 } );
addData( "req_wear", "minecolonies:pirate_shoes",										{ "endurance": 45 } );
addData( "req_wear", "minecolonies:pirate_top",											{ "endurance": 30 } );
}
//MINECRAFT
{
addData( "xp_value_break", "minecraft:acacia_leaves",									{ "woodcutting": 1.1 } );
addData( "xp_value_break", "minecraft:acacia_log",										{ "woodcutting": 14 } );
addData( "xp_value_smelt", "minecraft:acacia_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "minecraft:acacia_log",											{ "extraChance": 1 } );
addData( "info_log", "minecraft:acacia_log",											{ "extraChance": 1.25 } );
addData( "xp_value_break", "minecraft:acacia_planks",									{ "woodcutting": 5 } );
addData( "req_place", "minecraft:acacia_sapling",										{ "farming": 10, "woodcutting": 15 } );
addData( "xp_value_break", "minecraft:acacia_sapling",									{ "woodcutting": 26 } );
addData( "xp_value_grow", "minecraft:acacia_sapling",									{ "farming": 30 } );
addData( "xp_value_break", "minecraft:acacia_wood",										{ "woodcutting": 14 } );
addData( "info_log", "minecraft:acacia_wood",											{ "extraChance": 1.25 } );
addData( "xp_value_break", "minecraft:allium",											{ "farming": 12.5 } );
addData( "xp_value_smelt", "minecraft:ancient_debris",									{ "smithing": 60 } );
addData( "info_smelt", "minecraft:ancient_debris",										{ "extraChance": 0.33 } );
addData( "xp_value_break", "minecraft:andesite",										{ "mining": 0.5 } );
addData2( "salvage", "minecraft:andesite", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 50,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData( "xp_value_craft", "minecraft:anvil",											{ "crafting": 310, "smithing": 62 } );
addData2( "salvage", "minecraft:anvil", "minecraft:iron_block",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 30
} );
addData( "xp_value_break", "minecraft:azure_bluet",										{ "farming": 4.5 } );
addData( "xp_value_break", "minecraft:bamboo",											{ "farming": 0.2, "woodcutting": 0.4 } );
addData( "xp_value_grow", "minecraft:bamboo",											{ "farming": 1.2 } );
addData( "block_specific", "minecraft:bamboo",											{ "growsUpwards": 1 } );
addData( "block_specific", "minecraft:bamboo_sapling",									{ "growsUpwards": 1 } );
addData( "info_plant", "minecraft:bamboo",												{ "extraChance": 0.35 } );
addData( "xp_bonus_biome", "minecraft:bamboo_jungle",									{ "agility": 25, "swimming": 25, "fishing": 25, "combat": 10, "archery": 35, "woodcutting": -25, "farming": -25 } );
addData( "biome_effect_negative", "minecraft:bamboo_jungle",							{ "minecraft:slowness": 0, "minecraft:weakness": 0 } );
addData( "biome_mob_multiplier", "minecraft:bamboo_jungle",								{ "speedBonus": 1.5, "hpBonus": 1.25 } );
addData( "xp_bonus_biome", "minecraft:bamboo_jungle_hills",								{ "agility": 25, "swimming": 25, "fishing": 25, "combat": 10, "archery": 35, "woodcutting": -75, "farming": -75 } );
addData( "biome_effect_negative", "minecraft:bamboo_jungle_hills",						{ "minecraft:slowness": 0, "minecraft:weakness": 0 } );
addData( "biome_mob_multiplier", "minecraft:bamboo_jungle_hills",						{ "speedBonus": 1.5, "hpBonus": 1.25 } );
addData( "xp_value_break", "minecraft:bamboo_sapling",									{ "farming": 0.2, "woodcutting": 0.4 } );
addData( "xp_value_grow", "minecraft:bamboo_sapling",									{ "farming": 1.2 } );
addData( "fish_enchant_pool", "minecraft:bane_of_arthropods",							{ "levelReq": 15, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 90, "maxLevel": 10 } );
addData( "biome_mob_multiplier", "minecraft:beach",										{ "speedBonus": 0.75, "hpBonus": 0.75, "damageBonus": 0.75 } );
addData( "xp_value_craft", "minecraft:beacon",											{ "crafting": 1000 } );
addData2( "salvage", "minecraft:beacon", "minecraft:obsidian",
{
	"salvageMax": 3,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 90,
	"xpPerItem": 3.5,
	"levelReq": 30
});
addData2( "salvage", "minecraft:beacon", "minecraft:nether_star",
{
	"salvageMax": 1,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 666,
	"levelReq": 50
});
addData( "xp_value_break", "minecraft:bedrock",											{ "mining": 9001 } );
addData2( "salvage", "minecraft:bedrock", "minecraft:nether_star",
{
	"salvageMax": 666,
	"baseChance": 0.01,
	"chancePerLevel": 0,
	"maxChance": 0.01,
	"xpPerItem": 200,
	"levelReq": 99
} );
addData( "xp_value_break", "minecraft:beetroot",										{ "farming": 1.5 } );
addData( "xp_value_grow", "minecraft:beetroot",											{ "farming": 12 } );
addData( "info_plant", "minecraft:beetroot",											{ "extraChance": 1 } );
addData2( "salvage", "minecraft:beetroot", "minecraft:beetroot_seeds",
{
	"salvageMax": 3,
	"baseChance": 20,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 1,
	"levelReq": 1
} );
addData( "xp_value_break", "minecraft:beetroots",										{ "farming": 1.5 } );
addData( "xp_value_grow", "minecraft:beetroots",										{ "farming": 12 } );
addData( "xp_value_break", "minecraft:birch_leaves",									{ "woodcutting": 0.7 } );
addData( "xp_value_break", "minecraft:birch_log",										{ "woodcutting": 12 } );
addData( "xp_value_smelt", "minecraft:birch_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "minecraft:birch_log",											{ "extraChance": 1 } );
addData( "info_log", "minecraft:birch_log",												{ "extraChance": 0.85 } );
addData( "xp_value_break", "minecraft:birch_planks",									{ "woodcutting": 5 } );
addData( "req_place", "minecraft:birch_sapling",										{ "farming": 10, "woodcutting": 15 } );
addData( "xp_value_break", "minecraft:birch_sapling",									{ "woodcutting": 12 } );
addData( "xp_value_grow", "minecraft:birch_sapling",									{ "farming": 20 } );
addData( "xp_value_break", "minecraft:birch_wood",										{ "woodcutting": 12 } );
addData( "info_log", "minecraft:birch_wood",											{ "extraChance": 0.85 } );
addData( "xp_value_smelt", "minecraft:black_terracotta",								{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:black_terracotta",									{ "extraChance": 1.5 } );
addData( "req_use", "minecraft:blast_furnace",											{ "smithing": 10 } );
addData( "req_craft", "minecraft:blast_furnace",										{ "crafting": 10 } );
addData( "req_place", "minecraft:blast_furnace",										{ "building": 10 } );
addData( "xp_value_craft", "minecraft:blast_furnace",									{ "crafting": 61 } );
addData2( "salvage", "minecraft:blast_furnace", "minecraft:iron_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "minecraft:activator_rail", "minecraft:iron_ingot",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "minecraft:detector_rail", "minecraft:iron_ingot",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData2( "salvage", "minecraft:powered_rail", "minecraft:gold_ingot",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "fish_enchant_pool", "minecraft:blast_protection",								{ "levelReq": 25, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 80, "maxLevel": 8 } );
addData( "xp_value_kill", "minecraft:blaze",											{ "combat": 30 } );
addData( "xp_value_brew", "minecraft:blaze_powder",										{ "alchemy": 9 } );
addData( "info_brew", "minecraft:blaze_powder",											{ "extraChance": 0.35 } );
addData2( "salvage", "minecraft:blue_ice", "minecraft:packed_ice",
{
	"salvageMax": 9,
	"baseChance": 35,
	"chancePerLevel": 0.75,
	"maxChance": 90,
	"xpPerItem": 0.5,
	"levelReq": 5
} );
addData( "xp_value_break", "minecraft:blue_orchid",										{ "farming": 20 } );
addData( "xp_value_smelt", "minecraft:blue_terracotta",									{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:blue_terracotta",										{ "extraChance": 1.5 } );
addData( "xp_value_craft", "minecraft:bone",											{ "crafting": 0 } );
addData( "xp_value_craft", "minecraft:bone_block",										{ "crafting": 0 } );
addData( "xp_value_break", "minecraft:bone_block",										{ "excavation": 15 } );
addData2( "salvage", "minecraft:bone_block", "minecraft:bone",
{
	"salvageMax": 3,
	"baseChance": 20,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2,
	"levelReq": 8
} );
// addData2( "salvage", "minecraft:enchanted_book", "minecraft:book",
// {
// 	"salvageMax": 1,
// 	"baseChance": 30,
// 	"chancePerLevel": 2,
// 	"maxChance": 90,
// 	"xpPerItem": 5,
// 	"levelReq": 1
// });
addData2( "salvage", "minecraft:book", "minecraft:paper",
{
	"salvageMax": 3,
	"baseChance": 30,
	"chancePerLevel": 2,
	"maxChance": 90,
	"xpPerItem": 5,
	"levelReq": 1
});
addData( "xp_value_break", "minecraft:bookshelf",										{ "woodcutting": 50 } );
addData2( "treasure", "minecraft:bookshelf", "minecraft:music_disc_pigstep",
{
	"startChance": 0.05,
	"startLevel": 1,
	"endChance": 0.2,
	"endLevel": 100,
	"xpPerItem": 12.5,
	"minCount": 1,
	"maxCount": 1
} );
addData( "req_weapon", "minecraft:bow",									{ "archery": 1, "agility": 20} );
addData( "item_specific", "minecraft:bow",												{ "archeryWeapon": 1} );
addData2( "salvage", "minecraft:bow", "minecraft:string",
{
	"salvageMax": 3,
	"baseChance": 60,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 7,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:bow",													{ "startWeight": 100, "startLevel": 1, "endWeight": 25, "endLevel": 80, "xp": 35, "enchantLevelReq": 10 } );
addData2( "salvage", "minecraft:brewing_stand", "minecraft:blaze_rod",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 25
} );
addData2( "salvage", "minecraft:bricks", "minecraft:brick",
{
	"salvageMax": 4,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 2,
	"levelReq": 3
} );
addData( "xp_value_break", "minecraft:brown_mushroom",									{ "farming": 10 } );
addData( "xp_value_break", "minecraft:brown_mushroom_block",							{ "farming": 3 } );
addData( "xp_value_smelt", "minecraft:brown_terracotta",								{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:brown_terracotta",									{ "extraChance": 1.5 } );
addData( "xp_value_craft", "minecraft:bucket",											{ "crafting": 30 } );
addData2( "salvage", "minecraft:bucket", "minecraft:iron_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "xp_value_break", "minecraft:cactus",											{ "farming": 2 } );
addData( "xp_value_grow", "minecraft:cactus",											{ "farming": 6 } );
addData( "block_specific", "minecraft:cactus",											{ "growsUpwards": 1 } );
addData( "xp_value_cook", "minecraft:cactus",											{ "cooking": 12.5, "crafting": 4 } );
addData( "info_cook", "minecraft:cactus",												{ "extraChance": 2 } );
addData( "info_plant", "minecraft:cactus",												{ "extraChance": 0.45 } );
addData( "xp_value_craft", "minecraft:cake",											{ "cooking": 45 } );
addData( "xp_value_break", "minecraft:carrot",											{ "farming": 1 } );
addData( "xp_value_grow", "minecraft:carrot",											{ "farming": 8 } );
addData( "info_plant", "minecraft:carrot",												{ "extraChance": 1.5 } );
addData( "xp_value_break", "minecraft:carrots",											{ "farming": 1 } );
addData( "xp_value_grow", "minecraft:carrots",											{ "farming": 8 } );
addData( "info_plant", "minecraft:carrots",												{ "extraChance": 1.5 } );
addData( "xp_bonus_worn", "minecraft:carved_pumpkin",									{ "combat": 5 } );
addData( "xp_value_craft", "minecraft:cauldron",										{ "crafting": 70 } );
addData( "block_specific", "minecraft:smithing_table",									{ "salvageStation": 1 } );
addData( "block_specific", "minecraft:bedrock",											{ "salvageStation": 1 } );
addData2( "salvage", "minecraft:cauldron", "minecraft:iron_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 30
} );
addData( "xp_value_kill", "minecraft:cave_spider",										{ "combat": 25 } );
addData( "req_wear", "minecraft:chainmail_boots",										{ "endurance": 20 } );
addData( "xp_bonus_worn", "minecraft:chainmail_boots",									{ "combat": 5 } );
addData( "xp_value_smelt", "minecraft:chainmail_boots",									{ "smithing": 6 } );
addData( "info_smelt", "minecraft:chainmail_boots",										{ "extraChance": 15 } );
addData2( "salvage", "minecraft:chainmail_boots", "minecraft:iron_ingot",
{
	"salvageMax": 4,
	"baseChance": 35,
	"chancePerLevel": 1.25,
	"maxChance": 90,
	"xpPerItem": 50,
	"levelReq": 20
} );
addData( "fish_pool", "minecraft:chainmail_boots",										{ "startWeight": 50, "startLevel": 15, "endWeight": 15, "endLevel": 80, "xp": 35, "enchantLevelReq": 10 } );
addData( "req_wear", "minecraft:chainmail_chestplate",									{ "endurance": 20 } );
addData( "xp_bonus_worn", "minecraft:chainmail_chestplate",								{ "combat": 5 } );
addData( "xp_value_smelt", "minecraft:chainmail_chestplate",							{ "smithing": 12 } );
addData( "info_smelt", "minecraft:chainmail_chestplate",								{ "extraChance": 15 } );
addData2( "salvage", "minecraft:chainmail_chestplate", "minecraft:iron_ingot",
{
	"salvageMax": 8,
	"baseChance": 35,
	"chancePerLevel": 1.25,
	"maxChance": 90,
	"xpPerItem": 50,
	"levelReq": 20
} );
addData( "fish_pool", "minecraft:chainmail_chestplate",									{ "startWeight": 50, "startLevel": 15, "endWeight": 15, "endLevel": 80, "xp": 35, "enchantLevelReq": 10 } );
addData( "req_wear", "minecraft:chainmail_helmet",										{ "endurance": 20 } );
addData( "xp_bonus_worn", "minecraft:chainmail_helmet",									{ "combat": 5 } );
addData( "xp_value_smelt", "minecraft:chainmail_helmet",								{ "smithing": 7.5 } );
addData( "info_smelt", "minecraft:chainmail_helmet",									{ "extraChance": 15 } );
addData2( "salvage", "minecraft:chainmail_helmet", "minecraft:iron_ingot",
{
	"salvageMax": 5,
	"baseChance": 35,
	"chancePerLevel": 1.25,
	"maxChance": 90,
	"xpPerItem": 50,
	"levelReq": 20
} );
addData( "fish_pool", "minecraft:chainmail_helmet",										{ "startWeight": 50, "startLevel": 15, "endWeight": 15, "endLevel": 80, "xp": 35, "enchantLevelReq": 10 } );
addData( "req_wear", "minecraft:chainmail_leggings",									{ "endurance": 20 } );
addData( "xp_bonus_worn", "minecraft:chainmail_leggings",								{ "combat": 5 } );
addData( "xp_value_smelt", "minecraft:chainmail_leggings",								{ "smithing": 10.5 } );
addData( "info_smelt", "minecraft:chainmail_leggings",									{ "extraChance": 15 } );
addData2( "salvage", "minecraft:chainmail_leggings", "minecraft:iron_ingot",
{
	"salvageMax": 7,
	"baseChance": 35,
	"chancePerLevel": 1.25,
	"maxChance": 90,
	"xpPerItem": 50,
	"levelReq": 20
} );
addData( "fish_pool", "minecraft:chainmail_leggings",									{ "startWeight": 50, "startLevel": 15, "endWeight": 15, "endLevel": 80, "xp": 35, "enchantLevelReq": 10 } );
addData( "fish_enchant_pool", "minecraft:channeling",									{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "info_smelt", "minecraft:charcoal",							{ "extraChance": 1} );
addData( "xp_value_smelt", "minecraft:charcoal",							{ "smithing": 8} );
addData2( "salvage", "minecraft:chest", "minecraft:oak_planks",
{
	"salvageMax": 8,
	"baseChance": 40,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 0.8,
	"levelReq": 10
} );
addData( "xp_value_breed", "minecraft:chicken",											{ "farming": 10 } );
addData( "mob_rare_drop", "minecraft:chicken",											{ "minecraft:egg": 10 } );
addData2( "salvage", "minecraft:chipped_anvil", "minecraft:iron_block",
{
	"salvageMax": 2,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 20
} );
addData( "xp_value_break", "minecraft:chorus_flower",									{ "farming": 35 } );
addData( "xp_value_cook", "minecraft:chorus_fruit",										{ "cooking": 25, "crafting": 22.5 } );
addData( "info_cook", "minecraft:chorus_fruit",											{ "extraChance": 0.33 } );
addData( "xp_value_break", "minecraft:chorus_plant",									{ "farming": 2.5 } );
addData( "xp_value_break", "minecraft:clay",											{ "excavation": 5 } );
addData( "xp_value_smelt", "minecraft:clay",											{ "smithing": 6, "crafting": 14 } );
addData( "info_smelt", "minecraft:clay",												{ "extraChance": 0.5 } );
addData( "xp_value_break", "minecraft:clay_ball",										{ "excavation": 5 } );
addData( "xp_value_smelt", "minecraft:clay_ball",										{ "smithing": 1.5, "crafting": 3.5 } );
addData( "info_smelt", "minecraft:clay_ball",											{ "extraChance": 0.5 } );
addData( "xp_value_craft", "minecraft:clock",											{ "crafting": 125 } );
addData2( "salvage", "minecraft:clock", "minecraft:redstone",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 20
} );
addData2( "salvage", "minecraft:clock", "minecraft:gold_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
} );
addData( "xp_value_craft", "minecraft:coal",											{ "crafting": 0 } );
addData( "info_smelt", "minecraft:coal",								{ "extraChance": 1} );
addData( "xp_value_smelt", "minecraft:coal",								{ "smithing": 8} );
addData( "xp_value_craft", "minecraft:coal_block",										{ "crafting": 0 } );
addData( "xp_value_break", "minecraft:coarse_dirt",										{ "excavation": 1.7 } );
addData( "xp_value_break", "minecraft:cobblestone",										{ "mining": 0.5 } );
addData( "xp_value_smelt", "minecraft:cobblestone",										{ "smithing": 0.5 } );
addData( "info_smelt", "minecraft:cobblestone",											{ "extraChance": 1 } );
addData2( "salvage", "minecraft:cobblestone_wall", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 20,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 1.25,
	"levelReq": 5
} );
addData( "xp_value_break", "minecraft:cobweb",											{ "farming": 5 } );
addData( "xp_value_break", "minecraft:cocoa",											{ "farming": 2 } );
addData( "xp_value_grow", "minecraft:cocoa",											{ "farming": 17 } );
addData( "info_plant", "minecraft:cocoa_beans",											{ "extraChance": 1.5 } );
addData( "xp_value_general", "minecraft:cod",											{ "fishing": 20 } );
addData( "req_biome", "minecraft:cold_ocean",											{ "swimming": 25, "endurance": 15 } );
addData( "xp_bonus_biome", "minecraft:cold_ocean",										{ "swimming": 50, "fishing": 30 } );
addData( "biome_effect_negative", "minecraft:cold_ocean",								{ "minecraft:slowness": 1, "minecraft:weakness": 0 } );
addData( "xp_value_craft", "minecraft:compass",											{ "crafting": 45 } );
addData2( "salvage", "minecraft:compass", "minecraft:redstone",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 15
});
addData2( "salvage", "minecraft:compass", "minecraft:iron_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 20,
	"levelReq": 15
});
addData2( "salvage", "minecraft:conduit", "minecraft:heart_of_the_sea",
{
	"salvageMax": 1,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 100,
	"xpPerItem": 50,
	"levelReq": 25
} );
addData( "xp_value_craft", "minecraft:cookie",											{ "cooking": 0.75 } );
addData( "xp_value_break", "minecraft:cornflower",										{ "farming": 5.5 } );
addData( "xp_value_breed", "minecraft:cow",												{ "farming": 35 } );
addData( "xp_value_kill", "minecraft:creeper",											{ "combat": 25 } );
addData( "item_specific", "minecraft:crossbow",											{ "archeryWeapon": 1} );
addData( "req_weapon", "minecraft:crossbow",											{ "archery": 10 } );
addData( "xp_value_craft", "minecraft:crossbow",										{ "crafting": 20, "smithing": 10 } );
addData( "xp_value_smelt", "minecraft:cyan_terracotta",									{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:cyan_terracotta",										{ "extraChance": 1.5 } );
addData2( "salvage", "minecraft:damaged_anvil", "minecraft:iron_block",
{
	"salvageMax": 1,
	"baseChance": 5,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "xp_value_break", "minecraft:dandelion",										{ "farming": 8 } );
addData( "xp_value_break", "minecraft:dark_oak_leaves",									{ "woodcutting": 0.6 } );
addData( "xp_value_break", "minecraft:dark_oak_log",									{ "woodcutting": 7 } );
addData( "xp_value_smelt", "minecraft:dark_oak_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "minecraft:dark_oak_log",										{ "extraChance": 1 } );
addData( "info_log", "minecraft:dark_oak_log",											{ "extraChance": 0.5 } );
addData( "xp_value_break", "minecraft:dark_oak_planks",									{ "woodcutting": 5 } );
addData( "req_place", "minecraft:dark_oak_sapling",										{ "farming": 10, "woodcutting": 25 } );
addData( "xp_value_break", "minecraft:dark_oak_sapling",								{ "woodcutting": 18 } );
addData( "xp_value_grow", "minecraft:dark_oak_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "minecraft:dark_oak_wood",									{ "woodcutting": 7 } );
addData( "info_log", "minecraft:dark_oak_wood",											{ "extraChance": 0.5 } );
addData( "xp_value_break", "minecraft:dark_prismarine",									{ "mining": 3.5 } );
addData2( "salvage", "minecraft:dark_prismarine", "minecraft:prismarine_shard",
{
	"salvageMax": 8,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 1,
	"levelReq": 15
} );
addData2( "salvage", "minecraft:dark_scoria", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 55,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData2( "salvage", "minecraft:daylight_detector", "minecraft:quartz",
{
	"salvageMax": 3,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 90,
	"xpPerItem": 4.5,
	"levelReq": 15
} );
addData( "xp_value_break", "minecraft:dead_bush",										{ "farming": 5 } );
addData( "req_biome", "minecraft:deep_frozen_ocean",									{ "swimming": 35, "endurance": 25 } );
addData( "xp_bonus_biome", "minecraft:deep_frozen_ocean",								{ "swimming": 100, "fishing": 50 } );
addData( "biome_effect_negative", "minecraft:deep_frozen_ocean",						{ "minecraft:slowness": 3, "minecraft:weakness": 2 } );
addData( "req_biome", "minecraft:deep_ocean",											{ "swimming": 15 } );
addData( "xp_bonus_biome", "minecraft:deep_ocean",										{ "swimming": 50, "fishing": 20 } );
addData( "biome_effect_negative", "minecraft:deep_ocean",								{ "minecraft:slowness": 0 } );
addData( "fish_enchant_pool", "minecraft:depth_strider",								{ "levelReq": 20, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 90, "maxLevel": 5 } );
addData( "xp_bonus_biome", "minecraft:desert",											{ "excavation": 10, "farming": -15 } );
addData( "biome_mob_multiplier", "minecraft:desert",									{ "speedBonus": 0.75, "hpBonus": 0.75, "damageBonus": 0.75 } );
addData( "xp_value_craft", "minecraft:diamond",											{ "crafting": 0 } );
addData( "req_tool", "minecraft:diamond_axe",											{ "woodcutting": 40 } );
addData( "req_weapon", "minecraft:diamond_axe",											{ "combat": 45 } );
addData( "xp_value_craft", "minecraft:diamond_axe",										{ "crafting": 180, "smithing": 36 } );
addData2( "salvage", "minecraft:diamond_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
} );
addData2( "salvage", "minecraft:diamond_axe", "minecraft:diamond",
{
	"salvageMax": 3,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
});
addData( "fish_pool", "minecraft:diamond_axe",											{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData( "xp_value_craft", "minecraft:diamond_block",									{ "crafting": 0 } );
addData( "req_wear", "minecraft:diamond_boots",											{ "endurance": 40 } );
addData( "xp_bonus_worn", "minecraft:diamond_boots",									{ "magic": 2.5 } );
addData2( "salvage", "minecraft:diamond_boots", "minecraft:diamond",
{
	"salvageMax": 4,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
} );
addData( "fish_pool", "minecraft:diamond_boots",										{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData( "req_wear", "minecraft:diamond_chestplate",									{ "endurance": 40 } );
addData( "xp_bonus_worn", "minecraft:diamond_chestplate",								{ "magic": 2.5 } );
addData2( "salvage", "minecraft:diamond_chestplate", "minecraft:diamond",
{
	"salvageMax": 8,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
} );
addData( "fish_pool", "minecraft:diamond_chestplate",									{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData( "req_wear", "minecraft:diamond_helmet",										{ "endurance": 40 } );
addData( "xp_bonus_worn", "minecraft:diamond_helmet",									{ "magic": 2.5 } );
addData2( "salvage", "minecraft:diamond_helmet", "minecraft:diamond",
{
	"salvageMax": 5,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
} );
addData( "fish_pool", "minecraft:diamond_helmet",										{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData( "req_tool", "minecraft:diamond_hoe",											{ "farming": 30 } );
addData( "xp_bonus_held", "minecraft:diamond_hoe",										{ "farming": 10 } );
addData( "xp_value_craft", "minecraft:diamond_hoe",										{ "crafting": 120, "smithing": 24 } );
addData2( "salvage", "minecraft:diamond_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
} );
addData2( "salvage", "minecraft:diamond_hoe", "minecraft:diamond",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
});
addData( "fish_pool", "minecraft:diamond_hoe",											{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData2( "salvage", "minecraft:diamond_horse_armor", "minecraft:diamond",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
} );
addData( "req_wear", "minecraft:diamond_leggings",										{ "endurance": 40 } );
addData( "xp_bonus_worn", "minecraft:diamond_leggings",									{ "magic": 2.5 } );
addData2( "salvage", "minecraft:diamond_leggings", "minecraft:diamond",
{
	"salvageMax": 7,
	"baseChance": 0.5,
	"chancePerLevel": 0.5,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
} );
addData( "fish_pool", "minecraft:diamond_leggings",										{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData( "req_tool", "minecraft:diamond_pickaxe",										{ "mining": 40 } );
addData( "req_weapon", "minecraft:diamond_pickaxe",										{ "combat": 40 } );
addData( "xp_value_craft", "minecraft:diamond_pickaxe",									{ "crafting": 180, "smithing": 36 } );
addData2( "salvage", "minecraft:diamond_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
} );
addData2( "salvage", "minecraft:diamond_pickaxe", "minecraft:diamond",
{
	"salvageMax": 3,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
});
addData( "fish_pool", "minecraft:diamond_pickaxe",										{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData( "req_tool", "minecraft:diamond_shovel",										{ "excavation": 40 } );
addData( "req_weapon", "minecraft:diamond_shovel",										{ "combat": 40 } );
addData( "xp_value_craft", "minecraft:diamond_shovel",									{ "crafting": 60, "smithing": 12 } );
addData2( "salvage", "minecraft:diamond_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
} );
addData2( "salvage", "minecraft:diamond_shovel", "minecraft:diamond",
{
	"salvageMax": 1,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
});
addData( "fish_pool", "minecraft:diamond_shovel",										{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData( "req_weapon", "minecraft:diamond_sword",										{ "combat": 40 } );
addData( "xp_value_craft", "minecraft:diamond_sword",									{ "crafting": 120, "smithing": 24 } );
addData2( "salvage", "minecraft:diamond_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 40
} );
addData2( "salvage", "minecraft:diamond_sword", "minecraft:diamond",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 76.15,
	"levelReq": 40
});
addData( "fish_pool", "minecraft:diamond_sword",										{ "startWeight": 0, "startLevel": 60, "endWeight": 25, "endLevel": 95, "xp": 150, "enchantLevelReq": 60 } );
addData( "xp_value_break", "minecraft:diorite",											{ "mining": 0.3 } );
addData2( "salvage", "minecraft:diorite", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 50,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData( "xp_value_break", "minecraft:dirt",											{ "excavation": 1.5 } );
addData2( "treasure", "minecraft:dirt", "minecraft:bone",
{
	"startChance": 0.1,
	"startLevel": 25,
	"endChance": 1,
	"endLevel": 125,
	"xpPerItem": 8,
	"minCount": 1,
	"maxCount": 3
} );
addData( "xp_value_brew", "minecraft:dragon_breath",									{ "alchemy": 35 } );
addData( "info_brew", "minecraft:dragon_breath",										{ "extraChance": 3 } );
addData( "xp_bonus_worn", "minecraft:dragon_head",										{ "flying": 50, "combat": 25 } );
addData2( "salvage", "minecraft:dragon_head", "minecraft:dragon_egg",
{
	"salvageMax": 1,
	"baseChance": 10,
	"chancePerLevel": 0.5,
	"maxChance": 20,
	"xpPerItem": 100,
	"levelReq": 50
} );
addData( "xp_value_kill", "minecraft:drowned",											{ "combat": 25 } );
addData( "fish_enchant_pool", "minecraft:efficiency",									{ "levelReq": 25, "levelPerLevel": 30, "chancePerLevel": 1, "maxChance": 80, "maxLevel": 10 } );
addData2( "salvage", "minecraft:egg", "minecraft:chicken_spawn_egg",
{
	"salvageMax": 1,
	"baseChance": 12.5,
	"chancePerLevel": 0,
	"maxChance": 12.5,
	"xpPerItem": 3,
	"levelReq": 10
} );
addData( "xp_value_cook", "minecraft:egg",												{ "cooking": 7.5 } );
addData( "info_cook", "minecraft:egg",													{ "extraChance": 1.5 } );
addData( "xp_value_kill", "minecraft:elder_guardian",									{ "combat": 100 } );
addData( "req_wear", "minecraft:elytra",												{ "agility": 40, "endurance": 20 } );
addData2( "salvage", "minecraft:elytra", "minecraft:phantom_membrane",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 100,
	"levelReq": 1
} );
addData( "xp_value_craft", "minecraft:emerald",											{ "crafting": 0 } );
addData2( "salvage", "minecraft:emerald", "minecraft:experience_bottle",
{
	"salvageMax": 16,
	"baseChance": 1,
	"chancePerLevel": 1,
	"maxChance": 100,
	"xpPerItem": 1,
	"levelReq": 15
} );
addData( "xp_value_craft", "minecraft:emerald_block",									{ "crafting": 0 } );
addData( "req_use", "minecraft:enchanting_table",										{ "mining": 25 } );
addData( "req_place", "minecraft:enchanting_table",										{ "building": 25 } );
addData( "xp_bonus_worn", "minecraft:enchanting_table",									{ "magic": 10, "alchemy": 10 } );
addData2( "salvage", "minecraft:enchanting_table", "minecraft:obsidian",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 25
} );
addData2( "salvage", "minecraft:end_crystal", "minecraft:ender_eye",
{
	"salvageMax": 1,
	"baseChance": 30,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 25
} );
addData2( "salvage", "minecraft:end_stone_brick_wall", "minecraft:end_stone_bricks",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 10
} );
addData( "xp_value_kill", "minecraft:ender_dragon",										{ "combat": 2500 } );
addData( "mob_rare_drop", "minecraft:ender_dragon",										{ "minecraft:dragon_head": 1, "minecraft:dragon_egg": 10 } );
addData2( "salvage", "minecraft:ender_eye", "minecraft:blaze_powder",
{
	"salvageMax": 1,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 85,
	"xpPerItem": 10,
	"levelReq": 8
} );
addData( "xp_value_kill", "minecraft:enderman",											{ "combat": 35 } );
addData( "xp_value_kill", "minecraft:evoker",											{ "combat": 40 } );
addData( "xp_value_tame", "minecraft:exampleanimal",									{ "taming": 10 } );
addData( "fish_enchant_pool", "minecraft:feather_falling",								{ "levelReq": 5, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 85, "maxLevel": 5 } );
addData( "xp_value_brew", "minecraft:fermented_spider_eye",								{ "alchemy": 12 } );
addData( "info_brew", "minecraft:fermented_spider_eye",									{ "extraChance": 0.6 } );
addData( "xp_value_break", "minecraft:fern",											{ "farming": 0.35 } );
addData( "req_use", "minecraft:firework_rocket",										{ "flying": 5 } );
addData2( "salvage", "minecraft:fishing_rod", "minecraft:string",
{
	"salvageMax": 2,
	"baseChance": 45,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 7,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:fishing_rod",											{ "startWeight": 40, "startLevel": 1, "endWeight": 100, "endLevel": 80, "xp": 35, "enchantLevelReq": 10 } );
addData( "xp_value_craft", "minecraft:flint_and_steel",									{ "crafting": 12 } );
addData2( "salvage", "minecraft:flint_and_steel", "minecraft:flint",
{
	"salvageMax": 1,
	"baseChance": 35,
	"chancePerLevel": 1.5,
	"maxChance": 95,
	"xpPerItem": 3,
	"levelReq": 5
} );
addData2( "salvage", "minecraft:flower_pot", "minecraft:brick",
{
	"salvageMax": 3,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 2,
	"levelReq": 3
} );
addData( "req_dimension_travel", "minecraft:overworld",											{ "excavation": 1 } );

addData( "fish_enchant_pool", "minecraft:fortune",										{ "levelReq": 35, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 75, "maxLevel": 5 } );
addData( "fish_enchant_pool", "minecraft:frost_walker",									{ "levelReq": 25, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 80, "maxLevel": 5 } );
addData( "req_biome", "minecraft:frozen_ocean",											{ "swimming": 35, "endurance": 15 } );
addData( "xp_bonus_biome", "minecraft:frozen_ocean",									{ "swimming": 75, "fishing": 40 } );
addData( "biome_effect_negative", "minecraft:frozen_ocean",								{ "minecraft:slowness": 2, "minecraft:weakness": 1 } );
addData2( "salvage", "minecraft:furnace", "minecraft:cobblestone",
{
	"salvageMax": 8,
	"baseChance": 20,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 1.25,
	"levelReq": 5
} );
addData( "xp_value_brew", "minecraft:ghast_tear",										{ "alchemy": 20 } );
addData( "info_brew", "minecraft:ghast_tear",											{ "extraChance": 0.75 } );
addData2( "salvage", "minecraft:ghast_tear", "minecraft:ghast_spawn_egg",
{
	"salvageMax": 1,
	"baseChance": 12.5,
	"chancePerLevel": 0.1,
	"maxChance": 25,
	"xpPerItem": 10,
	"levelReq": 25
} );
addData2( "salvage", "minecraft:glass_bottle", "minecraft:glass",
{
	"salvageMax": 1,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 90,
	"xpPerItem": 0.35,
	"levelReq": 3
} );
addData( "xp_value_brew", "minecraft:glistering_melon_slice",							{ "alchemy": 12 } );
addData( "info_brew", "minecraft:glistering_melon_slice",								{ "extraChance": 0.45 } );
addData( "info_ore", "minecraft:glowstone",												{ "extraChance": 0.1 } );
addData( "xp_value_brew", "minecraft:glowstone_dust",									{ "alchemy": 9 } );
addData( "info_brew", "minecraft:glowstone_dust",										{ "extraChance": 0.45 } );
addData( "xp_value_craft", "minecraft:gold_block",										{ "crafting": 0 } );
addData( "xp_value_craft", "minecraft:gold_ingot",										{ "crafting": 0 } );
addData( "xp_value_craft", "minecraft:gold_nugget",										{ "crafting": 0 } );
addData2( "salvage", "minecraft:golden_apple", "minecraft:gold_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
} );
addData( "req_tool", "minecraft:golden_axe",											{ "woodcutting": 30 } );
addData( "req_weapon", "minecraft:golden_axe",											{ "combat": 35 } );
addData( "xp_bonus_held", "minecraft:golden_axe",										{ "woodcutting": 50, "combat": 50 } );
addData( "xp_value_craft", "minecraft:golden_axe",										{ "crafting": 90, "smithing": 18 } );
addData( "xp_value_smelt", "minecraft:golden_axe",										{ "smithing": 6 } );
addData( "info_smelt", "minecraft:golden_axe",											{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
} );
addData2( "salvage", "minecraft:golden_axe", "minecraft:gold_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:golden_axe",											{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "xp_bonus_worn", "minecraft:golden_boots",										{ "mining": 5, "endurance": 5 } );
addData( "xp_value_smelt", "minecraft:golden_boots",									{ "smithing": 8 } );
addData( "info_smelt", "minecraft:golden_boots",										{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_boots", "minecraft:gold_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
} );
addData( "fish_pool", "minecraft:golden_boots",											{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "xp_value_brew", "minecraft:golden_carrot",									{ "alchemy": 11 } );
addData( "info_brew", "minecraft:golden_carrot",										{ "extraChance": 0.5 } );
addData2( "salvage", "minecraft:golden_carrot", "minecraft:carrot",
{
	"salvageMax": 1,
	"baseChance": 35,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 4,
	"levelReq": 5
} );
addData( "xp_bonus_worn", "minecraft:golden_chestplate",								{ "mining": 5, "endurance": 5 } );
addData( "xp_value_smelt", "minecraft:golden_chestplate",								{ "smithing": 16 } );
addData( "info_smelt", "minecraft:golden_chestplate",									{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_chestplate", "minecraft:gold_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
} );
addData( "fish_pool", "minecraft:golden_chestplate",									{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "xp_bonus_worn", "minecraft:golden_helmet",									{ "mining": 5, "endurance": 5 } );
addData( "xp_value_smelt", "minecraft:golden_helmet",									{ "smithing": 10 } );
addData( "info_smelt", "minecraft:golden_helmet",										{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_helmet", "minecraft:gold_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
} );
addData( "fish_pool", "minecraft:golden_helmet",										{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "req_tool", "minecraft:golden_hoe",											{ "farming": 50 } );
addData( "xp_bonus_held", "minecraft:golden_hoe",										{ "farming": 20 } );
addData( "xp_value_craft", "minecraft:golden_hoe",										{ "crafting": 60, "smithing": 12 } );
addData( "xp_value_smelt", "minecraft:golden_hoe",										{ "smithing": 4 } );
addData( "info_smelt", "minecraft:golden_hoe",											{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
} );
addData2( "salvage", "minecraft:golden_hoe", "minecraft:gold_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:golden_hoe",											{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "xp_value_smelt", "minecraft:golden_horse_armor",								{ "smithing": 100 } );
addData( "info_smelt", "minecraft:golden_horse_armor",									{ "extraChance": 50 } );
addData2( "salvage", "minecraft:golden_horse_armor", "minecraft:gold_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
} );
addData( "xp_bonus_worn", "minecraft:golden_leggings",									{ "mining": 5, "endurance": 5 } );
addData( "xp_value_smelt", "minecraft:golden_leggings",									{ "smithing": 14 } );
addData( "info_smelt", "minecraft:golden_leggings",										{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_leggings", "minecraft:gold_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
} );
addData( "fish_pool", "minecraft:golden_leggings",										{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "req_tool", "minecraft:golden_pickaxe",										{ "mining": 30 } );
addData( "req_weapon", "minecraft:golden_pickaxe",										{ "combat": 30 } );
addData( "xp_bonus_held", "minecraft:golden_pickaxe",									{ "mining": 50 } );
addData( "xp_value_craft", "minecraft:golden_pickaxe",									{ "crafting": 90, "smithing": 18 } );
addData( "xp_value_smelt", "minecraft:golden_pickaxe",									{ "smithing": 6 } );
addData( "info_smelt", "minecraft:golden_pickaxe",										{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
} );
addData2( "salvage", "minecraft:golden_pickaxe", "minecraft:gold_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:golden_pickaxe",										{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "req_tool", "minecraft:golden_shovel",											{ "excavation": 30 } );
addData( "req_weapon", "minecraft:golden_shovel",										{ "combat": 30 } );
addData( "xp_bonus_held", "minecraft:golden_shovel",									{ "excavation": 50 } );
addData( "xp_value_craft", "minecraft:golden_shovel",									{ "crafting": 30, "smithing": 6 } );
addData( "xp_value_smelt", "minecraft:golden_shovel",									{ "smithing": 2 } );
addData( "info_smelt", "minecraft:golden_shovel",										{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
} );
addData2( "salvage", "minecraft:golden_shovel", "minecraft:gold_ingot",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:golden_shovel",										{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "req_weapon", "minecraft:golden_sword",										{ "combat": 30 } );
addData( "xp_bonus_held", "minecraft:golden_sword",										{ "combat": 50 } );
addData( "xp_value_craft", "minecraft:golden_sword",									{ "crafting": 60, "smithing": 12 } );
addData( "xp_value_smelt", "minecraft:golden_sword",									{ "smithing": 4 } );
addData( "info_smelt", "minecraft:golden_sword",										{ "extraChance": 2.5 } );
addData2( "salvage", "minecraft:golden_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
} );
addData2( "salvage", "minecraft:golden_sword", "minecraft:gold_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:golden_sword",											{ "startWeight": 5, "startLevel": 35, "endWeight": 35, "endLevel": 90, "xp": 55, "enchantLevelReq": 45 } );
addData( "xp_value_break", "minecraft:granite",											{ "mining": 0.4 } );
addData2( "salvage", "minecraft:granite", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 50,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData( "xp_value_break", "minecraft:grass",											{ "farming": 0.25 } );
addData( "xp_value_break", "minecraft:grass_block",										{ "excavation": 2 } );
addData2( "treasure", "minecraft:grass_block", "minecraft:grass",
{
	"startChance": 0.1,
	"startLevel": 1,
	"endChance": 1,
	"endLevel": 100,
	"xpPerItem": 3,
	"minCount": 1,
	"maxCount": 1
} );
addData( "xp_value_break", "minecraft:gravel",											{ "excavation": 2 } );
addData2( "salvage", "minecraft:gravel", "minecraft:flint",
{
	"salvageMax": 2,
	"baseChance": 20,
	"chancePerLevel": 1,
	"maxChance": 85,
	"xpPerItem": 1,
	"levelReq": 1
} );
addData2( "treasure", "minecraft:gravel", "minecraft:gunpowder",
{
	"startChance": 0.2,
	"startLevel": 1,
	"endChance": 2,
	"endLevel": 125,
	"xpPerItem": 4,
	"minCount": 1,
	"maxCount": 4
} );
addData( "xp_value_smelt", "minecraft:gray_terracotta",									{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:gray_terracotta",										{ "extraChance": 1.5 } );
addData( "xp_value_smelt", "minecraft:green_terracotta",								{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:green_terracotta",									{ "extraChance": 1.5 } );
addData( "xp_value_kill", "minecraft:guardian",											{ "combat": 25 } );
addData( "xp_value_brew", "minecraft:gunpowder",										{ "alchemy": 7.5 } );
addData( "info_brew", "minecraft:gunpowder",											{ "extraChance": 0.45 } );
addData( "xp_value_craft", "minecraft:hay_block",										{ "crafting": 0 } );
addData( "xp_bonus_worn", "minecraft:heart_of_the_sea",									{ "swimming": 25, "fishing": 10 } );
addData( "fish_pool", "minecraft:heart_of_the_sea",										{ "startWeight": 1, "startLevel": 1, "endWeight": 1, "endLevel": 1, "xp": 250, "minCount": 1, "maxCount": 1 } );
addData( "xp_value_craft", "minecraft:heavy_weighted_pressure_plate",					{ "crafting": 20 } );
addData2( "salvage", "minecraft:heavy_weighted_pressure_plate", "minecraft:iron_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData2( "salvage", "minecraft:honeycomb_block", "minecraft:honeycomb",
{
	"salvageMax": 4,
	"baseChance": 20,
	"chancePerLevel": 2,
	"maxChance": 90,
	"xpPerItem": 2,
	"levelReq": 10
} );
addData( "xp_value_craft", "minecraft:hopper",											{ "crafting": 58 } );
addData2( "salvage", "minecraft:hopper", "minecraft:chest",
{
	"salvageMax": 1,
	"baseChance": 35,
	"chancePerLevel": 1.5,
	"maxChance": 95,
	"xpPerItem": 10,
	"levelReq": 5
} );
addData( "xp_value_tame", "minecraft:horse",				{ "taming": 30} );
addData( "xp_value_kill", "minecraft:husk",												{ "combat": 45 } );
addData( "xp_value_break", "minecraft:ice",												{ "mining": 0.1 } );
addData( "xp_value_break", "minecraft:infested_chiseled_stone_bricks",					{ "mining": 200 } );
addData( "xp_value_break", "minecraft:infested_cobblestone",							{ "mining": 50 } );
addData( "xp_value_break", "minecraft:infested_cracked_stone_bricks",					{ "mining": 200 } );
addData( "xp_value_break", "minecraft:infested_mossy_stone_bricks",						{ "mining": 200 } );
addData( "xp_value_break", "minecraft:infested_stone",									{ "mining": 50 } );
addData( "xp_value_break", "minecraft:infested_stone_bricks",							{ "mining": 200 } );
addData( "req_tool", "minecraft:iron_axe",												{ "woodcutting": 20 } );
addData( "req_weapon", "minecraft:iron_axe",											{ "combat": 25 } );
addData( "xp_value_craft", "minecraft:iron_axe",										{ "crafting": 30, "smithing": 6 } );
addData( "xp_value_smelt", "minecraft:iron_axe",										{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:iron_axe",											{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
} );
addData2( "salvage", "minecraft:iron_axe", "minecraft:iron_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:iron_axe",												{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "xp_value_craft", "minecraft:iron_block",										{ "crafting": 0 } );
addData( "req_wear", "minecraft:iron_boots",											{ "endurance": 30 } );
addData( "xp_bonus_worn", "minecraft:iron_boots",										{ "smithing": 2.5 } );
addData( "xp_value_craft", "minecraft:iron_boots",										{ "crafting": 40, "smithing": 8 } );
addData( "xp_value_smelt", "minecraft:iron_boots",										{ "smithing": 2 } );
addData( "info_smelt", "minecraft:iron_boots",											{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_boots", "minecraft:iron_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "fish_pool", "minecraft:iron_boots",											{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "req_wear", "minecraft:iron_chestplate",										{ "endurance": 30 } );
addData( "xp_bonus_worn", "minecraft:iron_chestplate",									{ "smithing": 2.5 } );
addData( "xp_value_smelt", "minecraft:iron_chestplate",									{ "smithing": 4 } );
addData( "info_smelt", "minecraft:iron_chestplate",										{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_chestplate", "minecraft:iron_ingot",
{
	"salvageMax": 8,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "fish_pool", "minecraft:iron_chestplate",										{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "xp_value_craft", "minecraft:iron_door",										{ "crafting": 20 } );
addData2( "salvage", "minecraft:iron_door", "minecraft:iron_ingot",
{
	"salvageMax": 6,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "req_wear", "minecraft:iron_helmet",											{ "endurance": 30 } );
addData( "xp_bonus_worn", "minecraft:iron_helmet",										{ "smithing": 2.5 } );
addData( "xp_value_craft", "minecraft:iron_helmet",										{ "crafting": 50, "smithing": 10 } );
addData( "xp_value_smelt", "minecraft:iron_helmet",										{ "smithing": 2.5 } );
addData( "info_smelt", "minecraft:iron_helmet",											{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_helmet", "minecraft:iron_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData( "fish_pool", "minecraft:iron_helmet",											{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "req_tool", "minecraft:iron_hoe",												{ "farming": 20 } );
addData( "xp_bonus_held", "minecraft:iron_hoe",											{ "farming": 5 } );
addData( "xp_value_craft", "minecraft:iron_hoe",										{ "crafting": 20, "smithing": 4 } );
addData( "xp_value_smelt", "minecraft:iron_hoe",										{ "smithing": 1 } );
addData( "info_smelt", "minecraft:iron_hoe",											{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "minecraft:iron_hoe", "minecraft:iron_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:iron_hoe",												{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "xp_value_smelt", "minecraft:iron_horse_armor",								{ "smithing": 25 } );
addData( "info_smelt", "minecraft:iron_horse_armor",									{ "extraChance": 50 } );
addData2( "salvage", "minecraft:iron_horse_armor", "minecraft:iron_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData( "xp_value_craft", "minecraft:iron_ingot",										{ "crafting": 0 } );
addData( "req_wear", "minecraft:iron_leggings",											{ "endurance": 30 } );
addData( "xp_bonus_worn", "minecraft:iron_leggings",									{ "smithing": 2.5 } );
addData( "xp_value_smelt", "minecraft:iron_leggings",									{ "smithing": 3.5 } );
addData( "info_smelt", "minecraft:iron_leggings",										{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_leggings", "minecraft:iron_ingot",
{
	"salvageMax": 7,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
});
addData( "fish_pool", "minecraft:iron_leggings",										{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "xp_value_craft", "minecraft:iron_nugget",										{ "crafting": 0 } );
addData( "req_tool", "minecraft:iron_pickaxe",											{ "mining": 20 } );
addData( "req_weapon", "minecraft:iron_pickaxe",										{ "combat": 20 } );
addData( "xp_value_craft", "minecraft:iron_pickaxe",									{ "crafting": 30, "smithing": 6 } );
addData( "xp_value_smelt", "minecraft:iron_pickaxe",									{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:iron_pickaxe",										{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 5
} );
addData2( "salvage", "minecraft:iron_pickaxe", "minecraft:iron_ingot",
{
	"salvageMax": 3,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:iron_pickaxe",											{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "req_tool", "minecraft:iron_shovel",											{ "excavation": 20 } );
addData( "req_weapon", "minecraft:iron_shovel",											{ "combat": 20 } );
addData( "xp_value_craft", "minecraft:iron_shovel",										{ "crafting": 10, "smithing": 2 } );
addData( "xp_value_smelt", "minecraft:iron_shovel",										{ "smithing": 0.5 } );
addData( "info_smelt", "minecraft:iron_shovel",											{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "minecraft:iron_shovel", "minecraft:iron_ingot",
{
	"salvageMax": 1,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:iron_shovel",											{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "req_weapon", "minecraft:iron_sword",											{ "combat": 20 } );
addData( "xp_value_craft", "minecraft:iron_sword",										{ "crafting": 20, "smithing": 4 } );
addData( "xp_value_smelt", "minecraft:iron_sword",										{ "smithing": 1 } );
addData( "info_smelt", "minecraft:iron_sword",											{ "extraChance": 5 } );
addData2( "salvage", "minecraft:iron_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 30
});
addData2( "salvage", "minecraft:iron_sword", "minecraft:iron_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 30
});
addData( "fish_pool", "minecraft:iron_sword",											{ "startWeight": 75, "startLevel": 20, "endWeight": 20, "endLevel": 85, "xp": 45, "enchantLevelReq": 20 } );
addData( "xp_value_craft", "minecraft:iron_trapdoor",									{ "crafting": 40 } );
addData2( "salvage", "minecraft:iron_trapdoor", "minecraft:iron_ingot",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData2( "salvage", "minecraft:item_frame", "minecraft:stick",
{
	"salvageMax": 8,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 95,
	"xpPerItem": 0.5,
	"levelReq": 1
} );
addData2( "salvage", "minecraft:jack_o_lantern", "minecraft:torch",
{
	"salvageMax": 1,
	"baseChance": 60,
	"chancePerLevel": 1.5,
	"maxChance": 95,
	"xpPerItem": 1,
	"levelReq": 1
} );
addData2( "salvage", "minecraft:jukebox", "minecraft:oak_planks",
{
	"salvageMax": 8,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 20
} );
addData( "xp_bonus_biome", "minecraft:jungle",											{ "agility": 25, "swimming": 25, "fishing": 25, "combat": 10, "archery": 35, "woodcutting": -25, "farming": -25 } );
addData( "biome_effect_negative", "minecraft:jungle",									{ "minecraft:slowness": 0, "minecraft:weakness": 0 } );
addData( "biome_mob_multiplier", "minecraft:jungle",									{ "speedBonus": 1.5, "hpBonus": 1.25 } );
addData( "xp_bonus_biome", "minecraft:jungle_edge",										{ "agility": 25, "swimming": 25, "fishing": 25, "combat": 10, "archery": 35, "woodcutting": -75, "farming": -75 } );
addData( "biome_effect_negative", "minecraft:jungle_edge",								{ "minecraft:slowness": 0, "minecraft:weakness": 0 } );
addData( "biome_mob_multiplier", "minecraft:jungle_edge",								{ "speedBonus": 1.5, "hpBonus": 1.25 } );
addData( "xp_bonus_biome", "minecraft:jungle_hills",									{ "agility": 25, "swimming": 25, "fishing": 25, "combat": 10, "archery": 35, "woodcutting": -75, "farming": -75 } );
addData( "biome_effect_negative", "minecraft:jungle_hills",								{ "minecraft:slowness": 0, "minecraft:weakness": 0 } );
addData( "biome_mob_multiplier", "minecraft:jungle_hills",								{ "speedBonus": 1.5, "hpBonus": 1.25 } );
addData( "xp_value_break", "minecraft:jungle_leaves",									{ "woodcutting": 0.9 } );
addData( "xp_value_break", "minecraft:jungle_log",										{ "woodcutting": 4.5 } );
addData( "xp_value_smelt", "minecraft:jungle_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "minecraft:jungle_log",											{ "extraChance": 1 } );
addData( "info_log", "minecraft:jungle_log",											{ "extraChance": 0.55 } );
addData( "xp_value_break", "minecraft:jungle_planks",									{ "woodcutting": 5 } );
addData( "req_place", "minecraft:jungle_sapling",										{ "farming": 20, "woodcutting": 35 } );
addData( "xp_value_break", "minecraft:jungle_sapling",									{ "woodcutting": 24 } );
addData( "xp_value_grow", "minecraft:jungle_sapling",									{ "farming": 25 } );
addData( "xp_value_break", "minecraft:jungle_wood",										{ "woodcutting": 4.5 } );
addData( "info_log", "minecraft:jungle_wood",											{ "extraChance": 0.55 } );
addData( "xp_value_break", "minecraft:kelp",											{ "farming": 1 } );
addData( "xp_value_grow", "minecraft:kelp",												{ "farming": 2 } );
addData( "block_specific", "minecraft:kelp",											{ "growsUpwards": 1 } );
addData( "info_plant", "minecraft:kelp",												{ "extraChance": 0.25 } );
addData( "fish_pool", "minecraft:kelp",													{ "startWeight": 500, "startLevel": 1, "endWeight": 25, "endLevel": 75, "xp": 0.25, "minCount": 5, "maxCount": 24 } );
addData( "xp_value_break", "minecraft:kelp_plant",										{ "farming": 1 } );
addData( "xp_value_grow", "minecraft:kelp_plant",										{ "farming": 2 } );
addData( "block_specific", "minecraft:kelp_plant",										{ "growsUpwards": 1 } );
addData( "info_plant", "minecraft:kelp_plant",											{ "extraChance": 0.25 } );
addData2( "salvage", "minecraft:ladder", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 30,
	"chancePerLevel": 1.5,
	"maxChance": 100,
	"xpPerItem": 1,
	"levelReq": 1
} );
addData( "xp_value_craft", "minecraft:lapis",											{ "crafting": 0 } );
addData( "xp_value_craft", "minecraft:lapis_block",										{ "crafting": 0 } );
addData( "xp_value_break", "minecraft:large_fern",										{ "farming": 5.5 } );
addData2( "salvage", "minecraft:lead", "minecraft:string",
{
	"salvageMax": 2,
	"baseChance": 50,
	"chancePerLevel": 1.5,
	"maxChance": 90,
	"xpPerItem": 7.5,
	"levelReq": 8
} );
addData( "xp_value_general", "minecraft:leather",										{ "fishing": 25 } );
addData( "req_wear", "minecraft:leather_boots",											{ "endurance": 5 } );
addData( "xp_bonus_worn", "minecraft:leather_boots",									{ "agility": 2.5, "farming": 2.5, "woodcutting": 2.5, "fishing": 2.5 } );
addData2( "salvage", "minecraft:leather_boots", "minecraft:leather",
{
	"salvageMax": 4,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 7.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:leather_boots",										{ "startWeight": 100, "startLevel": 5, "endWeight": 10, "endLevel": 80, "xp": 35, "enchantLevelReq": 1 } );
addData( "req_wear", "minecraft:leather_chestplate",									{ "endurance": 5 } );
addData( "xp_bonus_worn", "minecraft:leather_chestplate",								{ "agility": 2.5, "farming": 2.5, "woodcutting": 2.5, "fishing": 2.5 } );
addData2( "salvage", "minecraft:leather_chestplate", "minecraft:leather",
{
	"salvageMax": 8,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 7.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:leather_chestplate",									{ "startWeight": 100, "startLevel": 5, "endWeight": 10, "endLevel": 80, "xp": 35, "enchantLevelReq": 1 } );
addData( "req_wear", "minecraft:leather_helmet",										{ "endurance": 5 } );
addData( "xp_bonus_worn", "minecraft:leather_helmet",									{ "agility": 2.5, "farming": 2.5, "woodcutting": 2.5, "fishing": 2.5 } );
addData2( "salvage", "minecraft:leather_helmet", "minecraft:leather",
{
	"salvageMax": 5,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 7.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:leather_helmet",										{ "startWeight": 100, "startLevel": 5, "endWeight": 10, "endLevel": 80, "xp": 35, "enchantLevelReq": 1 } );
addData2( "salvage", "minecraft:leather_horse_armor", "minecraft:leather",
{
	"salvageMax": 7,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 7.5,
	"levelReq": 1
} );
addData( "req_wear", "minecraft:leather_leggings",										{ "endurance": 5 } );
addData( "xp_bonus_worn", "minecraft:leather_leggings",									{ "agility": 2.5, "farming": 2.5, "woodcutting": 2.5, "fishing": 2.5 } );
addData2( "salvage", "minecraft:leather_leggings", "minecraft:leather",
{
	"salvageMax": 7,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 7.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:leather_leggings",										{ "startWeight": 100, "startLevel": 5, "endWeight": 10, "endLevel": 80, "xp": 35, "enchantLevelReq": 1 } );
addData( "xp_value_smelt", "minecraft:light_blue_terracotta",							{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:light_blue_terracotta",								{ "extraChance": 1.5 } );
addData( "xp_value_smelt", "minecraft:light_gray_terracotta",							{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:light_gray_terracotta",								{ "extraChance": 1.5 } );
addData( "xp_value_craft", "minecraft:light_weighted_pressure_plate",					{ "crafting": 60 } );
addData2( "salvage", "minecraft:light_weighted_pressure_plate", "minecraft:gold_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 80,
	"xpPerItem": 35,
	"levelReq": 30
} );
addData( "xp_value_break", "minecraft:lilac",											{ "farming": 16.5 } );
addData( "xp_value_break", "minecraft:lily_of_the_valley",								{ "farming": 9.5 } );
addData( "xp_value_break", "minecraft:lily_pad",										{ "farming": 5 } );
addData( "fish_pool", "minecraft:lily_pad",												{ "startWeight": 500, "startLevel": 1, "endWeight": 25, "endLevel": 75, "xp": 0.25, "minCount": 5, "maxCount": 24 } );
addData( "xp_value_smelt", "minecraft:lime_terracotta",									{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:lime_terracotta",										{ "extraChance": 1.5 } );
addData( "xp_value_break", "minecraft:log",												{ "woodcutting": 8 } );
addData( "xp_value_smelt", "minecraft:log",												{ "smithing": 0.25 } );
addData( "info_smelt", "minecraft:log",													{ "extraChance": 1 } );
addData( "info_log", "minecraft:log",													{ "extraChance": 1 } );
addData( "fish_enchant_pool", "minecraft:looting",										{ "levelReq": 35, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 75, "maxLevel": 5 } );
addData( "fish_enchant_pool", "minecraft:luck_of_the_sea",								{ "levelReq": 15, "levelPerLevel": 15, "chancePerLevel": 1, "maxChance": 80, "maxLevel": 5 } );
addData( "fish_enchant_pool", "minecraft:lure",											{ "levelReq": 20, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 85, "maxLevel": 5 } );
addData( "xp_value_smelt", "minecraft:magenta_terracotta",								{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:magenta_terracotta",									{ "extraChance": 1.5 } );
addData2( "salvage", "minecraft:magma_block", "minecraft:magma_cream",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 0.75,
	"maxChance": 50,
	"xpPerItem": 0.5,
	"levelReq": 30
} );
addData2( "treasure", "minecraft:magma_block", "minecraft:magma_cream",
{
	"startChance": 0.1,
	"startLevel": 25,
	"endChance": 1,
	"endLevel": 150,
	"xpPerItem": 12.5,
	"minCount": 1,
	"maxCount": 2
} );
addData( "xp_value_brew", "minecraft:magma_cream",										{ "alchemy": 17 } );
addData( "info_brew", "minecraft:magma_cream",											{ "extraChance": 0.6 } );
addData2( "salvage", "minecraft:magma_cream", "minecraft:slime_ball",
{
	"salvageMax": 1,
	"baseChance": 30,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 15,
	"levelReq": 20
} );
addData( "xp_value_kill", "minecraft:magma_cube",										{ "combat": 7.5 } );
addData( "xp_value_break", "minecraft:melon",											{ "farming": 7.5 } );
addData( "info_plant", "minecraft:melon",												{ "extraChance": 1 } );
addData2( "salvage", "minecraft:melon", "minecraft:melon_slice",
{
	"salvageMax": 9,
	"baseChance": 30,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 0.35,
	"levelReq": 3
} );
addData( "xp_value_break", "minecraft:melon_seeds",										{ "farming": 7.5 } );
addData( "xp_value_break", "minecraft:melon_slice",										{ "farming": 7.5 } );
addData( "fish_enchant_pool", "minecraft:mending",										{ "levelReq": 50, "chancePerLevel": 1, "maxChance": 50 } );
addData( "xp_value_craft", "minecraft:minecart",										{ "crafting": 50 } );
addData2( "salvage", "minecraft:minecart", "minecraft:iron_ingot",
{
	"salvageMax": 5,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "xp_value_break", "minecraft:mossy_cobblestone",								{ "mining": 1.5 } );
addData2( "salvage", "minecraft:mossy_cobblestone", "minecraft:vine",
{
	"salvageMax": 1,
	"baseChance": 1,
	"chancePerLevel": 1,
	"maxChance": 15,
	"xpPerItem": 5,
	"levelReq": 15
} );
addData( "fish_enchant_pool", "minecraft:multishot",									{ "levelReq": 35, "chancePerLevel": 1, "maxChance": 50 } );
addData( "xp_value_craft", "minecraft:mushroom_stew",									{ "cooking": 15 } );
addData( "xp_value_break", "minecraft:mycelium",										{ "excavation": 6, "farming": 1 } );
addData( "xp_value_general", "minecraft:name_tag",										{ "fishing": 60 } );
addData( "fish_pool", "minecraft:nautilus_shell",										{ "startWeight": 1, "startLevel": 1, "endWeight": 5, "endLevel": 25, "xp": 250, "minCount": 1, "maxCount": 3 } );
addData( "biome_mob_multiplier", "minecraft:nether",									{ "hpBonus": 1.5, "damageBonus": 1.5 } );
addData( "xp_value_break", "minecraft:nether_bricks",									{ "mining": 1.5 } );
addData( "xp_value_smelt", "minecraft:nether_bricks",									{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:nether_bricks",										{ "extraChance": 1 } );
addData2( "salvage", "minecraft:nether_bricks", "minecraft:nether_brick",
{
	"salvageMax": 4,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 1.5,
	"levelReq": 15
} );
addData( "xp_value_break", "minecraft:nether_quartz",									{ "mining": 1.5 } );
addData( "xp_bonus_worn", "minecraft:nether_star",										{ "combat": 10, "endurance": 10, "archery": 10, "magic": 10, "flying": 20 } );
addData( "fish_pool", "minecraft:nether_star",											{ "startWeight": 0, "startLevel": 95, "endWeight": 1, "endLevel": 150, "xp": 666, "minCount": 1, "maxCount": 1 } );
addData( "xp_value_break", "minecraft:nether_wart",										{ "farming": 1 } );
addData( "xp_value_grow", "minecraft:nether_wart",										{ "farming": 11 } );
addData( "xp_value_brew", "minecraft:nether_wart",										{ "alchemy": 6 } );
addData( "info_brew", "minecraft:nether_wart",											{ "extraChance": 0.25 } );
addData( "info_plant", "minecraft:nether_wart",											{ "extraChance": 0.75 } );
addData2( "salvage", "minecraft:nether_wart_block", "minecraft:nether_wart",
{
	"salvageMax": 9,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 90,
	"xpPerItem": 2,
	"levelReq": 10
} );
addData( "req_tool", "minecraft:netherite_axe",											{ "woodcutting": 60 } );
addData( "req_weapon", "minecraft:netherite_axe",										{ "combat": 65 } );
addData( "xp_value_craft", "minecraft:netherite_axe",									{ "crafting": 600, "smithing": 120 } );
addData( "fish_pool", "minecraft:netherite_axe",										{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "minecraft:netherite_boots",										{ "endurance": 60 } );
addData( "xp_value_craft", "minecraft:netherite_boots",									{ "crafting": 800, "smithing": 160 } );
addData( "fish_pool", "minecraft:netherite_boots",										{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "minecraft:netherite_chestplate",									{ "endurance": 60 } );
addData( "xp_value_craft", "minecraft:netherite_chestplate",							{ "crafting": 1600, "smithing": 320 } );
addData( "fish_pool", "minecraft:netherite_chestplate",									{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "minecraft:netherite_helmet",										{ "endurance": 60 } );
addData( "xp_value_craft", "minecraft:netherite_helmet",								{ "crafting": 1000, "smithing": 200 } );
addData( "fish_pool", "minecraft:netherite_helmet",										{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "minecraft:netherite_hoe",											{ "farming": 40 } );
addData( "xp_bonus_held", "minecraft:netherite_hoe",									{ "farming": 15 } );
addData( "xp_value_craft", "minecraft:netherite_hoe",									{ "crafting": 400, "smithing": 80 } );
addData( "fish_pool", "minecraft:netherite_hoe",										{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_wear", "minecraft:netherite_leggings",									{ "endurance": 60 } );
addData( "xp_value_craft", "minecraft:netherite_leggings",								{ "crafting": 1400, "smithing": 280 } );
addData( "fish_pool", "minecraft:netherite_leggings",									{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "minecraft:netherite_pickaxe",										{ "mining": 60 } );
addData( "req_weapon", "minecraft:netherite_pickaxe",									{ "combat": 60 } );
addData( "xp_value_craft", "minecraft:netherite_pickaxe",								{ "crafting": 600, "smithing": 120 } );
addData( "fish_pool", "minecraft:netherite_pickaxe",									{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_tool", "minecraft:netherite_shovel",										{ "excavation": 60 } );
addData( "req_weapon", "minecraft:netherite_shovel",									{ "combat": 60 } );
addData( "xp_value_craft", "minecraft:netherite_shovel",								{ "crafting": 200, "smithing": 40 } );
addData( "fish_pool", "minecraft:netherite_shovel",										{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "req_weapon", "minecraft:netherite_sword",										{ "combat": 60 } );
addData( "xp_value_craft", "minecraft:netherite_sword",									{ "crafting": 400, "smithing": 80 } );
addData( "fish_pool", "minecraft:netherite_sword",										{ "startWeight": 0, "startLevel": 80, "endWeight": 3, "endLevel": 100, "xp": 350, "enchantLevelReq": 120 } );
addData( "xp_value_break", "minecraft:netherrack",										{ "mining": 0.1 } );
addData( "xp_value_smelt", "minecraft:netherrack",										{ "smithing": 0.25 } );
addData( "info_smelt", "minecraft:netherrack",											{ "extraChance": 1 } );
addData2( "treasure", "minecraft:netherrack", "minecraft:gold_nugget",
{
	"startChance": 0.1,
	"startLevel": 25,
	"endChance": 2,
	"endLevel": 150,
	"xpPerItem": 7.5,
	"minCount": 1,
	"maxCount": 3
} );
addData( "xp_value_break", "minecraft:oak_leaves",										{ "woodcutting": 0.5 } );
addData( "xp_value_break", "minecraft:oak_log",											{ "woodcutting": 8 } );
addData( "xp_value_smelt", "minecraft:oak_log",											{ "smithing": 0.25 } );
addData( "info_smelt", "minecraft:oak_log",												{ "extraChance": 1 } );
addData( "info_log", "minecraft:oak_log",												{ "extraChance": 1 } );
addData( "xp_value_break", "minecraft:oak_planks",										{ "woodcutting": 5 } );
addData( "req_place", "minecraft:oak_sapling",											{ "farming": 5, "woodcutting": 10 } );
addData( "xp_value_break", "minecraft:oak_sapling",										{ "woodcutting": 15 } );
addData( "xp_value_grow", "minecraft:oak_sapling",										{ "farming": 10 } );
addData( "xp_value_break", "minecraft:oak_wood",										{ "woodcutting": 8 } );
addData( "info_log", "minecraft:oak_wood",												{ "extraChance": 1 } );
addData( "xp_bonus_biome", "minecraft:ocean",											{ "swimming": 25, "fishing": 10 } );
addData( "biome_effect_negative", "minecraft:ocean",									{ "minecraft:slowness": 0 } );
addData( "xp_value_tame", "minecraft:ocelot",				{ "taming": 20} );
addData( "xp_value_smelt", "minecraft:orange_terracotta",								{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:orange_terracotta",									{ "extraChance": 1.5 } );
addData( "xp_value_break", "minecraft:orange_tulip",									{ "farming": 16.5 } );
addData( "vein_blacklist", "minecraft:overworld",										{ "minecraft:bedrock": 0 } );
addData( "xp_value_break", "minecraft:oxeye_daisy",										{ "farming": 8.5 } );
addData2( "salvage", "minecraft:packed_ice", "minecraft:ice",
{
	"salvageMax": 9,
	"baseChance": 50,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData( "xp_value_tame", "minecraft:parrot",				{ "taming": 20} );
addData( "xp_value_break", "minecraft:peony",											{ "farming": 17.5 } );
addData( "xp_value_brew", "minecraft:phantom_membrane",									{ "alchemy": 17 } );
addData( "info_brew", "minecraft:phantom_membrane",										{ "extraChance": 0.7 } );
addData( "fish_enchant_pool", "minecraft:piercing",										{ "levelReq": 35, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 80, "maxLevel": 7 } );
addData( "xp_value_breed", "minecraft:pig",												{ "farming": 25 } );
addData( "xp_value_smelt", "minecraft:pink_terracotta",									{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:pink_terracotta",										{ "extraChance": 1.5 } );
addData( "xp_value_break", "minecraft:pink_tulip",										{ "farming": 6 } );
addData( "biome_mob_multiplier", "minecraft:plains",									{ "speedBonus": 0.75, "hpBonus": 0.75, "damageBonus": 0.75 } );
addData( "biome_effect_positive", "minecraft:plains",									{ "minecraft:speed": 0 } );
addData( "xp_value_break", "minecraft:podzol",											{ "excavation": 3, "farming": 1 } );
addData2( "treasure", "minecraft:podzol", "minecraft:sweet_berries",
{
	"startChance": 0.1,
	"startLevel": 15,
	"endChance": 1,
	"endLevel": 150,
	"xpPerItem": 3,
	"minCount": 1,
	"maxCount": 3
} );
addData( "xp_value_break", "minecraft:polished_andesite",								{ "mining": 0.5 } );
addData( "xp_value_smelt", "minecraft:polished_blackstone_bricks",						{ "smithing": 2.5 } );
addData( "info_smelt", "minecraft:polished_blackstone_bricks",							{ "extraChance": 1 } );
addData( "xp_value_break", "minecraft:polished_diorite",								{ "mining": 0.3 } );
addData( "xp_value_break", "minecraft:polished_granite",								{ "mining": 0.4 } );
addData( "xp_value_break", "minecraft:poppy",											{ "farming": 11.5 } );
addData( "xp_value_break", "minecraft:potato",											{ "farming": 0.75 } );
addData( "xp_value_grow", "minecraft:potato",											{ "farming": 6.6 } );
addData( "info_plant", "minecraft:potato",												{ "extraChance": 1.5 } );
addData( "xp_value_break", "minecraft:potatoes",										{ "farming": 0.75 } );
addData( "xp_value_grow", "minecraft:potatoes",											{ "farming": 6.6 } );
addData( "info_plant", "minecraft:potatoes",											{ "extraChance": 1.5 } );
addData( "fish_enchant_pool", "minecraft:power",										{ "levelReq": 20, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 80, "maxLevel": 8 } );
addData( "xp_value_break", "minecraft:prismarine",										{ "mining": 2.5 } );
addData2( "salvage", "minecraft:prismarine", "minecraft:prismarine_shard",
{
	"salvageMax": 4,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 1,
	"levelReq": 15
} );
addData( "xp_value_break", "minecraft:prismarine_bricks",								{ "mining": 4 } );
addData2( "salvage", "minecraft:prismarine_bricks", "minecraft:prismarine_shard",
{
	"salvageMax": 9,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 1,
	"levelReq": 15
} );
addData( "fish_enchant_pool", "minecraft:projectile_protection",						{ "levelReq": 15, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 85, "maxLevel": 8 } );
addData( "fish_enchant_pool", "minecraft:protection",									{ "levelReq": 20, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 75, "maxLevel": 8 } );
addData( "xp_value_general", "minecraft:pufferfish",									{ "fishing": 35 } );
addData( "xp_value_brew", "minecraft:pufferfish",										{ "alchemy": 5 } );
addData( "info_brew", "minecraft:pufferfish",											{ "extraChance": 0.45 } );
addData( "xp_value_break", "minecraft:pumpkin",											{ "farming": 7.5 } );
addData( "info_plant", "minecraft:pumpkin",												{ "extraChance": 0.6 } );
addData( "xp_value_craft", "minecraft:pumpkin_pie",										{ "cooking": 27.5 } );
addData( "xp_value_cook", "minecraft:pumpkin_seed",										{ "cooking": 5 } );
addData( "xp_value_break", "minecraft:pumpkin_seeds",									{ "farming": 7.5 } );
addData( "fish_enchant_pool", "minecraft:punch",										{ "levelReq": 15, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 90, "maxLevel": 10 } );
addData( "xp_value_smelt", "minecraft:purple_terracotta",								{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:purple_terracotta",									{ "extraChance": 1.5 } );
addData( "xp_value_break", "minecraft:purpur_block",									{ "mining": 2 } );
addData( "xp_value_break", "minecraft:purpur_pillar",									{ "mining": 2.5 } );
addData2( "salvage", "minecraft:quartz_block", "minecraft:quartz",
{
	"salvageMax": 4,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 90,
	"xpPerItem": 1.5,
	"levelReq": 15
} );
addData( "fish_enchant_pool", "minecraft:quick_charge",									{ "levelReq": 20, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 80, "maxLevel": 5 } );
addData( "xp_value_brew", "minecraft:rabbit_foot",										{ "alchemy": 20 } );
addData( "info_brew", "minecraft:rabbit_foot",											{ "extraChance": 0.65 } );
addData( "xp_value_craft", "minecraft:rabbit_stew",										{ "cooking": 35 } );
addData( "xp_value_break", "minecraft:rail",											{ "mining": 0.8 } );
addData( "xp_value_kill", "minecraft:ravager",											{ "combat": 50 } );
addData( "xp_value_break", "minecraft:red_mushroom",									{ "farming": 12 } );
addData( "xp_value_break", "minecraft:red_mushroom_block",								{ "farming": 4 } );
addData( "xp_value_break", "minecraft:red_sand",										{ "excavation": 1.2 } );
addData( "xp_value_smelt", "minecraft:red_sand",										{ "smithing": 1.2 } );
addData( "info_smelt", "minecraft:red_sand",											{ "extraChance": 0.9 } );
addData( "xp_value_smelt", "minecraft:red_sandstone",									{ "smithing": 3.6 } );
addData( "info_smelt", "minecraft:red_sandstone",										{ "extraChance": 0.9 } );
addData2( "salvage", "minecraft:red_sandstone", "minecraft:red_sand",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 90,
	"xpPerItem": 0.5,
	"levelReq": 5
} );
addData( "xp_value_smelt", "minecraft:red_terracotta",									{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:red_terracotta",										{ "extraChance": 1.5 } );
addData( "xp_value_break", "minecraft:red_tulip",										{ "farming": 7.5 } );
addData( "xp_value_craft", "minecraft:redstone",										{ "crafting": 0 } );
addData( "xp_value_brew", "minecraft:redstone",											{ "alchemy": 8 } );
addData( "info_brew", "minecraft:redstone",												{ "extraChance": 0.4 } );
addData( "xp_value_craft", "minecraft:redstone_block",									{ "crafting": 0 } );
addData2( "salvage", "minecraft:redstone_torch", "minecraft:redstone",
{
	"salvageMax": 1,
	"baseChance": 60,
	"chancePerLevel": 1.5,
	"maxChance": 90,
	"xpPerItem": 1.5,
	"levelReq": 5
} );
addData( "fish_enchant_pool", "minecraft:riptide",										{ "levelReq": 25, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 85, "maxLevel": 7 } );
addData( "xp_bonus_biome", "minecraft:river",											{ "fishing": 5 } );
addData( "biome_mob_multiplier", "minecraft:river",										{ "speedBonus": 0.75, "hpBonus": 0.75, "damageBonus": 0.75 } );
addData( "xp_value_break", "minecraft:rose_bush",										{ "farming": 13.5 } );
addData2( "salvage", "minecraft:rotten_flesh", "minecraft:leather",
{
	"salvageMax": 1,
	"baseChance": 20,
	"chancePerLevel": 0.8,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 12
} );
addData( "xp_value_general", "minecraft:saddle",										{ "fishing": 75 } );
addData2( "salvage", "minecraft:saddle", "minecraft:leather",
{
	"salvageMax": 5,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 25,
	"levelReq": 1
} );
addData( "xp_value_general", "minecraft:salmon",										{ "fishing": 25 } );
addData( "xp_value_break", "minecraft:sand",											{ "excavation": 1 } );
addData( "xp_value_smelt", "minecraft:sand",											{ "smithing": 1 } );
addData( "info_smelt", "minecraft:sand",												{ "extraChance": 1 } );
addData2( "treasure", "minecraft:sand", "biomesoplenty:white_sand",
{
	"startChance": 0.05,
	"startLevel": 1,
	"endChance": 1,
	"endLevel": 180,
	"xpPerItem": 2,
	"minCount": 1,
	"maxCount": 4
} );
addData( "xp_value_smelt", "minecraft:sandstone",										{ "smithing": 3 } );
addData( "info_smelt", "minecraft:sandstone",											{ "extraChance": 1 } );
addData2( "salvage", "minecraft:sandstone", "minecraft:sand",
{
	"salvageMax": 4,
	"baseChance": 15,
	"chancePerLevel": 1.25,
	"maxChance": 90,
	"xpPerItem": 0.5,
	"levelReq": 5
} );
addData2( "salvage", "minecraft:sandstone_wall", "minecraft:sandstone",
{
	"salvageMax": 1,
	"baseChance": 25,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 1,
	"levelReq": 5
} );
addData( "req_place", "minecraft:scaffolding",											{ "building": 10 } );
addData2( "salvage", "minecraft:scaffolding", "minecraft:bamboo",
{
	"salvageMax": 1,
	"baseChance": 50,
	"chancePerLevel": 1.5,
	"maxChance": 90,
	"xpPerItem": 2,
	"levelReq": 12
} );
addData2( "salvage", "minecraft:scoria", "minecraft:cobblestone",
{
	"salvageMax": 1,
	"baseChance": 55,
	"chancePerLevel": 1,
	"maxChance": 90,
	"xpPerItem": 0.1,
	"levelReq": 1
} );
addData( "xp_value_break", "minecraft:sea_grass",										{ "farming": 4.5 } );
addData2( "salvage", "minecraft:sea_lantern", "minecraft:prismarine_crystals",
{
	"salvageMax": 5,
	"baseChance": 10,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 2,
	"levelReq": 15
} );
addData( "xp_value_break", "minecraft:sea_pickle",										{ "farming": 1 } );
addData( "xp_value_grow", "minecraft:sea_pickle",										{ "farming": 4 } );
addData( "xp_value_cook", "minecraft:sea_pickle",										{ "cooking": 12.5, "crafting": 3 } );
addData( "info_cook", "minecraft:sea_pickle",											{ "extraChance": 2 } );
addData( "info_plant", "minecraft:sea_pickle",											{ "extraChance": 1.5 } );
addData( "fish_enchant_pool", "minecraft:sharpness",									{ "levelReq": 20, "levelPerLevel": 25, "chancePerLevel": 1, "maxChance": 80, "maxLevel": 8 } );
addData( "xp_value_craft", "minecraft:shears",											{ "crafting": 20 } );
addData2( "salvage", "minecraft:shears", "minecraft:iron_ingot",
{
	"salvageMax": 2,
	"baseChance": 15,
	"chancePerLevel": 1,
	"maxChance": 80,
	"xpPerItem": 10,
	"levelReq": 10
} );
addData( "xp_value_breed", "minecraft:sheep",											{ "farming": 30 } );
addData( "mob_rare_drop", "minecraft:sheep",											{ "minecraft:string": 10 } );
addData( "xp_bonus_worn", "minecraft:shield",											{ "endurance": 12.5, "combat": 5 } );
addData( "fish_enchant_pool", "minecraft:silk_touch",									{ "levelReq": 40, "chancePerLevel": 1, "maxChance": 50 } );
addData( "req_kill", "minecraft:silverfish",											{ "combat": 10 } );
addData( "xp_value_kill", "minecraft:silverfish",										{ "combat": 35 } );
addData( "xp_value_kill", "minecraft:skeleton",											{ "combat": 25 } );
addData( "xp_value_kill", "minecraft:slime",											{ "combat": 5 } );
addData( "mob_rare_drop", "minecraft:slime",											{ "minecraft:slime_block": 100 } );
addData( "fish_enchant_pool", "minecraft:smite",										{ "levelReq": 15, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 90, "maxLevel": 5 } );
addData( "req_use", "minecraft:smoker",													{ "cooking": 10 } );
addData( "req_craft", "minecraft:smoker",												{ "crafting": 10 } );
addData( "req_place", "minecraft:smoker",												{ "building": 10 } );
addData( "xp_value_break", "minecraft:snow_block",										{ "excavation": 3.5 } );
addData( "xp_value_break", "minecraft:soul_sand",										{ "excavation": 5 } );
addData2( "salvage", "minecraft:soul_sand", "minecraft:nether_wart",
{
	"salvageMax": 1,
	"baseChance": 0.5,
	"chancePerLevel": 0.05,
	"maxChance": 0.5,
	"xpPerItem": 0.5,
	"levelReq": 25
} );
addData2( "treasure", "minecraft:soul_sand", "minecraft:ghast_tear",
{
	"startChance": 0.1,
	"startLevel": 25,
	"endChance": 1,
	"endLevel": 125,
	"xpPerItem": 15,
	"minCount": 1,
	"maxCount": 2
} );
addData( "req_break", "minecraft:spawner",												{ "combat": 5 } );
addData( "xp_value_break", "minecraft:spawner",											{ "mining": 50, "combat": 150, "endurance": 100 } );
addData( "xp_value_kill", "minecraft:spider",											{ "combat": 20 } );
addData( "xp_value_brew", "minecraft:spider_eye",										{ "alchemy": 9 } );
addData( "info_brew", "minecraft:spider_eye",											{ "extraChance": 0.45 } );
addData( "xp_value_break", "minecraft:spruce_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "minecraft:spruce_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "minecraft:spruce_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "minecraft:spruce_log",											{ "extraChance": 1 } );
addData( "info_log", "minecraft:spruce_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "minecraft:spruce_planks",									{ "woodcutting": 5 } );
addData( "req_place", "minecraft:spruce_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_break", "minecraft:spruce_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_grow", "minecraft:spruce_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "minecraft:spruce_wood",										{ "woodcutting": 5 } );
addData( "info_log", "minecraft:spruce_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "minecraft:stone",											{ "mining": 0.1 } );
addData( "xp_value_smelt", "minecraft:stone",											{ "smithing": 1 } );
addData( "info_smelt", "minecraft:stone",												{ "extraChance": 1 } );
addData( "req_tool", "minecraft:stone_axe",												{ "woodcutting": 10 } );
addData( "req_weapon", "minecraft:stone_axe",											{ "combat": 15 } );
addData( "xp_value_craft", "minecraft:stone_axe",										{ "crafting": 15, "smithing": 3 } );
addData2( "salvage", "minecraft:stone_axe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
} );
addData( "xp_value_break", "minecraft:stone_bricks",									{ "mining": 0.7 } );
addData( "xp_value_smelt", "minecraft:stone_bricks",									{ "smithing": 1 } );
addData( "info_smelt", "minecraft:stone_bricks",										{ "extraChance": 1 } );
addData( "req_tool", "minecraft:stone_hoe",												{ "farming": 10 } );
addData( "xp_bonus_held", "minecraft:stone_hoe",										{ "farming": 2.5 } );
addData( "xp_value_craft", "minecraft:stone_hoe",										{ "crafting": 10, "smithing": 2 } );
addData2( "salvage", "minecraft:stone_hoe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
} );
addData( "item_specific", 			"minecraft:stone_pickaxe",							{ "autoValueOffsetTool": -10 } );
addData( "req_tool", "minecraft:stone_pickaxe",											{ "mining": 10 } );
addData( "req_weapon", "minecraft:stone_pickaxe",										{ "combat": 10 } );
addData( "xp_value_craft", "minecraft:stone_pickaxe",									{ "crafting": 15, "smithing": 3 } );
addData2( "salvage", "minecraft:stone_pickaxe", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
} );
addData( "req_tool", "minecraft:stone_shovel",											{ "excavation": 10 } );
addData( "req_weapon", "minecraft:stone_shovel",										{ "combat": 10 } );
addData( "xp_value_craft", "minecraft:stone_shovel",									{ "crafting": 5, "smithing": 1 } );
addData2( "salvage", "minecraft:stone_shovel", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
} );
addData( "req_weapon", "minecraft:stone_sword",											{ "combat": 10 } );
addData( "xp_value_craft", "minecraft:stone_sword",										{ "crafting": 10, "smithing": 2 } );
addData2( "salvage", "minecraft:stone_sword", "minecraft:stick",
{
	"salvageMax": 2,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 1.5,
	"levelReq": 5
} );
addData( "req_use", "minecraft:stonecutter",											{ "building": 10 } );
addData( "req_craft", "minecraft:stonecutter",											{ "crafting": 10 } );
addData( "req_place", "minecraft:stonecutter",											{ "building": 10 } );
addData( "fish_pool", "minecraft:string",												{ "startWeight": 200, "startLevel": 1, "endWeight": 15, "endLevel": 80, "xp": 0.35, "minCount": 5, "maxCount": 16 } );
addData( "xp_value_brew", "minecraft:sugar",											{ "alchemy": 3 } );
addData( "info_brew", "minecraft:sugar",												{ "extraChance": 0.3 } );
addData( "xp_value_break", "minecraft:sugar_cane",										{ "farming": 1.5 } );
addData( "xp_value_grow", "minecraft:sugar_cane",										{ "farming": 5 } );
addData( "block_specific", "minecraft:sugar_cane",										{ "growsUpwards": 1 } );
addData( "info_plant", "minecraft:sugar_cane",											{ "extraChance": 0.33 } );
addData( "xp_value_break", "minecraft:sunflower",										{ "farming": 17.5 } );
addData( "fish_enchant_pool", "minecraft:sweeping",										{ "levelReq": 15, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 85, "maxLevel": 5 } );
addData( "xp_value_break", "minecraft:sweet_berry_bush",								{ "farming": 1.25 } );
addData( "xp_value_break", "minecraft:tall_grass",										{ "farming": 4.5 } );
addData( "xp_value_smelt", "minecraft:terracotta",										{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:terracotta",											{ "extraChance": 1.5 } );
addData( "biome_mob_multiplier", "minecraft:the_end",									{ "speedBonus": 1.25, "hpBonus": 2, "damageBonus": 1.25 } );
addData( "vein_blacklist", "minecraft:the_end",											{ "minecraft:bedrock": 0 } );
addData( "xp_bonus_dimension", "minecraft:the_end",										{ "flying": 50, "combat": 20, "archery": 50, "endurance": 20 } );
addData( "vein_blacklist", "minecraft:the_nether",										{ "minecraft:bedrock": 0 } );
addData( "xp_bonus_dimension", "minecraft:the_nether",									{ "combat": 25, "archery": 25, "endurance": 25, "flying": 250, "farming": -25 } );
addData( "fish_enchant_pool", "minecraft:thorns",										{ "levelReq": 15, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 85, "maxLevel": 8 } );
addData2( "salvage", "minecraft:tnt", "minecraft:gunpowder",
{
	"salvageMax": 5,
	"baseChance": 25,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 4,
	"levelReq": 15
} );
addData2( "salvage", "minecraft:trapped_chest", "minecraft:chest",
{
	"salvageMax": 1,
	"baseChance": 30,
	"chancePerLevel": 1.5,
	"maxChance": 100,
	"xpPerItem": 1.5,
	"levelReq": 5
} );
addData( "xp_value_general", "minecraft:tripwire_hook",									{ "fishing": 35 } );
addData( "xp_value_general", "minecraft:tropical_fish",									{ "fishing": 200 } );
addData( "req_wear", "minecraft:turtle_helmet",											{ "endurance": 15, "swimming": 5 } );
addData( "xp_bonus_worn", "minecraft:turtle_helmet",									{ "swimming": 15, "fishing": 7.5 } );
addData( "xp_value_craft", "minecraft:turtle_helmet",									{ "crafting": 100, "smithing": 20 } );
addData( "xp_value_brew", "minecraft:turtle_helmet",									{ "alchemy": 45 } );
addData( "info_brew", "minecraft:turtle_helmet",										{ "extraChance": 2 } );
addData2( "salvage", "minecraft:turtle_helmet", "minecraft:scute",
{
	"salvageMax": 5,
	"baseChance": 20,
	"chancePerLevel": 1.5,
	"maxChance": 75,
	"xpPerItem": 15,
	"levelReq": 15
} );
addData( "fish_enchant_pool", "minecraft:unbreaking",									{ "levelReq": 15, "levelPerLevel": 20, "chancePerLevel": 1, "maxChance": 75, "maxLevel": 5 } );
addData( "xp_value_kill", "minecraft:vindicator",										{ "combat": 35 } );
addData( "xp_value_break", "minecraft:vine",											{ "farming": 3.5 } );
addData( "xp_value_cook", "minecraft:wet_sponge",										{ "cooking": 15, "crafting": 15 } );
addData( "xp_value_break", "minecraft:wheat",											{ "farming": 1 } );
addData( "xp_value_grow", "minecraft:wheat",											{ "farming": 9 } );
addData( "xp_value_craft", "minecraft:wheat",											{ "crafting": 0 } );
addData( "info_plant", "minecraft:wheat",												{ "extraChance": 0.5 } );
addData2( "salvage", "minecraft:wheat", "minecraft:wheat_seeds",
{
	"salvageMax": 3,
	"baseChance": 30,
	"chancePerLevel": 1,
	"maxChance": 75,
	"xpPerItem": 1,
	"levelReq": 1
} );
addData( "xp_value_break", "minecraft:wheat_seeds",										{ "farming": 1 } );
addData( "xp_value_grow", "minecraft:wheat_seeds",										{ "farming": 9 } );
addData( "xp_value_smelt", "minecraft:white_terracotta",								{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:white_terracotta",									{ "extraChance": 1.5 } );
addData( "xp_value_break", "minecraft:white_tulip",										{ "farming": 8.5 } );
addData( "xp_value_kill", "minecraft:wither",											{ "combat": 1000 } );
addData( "xp_value_break", "minecraft:wither_rose",										{ "farming": 35 } );
addData2( "salvage", "minecraft:wither_rose", "minecraft:wither_skeleton_spawn_egg",
{
	"salvageMax": 3,
	"baseChance": 12.5,
	"chancePerLevel": 0.1,
	"maxChance": 25,
	"xpPerItem": 10,
	"levelReq": 50
} );
addData( "xp_value_kill", "minecraft:wither_skeleton",									{ "combat": 40 } );
addData( "xp_value_tame", "minecraft:wolf",					{ "taming": 10} );
addData( "req_tool", "minecraft:wooden_axe",											{ "woodcutting": 1 } );
addData( "req_weapon", "minecraft:wooden_axe",											{ "combat": 1 } );
addData( "xp_value_craft", "minecraft:wooden_axe",										{ "crafting": 9 } );
addData2( "salvage", "minecraft:wooden_axe", "minecraft:stick",
{
	"salvageMax": 5,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:wooden_axe",											{ "startWeight": 100, "startLevel": 1, "endWeight": 5, "endLevel":  80, "xp": 15, "enchantLevelReq": 1 } );
addData( "req_tool", "minecraft:wooden_hoe",											{ "farming": 1 } );
addData( "xp_bonus_held", "minecraft:wooden_hoe",										{ "farming": 1 } );
addData( "xp_value_craft", "minecraft:wooden_hoe",										{ "crafting": 6 } );
addData2( "salvage", "minecraft:wooden_hoe", "minecraft:stick",
{
	"salvageMax": 4,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:wooden_hoe",											{ "startWeight": 100, "startLevel": 1, "endWeight": 10, "endLevel": 80, "xp": 15, "enchantLevelReq": 1 } );
addData( "item_specific", 			"minecraft:wooden_pickaxe",							{ "autoValueOffsetTool": -10 } );
addData( "req_tool", "minecraft:wooden_pickaxe",										{ "mining": 1 } );
addData( "req_weapon", "minecraft:wooden_pickaxe",										{ "combat": 1 } );
addData( "xp_value_craft", "minecraft:wooden_pickaxe",									{ "crafting": 9 } );
addData2( "salvage", "minecraft:wooden_pickaxe", "minecraft:stick",
{
	"salvageMax": 5,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:wooden_pickaxe",										{ "startWeight": 100, "startLevel": 1, "endWeight": 5, "endLevel":  80, "xp": 15, "enchantLevelReq": 1 } );
addData( "req_tool", "minecraft:wooden_shovel",											{ "excavation": 1 } );
addData( "req_weapon", "minecraft:wooden_shovel",										{ "combat": 1 } );
addData( "xp_value_craft", "minecraft:wooden_shovel",									{ "crafting": 3 } );
addData2( "salvage", "minecraft:wooden_shovel", "minecraft:stick",
{
	"salvageMax": 3,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:wooden_shovel",										{ "startWeight": 100, "startLevel": 1, "endWeight": 5, "endLevel":  80, "xp": 15, "enchantLevelReq": 1 } );
addData( "req_weapon", "minecraft:wooden_sword",										{ "combat": 1 } );
addData( "xp_value_craft", "minecraft:wooden_sword",									{ "crafting": 6 } );
addData2( "salvage", "minecraft:wooden_sword", "minecraft:stick",
{
	"salvageMax": 4,
	"baseChance": 35,
	"chancePerLevel": 2,
	"maxChance": 80,
	"xpPerItem": 2.5,
	"levelReq": 1
} );
addData( "fish_pool", "minecraft:wooden_sword",											{ "startWeight": 100, "startLevel": 1, "endWeight": 5, "endLevel":  80, "xp": 15, "enchantLevelReq": 1 } );
addData2( "salvage", "minecraft:writable_book", "minecraft:book",
{
	"salvageMax": 1,
	"baseChance": 25,
	"chancePerLevel": 1.5,
	"maxChance": 80,
	"xpPerItem": 12.5,
	"levelReq": 1
} );
addData( "xp_value_smelt", "minecraft:yellow_terracotta",								{ "smithing": 1.5 } );
addData( "info_smelt", "minecraft:yellow_terracotta",									{ "extraChance": 1.5 } );
addData( "xp_value_kill", "minecraft:zombie",											{ "combat": 15 } );
addData( "mob_rare_drop", "minecraft:zombie",											{ "minecraft:beetroot": 40 } );
addData( "xp_value_kill", "minecraft:zombie_pigman",									{ "combat": 25 } );
addData( "xp_value_kill", "minecraft:zombie_villager",									{ "combat": 15 } );
}
//MVW
{
addData( "item_specific", "mvw:amethyst_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:amethyst_bow",								{ "archery": 10} );
addData( "item_specific", "mvw:amethyst_crossbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:amethyst_crossbow",							{ "archery": 15} );
addData( "item_specific", "mvw:black_opal_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:black_opal_bow",							{ "archery": 10} );
addData( "item_specific", "mvw:black_opal_crossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:black_opal_crossbow",						{ "archery": 15} );
addData( "item_specific", "mvw:copper_bow",								{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:copper_bow",								{ "archery": 5} );
addData( "item_specific", "mvw:copper_crossbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:copper_crossbow",							{ "archery": 13} );
addData( "item_specific", "mvw:diamond_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:diamond_bow",								{ "archery": 10} );
addData( "item_specific", "mvw:diamond_crossbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:diamond_crossbow",							{ "archery": 15} );
addData( "item_specific", "mvw:gold_bow",								{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:gold_bow",									{ "archery": 5} );
addData( "item_specific", "mvw:gold_crossbow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:gold_crossbow",								{ "archery": 12} );
addData( "item_specific", "mvw:iron_bow",								{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:iron_bow",									{ "archery": 1} );
addData( "item_specific", "mvw:iron_crossbow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:iron_crossbow",								{ "archery": 11} );
addData( "item_specific", "mvw:netherite_black_opal_bow",				{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:netherite_black_opal_bow",					{ "archery": 15} );
addData( "item_specific", "mvw:netherite_black_opal_crossbow",			{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:netherite_black_opal_crossbow",				{ "archery": 15} );
addData( "item_specific", "mvw:netherite_bow",							{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:netherite_bow",								{ "archery": 15} );
addData( "item_specific", "mvw:netherite_crossbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:netherite_crossbow",						{ "archery": 15} );
addData( "item_specific", "mvw:silver_bow",								{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:silver_bow",								{ "archery": 5} );
addData( "item_specific", "mvw:silver_crossbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "mvw:silver_crossbow",							{ "archery": 13} );
addData( "req_weapon", "mvw:wooden_knife",								{ "combat": 1} );
}
//MYSTICALAGRADDITIONS
{
addData( "info_ore", "mysticalagradditions:end_inferium_ore",		{ "extraChance": 1} );
addData( "info_smelt", "mysticalagradditions:end_inferium_ore",			{ "extraChance": 1} );
addData( "xp_value_break", "mysticalagradditions:end_inferium_ore",			{ "mining": 8, "magic": 4} );
addData( "xp_value_smelt", "mysticalagradditions:end_inferium_ore",			{ "smithing": 12, "magic": 2} );
addData( "info_ore", "mysticalagradditions:end_prosperity_ore",		{ "extraChance": 1} );
addData( "info_smelt", "mysticalagradditions:end_prosperity_ore",		{ "extraChance": 1} );
addData( "xp_value_break", "mysticalagradditions:end_prosperity_ore",		{ "mining": 8, "magic": 2} );
addData( "xp_value_smelt", "mysticalagradditions:end_prosperity_ore",		{ "smithing": 12, "magic": 2} );
addData( "info_ore", "mysticalagradditions:nether_inferium_ore",	{ "extraChance": 1} );
addData( "info_smelt", "mysticalagradditions:nether_inferium_ore",		{ "extraChance": 1} );
addData( "xp_value_break", "mysticalagradditions:nether_inferium_ore",		{ "mining": 8, "magic": 4} );
addData( "xp_value_smelt", "mysticalagradditions:nether_inferium_ore",		{ "smithing": 12, "magic": 2} );
addData( "info_ore", "mysticalagradditions:nether_prosperity_ore",	{ "extraChance": 1} );
addData( "info_smelt", "mysticalagradditions:nether_prosperity_ore",	{ "extraChance": 1} );
addData( "xp_value_break", "mysticalagradditions:nether_prosperity_ore",	{ "mining": 8, "magic": 2} );
addData( "xp_value_smelt", "mysticalagradditions:nether_prosperity_ore",	{ "smithing": 12, "magic": 2} );
}
//MYSTICALAGRICULTURE
{
addData( "info_ore", "mysticalagriculture:inferium_ore",			{ "extraChance": 1} );
addData( "info_smelt", "mysticalagriculture:inferium_ore",				{ "extraChance": 1} );
addData( "xp_value_break", "mysticalagriculture:inferium_ore",				{ "mining": 8, "magic": 4} );
addData( "xp_value_smelt", "mysticalagriculture:inferium_ore",				{ "smithing": 12, "magic": 2} );
addData( "info_ore", "mysticalagriculture:prosperity_ore",			{ "extraChance": 1} );
addData( "info_smelt", "mysticalagriculture:prosperity_ore",			{ "extraChance": 1} );
addData( "xp_value_break", "mysticalagriculture:prosperity_ore",			{ "mining": 8, "magic": 2} );
addData( "xp_value_smelt", "mysticalagriculture:prosperity_ore",			{ "smithing": 12, "magic": 2} );
addData( "info_ore", "mysticalagriculture:soulium_ore",				{ "extraChance": 0.5} );
addData( "info_smelt", "mysticalagriculture:soulium_ore",				{ "extraChance": 1} );
addData( "xp_value_break", "mysticalagriculture:soulium_ore",				{ "mining": 18, "magic": 4} );
addData( "xp_value_smelt", "mysticalagriculture:soulium_ore",				{ "smithing": 12, "magic": 2} );
}
//NOTREEPUNCHING
{
addData( "req_weapon", "notreepunching:flint_knife",					{ "combat": 1} );
}
//ORESANDMETALS
{
addData( "req_tool", "oresandmetals:adamant_axe",										{ "woodcutting": 35 } );
addData( "req_weapon", "oresandmetals:adamant_axe",										{ "combat": 35 } );
addData( "req_wear", "oresandmetals:adamant_boots",										{ "endurance": 35 } );
addData( "req_wear", "oresandmetals:adamant_chestplate",								{ "endurance": 35 } );
addData( "req_wear", "oresandmetals:adamant_helmet",									{ "endurance": 35 } );
addData( "req_wear", "oresandmetals:adamant_leggings",									{ "endurance": 35 } );
addData( "req_tool", "oresandmetals:adamant_pickaxe",									{ "mining": 35 } );
addData( "req_weapon", "oresandmetals:adamant_pickaxe",									{ "combat": 35 } );
addData( "req_tool", "oresandmetals:adamant_shovel",									{ "excavation": 35 } );
addData( "req_weapon", "oresandmetals:adamant_shovel",									{ "combat": 35 } );
addData( "req_weapon", "oresandmetals:adamant_sword",									{ "combat": 35 } );
addData( "xp_value_break", "oresandmetals:adamantite_ore",								{ "mining": 30 } );
addData( "req_break", "oresandmetals:adamantite_ore",									{ "mining": 35 } );
addData( "req_tool", "oresandmetals:banite_axe",										{ "woodcutting": 80 } );
addData( "req_weapon", "oresandmetals:banite_axe",										{ "combat": 80 } );
addData( "req_wear", "oresandmetals:banite_boots",										{ "endurance": 80 } );
addData( "req_wear", "oresandmetals:banite_chestplate",									{ "endurance": 80 } );
addData( "req_wear", "oresandmetals:banite_helmet",										{ "endurance": 80 } );
addData( "req_wear", "oresandmetals:banite_leggings",									{ "endurance": 80 } );
addData( "xp_value_break", "oresandmetals:banite_ore",									{ "mining": 75 } );
addData( "req_break", "oresandmetals:banite_ore",										{ "mining": 80 } );
addData( "req_tool", "oresandmetals:banite_pickaxe",									{ "mining": 80 } );
addData( "req_weapon", "oresandmetals:banite_pickaxe",									{ "combat": 80 } );
addData( "req_tool", "oresandmetals:banite_shovel",										{ "excavation": 80 } );
addData( "req_weapon", "oresandmetals:banite_shovel",									{ "combat": 80 } );
addData( "req_weapon", "oresandmetals:banite_sword",									{ "combat": 80 } );
addData( "req_tool", "oresandmetals:bronze_axe",										{ "woodcutting": 5 } );
addData( "req_weapon", "oresandmetals:bronze_axe",										{ "combat": 5 } );
addData( "req_wear", "oresandmetals:bronze_boots",										{ "endurance": 5 } );
addData( "req_wear", "oresandmetals:bronze_chestplate",									{ "endurance": 5 } );
addData( "req_wear", "oresandmetals:bronze_helmet",										{ "endurance": 5 } );
addData( "req_wear", "oresandmetals:bronze_leggings",									{ "endurance": 5 } );
addData( "req_tool", "oresandmetals:bronze_pickaxe",									{ "mining": 5 } );
addData( "req_weapon", "oresandmetals:bronze_pickaxe",									{ "combat": 5 } );
addData( "req_tool", "oresandmetals:bronze_shovel",										{ "excavation": 5 } );
addData( "req_weapon", "oresandmetals:bronze_shovel",									{ "combat": 5 } );
addData( "req_weapon", "oresandmetals:bronze_sword",									{ "combat": 5 } );
addData( "xp_value_break", "oresandmetals:dark_animica_ore",							{ "mining": 85 } );
addData( "req_break", "oresandmetals:dark_animica_ore",									{ "mining": 90 } );
addData( "xp_value_break", "oresandmetals:drakolith_ore",								{ "mining": 55 } );
addData( "req_break", "oresandmetals:drakolith_ore",									{ "mining": 60 } );
addData( "req_tool", "oresandmetals:elder_rune_axe",									{ "woodcutting": 90 } );
addData( "req_weapon", "oresandmetals:elder_rune_axe",									{ "combat": 90 } );
addData( "req_wear", "oresandmetals:elder_rune_boots",									{ "endurance": 90 } );
addData( "req_wear", "oresandmetals:elder_rune_chestplate",								{ "endurance": 90 } );
addData( "req_wear", "oresandmetals:elder_rune_helmet",									{ "endurance": 90 } );
addData( "req_wear", "oresandmetals:elder_rune_leggings",								{ "endurance": 90 } );
addData( "req_tool", "oresandmetals:elder_rune_pickaxe",								{ "mining": 90 } );
addData( "req_weapon", "oresandmetals:elder_rune_pickaxe",								{ "combat": 90 } );
addData( "req_tool", "oresandmetals:elder_rune_shovel",									{ "excavation": 90 } );
addData( "req_weapon", "oresandmetals:elder_rune_shovel",								{ "combat": 90 } );
addData( "req_weapon", "oresandmetals:elder_rune_sword",								{ "combat": 90 } );
addData( "xp_value_break", "oresandmetals:light_animica_ore",							{ "mining": 85 } );
addData( "req_break", "oresandmetals:light_animica_ore",								{ "mining": 90 } );
addData( "req_tool", "oresandmetals:mithril_axe",										{ "woodcutting": 25 } );
addData( "req_weapon", "oresandmetals:mithril_axe",										{ "combat": 25 } );
addData( "req_wear", "oresandmetals:mithril_boots",										{ "endurance": 25 } );
addData( "req_wear", "oresandmetals:mithril_chestplate",								{ "endurance": 25 } );
addData( "req_wear", "oresandmetals:mithril_helmet",									{ "endurance": 25 } );
addData( "req_wear", "oresandmetals:mithril_leggings",									{ "endurance": 25 } );
addData( "xp_value_break", "oresandmetals:mithril_ore",									{ "mining": 20 } );
addData( "req_break", "oresandmetals:mithril_ore",										{ "mining": 25 } );
addData( "req_tool", "oresandmetals:mithril_pickaxe",									{ "mining": 25 } );
addData( "req_weapon", "oresandmetals:mithril_pickaxe",									{ "combat": 25 } );
addData( "req_tool", "oresandmetals:mithril_shovel",									{ "excavation": 25 } );
addData( "req_weapon", "oresandmetals:mithril_shovel",									{ "combat": 25 } );
addData( "req_weapon", "oresandmetals:mithril_sword",									{ "combat": 25 } );
addData( "xp_value_break", "oresandmetals:necrite_ore",									{ "mining": 65 } );
addData( "req_break", "oresandmetals:necrite_ore",										{ "mining": 70 } );
addData( "req_tool", "oresandmetals:necronium_axe",										{ "woodcutting": 70 } );
addData( "req_weapon", "oresandmetals:necronium_axe",									{ "combat": 70 } );
addData( "req_wear", "oresandmetals:necronium_boots",									{ "endurance": 70 } );
addData( "req_wear", "oresandmetals:necronium_chestplate",								{ "endurance": 70 } );
addData( "req_wear", "oresandmetals:necronium_helmet",									{ "endurance": 70 } );
addData( "req_wear", "oresandmetals:necronium_leggings",								{ "endurance": 70 } );
addData( "req_tool", "oresandmetals:necronium_pickaxe",									{ "mining": 70 } );
addData( "req_weapon", "oresandmetals:necronium_pickaxe",								{ "combat": 70 } );
addData( "req_tool", "oresandmetals:necronium_shovel",									{ "excavation": 70 } );
addData( "req_weapon", "oresandmetals:necronium_shovel",								{ "combat": 70 } );
addData( "req_weapon", "oresandmetals:necronium_sword",									{ "combat": 70 } );
addData( "xp_value_break", "oresandmetals:orichalcite_ore",								{ "mining": 55 } );
addData( "req_break", "oresandmetals:orichalcite_ore",									{ "mining": 60 } );
addData( "req_tool", "oresandmetals:orikalkum_axe",										{ "woodcutting": 60 } );
addData( "req_weapon", "oresandmetals:orikalkum_axe",									{ "combat": 60 } );
addData( "req_wear", "oresandmetals:orikalkum_boots",									{ "endurance": 60 } );
addData( "req_wear", "oresandmetals:orikalkum_chestplate",								{ "endurance": 60 } );
addData( "req_wear", "oresandmetals:orikalkum_helmet",									{ "endurance": 60 } );
addData( "req_wear", "oresandmetals:orikalkum_leggings",								{ "endurance": 60 } );
addData( "req_tool", "oresandmetals:orikalkum_pickaxe",									{ "mining": 60 } );
addData( "req_weapon", "oresandmetals:orikalkum_pickaxe",								{ "combat": 60 } );
addData( "req_tool", "oresandmetals:orikalkum_shovel",									{ "excavation": 60 } );
addData( "req_weapon", "oresandmetals:orikalkum_shovel",								{ "combat": 60 } );
addData( "req_weapon", "oresandmetals:orikalkum_sword",									{ "combat": 60 } );
addData( "xp_value_break", "oresandmetals:phasmatite_ore",								{ "mining": 65 } );
addData( "req_break", "oresandmetals:phasmatite_ore",									{ "mining": 70 } );
addData( "req_tool", "oresandmetals:rune_axe",											{ "woodcutting": 50 } );
addData( "req_weapon", "oresandmetals:rune_axe",										{ "combat": 50 } );
addData( "req_wear", "oresandmetals:rune_boots",										{ "endurance": 50 } );
addData( "req_wear", "oresandmetals:rune_chestplate",									{ "endurance": 50 } );
addData( "req_wear", "oresandmetals:rune_helmet",										{ "endurance": 50 } );
addData( "req_wear", "oresandmetals:rune_leggings",										{ "endurance": 50 } );
addData( "req_tool", "oresandmetals:rune_pickaxe",										{ "mining": 50 } );
addData( "req_weapon", "oresandmetals:rune_pickaxe",									{ "combat": 50 } );
addData( "req_tool", "oresandmetals:rune_shovel",										{ "excavation": 50 } );
addData( "req_weapon", "oresandmetals:rune_shovel",										{ "combat": 50 } );
addData( "req_weapon", "oresandmetals:rune_sword",										{ "combat": 50 } );
addData( "xp_value_break", "oresandmetals:runite_ore",									{ "mining": 45 } );
addData( "req_break", "oresandmetals:runite_ore",										{ "mining": 50 } );
addData( "req_tool", "oresandmetals:steel_axe",											{ "woodcutting": 15 } );
addData( "req_weapon", "oresandmetals:steel_axe",										{ "combat": 15 } );
addData( "req_wear", "oresandmetals:steel_boots",										{ "endurance": 15 } );
addData( "req_wear", "oresandmetals:steel_chestplate",									{ "endurance": 15 } );
addData( "req_wear", "oresandmetals:steel_helmet",										{ "endurance": 15 } );
addData( "req_wear", "oresandmetals:steel_leggings",									{ "endurance": 15 } );
addData( "req_tool", "oresandmetals:steel_pickaxe",										{ "mining": 15 } );
addData( "req_weapon", "oresandmetals:steel_pickaxe",									{ "combat": 15 } );
addData( "req_tool", "oresandmetals:steel_shovel",										{ "excavation": 15 } );
addData( "req_weapon", "oresandmetals:steel_shovel",									{ "combat": 15 } );
addData( "req_weapon", "oresandmetals:steel_sword",										{ "combat": 15 } );
}
//POWAH
{
addData( "info_ore", "powah:uraninite_ore",							{ "extraChance": 0.5} );
addData( "info_smelt", "powah:uraninite_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "powah:uraninite_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "powah:uraninite_ore",							{ "smithing": 14} );
addData( "info_ore", "powah:uraninite_ore_dense",					{ "extraChance": 0.33} );
addData( "info_smelt", "powah:uraninite_ore_dense",						{ "extraChance": 1} );
addData( "xp_value_break", "powah:uraninite_ore_dense",						{ "mining": 30} );
addData( "xp_value_smelt", "powah:uraninite_ore_dense",						{ "smithing": 18} );
addData( "info_ore", "powah:uraninite_ore_poor",					{ "extraChance": 0.75} );
addData( "info_smelt", "powah:uraninite_ore_poor",						{ "extraChance": 1} );
addData( "xp_value_break", "powah:uraninite_ore_poor",						{ "mining": 4} );
addData( "xp_value_smelt", "powah:uraninite_ore_poor",						{ "smithing": 10} );
addData( "info_smelt", "powah:uraninite_raw",							{ "extraChance": 1} );
addData( "xp_value_smelt", "powah:uraninite_raw",							{ "smithing": 14} );
addData( "info_smelt", "powah:uraninite_raw_dense",						{ "extraChance": 1} );
addData( "xp_value_smelt", "powah:uraninite_raw_dense",						{ "smithing": 18} );
addData( "info_smelt", "powah:uraninite_raw_poor",						{ "extraChance": 1} );
addData( "xp_value_smelt", "powah:uraninite_raw_poor",						{ "smithing": 10} );
}
//RATS
{
addData( "info_ore", "rats:cheese_ore",								{ "extraChance": 0.5} );
addData( "info_smelt", "rats:cheese_ore",								{ "extraChance": 0.5} );
addData( "xp_value_break", "rats:cheese_ore",								{ "mining": 12} );
addData( "xp_value_smelt", "rats:cheese_ore",								{ "smithing": 8} );
addData( "info_smelt", "rats:marbled_cheese_raw",						{ "extraChance": 0.5} );
addData( "xp_value_smelt", "rats:marbled_cheese_raw",						{ "smithing": 12} );
addData( "info_ore", "rats:oratchalcum_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "rats:oratchalcum_ore",							{ "extraChance": 0.5} );
addData( "xp_value_break", "rats:oratchalcum_ore",							{ "mining": 22} );
addData( "xp_value_smelt", "rats:oratchalcum_ore",							{ "smithing": 18} );
addData( "info_ore", "rats:ratlantean_gem_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "rats:ratlantean_gem_ore",						{ "extraChance": 0.5} );
addData( "xp_value_break", "rats:ratlantean_gem_ore",						{ "mining": 28, "magic": 8} );
addData( "xp_value_smelt", "rats:ratlantean_gem_ore",						{ "smithing": 35} );
}
//RFTOOLS
{
addData( "info_ore", "rftools:dimensional_shard_ore",				{ "extraChance": 0.75} );
addData( "xp_value_break", "rftools:dimensional_shard_ore",					{ "mining": 22, "magic": 35} );
}
//SCALINGHEALTH
{
addData( "xp_value_craft", "scalinghealth:bandages",									{ "crafting": 4 } );
addData( "xp_value_craft", "scalinghealth:heart_crystal",									{ "crafting": 20, "magic": 30, "endurance": 15 } );
addData( "info_ore", "scalinghealth:heart_crystal_ore",									{ "extraChance": 0.25 } );
addData( "xp_value_break", "scalinghealth:heart_crystal_ore",									{ "mining": 20 } );
addData( "xp_value_craft", "scalinghealth:medkit",										{ "crafting": 18 } );
addData( "xp_value_craft", "scalinghealth:power_crystal",									{ "crafting": 20, "magic": 30, "combat": 15 } );
addData( "info_ore", "scalinghealth:power_crystal_ore",									{ "extraChance": 0.25 } );
addData( "xp_value_break", "scalinghealth:power_crystal_ore",									{ "mining": 20 } );
}
//SILENTGEAR
{
addData( "xp_value_smelt", "silentgear:azure_electrum_dust",				{ "smithing": 22} );
addData( "info_smelt", "silentgear:azure_silver_chunks",				{ "extraChance": 1} );
addData( "xp_value_smelt", "silentgear:azure_silver_chunks",				{ "smithing": 16} );
addData( "xp_value_smelt", "silentgear:azure_silver_dust",					{ "smithing": 16} );
addData( "info_ore", "silentgear:azure_silver_ore",					{ "extraChance": 0.33} );
addData( "info_smelt", "silentgear:azure_silver_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "silentgear:azure_silver_ore",					{ "mining": 30} );
addData( "xp_value_smelt", "silentgear:azure_silver_ore",					{ "smithing": 16} );
addData( "xp_value_smelt", "silentgear:blaze_gold_dust",					{ "smithing": 18} );
addData( "req_weapon", "silentgear:bow",								{ "archery": 5} );
addData( "info_smelt", "silentgear:crimson_iron_chunks",				{ "extraChance": 1} );
addData( "xp_value_smelt", "silentgear:crimson_iron_chunks",				{ "smithing": 16} );
addData( "xp_value_smelt", "silentgear:crimson_iron_dust",					{ "smithing": 16} );
addData( "info_ore", "silentgear:crimson_iron_ore",					{ "extraChance": 0.33} );
addData( "info_smelt", "silentgear:crimson_iron_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "silentgear:crimson_iron_ore",					{ "mining": 22} );
addData( "xp_value_smelt", "silentgear:crimson_iron_ore",					{ "smithing": 16} );
addData( "xp_value_smelt", "silentgear:crimson_steel_dust",					{ "smithing": 22} );
addData( "req_weapon", "silentgear:crossbow",							{ "archery": 15} );
}
//SILENTGEMS
{
addData( "info_ore", "silentgems:agate_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:agate_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:agate_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:agate_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:alexandrite_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:alexandrite_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:alexandrite_ore",					{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:alexandrite_ore",					{ "smithing": 18} );
addData( "info_ore", "silentgems:amber_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:amber_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:amber_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:amber_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:ametrine_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:ametrine_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:ametrine_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:ametrine_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:ammolite_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:ammolite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:ammolite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:ammolite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:apatite_ore",						{ "extraChance": 1} );
addData( "info_smelt", "silentgems:apatite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:apatite_ore",						{ "mining": 6} );
addData( "xp_value_smelt", "silentgems:apatite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:aquamarine_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:aquamarine_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:aquamarine_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:aquamarine_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:benitoite_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:benitoite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:benitoite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:benitoite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:black_diamond_ore",				{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:black_diamond_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:black_diamond_ore",					{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:black_diamond_ore",					{ "smithing": 18} );
addData( "info_ore", "silentgems:carnelian_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:carnelian_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:carnelian_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:carnelian_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:cats_eye_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:cats_eye_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:cats_eye_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:cats_eye_ore",						{ "smithing": 18} );
addData( "xp_value_smelt", "silentgems:chaos_gold_dust",					{ "smithing": 18} );
addData( "xp_value_smelt", "silentgems:chaos_iron_dust",					{ "smithing": 18} );
addData( "info_ore", "silentgems:chaos_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:chaos_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:chaos_ore",							{ "mining": 8} );
addData( "xp_value_smelt", "silentgems:chaos_ore",							{ "smithing": 8} );
addData( "xp_value_smelt", "silentgems:chaos_silver_dust",					{ "smithing": 18} );
addData( "info_ore", "silentgems:chrysoprase_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:chrysoprase_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:chrysoprase_ore",					{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:chrysoprase_ore",					{ "smithing": 18} );
addData( "info_ore", "silentgems:citrine_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:citrine_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:citrine_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:citrine_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:coral_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:coral_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:coral_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:coral_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:ender_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:ender_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:ender_ore",							{ "mining": 12} );
addData( "xp_value_smelt", "silentgems:ender_ore",							{ "smithing": 12} );
addData( "info_ore", "silentgems:euclase_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:euclase_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:euclase_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:euclase_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:fluorite_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "silentgems:fluorite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:fluorite_ore",						{ "mining": 10} );
addData( "xp_value_smelt", "silentgems:fluorite_ore",						{ "smithing": 15} );
addData( "info_ore", "silentgems:garnet_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:garnet_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:garnet_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:garnet_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:green_sapphire_ore",				{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:green_sapphire_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:green_sapphire_ore",					{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:green_sapphire_ore",					{ "smithing": 18} );
addData( "info_ore", "silentgems:heliodor_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:heliodor_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:heliodor_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:heliodor_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:iolite_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:iolite_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:iolite_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:iolite_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:jade_ore",							{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:jade_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:jade_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:jade_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:jasper_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:jasper_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:jasper_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:jasper_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:kunzite_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:kunzite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:kunzite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:kunzite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:kyanite_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:kyanite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:kyanite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:kyanite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:lepidolite_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:lepidolite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:lepidolite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:lepidolite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:malachite_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:malachite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:malachite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:malachite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:moldavite_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:moldavite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:moldavite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:moldavite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:moonstone_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:moonstone_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:moonstone_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:moonstone_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:morganite_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:morganite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:morganite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:morganite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:onyx_ore",							{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:onyx_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:onyx_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:onyx_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:opal_ore",							{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:opal_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:opal_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:opal_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:pearl_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:pearl_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:pearl_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:pearl_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:peridot_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:peridot_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:peridot_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:peridot_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:phosphophyllite_ore",				{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:phosphophyllite_ore",				{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:phosphophyllite_ore",				{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:phosphophyllite_ore",				{ "smithing": 18} );
addData( "info_ore", "silentgems:pyrope_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:pyrope_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:pyrope_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:pyrope_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:rose_quartz_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:rose_quartz_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:rose_quartz_ore",					{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:rose_quartz_ore",					{ "smithing": 18} );
addData( "info_ore", "silentgems:ruby_ore",							{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:ruby_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:ruby_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:ruby_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:sapphire_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:sapphire_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:sapphire_ore",						{ "mining": 30} );
addData( "xp_value_smelt", "silentgems:sapphire_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:sodalite_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:sodalite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:sodalite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:sodalite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:spinel_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:spinel_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:spinel_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:spinel_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:sunstone_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:sunstone_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:sunstone_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:sunstone_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:tanzanite_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:tanzanite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:tanzanite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:tanzanite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:tektite_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:tektite_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:tektite_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:tektite_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:topaz_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:topaz_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:topaz_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:topaz_ore",							{ "smithing": 18} );
addData( "info_ore", "silentgems:turquoise_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:turquoise_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:turquoise_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:turquoise_ore",						{ "smithing": 18} );
addData( "info_ore", "silentgems:yellow_diamond_ore",				{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:yellow_diamond_ore",					{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:yellow_diamond_ore",					{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:yellow_diamond_ore",					{ "smithing": 18} );
addData( "info_ore", "silentgems:zircon_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "silentgems:zircon_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "silentgems:zircon_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "silentgems:zircon_ore",							{ "smithing": 18} );
}
//SILENTS_MECHANISMS
{
addData( "xp_value_smelt", "silents_mechanisms:aluminum_dust",				{ "smithing": 8} );
addData( "xp_value_smelt", "silents_mechanisms:aluminum_steel_dust",		{ "smithing": 18} );
addData( "info_smelt", "silents_mechanisms:bauxite_chunks",				{ "extraChance": 0.75} );
addData( "xp_value_smelt", "silents_mechanisms:bauxite_chunks",				{ "smithing": 8} );
addData( "info_ore", "silents_mechanisms:bauxite_ore",				{ "extraChance": 0.75} );
addData( "info_smelt", "silents_mechanisms:bauxite_ore",				{ "extraChance": 0.75} );
addData( "xp_value_break", "silents_mechanisms:bauxite_ore",				{ "mining": 8} );
addData( "xp_value_smelt", "silents_mechanisms:bauxite_ore",				{ "smithing": 12} );
addData( "xp_value_smelt", "silents_mechanisms:bismuth_brass_dust",			{ "smithing": 18} );
addData( "info_smelt", "silents_mechanisms:bismuth_chunks",				{ "extraChance": 1} );
addData( "xp_value_smelt", "silents_mechanisms:bismuth_chunks",				{ "smithing": 8} );
addData( "xp_value_smelt", "silents_mechanisms:bismuth_dust",				{ "smithing": 8} );
addData( "info_ore", "silents_mechanisms:bismuth_ore",				{ "extraChance": 0.5} );
addData( "info_smelt", "silents_mechanisms:bismuth_ore",				{ "extraChance": 1} );
addData( "xp_value_break", "silents_mechanisms:bismuth_ore",				{ "mining": 15} );
addData( "xp_value_smelt", "silents_mechanisms:bismuth_ore",				{ "smithing": 12} );
addData( "xp_value_smelt", "silents_mechanisms:bismuth_steel_dust",			{ "smithing": 18} );
addData( "xp_value_smelt", "silents_mechanisms:brass_dust",					{ "smithing": 22} );
addData( "info_smelt", "silents_mechanisms:copper_chunks",				{ "extraChance": 0.9} );
addData( "xp_value_smelt", "silents_mechanisms:copper_chunks",				{ "smithing": 7} );
addData( "info_smelt", "silents_mechanisms:gold_chunks",				{ "extraChance": 0.5} );
addData( "xp_value_smelt", "silents_mechanisms:gold_chunks",				{ "smithing": 16} );
addData( "info_smelt", "silents_mechanisms:iron_chunks",				{ "extraChance": 1} );
addData( "xp_value_smelt", "silents_mechanisms:iron_chunks",				{ "smithing": 12} );
addData( "info_smelt", "silents_mechanisms:lead_chunks",				{ "extraChance": 0.75} );
addData( "xp_value_smelt", "silents_mechanisms:lead_chunks",				{ "smithing": 18} );
addData( "info_smelt", "silents_mechanisms:nickel_chunks",				{ "extraChance": 0.35} );
addData( "xp_value_smelt", "silents_mechanisms:nickel_chunks",				{ "smithing": 28} );
addData( "info_smelt", "silents_mechanisms:platinum_chunks",			{ "extraChance": 0.35} );
addData( "xp_value_smelt", "silents_mechanisms:platinum_chunks",			{ "smithing": 28} );
addData( "xp_value_smelt", "silents_mechanisms:platinum_dust",				{ "smithing": 28} );
addData( "info_ore", "silents_mechanisms:platinum_ore",				{ "extraChance": 0.5} );
addData( "info_smelt", "silents_mechanisms:platinum_ore",				{ "extraChance": 0.35} );
addData( "xp_value_break", "silents_mechanisms:platinum_ore",				{ "mining": 28} );
addData( "xp_value_smelt", "silents_mechanisms:platinum_ore",				{ "smithing": 28} );
addData( "xp_value_smelt", "silents_mechanisms:redstone_alloy_dust",		{ "smithing": 18} );
addData( "info_smelt", "silents_mechanisms:silver_chunks",				{ "extraChance": 0.5} );
addData( "xp_value_smelt", "silents_mechanisms:silver_chunks",				{ "smithing": 18} );
addData( "xp_value_smelt", "silents_mechanisms:steel_dust",					{ "smithing": 16} );
addData( "info_smelt", "silents_mechanisms:uranium_chunks",				{ "extraChance": 0.35} );
addData( "xp_value_smelt", "silents_mechanisms:uranium_chunks",				{ "smithing": 18} );
addData( "xp_value_smelt", "silents_mechanisms:uranium_dust",				{ "smithing": 18} );
addData( "info_ore", "silents_mechanisms:uranium_ore",				{ "extraChance": 0.5} );
addData( "info_smelt", "silents_mechanisms:uranium_ore",				{ "extraChance": 0.35} );
addData( "xp_value_break", "silents_mechanisms:uranium_ore",				{ "mining": 22} );
addData( "xp_value_smelt", "silents_mechanisms:uranium_ore",				{ "smithing": 18} );
addData( "info_smelt", "silents_mechanisms:zinc_chunks",				{ "extraChance": 0.7} );
addData( "xp_value_smelt", "silents_mechanisms:zinc_chunks",				{ "smithing": 12} );
addData( "xp_value_smelt", "silents_mechanisms:zinc_dust",					{ "smithing": 12} );
addData( "info_ore", "silents_mechanisms:zinc_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silents_mechanisms:zinc_ore",					{ "extraChance": 0.7} );
addData( "xp_value_break", "silents_mechanisms:zinc_ore",					{ "mining": 12} );
addData( "xp_value_smelt", "silents_mechanisms:zinc_ore",					{ "smithing": 16} );
}
//SILENTSGEMS
{
addData( "info_ore", "silentsgems:amethyst_ore",					{ "extraChance": 0.75} );
addData( "info_smelt", "silentsgems:amethyst_ore",						{ "extraChance": 1} );
addData( "xp_value_break", "silentsgems:amethyst_ore",						{ "mining": 25} );
addData( "xp_value_smelt", "silentsgems:amethyst_ore",						{ "smithing": 18} );
}
//SOME_MOD
{
addData( "item_specific", 			"some_mod:gun",										{ "archeryWeapon": 1 } );
addData( "xp_value_place", 			"some_mod:some_block",								{ "magic": 5 } );
addData2( "req_use_enchantment", 	"some_mod:some_enchantment",	2,
{
	"agility": 10
});
addData( "item_specific", 			"some_mod:staff",									{ "magicWeapon": 1 } );
addData( "item_specific", 			"some_mod:sword",									{ "meleeWeapon": 1 } );
}
//SPARTANSHIELDS
{
addData( "xp_bonus_worn", "spartanshields:shield_basic_bronze",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_constantan",				{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_copper",					{ "endurance": 12.5, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_diamond",				{ "endurance": 30, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_electrum",				{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_gold",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_invar",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_iron",					{ "endurance": 12.5, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_lead",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_netherite",				{ "endurance": 50, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_nickel",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_obsidian",				{ "endurance": 40, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_platinum",				{ "endurance": 30, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_silver",					{ "endurance": 15, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_steel",					{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_stone",					{ "endurance": 12, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_tin",					{ "endurance": 12.5, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_basic_wood",					{ "endurance": 10, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_botania_elementium",			{ "endurance": 40, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_botania_manasteel",			{ "endurance": 30, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_botania_terrasteel",			{ "endurance": 50, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_mekanism_lapis_lazuli",		{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_mekanism_osmium",				{ "endurance": 15, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_mekanism_powered_advanced",	{ "endurance": 30, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_mekanism_powered_basic",		{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_mekanism_powered_elite",		{ "endurance": 35, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_mekanism_powered_ultimate",	{ "endurance": 40, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_mekanism_refined_glowstone",	{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_mekanism_refined_obsidian",	{ "endurance": 40, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_bronze",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_constantan",				{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_copper",					{ "endurance": 12.5, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_diamond",				{ "endurance": 30, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_electrum",				{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_gold",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_invar",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_iron",					{ "endurance": 12.5, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_lead",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_netherite",				{ "endurance": 50, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_nickel",					{ "endurance": 20, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_obsidian",				{ "endurance": 40, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_platinum",				{ "endurance": 30, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_silver",					{ "endurance": 15, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_steel",					{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_stone",					{ "endurance": 12, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_tin",					{ "endurance": 12.5, "combat": 10} );
addData( "xp_bonus_worn", "spartanshields:shield_tower_wood",					{ "endurance": 10, "combat": 10} );
}
//SPARTANWEAPONRY
{
addData( "req_weapon", "spartanweaponry:battleaxe_bronze",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:battleaxe_copper",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:battleaxe_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:battleaxe_electrum",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:battleaxe_gold",			{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:battleaxe_invar",			{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:battleaxe_iron",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:battleaxe_lead",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:battleaxe_netherite",		{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:battleaxe_nickel",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:battleaxe_platinum",		{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:battleaxe_silver",			{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:battleaxe_steel",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:battleaxe_stone",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:battleaxe_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:battleaxe_wood",			{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:boomerang_bronze",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:boomerang_copper",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:boomerang_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:boomerang_electrum",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:boomerang_gold",			{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:boomerang_invar",			{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:boomerang_iron",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:boomerang_lead",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:boomerang_netherite",		{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:boomerang_nickel",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:boomerang_platinum",		{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:boomerang_silver",			{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:boomerang_steel",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:boomerang_stone",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:boomerang_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:boomerang_wood",			{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:cestus",					{ "combat": 1} );
addData( "req_weapon", "spartanweaponry:cestus_studded",			{ "combat": 3} );
addData( "req_weapon", "spartanweaponry:club_studded",				{ "combat": 3} );
addData( "req_weapon", "spartanweaponry:club_wood",					{ "combat": 1} );
addData( "req_weapon", "spartanweaponry:dagger_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:dagger_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:dagger_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:dagger_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:dagger_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:dagger_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:dagger_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:dagger_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:dagger_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:dagger_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:dagger_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:dagger_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:dagger_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:dagger_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:dagger_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:dagger_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:flanged_mace_bronze",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:flanged_mace_copper",		{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:flanged_mace_diamond",		{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:flanged_mace_electrum",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:flanged_mace_gold",			{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:flanged_mace_invar",		{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:flanged_mace_iron",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:flanged_mace_lead",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:flanged_mace_netherite",	{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:flanged_mace_nickel",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:flanged_mace_platinum",		{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:flanged_mace_silver",		{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:flanged_mace_steel",		{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:flanged_mace_stone",		{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:flanged_mace_tin",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:flanged_mace_wood",			{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:glaive_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:glaive_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:glaive_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:glaive_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:glaive_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:glaive_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:glaive_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:glaive_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:glaive_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:glaive_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:glaive_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:glaive_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:glaive_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:glaive_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:glaive_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:glaive_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:greatsword_bronze",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:greatsword_copper",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:greatsword_diamond",		{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:greatsword_electrum",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:greatsword_gold",			{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:greatsword_invar",			{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:greatsword_iron",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:greatsword_lead",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:greatsword_netherite",		{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:greatsword_nickel",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:greatsword_platinum",		{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:greatsword_silver",			{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:greatsword_steel",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:greatsword_stone",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:greatsword_tin",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:greatsword_wood",			{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:halberd_bronze",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:halberd_copper",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:halberd_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:halberd_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:halberd_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:halberd_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:halberd_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:halberd_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:halberd_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:halberd_nickel",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:halberd_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:halberd_silver",			{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:halberd_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:halberd_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:halberd_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:halberd_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:hammer_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:hammer_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:hammer_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:hammer_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:hammer_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:hammer_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:hammer_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:hammer_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:hammer_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:hammer_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:hammer_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:hammer_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:hammer_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:hammer_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:hammer_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:hammer_wood",				{ "combat": 5} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_bronze",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_bronze",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_copper",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_copper",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_diamond",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_diamond",		{ "archery": 15} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_electrum",	{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_electrum",		{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_gold",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_gold",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_invar",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_invar",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_iron",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_iron",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_lead",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_lead",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_leather",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_leather",		{ "archery": 10} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_netherite",	{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_netherite",		{ "archery": 20} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_nickel",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_nickel",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_platinum",	{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_platinum",		{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_silver",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_silver",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_steel",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_steel",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_tin",			{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_tin",			{ "archery": 13} );
addData( "item_specific", "spartanweaponry:heavy_crossbow_wood",		{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:heavy_crossbow_wood",			{ "archery": 10} );
addData( "req_weapon", "spartanweaponry:javelin_bronze",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:javelin_copper",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:javelin_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:javelin_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:javelin_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:javelin_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:javelin_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:javelin_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:javelin_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:javelin_nickel",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:javelin_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:javelin_silver",			{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:javelin_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:javelin_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:javelin_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:javelin_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:katana_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:katana_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:katana_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:katana_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:katana_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:katana_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:katana_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:katana_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:katana_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:katana_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:katana_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:katana_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:katana_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:katana_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:katana_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:katana_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:lance_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:lance_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:lance_diamond",				{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:lance_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:lance_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:lance_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:lance_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:lance_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:lance_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:lance_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:lance_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:lance_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:lance_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:lance_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:lance_tin",					{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:lance_wood",				{ "combat": 5} );
addData( "item_specific", "spartanweaponry:longbow_bronze",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_bronze",				{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_copper",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_copper",				{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_diamond",			{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_diamond",				{ "archery": 10} );
addData( "item_specific", "spartanweaponry:longbow_electrum",			{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_electrum",				{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_gold",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_gold",					{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_invar",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_invar",					{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_iron",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_iron",					{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_lead",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_lead",					{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_leather",			{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_leather",				{ "archery": 7} );
addData( "item_specific", "spartanweaponry:longbow_netherite",			{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_netherite",				{ "archery": 15} );
addData( "item_specific", "spartanweaponry:longbow_nickel",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_nickel",				{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_platinum",			{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_platinum",				{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_silver",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_silver",				{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_steel",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_steel",					{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_tin",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_tin",					{ "archery": 8} );
addData( "item_specific", "spartanweaponry:longbow_wood",				{ "archeryWeapon": 1} );
addData( "req_weapon", "spartanweaponry:longbow_wood",					{ "archery": 5} );
addData( "req_weapon", "spartanweaponry:longsword_bronze",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:longsword_copper",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:longsword_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:longsword_electrum",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:longsword_gold",			{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:longsword_invar",			{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:longsword_iron",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:longsword_lead",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:longsword_netherite",		{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:longsword_nickel",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:longsword_platinum",		{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:longsword_silver",			{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:longsword_steel",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:longsword_stone",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:longsword_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:longsword_wood",			{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:pike_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:pike_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:pike_diamond",				{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:pike_electrum",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:pike_gold",					{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:pike_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:pike_iron",					{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:pike_lead",					{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:pike_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:pike_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:pike_platinum",				{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:pike_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:pike_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:pike_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:pike_tin",					{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:pike_wood",					{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:quarterstaff_bronze",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:quarterstaff_copper",		{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:quarterstaff_diamond",		{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:quarterstaff_electrum",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:quarterstaff_gold",			{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:quarterstaff_invar",		{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:quarterstaff_iron",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:quarterstaff_lead",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:quarterstaff_netherite",	{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:quarterstaff_nickel",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:quarterstaff_platinum",		{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:quarterstaff_silver",		{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:quarterstaff_steel",		{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:quarterstaff_stone",		{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:quarterstaff_tin",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:quarterstaff_wood",			{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:rapier_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:rapier_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:rapier_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:rapier_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:rapier_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:rapier_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:rapier_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:rapier_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:rapier_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:rapier_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:rapier_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:rapier_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:rapier_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:rapier_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:rapier_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:rapier_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:saber_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:saber_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:saber_diamond",				{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:saber_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:saber_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:saber_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:saber_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:saber_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:saber_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:saber_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:saber_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:saber_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:saber_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:saber_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:saber_tin",					{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:saber_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:spear_bronze",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:spear_copper",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:spear_diamond",				{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:spear_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:spear_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:spear_invar",				{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:spear_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:spear_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:spear_netherite",			{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:spear_nickel",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:spear_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:spear_silver",				{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:spear_steel",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:spear_stone",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:spear_tin",					{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:spear_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:throwing_knife_bronze",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:throwing_knife_copper",		{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:throwing_knife_diamond",	{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:throwing_knife_electrum",	{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:throwing_knife_gold",		{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:throwing_knife_invar",		{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:throwing_knife_iron",		{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:throwing_knife_lead",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:throwing_knife_netherite",	{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:throwing_knife_nickel",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:throwing_knife_platinum",	{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:throwing_knife_silver",		{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:throwing_knife_steel",		{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:throwing_knife_stone",		{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:throwing_knife_tin",		{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:throwing_knife_wood",		{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:tomahawk_bronze",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:tomahawk_copper",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:tomahawk_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:tomahawk_electrum",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:tomahawk_gold",				{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:tomahawk_invar",			{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:tomahawk_iron",				{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:tomahawk_lead",				{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:tomahawk_netherite",		{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:tomahawk_nickel",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:tomahawk_platinum",			{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:tomahawk_silver",			{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:tomahawk_steel",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:tomahawk_stone",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:tomahawk_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:tomahawk_wood",				{ "combat": 5} );
addData( "req_weapon", "spartanweaponry:warhammer_bronze",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:warhammer_copper",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:warhammer_diamond",			{ "combat": 45} );
addData( "req_weapon", "spartanweaponry:warhammer_electrum",		{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:warhammer_gold",			{ "combat": 35} );
addData( "req_weapon", "spartanweaponry:warhammer_invar",			{ "combat": 22} );
addData( "req_weapon", "spartanweaponry:warhammer_iron",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:warhammer_lead",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:warhammer_netherite",		{ "combat": 65} );
addData( "req_weapon", "spartanweaponry:warhammer_nickel",			{ "combat": 20} );
addData( "req_weapon", "spartanweaponry:warhammer_platinum",		{ "combat": 37} );
addData( "req_weapon", "spartanweaponry:warhammer_silver",			{ "combat": 17} );
addData( "req_weapon", "spartanweaponry:warhammer_steel",			{ "combat": 25} );
addData( "req_weapon", "spartanweaponry:warhammer_stone",			{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:warhammer_tin",				{ "combat": 15} );
addData( "req_weapon", "spartanweaponry:warhammer_wood",			{ "combat": 5} );
}
//STORAGEDRAWERS
{
addData( "req_craft", "storagedrawers:compacting_drawers_3",							{ "crafting": 30 } );
addData( "req_place", "storagedrawers:compacting_drawers_3",							{ "building": 15 } );
addData( "req_use", "storagedrawers:compacting_drawers_3",								{ "crafting": 30 } );
addData( "req_craft", "storagedrawers:controller",										{ "crafting": 40 } );
addData( "req_place", "storagedrawers:controller",										{ "building": 20 } );
addData( "req_use", "storagedrawers:controller",										{ "crafting": 40 } );
addData( "req_craft", "storagedrawers:controller_slave",								{ "crafting": 50 } );
addData( "req_place", "storagedrawers:controller_slave",								{ "building": 25 } );
addData( "req_use", "storagedrawers:controller_slave",									{ "crafting": 50 } );
addData( "req_craft", "storagedrawers:conversion_upgrade",								{ "crafting": 25 } );
addData( "req_craft", "storagedrawers:diamond_storage_upgrade",							{ "crafting": 40 } );
addData( "req_craft", "storagedrawers:emerald_storage_upgrade",							{ "crafting": 50 } );
addData( "req_craft", "storagedrawers:gold_storage_upgrade",							{ "crafting": 30 } );
addData( "req_craft", "storagedrawers:illumination_upgrade",							{ "crafting": 25 } );
addData( "req_craft", "storagedrawers:iron_storage_upgrade",							{ "crafting": 20 } );
addData( "req_craft", "storagedrawers:obsidian_storage_upgrade",						{ "crafting": 10 } );
addData( "req_craft", "storagedrawers:void_upgrade",									{ "crafting": 20 } );
}
//SWITCHBOW
{
addData( "item_specific", "switchbow:switchbow",						{ "archeryWeapon": 1} );
addData( "req_weapon", "switchbow:switchbow",							{ "archery": 20} );
addData( "item_specific", "switchbow:switchcrossbow",					{ "archeryWeapon": 1} );
addData( "req_weapon", "switchbow:switchcrossbow",						{ "archery": 30} );
}
//THEABYSS
{
addData( "info_smelt", "theabyss:abyssingot",							{ "extraChance": 0.5} );
addData( "xp_value_smelt", "theabyss:abyssingot",							{ "smithing": 8} );
addData( "info_smelt", "theabyss:unactivefusioningot",					{ "extraChance": 0.5} );
addData( "xp_value_smelt", "theabyss:unactivefusioningot",					{ "smithing": 18} );
}
//THERMAL
{
addData( "info_ore", "thermal:apatite_ore",							{ "extraChance": 1} );
addData( "info_smelt", "thermal:apatite_ore",							{ "extraChance": 1.2} );
addData( "xp_value_break", "thermal:apatite_ore",							{ "mining": 6} );
addData( "xp_value_smelt", "thermal:apatite_ore",							{ "smithing": 6} );
addData( "xp_value_smelt", "thermal:bronze_dust",							{ "smithing": 18} );
addData( "info_ore", "thermal:cinnabar_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "thermal:cinnabar_ore",							{ "extraChance": 0.6} );
addData( "xp_value_break", "thermal:cinnabar_ore",							{ "mining": 18} );
addData( "xp_value_smelt", "thermal:cinnabar_ore",							{ "smithing": 12} );
addData( "xp_value_smelt", "thermal:constantan_dust",						{ "smithing": 18} );
addData( "xp_value_smelt", "thermal:copper_dust",							{ "smithing": 7} );
addData( "info_ore", "thermal:copper_ore",							{ "extraChance": 0.8} );
addData( "info_smelt", "thermal:copper_ore",							{ "extraChance": 0.85} );
addData( "xp_value_break", "thermal:copper_ore",							{ "mining": 7} );
addData( "xp_value_smelt", "thermal:copper_ore",							{ "smithing": 7} );
addData( "xp_value_smelt", "thermal:electrum_dust",							{ "smithing": 18} );
addData( "xp_value_smelt", "thermal:enderium_dust",							{ "smithing": 28, "magic": 2} );
addData( "xp_value_smelt", "thermal:gold_dust",								{ "smithing": 16} );
addData( "xp_value_smelt", "thermal:invar_dust",							{ "smithing": 22} );
addData( "xp_value_smelt", "thermal:iron_dust",								{ "smithing": 12} );
addData( "xp_value_smelt", "thermal:lead_dust",								{ "smithing": 18} );
addData( "info_ore", "thermal:lead_ore",							{ "extraChance": 0.5} );
addData( "info_smelt", "thermal:lead_ore",								{ "extraChance": 0.75} );
addData( "xp_value_break", "thermal:lead_ore",								{ "mining": 20} );
addData( "xp_value_smelt", "thermal:lead_ore",								{ "smithing": 18} );
addData( "xp_value_smelt", "thermal:lumium_dust",							{ "smithing": 18} );
addData( "xp_value_smelt", "thermal:nickel_dust",							{ "smithing": 28} );
addData( "info_ore", "thermal:nickel_ore",							{ "extraChance": 0.35} );
addData( "info_smelt", "thermal:nickel_ore",							{ "extraChance": 0.35} );
addData( "xp_value_break", "thermal:nickel_ore",							{ "mining": 22} );
addData( "xp_value_smelt", "thermal:nickel_ore",							{ "smithing": 28} );
addData( "info_ore", "thermal:niter_ore",							{ "extraChance": 1} );
addData( "info_smelt", "thermal:niter_ore",								{ "extraChance": 1} );
addData( "xp_value_break", "thermal:niter_ore",								{ "mining": 16} );
addData( "xp_value_smelt", "thermal:niter_ore",								{ "smithing": 12} );
addData( "xp_value_smelt", "thermal:quartz_dust",							{ "smithing": 16} );
addData( "info_smelt", "thermal:rubber",								{ "extraChance": 1} );
addData( "xp_value_smelt", "thermal:rubber",								{ "smithing": 8} );
addData( "info_ore", "thermal:ruby_ore",							{ "extraChance": 0.75} );
addData( "info_smelt", "thermal:ruby_ore",								{ "extraChance": 1} );
addData( "xp_value_break", "thermal:ruby_ore",								{ "mining": 18} );
addData( "xp_value_smelt", "thermal:ruby_ore",								{ "smithing": 18} );
addData( "info_ore", "thermal:sapphire_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "thermal:sapphire_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "thermal:sapphire_ore",							{ "mining": 30} );
addData( "xp_value_smelt", "thermal:sapphire_ore",							{ "smithing": 18} );
addData( "xp_value_smelt", "thermal:signalum_dust",							{ "smithing": 22} );
addData( "xp_value_smelt", "thermal:silver_dust",							{ "smithing": 18} );
addData( "info_ore", "thermal:silver_ore",							{ "extraChance": 0.5} );
addData( "info_smelt", "thermal:silver_ore",							{ "extraChance": 0.5} );
addData( "xp_value_break", "thermal:silver_ore",							{ "mining": 22} );
addData( "xp_value_smelt", "thermal:silver_ore",							{ "smithing": 18} );
addData( "info_ore", "thermal:sulfur_ore",							{ "extraChance": 1} );
addData( "info_smelt", "thermal:sulfur_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "thermal:sulfur_ore",							{ "mining": 16} );
addData( "xp_value_smelt", "thermal:sulfur_ore",							{ "smithing": 12} );
addData( "xp_value_smelt", "thermal:tin_dust",								{ "smithing": 12} );
addData( "info_ore", "thermal:tin_ore",								{ "extraChance": 0.75} );
addData( "info_smelt", "thermal:tin_ore",								{ "extraChance": 1} );
addData( "xp_value_break", "thermal:tin_ore",								{ "mining": 10} );
addData( "xp_value_smelt", "thermal:tin_ore",								{ "smithing": 12} );
}
//TMECHWORKS
{
addData( "info_ore", "tmechworks:aluminum_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "tmechworks:aluminum_ore",						{ "extraChance": 0.75} );
addData( "xp_value_break", "tmechworks:aluminum_ore",						{ "mining": 8} );
addData( "xp_value_smelt", "tmechworks:aluminum_ore",						{ "smithing": 12} );
addData( "info_ore", "tmechworks:copper_ore",						{ "extraChance": 0.8} );
addData( "info_smelt", "tmechworks:copper_ore",							{ "extraChance": 0.85} );
addData( "xp_value_break", "tmechworks:copper_ore",							{ "mining": 7} );
addData( "xp_value_smelt", "tmechworks:copper_ore",							{ "smithing": 7} );
}
//TRAVERSE
{
addData( "req_place", "traverse:brown_autumnal_sapling",								{ "farming": 30, "woodcutting": 30 } );
addData( "xp_value_grow", "traverse:brown_autumnal_sapling",							{ "farming": 30 } );
addData( "xp_value_break", "traverse:fir_log",											{ "woodcutting": 7 } );
addData( "info_log", "traverse:fir_log",												{ "extraChance": 0.8 } );
addData( "req_place", "traverse:fir_sapling",											{ "farming": 35, "woodcutting": 60 } );
addData( "xp_value_grow", "traverse:fir_sapling",										{ "farming": 20 } );
addData( "xp_value_break", "traverse:fir_wood",											{ "woodcutting": 7 } );
addData( "info_log", "traverse:fir_wood",												{ "extraChance": 0.8 } );
addData( "req_place", "traverse:orange_autumnal_sapling",								{ "farming": 25, "woodcutting": 35 } );
addData( "xp_value_grow", "traverse:orange_autumnal_sapling",							{ "farming": 35 } );
addData( "req_place", "traverse:red_autumnal_sapling",									{ "farming": 35, "woodcutting": 25 } );
addData( "xp_value_grow", "traverse:red_autumnal_sapling",								{ "farming": 35 } );
addData( "req_place", "traverse:yellow_autumnal_sapling",								{ "farming": 30, "woodcutting": 35 } );
addData( "xp_value_grow", "traverse:yellow_autumnal_sapling",							{ "farming": 30 } );
}
//TREEMENDOUS
{
addData( "xp_value_break", "treemendous:alder_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:alder_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:alder_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:alder_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:alder_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:alder_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:alder_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:alder_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:alder_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:alder_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:alder_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:ash_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:ash_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:ash_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:ash_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:ash_log",												{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:ash_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:ash_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:ash_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:ash_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:ash_wood",										{ "woodcutting": 5 } );
addData( "info_log", "treemendous:ash_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:beech_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:beech_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:beech_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:beech_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:beech_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:beech_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:beech_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:beech_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:beech_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:beech_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:beech_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:brown_maple_leaves",							{ "woodcutting": 1.5 } );
addData( "req_place", "treemendous:brown_maple_sapling",								{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:brown_maple_sapling",							{ "farming": 15 } );
addData( "xp_value_break", "treemendous:cedar_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:cedar_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:cedar_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:cedar_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:cedar_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:cedar_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:cedar_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:cedar_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:cedar_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:cedar_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:cedar_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:cherry_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:cherry_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:cherry_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:cherry_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:cherry_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:cherry_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:cherry_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:cherry_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:cherry_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:cherry_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:cherry_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:chestnut_leaves",								{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:chestnut_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:chestnut_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:chestnut_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:chestnut_log",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:chestnut_planks",								{ "woodcutting": 5 } );
addData( "req_place", "treemendous:chestnut_sapling",									{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:chestnut_sapling",								{ "farming": 15 } );
addData( "xp_value_break", "treemendous:chestnut_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:chestnut_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:chestnut_wood",										{ "extraChance": 0.65 } );
addData( "req_tool", "treemendous:diamond_lumber_axe",									{ "woodcutting": 25 } );
addData( "xp_value_break", "treemendous:douglas_leaves",								{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:douglas_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:douglas_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:douglas_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:douglas_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:douglas_planks",								{ "woodcutting": 5 } );
addData( "req_place", "treemendous:douglas_sapling",									{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_break", "treemendous:douglas_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_grow", "treemendous:douglas_sapling",								{ "farming": 15 } );
addData( "xp_value_break", "treemendous:douglas_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:douglas_wood",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:elm_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:elm_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:elm_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:elm_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:elm_log",												{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:elm_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:elm_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:elm_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:elm_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:elm_wood",										{ "woodcutting": 5 } );
addData( "info_log", "treemendous:elm_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:fir_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:fir_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:fir_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:fir_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:fir_log",												{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:fir_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:fir_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:fir_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:fir_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:fir_wood",										{ "woodcutting": 5 } );
addData( "info_log", "treemendous:fir_wood",											{ "extraChance": 0.65 } );
addData( "req_tool", "treemendous:golden_lumber_axe",									{ "woodcutting": 25 } );
addData( "req_tool", "treemendous:iron_lumber_axe",										{ "woodcutting": 25 } );
addData( "xp_value_break", "treemendous:japanese_leaves",								{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:japanese_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:japanese_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:japanese_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:japanese_log",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:japanese_planks",								{ "woodcutting": 5 } );
addData( "req_place", "treemendous:japanese_sapling",									{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:japanese_sapling",								{ "farming": 15 } );
addData( "xp_value_break", "treemendous:japanese_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:japanese_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:japanese_wood",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:juniper_leaves",								{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:juniper_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:juniper_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:juniper_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:juniper_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:juniper_planks",								{ "woodcutting": 5 } );
addData( "req_place", "treemendous:juniper_sapling",									{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:juniper_sapling",								{ "farming": 15 } );
addData( "xp_value_break", "treemendous:juniper_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:juniper_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:juniper_wood",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:larch_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:larch_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:larch_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:larch_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:larch_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:larch_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:larch_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:larch_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:larch_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:larch_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:larch_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:linden_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:linden_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:linden_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:linden_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:linden_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:linden_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:linden_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:linden_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:linden_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:linden_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:linden_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:magnolia_leaves",								{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:magnolia_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:magnolia_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:magnolia_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:magnolia_log",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:magnolia_planks",								{ "woodcutting": 5 } );
addData( "req_place", "treemendous:magnolia_sapling",									{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:magnolia_sapling",								{ "farming": 15 } );
addData( "xp_value_break", "treemendous:magnolia_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:magnolia_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:magnolia_wood",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:maple_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:maple_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:maple_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:maple_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:maple_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:maple_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:maple_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:maple_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:maple_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:maple_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:maple_wood",											{ "extraChance": 0.65 } );
addData( "req_tool", "treemendous:netherite_lumber_axe",								{ "woodcutting": 25 } );
addData( "xp_value_break", "treemendous:pine_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:pine_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:pine_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:pine_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:pine_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:pine_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:pine_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:pine_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:pine_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:pine_wood",										{ "woodcutting": 5 } );
addData( "info_log", "treemendous:pine_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:plane_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:plane_log",										{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:plane_log",										{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:plane_log",											{ "extraChance": 1 } );
addData( "info_log", "treemendous:plane_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:plane_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:plane_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:plane_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:plane_sapling",									{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:plane_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:plane_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:pomegranate_leaves",							{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:pomegranate_log",								{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:pomegranate_log",								{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:pomegranate_log",									{ "extraChance": 1 } );
addData( "info_log", "treemendous:pomegranate_log",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:pomegranate_planks",							{ "woodcutting": 5 } );
addData( "req_place", "treemendous:pomegranate_sapling",								{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:pomegranate_sapling",							{ "farming": 15 } );
addData( "xp_value_break", "treemendous:pomegranate_sapling",							{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:pomegranate_wood",								{ "woodcutting": 5 } );
addData( "info_log", "treemendous:pomegranate_wood",									{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:poplar_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:poplar_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:poplar_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:poplar_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:poplar_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:poplar_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:poplar_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:poplar_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:poplar_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:poplar_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:poplar_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:rainbow_eucalyptus_leaves",						{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:rainbow_eucalyptus_log",						{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:rainbow_eucalyptus_log",						{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:rainbow_eucalyptus_log",							{ "extraChance": 1 } );
addData( "info_log", "treemendous:rainbow_eucalyptus_log",								{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:rainbow_eucalyptus_planks",						{ "woodcutting": 5 } );
addData( "req_place", "treemendous:rainbow_eucalyptus_sapling",							{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:rainbow_eucalyptus_sapling",						{ "farming": 15 } );
addData( "xp_value_break", "treemendous:rainbow_eucalyptus_sapling",					{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:rainbow_eucalyptus_wood",						{ "woodcutting": 5 } );
addData( "info_log", "treemendous:rainbow_eucalyptus_wood",								{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:red_maple_leaves",								{ "woodcutting": 1.5 } );
addData( "req_place", "treemendous:red_maple_sapling",									{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:red_maple_sapling",								{ "farming": 15 } );
addData( "xp_value_break", "treemendous:robinia_leaves",								{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:robinia_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:robinia_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:robinia_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:robinia_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:robinia_planks",								{ "woodcutting": 5 } );
addData( "req_place", "treemendous:robinia_sapling",									{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:robinia_sapling",								{ "farming": 15 } );
addData( "xp_value_break", "treemendous:robinia_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:robinia_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:robinia_wood",										{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:walnut_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:walnut_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:walnut_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:walnut_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:walnut_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:walnut_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:walnut_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:walnut_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:walnut_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:walnut_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:walnut_wood",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:willow_leaves",									{ "woodcutting": 1.5 } );
addData( "xp_value_break", "treemendous:willow_log",									{ "woodcutting": 5 } );
addData( "xp_value_smelt", "treemendous:willow_log",									{ "smithing": 0.25 } );
addData( "info_smelt", "treemendous:willow_log",										{ "extraChance": 1 } );
addData( "info_log", "treemendous:willow_log",											{ "extraChance": 0.65 } );
addData( "xp_value_break", "treemendous:willow_planks",									{ "woodcutting": 5 } );
addData( "req_place", "treemendous:willow_sapling",										{ "farming": 15, "woodcutting": 30 } );
addData( "xp_value_grow", "treemendous:willow_sapling",									{ "farming": 15 } );
addData( "xp_value_break", "treemendous:willow_sapling",								{ "woodcutting": 10 } );
addData( "xp_value_break", "treemendous:willow_wood",									{ "woodcutting": 5 } );
addData( "info_log", "treemendous:willow_wood",											{ "extraChance": 0.65 } );
}
//UNDERGARDEN
{
addData( "info_ore", "undergarden:cloggrum_ore",					{ "extraChance": 0.5} );
addData( "info_smelt", "undergarden:cloggrum_ore",						{ "extraChance": 0.5} );
addData( "xp_value_break", "undergarden:cloggrum_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "undergarden:cloggrum_ore",						{ "smithing": 12} );
addData( "info_ore", "undergarden:coal_ore",						{ "extraChance": 1} );
addData( "info_smelt", "undergarden:coal_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "undergarden:coal_ore",							{ "mining": 4} );
addData( "xp_value_smelt", "undergarden:coal_ore",							{ "smithing": 8} );
addData( "info_ore", "undergarden:diamond_ore",						{ "extraChance": 0.33} );
addData( "info_smelt", "undergarden:diamond_ore",						{ "extraChance": 0.25} );
addData( "xp_value_break", "undergarden:diamond_ore",						{ "mining": 35} );
addData( "xp_value_smelt", "undergarden:diamond_ore",						{ "smithing": 35} );
addData( "info_ore", "undergarden:froststeel_ore",					{ "extraChance": 0.5} );
addData( "info_smelt", "undergarden:froststeel_ore",					{ "extraChance": 0.5} );
addData( "xp_value_break", "undergarden:froststeel_ore",					{ "mining": 18} );
addData( "xp_value_smelt", "undergarden:froststeel_ore",					{ "smithing": 12} );
addData( "info_ore", "undergarden:gold_ore",						{ "extraChance": 0.5} );
addData( "info_smelt", "undergarden:gold_ore",							{ "extraChance": 0.5} );
addData( "xp_value_break", "undergarden:gold_ore",							{ "mining": 22} );
addData( "xp_value_smelt", "undergarden:gold_ore",							{ "smithing": 18} );
addData( "info_ore", "undergarden:iron_ore",						{ "extraChance": 0.75} );
addData( "info_smelt", "undergarden:iron_ore",							{ "extraChance": 1} );
addData( "xp_value_break", "undergarden:iron_ore",							{ "mining": 12} );
addData( "xp_value_smelt", "undergarden:iron_ore",							{ "smithing": 12} );
addData( "info_ore", "undergarden:regalium_ore",					{ "extraChance": 0.5} );
addData( "info_smelt", "undergarden:regalium_ore",						{ "extraChance": 0.5} );
addData( "xp_value_break", "undergarden:regalium_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "undergarden:regalium_ore",						{ "smithing": 12} );
addData( "info_ore", "undergarden:utherium_ore",					{ "extraChance": 0.5} );
addData( "info_smelt", "undergarden:utherium_ore",						{ "extraChance": 0.5} );
addData( "xp_value_break", "undergarden:utherium_ore",						{ "mining": 18} );
addData( "xp_value_smelt", "undergarden:utherium_ore",						{ "smithing": 12} );
}
//WOOT
{
addData( "xp_value_smelt", "woot:si_dust",									{ "smithing": 12} );
}
//QUARK
{
addData( "xp_value_craft", "quark:bamboo_block",									{ "crafting": 0} );
}
//UPGRADEDNETHERITE
{
addData( "req_tool", "upgradednetherite:ender_upgraded_netherite_axe",			{ "woodcutting": 80} );
addData( "req_tool", "upgradednetherite:ender_upgraded_netherite_pickaxe",		{ "mining": 80} );
addData( "req_tool", "upgradednetherite:ender_upgraded_netherite_shovel",		{ "excavation": 80} );
addData( "req_tool", "upgradednetherite:feather_upgraded_netherite_axe",		{ "woodcutting": 80} );
addData( "req_tool", "upgradednetherite:feather_upgraded_netherite_pickaxe",	{ "mining": 80} );
addData( "req_tool", "upgradednetherite:feather_upgraded_netherite_shovel",		{ "excavation": 80} );
addData( "req_tool", "upgradednetherite:fire_upgraded_netherite_axe",			{ "woodcutting": 80} );
addData( "req_tool", "upgradednetherite:fire_upgraded_netherite_pickaxe",		{ "mining": 80} );
addData( "req_tool", "upgradednetherite:fire_upgraded_netherite_shovel",		{ "excavation": 80} );
addData( "req_tool", "upgradednetherite:gold_upgraded_netherite_axe",			{ "woodcutting": 80} );
addData( "req_tool", "upgradednetherite:gold_upgraded_netherite_pickaxe",		{ "mining": 80} );
addData( "req_tool", "upgradednetherite:gold_upgraded_netherite_shovel",		{ "excavation": 80} );
addData( "req_tool", "upgradednetherite:phantom_upgraded_netherite_axe",		{ "woodcutting": 80} );
addData( "req_tool", "upgradednetherite:phantom_upgraded_netherite_pickaxe",	{ "mining": 80} );
addData( "req_tool", "upgradednetherite:phantom_upgraded_netherite_shovel",		{ "excavation": 80} );
addData( "req_tool", "upgradednetherite:poison_upgraded_netherite_axe",			{ "woodcutting": 80} );
addData( "req_tool", "upgradednetherite:water_upgraded_netherite_axe",			{ "woodcutting": 80} );
addData( "req_tool", "upgradednetherite:water_upgraded_netherite_pickaxe",		{ "mining": 80} );
addData( "req_tool", "upgradednetherite:water_upgraded_netherite_shovel",		{ "excavation": 80} );
addData( "req_tool", "upgradednetherite:wither_upgraded_netherite_axe",			{ "woodcutting": 80} );
addData( "req_weapon", "upgradednetherite:ender_upgraded_netherite_axe",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:ender_upgraded_netherite_pickaxe",	{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:ender_upgraded_netherite_shovel",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:ender_upgraded_netherite_sword",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:feather_upgraded_netherite_axe",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:feather_upgraded_netherite_pickaxe",	{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:feather_upgraded_netherite_shovel",	{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:feather_upgraded_netherite_sword",	{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:fire_upgraded_netherite_axe",			{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:fire_upgraded_netherite_pickaxe",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:fire_upgraded_netherite_shovel",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:fire_upgraded_netherite_sword",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:gold_upgraded_netherite_axe",			{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:gold_upgraded_netherite_pickaxe",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:gold_upgraded_netherite_shovel",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:gold_upgraded_netherite_sword",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:phantom_upgraded_netherite_axe",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:phantom_upgraded_netherite_pickaxe",	{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:phantom_upgraded_netherite_shovel",	{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:phantom_upgraded_netherite_sword",	{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:poison_upgraded_netherite_axe",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:poison_upgraded_netherite_sword",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:water_upgraded_netherite_axe",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:water_upgraded_netherite_pickaxe",	{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:water_upgraded_netherite_shovel",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:water_upgraded_netherite_sword",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:wither_upgraded_netherite_axe",		{ "combat": 80} );
addData( "req_weapon", "upgradednetherite:wither_upgraded_netherite_sword",		{ "combat": 80} );
addData( "req_wear", "upgradednetherite:ender_upgraded_netherite_boots",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:ender_upgraded_netherite_chestplate",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:ender_upgraded_netherite_helmet",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:ender_upgraded_netherite_leggings",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:feather_upgraded_netherite_boots",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:feather_upgraded_netherite_chestplate",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:feather_upgraded_netherite_helmet",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:feather_upgraded_netherite_leggings",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:fire_upgraded_netherite_boots",			{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:fire_upgraded_netherite_chestplate",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:fire_upgraded_netherite_helmet",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:fire_upgraded_netherite_leggings",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:gold_upgraded_netherite_boots",			{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:gold_upgraded_netherite_chestplate",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:gold_upgraded_netherite_helmet",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:gold_upgraded_netherite_leggings",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:phantom_upgraded_netherite_boots",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:phantom_upgraded_netherite_chestplate",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:phantom_upgraded_netherite_helmet",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:phantom_upgraded_netherite_leggings",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:poison_upgraded_netherite_boots",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:poison_upgraded_netherite_chestplate",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:poison_upgraded_netherite_helmet",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:poison_upgraded_netherite_leggings",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:water_upgraded_netherite_boots",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:water_upgraded_netherite_chestplate",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:water_upgraded_netherite_helmet",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:water_upgraded_netherite_leggings",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:wither_upgraded_netherite_boots",		{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:wither_upgraded_netherite_chestplate",	{ "endurance": 80} );
addData( "req_wear", "upgradednetherite:wither_upgraded_netherite_helmet",		{ "endurance": 80} );
addData( "xp_bonus_worn", "upgradednetherite:ender_upgraded_netherite_shield",		{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "upgradednetherite:feather_upgraded_netherite_shield",	{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "upgradednetherite:fire_upgraded_netherite_shield",		{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "upgradednetherite:gold_upgraded_netherite_shield",		{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "upgradednetherite:netherite_shield",						{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "upgradednetherite:phantom_upgraded_netherite_shield",	{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "upgradednetherite:poison_upgraded_netherite_shield",		{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "upgradednetherite:water_upgraded_netherite_shield",		{ "endurance": 25, "combat": 10} );
addData( "xp_bonus_worn", "upgradednetherite:wither_upgraded_netherite_shield",		{ "endurance": 25, "combat": 10} );
}

//Dynamic Trees
{
	addData( "req_place", "dynamictrees:jungle_seed",							{ "farming": 20, "woodcutting": 35 } );
	addData( "req_place", "dynamictrees:oak_seed",								{ "farming": 5, "woodcutting": 10 } );
	addData( "req_place", "dynamictrees:apple_oak_seed",						{ "farming": 35, "woodcutting": 15 } );
	addData( "req_place", "dynamictrees:acacia_seed",						{ "farming": 10, "woodcutting": 15 } );
	addData( "req_place", "dynamictrees:dark_oak_seed",						{ "farming": 10, "woodcutting": 25 } );
	addData( "req_place", "dynamictrees:spruce_seed",						{ "farming": 15, "woodcutting": 30 } );
	addData( "req_place", "dynamictrees:birch_seed",						{ "farming": 50, "woodcutting": 25 } );
	addData( "req_place", "dynamictrees:crimson_seed",						{ "farming": 50, "woodcutting": 55 } );
	addData( "req_place", "dynamictrees:warped_seed",						{ "farming": 60, "woodcutting": 50 } );
}

//CGM
{
addData( "item_specific", "cgm:pistol", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:shotgun", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:rifle", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:grenade_launcher", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:bazooka", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:mini_gun", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:assault_rifle", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:machine_pistol", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:heavy_rifle", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:missile", { "gunWeapon": 1 } );
addData( "item_specific", "cgm:grenade", { "gunWeapon": 1 } );
}

addData( "xp_value_smelt", "#forge:dusts",					{ "smithing": 0 } );
addData( "info_smelt", 	"#forge:dusts",					{ "extraChance": 0 } );

function addData2( dataKey, regKey, entryKey, entryObject, probe )
{
	data2Count++;
	if( probe != null )
		console.log( `Warning: addData has 1 too many arguments at "${dataKey}" -> ${regKey} -> ${entryKey} -> ${stringify( entryObject )}: ${probe}` );

	dataKey = dataKey.toString();
	regKey = regKey.toString();
	entryKey = entryKey.toString();

	if( entryObject.constructor != jsonConstructor )
	{
		console.log( `Error: "${stringify( entryObject )}" is not a json object! -> "${dataKey}" -> "${regKey}" -> "${entryKey}" -> ${ stringify( entryObject ) }` );
		return;
	}

	if( dataKey.includes( " " ) )
	{
		console.log( `Warning: "${dataKey}" has a space in it! "${dataKey}" -> "${regKey}" -> "${entryKey}" -> ${ stringify( entryObject ) }` );
		dataKey = dataKey.replace( / /g, "" );
	}
	if( regKey.includes( " " ) )
	{
		console.log( `Warning: "${regKey}" has a space in it! "${dataKey}" -> "${regKey}" -> "${entryKey}" -> ${ stringify( entryObject ) }` );
		regKey = regKey.replace( / /g, "" );
	}
	if( entryKey.includes( " " ) )
	{
		console.log( `Warning: "${entryKey}" has a space in it! "${dataKey}" -> "${regKey}" -> "${entryKey}" -> ${ stringify( entryObject ) }` );
		entryKey = entryKey.replace( / /g, "" );
	}
	
	Object.keys( entryObject ).forEach( key =>
	{
		if( key.includes( " " ) )
		{
			console.log( `Warning: "${key}" has a space in it! -> "${dataKey}" -> "${regKey}" -> "${entryKey}" -> ${ stringify( entryObject ) }` );
			entryObject[ key.replace( / /g, "" ) ] = entryObject[ key ];
			delete entryObject[ key ];
		}
	});

	if( validKeys2.includes( dataKey ) )
	{
		if( data2[ dataKey ] == null )
			data2[ dataKey ] = {};
		if( data2[ dataKey ][ regKey ] == null )
			data2[ dataKey ][ regKey ] = {};
		
		if( data2[ dataKey ][ regKey ][ entryKey ] != null )
			console.log( `${++dupes2} Warning: duplicate entry of ${entryKey} in ${regKey} in ${dataKey}` )
		data2[ dataKey ][ regKey ][ entryKey ] = entryObject;
	}
	else
		console.log( `invalid key "${dataKey}" -> "${regKey}" -> "${entryKey}" -> ${ stringify( entryObject ) }` );
}

function addData( dataKey, regKey, entryObject, probe )
{
	data1Count++;
	// Debug
	// if( /*dataKey == "req_wear" || dataKey == "req_tool" || dataKey == "req_weapon" ||*/ dataKey == "req_enchant" || dataKey == "req_craft" || dataKey == "req_place" || dataKey == "req_break" || dataKey == "req_kill" )
	// Object.keys( entryObject ).forEach( key =>
	// {
	// 	if( entryObject[ key ] >= 40 )
	// 		console.log( `${dataKey}, ${regKey}, ${key}: ${entryObject[ key ]}` );
	// });

	if( dataKey == "skills" )
		validSkills.push( regKey );

	if( probe != null )
		console.log( `Warning: addData has 1 too many arguments at "${dataKey}" -> "${regKey}" -> ${stringify( entryObject ) }: ${probe}` );

	dataKey = dataKey.toString();
	regKey = regKey.toString();

	if( entryObject.constructor != jsonConstructor )
	{
		console.log( `Error: "${stringify( entryObject )}" is not a json object! -> "${dataKey}" -> "${regKey}" -> ${ stringify( entryObject ) }` );
		return;
	}

	if( dataKey.includes( " " ) )
	{
		console.log( `Warning: "${dataKey}" has a space in it! -> "${dataKey}" -> "${regKey}" -> ${ stringify( entryObject ) }` );
		dataKey = dataKey.replace( / /g, "" );
	}
	if( regKey.includes( " " ) )
	{
		console.log( `Warning: "${regKey}" has a space in it! -> "${dataKey}" -> "${regKey}" -> ${ stringify( entryObject ) }` );
		regKey = regKey.replace( / /g, "" );
	}

	if( dataKey != "level_up_command" )
	{
		Object.keys( entryObject ).forEach( key =>
		{
			if( key.includes( " " ) )
			{
				console.log( `Warning: "${key}" has a space in it! -> "${dataKey}" -> "${regKey}" -> ${ stringify( entryObject ) }` );
				entryObject[ key.replace( / /g, "" ) ] = entryObject[ key ];
				delete entryObject[ key ];
			}
		});
	}

	if( validKeys.includes( dataKey ) )
	{
		if( data[ dataKey ] == null )
		data[ dataKey ] = {};
	
		if( data[ dataKey ][ regKey ] != null )
			console.log( `${++dupes} Warning: duplicate entry of ${regKey} in ${dataKey}` );
		data[ dataKey ][ regKey ] = entryObject;
	}
	else
		console.log( `invalid key "${dataKey}" -> "${regKey}" -> ${ stringify( entryObject ) }` );
}

function stringify( object )
{
	return JSON.stringify( object, null, "\t" ).replace(/: {\n([\t]*)\t/g, ":\n$1{\n$1\t" );
}

validKeys.forEach( dataKey =>
{
	if( data[ dataKey ] != null )
	{
		Object.keys( data[ dataKey ] ).forEach( regKey =>
		{
			Object.keys( data[ dataKey ][ regKey ] ).forEach( entry =>
			{
				if( validInfoKeys.includes( dataKey ) )
				{
					if( !validInfo.includes( entry ) )
						console.log( `"${dataKey}" unexpected value "${entry}" at "${regKey}"` );
				}
				else if( dataKey == "biome_mob_multiplier" )
				{
					if( !validBiomeMobMultiplier.includes( entry ) )
						console.log( `"${dataKey}" unexpected value "${entry}" at "${regKey}"` );
				}
				else if( dataKey == "fish_pool" )
				{
					if( !validFishPool.includes( entry ) )
						console.log( `"${dataKey}" unexpected value "${entry}" at "${regKey}"` );
				}
				else if( dataKey == "fish_enchant_pool" )
				{
					if( !validFishEnchantPool.includes( entry ) )
						console.log( `"${dataKey}" unexpected value "${entry}" at "${regKey}"` );
				}
				else if( dataKey == "level_up_command" )
				{
					if( !validSkills.includes( regKey ) )
						console.log( `"${dataKey}" unexpected value "${regKey}" at "${dataKey}"` );
				}
				else if( dataKey == "player_specific" )
				{
					if( !validPlayerSpecific.includes( entry ) )
						console.log( `${dataKey} unexpected value "${entry}" at "${regKey}"` );
				}
				else if( dataKey == "block_specific" )
				{
					if( !validBlockSpecific.includes( entry ) )
						console.log( `${dataKey} unexpected value "${entry}" at "${regKey}"` );
				}
				else if( dataKey == "item_specific" )
				{
					if( !validItemSpecific.includes( entry ) )
						console.log( `${dataKey} unexpected value "${entry}" at "${regKey}"` );
				}
				else if( dataKey == "skills" )
				{
					if( !validSkillsInfo.includes( entry ) )
						console.log( `${dataKey} unexpected value "${entry}" at "${regKey}"` );
				}
				else if( dataKey == "vein_blacklist" || dataKey == "mob_rare_drop" || dataKey == "biome_effect_negative" || dataKey == "biome_effect_positive" )
				{
					
				}
				else
				{
					if( !validSkills.includes( entry ) )
						console.log( `"${dataKey}" unexpected value "${entry}" at "${regKey}"` );
				}
				if( entry != "salvageItem" && parseFloat( data[ dataKey ][ regKey ][ entry ] ).toString() == "NaN" )
					console.log( `"${dataKey}" not a valid number "${entry}" at "${regKey}"` );
			
				blacklistChars.forEach( blacklistChar =>
				{
					if( entry.includes( blacklistChar ) && dataKey != "level_up_command" )
						console.log( `"${dataKey}" unexpected character '${blacklistChar}' in "${entry}" at "${regKey}"` );
					if( regKey.includes( blacklistChar ) )
						console.log( `"${dataKey}" unexpected character '${blacklistChar}' in "${regKey}" at "${entry}" at "${regKey}"` );
					if( dataKey.includes( blacklistChar ) )
						console.log( `"${dataKey}" unexpected character '${blacklistChar}' in "${dataKey}" at "${entry}" at "${regKey}"` );
				});
			});
		});
	}
	else
		console.log( `You can also (optionally) use "${dataKey}".` );
});
validKeys2.forEach( dataKey =>
	{
		if( data2[ dataKey ] != null )
		{
			Object.keys( data2[ dataKey ] ).forEach( regKey =>
			{
				Object.keys( data2[ dataKey ][ regKey ] ).forEach( entryKey =>
				{
					Object.keys( data2[ dataKey ][ regKey ][ entryKey ] ).forEach( value =>
					{
						if( dataKey == "salvage" )
						{
							if( !validSalvage.includes( value ) )
								console.log( `"${dataKey}" unexpected value "${entry}" at "${regKey}" at ${entryKey}` );
						}
						else if( dataKey == "treasure" )
						{
							if( !validTreasure.includes( value ) )
								console.log( `"${dataKey}" unexpected value "${entry}" at "${regKey}" at ${entryKey}` );
						}
						else if( dataKey == "req_use_enchantment" )
						{
							if( isNaN( parseFloat( entryKey ) ) )
								console.log( `"${dataKey}" unexpected non-number value "${entryKey}" at "${regKey}"` );
							if( !validSkills.includes( value ) )
							console.log( `"${dataKey}" unexpected skill "${value}" at "${regKey}", "${entryKey}"` );
						}

						blacklistChars.forEach( blacklistChar =>
						{
							if( value.includes( blacklistChar ) )
								console.log( `"${dataKey}" unexpected character '${blacklistChar}' in "${value}" at "${entryKey}" at "${regKey}"` );
							if( entryKey.includes( blacklistChar ) )
								console.log( `"${dataKey}" unexpected character '${blacklistChar}' in "${entryKey}" at "${value}" at "${entryKey}" at "${regKey}"` );
							if( regKey.includes( blacklistChar ) )
								console.log( `"${dataKey}" unexpected character '${blacklistChar}' in "${regKey}" at "${value}" at "${entryKey}" at "${regKey}"` );
							if( dataKey.includes( blacklistChar ) )
								console.log( `"${dataKey}" unexpected character '${blacklistChar}' in "${dataKey}" at "${value}" at "${entryKey}" at "${regKey}"` );
						});
					});
				});
			});
		}
		else
			console.log( `You can also (optionally) use "${dataKey}".` );
	});
Object.keys( data ).forEach( key =>
{
	if( !oldData[ key ] )
		oldData[ key ] = {};
	Object.keys( data[ key ] ).forEach( innerKey =>
	{
		oldData[ key ][ innerKey ] = data[ key ][ innerKey ];
	});
});
Object.keys( data2 ).forEach( key =>
{
	if( !oldData2[ key ] )
		oldData2[ key ] = {};
	Object.keys( data2[ key ] ).forEach( innerKey =>
	{
		oldData2[ key ][ innerKey ] = data2[ key ][ innerKey ];
	});
});
validKeys.forEach( key =>
{
	if( oldData[ key ] )
	{
		fs.writeFileSync( `./data/${key}.json`, stringify( oldData[ key ] ) );
	}
});
validKeys2.forEach( key =>
{
	if( oldData2[ key ] )
	{
		fs.writeFileSync( `./data/${key}.json`, stringify( oldData2[ key ] ) );
	}
});
console.log( `JSON Successfully built! data1: ${data1Count}, data2: ${data2Count}` );

module.exports.data = data;
module.exports.data2 = data2;
