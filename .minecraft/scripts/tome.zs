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
