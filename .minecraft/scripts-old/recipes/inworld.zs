import mods.inworldcrafting.FluidToItem;

// Burning wood drops charcoal
mods.inworldcrafting.FireCrafting.addRecipe(<minecraft:coal:1>, <ore:logWood>, 60);

// Sand from sandstone
FluidToItem.transform(<minecraft:sand> * 3, <liquid:water>, [<ore:sandstone>], false);

// Paper from sawdust
FluidToItem.transform(<minecraft:paper> * 6, <liquid:water>, [<ore:dustWood>], false);

// Boom Steel
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:ingotSteel>.firstItem, <ore:ingotIron>, 35);

// Coal to silicon
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:itemSilicon>.firstItem, <ore:itemCoal>, 30);

// Glowstone to clathrate
FluidToItem.transform(<thermalfoundation:material:894> * 3, <liquid:redstone>, [<minecraft:glowstone_dust>], true);

// TNT to tiny tnt
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<appliedenergistics2:tiny_tnt> * 3, <minecraft:tnt>, 95);


