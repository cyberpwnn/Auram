import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
#modloaded akashictome

recipes.remove(<akashictome:tome>);
<akashictome:tome>.displayName = "Tome of Knowledge";
<bqt:bqbook>.displayName = "Quest Book";

var completeTome = <akashictome:tome>.withTag(
{
    "akashictome:is_morphing": 1 as byte,
    "akashictome:data": {
        bqt: {
            id: "bqt:bqbook",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "bqt"
            },
            Damage: 0 as short
        },
        tconstruct: {
            id: "tconstruct:book",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "tconstruct"
            },
            Damage: 0 as short
        },
        astralsorcery: {
            id: "astralsorcery:itemjournal",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "astralsorcery"
            },
            Damage: 0 as short
        },
        immersiveengineering: {
            id: "immersiveengineering:tool",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "immersiveengineering"
            },
            Damage: 3 as short
        },
        botania: {
            id: "botania:lexicon",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "botania"
            },
            Damage: 0 as short
        },
        bloodmagic: {
            id: "guideapi:bloodmagic-guide",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "bloodmagic"
            },
            Damage: 0 as short
        },
        wizardry: {
            id: "wizardry:book",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "wizardry"
            },
            Damage: 0 as short
        },
        embers: {
            id: "embers:codex",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "embers"
            },
            Damage: 0 as short
        },
        conarm: {
            id: "conarm:book",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "conarm"
            },
            Damage: 0 as short
        },
        practicallogistics2: {
            id: "practicallogistics2:plguide",
            Count: 1 as byte,
            tag: {
                "akashictome:definedMod": "practicallogistics2"
            },
            Damage: 0 as short
        }
    }
});

completeTome.addTooltip(format.green("Contains all that there is to know"));
completeTome.addTooltip(format.aqua("Craft this tome with a book & some extra paper"));
mods.jei.JEI.addDescription(completeTome, "The Tome of Knowledge is a book for your books. Craft this tome with a book & some extra paper");
mods.jei.JEI.addItem(completeTome);
recipes.addShapeless(completeTome, [<minecraft:book>,<minecraft:paper>]);
mods.initialinventory.InvHandler.addStartingItem(completeTome);

var addedBooks = [
    <tconstruct:book>, 
    <bqt:bqbook>,
    <astralsorcery:itemjournal>, 
    <immersiveengineering:tool:3>, 
    <botania:lexicon>, 
    <guideapi:bloodmagic-guide>, 
    <wizardry:book>, 
    <embers:codex>, 
    <practicallogistics2:plguide>,
    <conarm:book>,
    ] as IItemStack[];

for itemBook in addedBooks {
    itemBook.addTooltip(format.green("Included within the Tome of Knowledge"));
    itemBook.addTooltip(format.aqua("Left click air to get the Tome of Knowledge again"));
}

