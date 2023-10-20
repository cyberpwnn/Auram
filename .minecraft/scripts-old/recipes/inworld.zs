import mods.inworldcrafting.FluidToItem;

// Sand from sandstone
FluidToItem.transform(<minecraft:sand> * 3, <liquid:water>, [<ore:sandstone>], false);

// Paper from sawdust
FluidToItem.transform(<minecraft:paper> * 5, <liquid:water>, [<ore:dustWood>], false);

// Boom Steel
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:ingotSteel>.firstItem, <ore:ingotIron>, 35);

// Boom Bloom
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<midnight:bloomcrystal> * 3, <midnight:bloomcrystal_rock>, 75);

// Coal to silicon
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:itemSilicon>.firstItem, <ore:itemCoal>, 45);


