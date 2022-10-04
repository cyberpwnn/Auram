#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

// Rocks
var itemRock = VanillaFactory.createItem("rock");
itemRock.maxStackSize = 16;
itemRock.register();

var itemSandPile = VanillaFactory.createItem("sand_pile");
itemSandPile.maxStackSize = 32;
itemSandPile.register();

var itemDirtClump = VanillaFactory.createItem("dirt_clump");
itemDirtClump.maxStackSize = 32;
itemDirtClump.register();
