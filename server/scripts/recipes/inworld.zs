import mods.inworldcrafting.FluidToItem;

// Burning wood drops charcoal
mods.inworldcrafting.FireCrafting.addRecipe(<minecraft:coal:1>, <ore:logWood>, 60);

// Burn Nightstone into Stone
mods.inworldcrafting.FireCrafting.addRecipe(<minecraft:stone>, <midnight:nightstone>, 240);

// Sand from sandstone
FluidToItem.transform(<minecraft:sand> * 3, <liquid:water>, [<ore:sandstone>], false);

// Paper from sawdust
FluidToItem.transform(<minecraft:paper> * 5, <liquid:water>, [<ore:dustWood>], false);

// Boom Steel
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:ingotSteel>.firstItem, <ore:ingotIron>, 35);

// Boom Sawdust
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:dustWood> * 2, <ore:plankWood>, 80);
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:dustWood> * 8, <ore:logWood>, 75);

// Boom Bloom
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<midnight:bloomcrystal> * 3, <midnight:bloomcrystal_rock>, 75);

// Coal to silicon
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:itemSilicon>.firstItem, <ore:itemCoal>, 45);

// Glowstone to clathrate
FluidToItem.transform(<thermalfoundation:material:894> * 3, <liquid:redstone>, [<minecraft:glowstone_dust>], true);

// TNT to tiny tnt
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<appliedenergistics2:tiny_tnt> * 3, <minecraft:tnt>, 95);