mods.initialinventory.InvHandler.addStartingItem(completeTome);
mods.initialinventory.InvHandler.addStartingItem(<usefulbackpacks:backpack:1>.withTag({display: {color: 16351261, Name: "Travel Bag"}, Items: [{Slot: 0 as byte, ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "yurtmod:mallet", Count: 1 as byte, Damage: 0 as short}, {Slot: 1 as byte, ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "yurtmod:tent", Count: 1 as byte, tag: {TentData: {TentColor: 0, TentType: 1 as byte, WidthCur: 2 as byte, DepthCur: 0 as byte, ID: -32768 as long}}, Damage: 0 as short}, {Slot: 3 as byte, ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "tconstruct:shovel", Count: 1 as byte, tag: {StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 3.975 as float, FreeModifiers: 3, Durability: 188, HarvestLevel: 1, Attack: 2.25 as float}, display: {Name: "Lucky Shovel"}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 3.975 as float, FreeModifiers: 4, Durability: 188, HarvestLevel: 1, Attack: 2.25 as float}, Special: {Categories: ["harvest", "tool", "aoe"]}, TinkerData: {UsedModifiers: 2, Materials: ["xu_magical_wood", "copper", "wood"], Modifiers: ["toolleveling", "mending_moss"]}, Modifiers: [{identifier: "magical_modifier", color: -131160, level: 1, magical_modifier: 1 as byte}, {identifier: "brittle", color: -131160, level: 1}, {identifier: "established", color: -1204473, level: 1}, {identifier: "ecological", color: -7444965, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1, xp: 55, bonus_modifiers: 0}, {identifier: "mending_moss", color: 4434738, stored_xp: 7, level: 2, heal_timestamp: 34261 as long}], Traits: ["magical_modifier", "brittle", "established", "ecological", "toolleveling", "mending_moss"]}, Damage: 32 as short}, {Slot: 4 as byte, ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "tconstruct:frypan", Count: 1 as byte, tag: {StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 3.975 as float, FreeModifiers: 3, Durability: 177, HarvestLevel: 1, Attack: 2.25 as float}, display: {Name: "Blunt Weapon"}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 3.975 as float, FreeModifiers: 3, Durability: 177, HarvestLevel: 1, Attack: 2.25 as float}, Special: {Categories: ["tool", "weapon"]}, TinkerData: {UsedModifiers: 3, Materials: ["xu_magical_wood", "copper"], Modifiers: ["toolleveling", "mending_moss", "knockback"]}, Modifiers: [{identifier: "magical_modifier", color: -131160, level: 1, magical_modifier: 1 as byte}, {identifier: "brittle", color: -131160, level: 1}, {identifier: "established", color: -1204473, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "mending_moss", color: 4434738, stored_xp: 0, level: 1, heal_timestamp: 37489 as long}, {identifier: "knockback", current: 20, color: 10461087, level: 2, max: 20, extraInfo: "19 / 20"}], Traits: ["magical_modifier", "brittle", "established", "toolleveling", "mending_moss", "knockback"]}, Damage: 23 as short}, {Slot: 5 as byte, ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "tconstruct:shuriken", Count: 1 as byte, tag: {StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, Accuracy: 1.0 as float, MiningSpeed: 2.7375 as float, FreeModifiers: 3, Durability: 135, HarvestLevel: 1, Attack: 2.875 as float}, display: {Name: "Rusty Shurikens"}, Stats: {AttackSpeedMultiplier: 1.0 as float, Accuracy: 1.0 as float, MiningSpeed: 2.7375 as float, FreeModifiers: 1, Durability: 135, HarvestLevel: 1, Attack: 8.557679 as float}, Special: {Categories: ["projectile", "no_melee", "tool"]}, TinkerData: {UsedModifiers: 5, Materials: ["xu_magical_wood", "copper", "wood", "copper"], Modifiers: ["toolleveling", "mending_moss", "sharpness"]}, Modifiers: [{identifier: "magical_modifier", color: -131160, level: 1, magical_modifier: 1 as byte}, {identifier: "brittle", color: -131160, level: 1}, {identifier: "established", color: -1204473, level: 1}, {identifier: "ecological", color: -7444965, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}, {identifier: "mending_moss", color: 4434738, level: 3}, {identifier: "sharpness", current: 144, color: 16774902, level: 2, max: 144, extraInfo: "143 / 144"}], Traits: ["magical_modifier", "brittle", "established", "ecological", "toolleveling", "mending_moss"]}, Damage: 30 as short}, {Slot: 7 as byte, id: "minecraft:compass", Count: 1 as byte, tag: {"quark:compass_calculated": 1 as byte, "quark:compass_in_nether": 0 as byte}, Damage: 0 as short}, {Slot: 8 as byte, id: "minecraft:clock", Count: 1 as byte, tag: {"quark:clock_calculated": 1 as byte}, Damage: 0 as short}, {Slot: 16 as byte, id: "tconstruct:edible", Count: 15 as byte, Damage: 11 as short}, {Slot: 17 as byte, id: "minecraft:torch", Count: 5 as byte, Damage: 0 as short}]}));