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

var itemFlightKey = VanillaFactory.createItem("flight_key");
itemFlightKey.maxStackSize = 1;
itemFlightKey.register();

var itemChunkCobalt = VanillaFactory.createItem("cobalt_chunk");
itemChunkCobalt.maxStackSize = 8;
itemChunkCobalt.register();

var itemChunkArdite = VanillaFactory.createItem("ardite_chunk");
itemChunkArdite.maxStackSize = 8;
itemChunkArdite.register();

var itemChunkCopper = VanillaFactory.createItem("copper_chunk");
itemChunkCopper.maxStackSize = 32;
itemChunkCopper.register();

var itemChunkIron = VanillaFactory.createItem("iron_chunk");
itemChunkIron.maxStackSize = 16;
itemChunkIron.register();

var itemChunkLead = VanillaFactory.createItem("lead_chunk");
itemChunkLead.maxStackSize = 8;
itemChunkLead.register();

var itemChunkNickel = VanillaFactory.createItem("nickel_chunk");
itemChunkNickel.maxStackSize = 32;
itemChunkNickel.register();

var itemChunkPlatinum = VanillaFactory.createItem("platinum_chunk");
itemChunkPlatinum.maxStackSize = 16;
itemChunkPlatinum.register();

var itemChunkSilver = VanillaFactory.createItem("silver_chunk");
itemChunkSilver.maxStackSize = 16;
itemChunkSilver.register();

var itemChunkTin = VanillaFactory.createItem("tin_chunk");
itemChunkTin.maxStackSize = 64;
itemChunkTin.register();

var itemChunkGold = VanillaFactory.createItem("gold_chunk");
itemChunkGold.maxStackSize = 8;
itemChunkGold.register();

var itemChunkAluminum = VanillaFactory.createItem("aluminum_chunk");
itemChunkAluminum.maxStackSize = 64;
itemChunkAluminum.register();
