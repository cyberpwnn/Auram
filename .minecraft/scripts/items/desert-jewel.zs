#loader contenttweaker

import mods.contenttweaker.Item;
import crafttweaker.game.IGame;

var ac = mods.contenttweaker.VanillaFactory.createItem("desertjewel");
ac.maxStackSize = 64;
ac.rarity = "rare";
ac.register();
game.setLocalization("item.contenttweaker.desertjewel.name", "Jewel of the Desert");
recipes.addShaped(<contenttweaker:desertjewel>, [[null, <minecraft:dye:4>, null],[<minecraft:emerald>, <minecraft:diamond>, <minecraft:emerald>], [null, <minecraft:emerald>, null]]);
