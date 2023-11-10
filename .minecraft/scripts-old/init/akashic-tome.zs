import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
#modloaded akashictome bqt tconstruct astralsorcery immersiveengineering botania guideapi wizardry embers conarm patchouli theaurorian thaumcraft draconicevolution solcarrot loreexpansion arcanearchives


recipes.remove(<akashictome:tome>);
<akashictome:tome>.displayName = "Tome of Knowledge";

var completeTome = <akashictome:tome>.withTag({"akashictome:data": {tconstruct: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, 
id: "tconstruct:book", Count: 1 as byte, tag: {"akashictome:definedMod": "tconstruct"}, Damage: 0 as short}, 
bloodarsenal: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, 
id: "guideapi:bloodarsenal-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "bloodarsenal"}, Damage: 0 as short}, 
astralsorcery: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "astralsorcery:itemjournal", Count: 1 as byte, tag: {"akashictome:definedMod": "astralsorcery"},
 Damage: 0 as short}, conarm: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "conarm:book", Count: 1 as byte, tag: {"akashictome:definedMod": "conarm"},
  Damage: 0 as short}, loreexpansion: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "loreexpansion:lore_journal", Count: 1 as byte,
   tag: {"akashictome:definedMod": "loreexpansion"}, Damage: 0 as short}, arcanearchives: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}},
    id: "arcanearchives:tome_arcana", Count: 1 as byte, tag: {"akashictome:definedMod": "arcanearchives", Book: "arcanearchives:xml/tome.xml"}, Damage: 0 as short}, 
    solcarrot: {id: "solcarrot:food_book", Count: 1 as byte, tag: {"akashictome:definedMod": "solcarrot"}, Damage: 0 as short}, aether_legacy: 
    {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "aether_legacy:lore_book", Count: 1 as byte, tag: {"akashictome:definedMod": "aether_legacy"}, Damage: 0 as short}, 
    botania: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "botania:lexicon", Count: 1 as byte, tag: {"akashictome:definedMod": "botania"}, Damage: 0 as short},
     draconicevolution: {id: "draconicevolution:info_tablet", Count: 1 as byte, tag: {"akashictome:definedMod": "draconicevolution"}, Damage: 0 as short}, thaumcraft:
      {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "thaumcraft:thaumonomicon", Count: 1 as byte, tag: {"akashictome:definedMod": "thaumcraft"}, Damage: 0 as short},
       bloodmagic: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "guideapi:bloodmagic-guide", Count: 1 as byte, tag: {"akashictome:definedMod": "bloodmagic"},
        Damage: 0 as short}, twilightforest: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}}, id: "patchouli:guide_book", Count: 1 as byte, tag:
         {"akashictome:definedMod": "twilightforest", "patchouli:book": "twilightforest:guide"}, Damage: 0 as short}, theaurorian: {ForgeCaps: {"astralsorcery:cap_item_amulet_holder": {}},
          id: "patchouli:guide_book", Count: 1 as byte, tag: {"akashictome:definedMod": "theaurorian", "patchouli:book": "theaurorian:the_aurorian_guide"}, Damage: 0 as short}}});

completeTome.addTooltip(format.green("Contains all that there is to know"));
completeTome.addTooltip(format.aqua("Craft this tome with a book & some extra paper"));
mods.jei.JEI.addDescription(completeTome, "The Tome of Knowledge is a book for your books. Craft this tome with a book & some extra paper");
mods.jei.JEI.addItem(completeTome);
recipes.addShapeless(completeTome, [<minecraft:book>,<minecraft:paper>]);
mods.initialinventory.InvHandler.addStartingItem(completeTome);
