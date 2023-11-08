import crafttweaker.item.IItemStack;
import mods.initialinventory.InvHandler;

static tome as IItemStack = <akashictome:tome>.withTag({RepairCost: 0, "akashictome:is_morphing": 1 as byte, display: {Name: "The Book"}, "akashictome:data": {
    tconstruct: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "tconstruct:book", Count: 1 as byte, tag: {"akashictome:definedMod": "tconstruct"}, Damage: 0 as short}, 
    buildcraftlib: {id: "buildcraftlib:guide", Count: 1 as byte, tag: {"akashictome:definedMod": "buildcraftlib"}, Damage: 0 as short}, 
    bloodarsenal: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "guideapi:bloodarsenal-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "bloodarsenal", "G-API_Category_Page": 0, "G-API_Category": 0, "G-API_Entry_Page": 0, "G-API_Page": 3, "G-API_Entry": "minecraft:guide.bloodarsenal.entry.lifebringer.intro"}, Damage: 0 as short}, 
    astralsorcery: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "astralsorcery:itemjournal", Count: 1 as byte, tag: {"akashictome:definedMod": "astralsorcery"}, Damage: 0 as short}, 
    conarm: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "conarm:book", Count: 1 as byte, tag: {"akashictome:definedMod": "conarm"}, Damage: 0 as short}, 
    immersiveengineering: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "immersiveengineering:tool", Count: 1 as byte, tag: {"akashictome:definedMod": "immersiveengineering"}, Damage: 3 as short}, 
    arcanearchives: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "arcanearchives:tome_arcana", Count: 1 as byte, tag: {"akashictome:definedMod": "arcanearchives", Book: "arcanearchives:xml/tome.xml"}, Damage: 0 as short}, 
    embers: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "embers:codex", Count: 1 as byte, tag: {"akashictome:definedMod": "embers"}, Damage: 0 as short}, 
    solcarrot: {id: "solcarrot:food_book", Count: 1 as byte, tag: {"akashictome:definedMod": "solcarrot"}, Damage: 0 as short}, 
    aether_legacy: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "aether_legacy:lore_book", Count: 1 as byte, tag: {"akashictome:definedMod": "aether_legacy"}, Damage: 0 as short}, 
    buildcraftlib1: {id: "buildcraftlib:guide", Count: 1 as byte, tag: {"akashictome:definedMod": "buildcraftlib1"}, Damage: 0 as short}, 
    botania: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {AS_Amulet_HolderLeast: -4785361185744441946 as long, AS_Amulet_HolderMost: 7645098134614984877 as long}}, id: "botania:lexicon", Count: 1 as byte, tag: {"akashictome:displayName": "Lexica Botania", "akashictome:definedMod": "botania", "akashictome:is_morphing": 1 as byte, display: {Name: "§rAkashic Tome (§aLexica Botania§r)"}}, Damage: 0 as short}, 
    dynamictrees: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "dynamictrees", "patchouli:book": "dynamictrees:guide"}, Damage: 0 as short}
}});

InvHandler.addStartingItem(tome);

recipes.remove(<akashictome:tome>);
mods.botania.ManaInfusion.addInfusion(tome, <minecraft:book>, 1000);
