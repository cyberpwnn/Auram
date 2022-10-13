import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
#modloaded akashictome bqt tconstruct astralsorcery immersiveengineering botania guideapi wizardry embers conarm


recipes.remove(<akashictome:tome>);
<akashictome:tome>.displayName = "Tome of Knowledge";
<bqt:bqbook>.displayName = "Quest Book";

var completeTome = <akashictome:tome>.withTag({"akashictome:data": 
    {
        tconstruct: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "tconstruct:book", Count: 1 as byte, tag: {"akashictome:definedMod": "tconstruct"}, Damage: 0 as short}, 
        bloodarsenal: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "guideapi:bloodarsenal-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "bloodarsenal", "G-API_Category_Page": 0}, Damage: 0 as short}, 
        astralsorcery: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "astralsorcery:itemjournal", Count: 1 as byte, tag: {"akashictome:definedMod": "astralsorcery"}, Damage: 0 as short}, 
        bqt: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "bqt:bqbook", Count: 1 as byte, tag: {"akashictome:definedMod": "bqt"}, Damage: 0 as short}, 
        conarm: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "conarm:book", Count: 1 as byte, tag: {"akashictome:definedMod": "conarm"}, Damage: 0 as short}, 
        immersiveengineering: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "immersiveengineering:tool", Count: 1 as byte, tag: {"akashictome:definedMod": "immersiveengineering"}, Damage: 3 as short}, 
        wizardry: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "wizardry:book", Count: 1 as byte, tag: {"akashictome:definedMod": "wizardry"}, Damage: 0 as short}, 
        gbook: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "gbook:guidebook", Count: 1 as byte, tag: {"akashictome:definedMod": "gbook", Book: "minecolonies:book/minecolonies.xml"}, Damage: 0 as short}, 
        embers: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "embers:codex", Count: 1 as byte, tag: {"akashictome:definedMod": "embers"}, Damage: 0 as short}, 
        botania: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "botania:lexicon", Count: 1 as byte, tag: {"akashictome:definedMod": "botania"}, Damage: 0 as short}, 
        draconicevolution: {id: "draconicevolution:info_tablet", Count: 1 as byte, tag: {"akashictome:definedMod": "draconicevolution"}, Damage: 0 as short}, 
        openblocks: {id: "openblocks:info_book", Count: 1 as byte, tag: {"akashictome:definedMod": "openblocks"}, Damage: 0 as short}, 
        extrautils2: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "extrautils2:book", Count: 1 as byte, tag: {"akashictome:definedMod": "extrautils2"}, Damage: 0 as short}, 
        thermalfoundation: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "thermalfoundation:tome_experience", Count: 1 as byte, tag: {"akashictome:definedMod": "thermalfoundation", Mode: 1}, Damage: 0 as short}, 
        bloodmagic: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "guideapi:bloodmagic-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "bloodmagic"}, Damage: 0 as short}, 
        opencomputers: {id: "opencomputers:tool", Count: 1 as byte, tag: {"akashictome:definedMod": "opencomputers"}, Damage: 4 as short}, 
        dynamictrees: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "dynamictrees", "patchouli:book": "dynamictrees:guide"}, Damage: 0 as short}, 
        hammercore: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "hammercore:manual", Count: 1 as byte, tag: {"akashictome:definedMod": "hammercore"}, Damage: 0 as short}}});

completeTome.addTooltip(format.green("Contains all that there is to know"));
completeTome.addTooltip(format.aqua("Craft this tome with a book & some extra paper"));
mods.jei.JEI.addDescription(completeTome, "The Tome of Knowledge is a book for your books. Craft this tome with a book & some extra paper");
mods.jei.JEI.addItem(completeTome);
recipes.addShapeless(completeTome, [<minecraft:book>,<minecraft:paper>]);
mods.initialinventory.InvHandler.addStartingItem(completeTome);

var addedBooks = [
    <tconstruct:book>, 
    <bqt:bqbook>,
    <openblocks:info_book>,
    <astralsorcery:itemjournal>, 
    <immersiveengineering:tool:3>, 
    <immersiveengineering:tool>,
    <botania:lexicon>, 
    <guideapi:bloodmagic-guide>, 
    <wizardry:book>, 
    <embers:codex>, 
    <thermalfoundation:tome_experience>,
    <hammercore:manual>,
    <conarm:book>,
    <draconicevolution:info_tablet>,
    <patchouli:guide_book>,
    <opencomputers:tool:4>,
    <extrautils2:book>,
    <opencomputers:tool>,
    <gbook:guidebook>,
    <guideapi:bloodarsenal-guide>
    ] as IItemStack[];

for itemBook in addedBooks {
    itemBook.addTooltip(format.green("Included within the Tome of Knowledge"));
    itemBook.addTooltip(format.aqua("Left click air to get the Tome of Knowledge again"));
}

mods.initialinventory.InvHandler.addStartingItem(completeTome);