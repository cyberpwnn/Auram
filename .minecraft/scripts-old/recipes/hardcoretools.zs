import crafttweaker.item.IItemStack;

dur(<minecraft:diamond_pickaxe>, 0.35);
dur(<minecraft:diamond_axe>, 0.35);
dur(<minecraft:diamond_sword>, 0.35);
dur(<minecraft:diamond_hoe>, 0.35);
dur(<minecraft:diamond_shovel>, 0.35);

dur(<minecraft:iron_pickaxe>, 0.55);
dur(<minecraft:iron_axe>, 0.55);
dur(<minecraft:iron_sword>, 0.55);
dur(<minecraft:iron_hoe>, 0.55);
dur(<minecraft:iron_shovel>, 0.55);

dur(<minecraft:stone_pickaxe>, 0.75);
dur(<minecraft:stone_axe>, 0.75);
dur(<minecraft:stone_sword>, 0.75);
dur(<minecraft:stone_hoe>, 0.75);
dur(<minecraft:stone_shovel>, 0.75);

dur(<embers:pickaxe_copper>, 0.6);
dur(<embers:axe_copper>, 0.6);
dur(<embers:shovel_copper>, 0.6);
dur(<embers:hoe_copper>, 0.6);
dur(<embers:sword_copper>, 0.6);

durarm(<minecraft:diamond_helmet>, 0.35);
durarm(<minecraft:diamond_chestplate>, 0.35);
durarm(<minecraft:diamond_leggings>, 0.35);
durarm(<minecraft:diamond_boots>, 0.35);

durarm(<minecraft:iron_helmet>, 0.55);
durarm(<minecraft:iron_chestplate>, 0.55);
durarm(<minecraft:iron_leggings>, 0.55);
durarm(<minecraft:iron_boots>, 0.55);

durarmgood(<minecraft:golden_helmet>, 2.55);
durarmgood(<minecraft:golden_chestplate>, 2.55);
durarmgood(<minecraft:golden_leggings>, 2.55);
durarmgood(<minecraft:golden_boots>, 2.55);

durnot(<minecraft:flint_and_steel>, 0.45);
durnot(<minecraft:shears>, 0.35);

function dur(a as IItemStack, b as double){
	a.maxDamage = (a.maxDamage as double) * b;
    a.maxDamage += 1;
    a.addTooltip("This tool was built with sticks...");
    a.addTooltip("It could last a lot longer if it used tougher materials.");
}

function durarm(a as IItemStack, b as double){
	a.maxDamage = (a.maxDamage as double) * b;
    a.maxDamage += 1;
    a.addTooltip("This armor was built with a hammer...");
    a.addTooltip("It could last a lot longer if it were casted.");
}

function durarmgood(a as IItemStack, b as double){
	a.maxDamage = (a.maxDamage as double) * b;
    a.maxDamage += 1;
    a.addTooltip("This armor was built with a hammer...");
    a.addTooltip("But its gold so it's actually better!");
}

function durnot(a as IItemStack, b as double){
	a.maxDamage = (a.maxDamage as double) * b;
    a.maxDamage += 1;
}