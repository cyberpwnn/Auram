#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

// Items
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

var itemChunkUranium = VanillaFactory.createItem("uranium_chunk");
itemChunkUranium.maxStackSize = 8;
itemChunkUranium.register();

var itemChunkOsmium = VanillaFactory.createItem("osmium_chunk");
itemChunkOsmium.maxStackSize = 16;
itemChunkOsmium.register();

var itemChunkIridium = VanillaFactory.createItem("iridium_chunk");
itemChunkIridium.maxStackSize = 8;
itemChunkIridium.register();

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
itemChunkPlatinum.maxStackSize = 8;
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

var itemQuartzCluster = VanillaFactory.createItem("quartz_cluster");
itemQuartzCluster.maxStackSize = 64;
itemQuartzCluster.register();

var itemChargedCertusCluster = VanillaFactory.createItem("charged_certus_cluster");
itemChargedCertusCluster.maxStackSize = 64;
itemChargedCertusCluster.register();

var itemCertusCluster = VanillaFactory.createItem("certus_cluster");
itemCertusCluster.maxStackSize = 64;
itemCertusCluster.register();

var itemEmeraldCluster = VanillaFactory.createItem("emerald_cluster");
itemEmeraldCluster.maxStackSize = 16;
itemEmeraldCluster.register();

var itemSapphireCluster = VanillaFactory.createItem("sapphire_cluster");
itemSapphireCluster.maxStackSize = 32;
itemSapphireCluster.register();

var itemRubyCluster = VanillaFactory.createItem("ruby_cluster");
itemRubyCluster.maxStackSize = 32;
itemRubyCluster.register();

var itemPeridotCluster = VanillaFactory.createItem("peridot_cluster");
itemPeridotCluster.maxStackSize = 32;
itemPeridotCluster.register();

var itemDiamondCluster = VanillaFactory.createItem("diamond_cluster");
itemDiamondCluster.maxStackSize = 16;
itemDiamondCluster.register();