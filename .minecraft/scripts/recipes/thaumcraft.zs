import mods.inworldcrafting.FireCrafting;

recipes.remove(<thaumcraft:salis_mundus>);
FireCrafting.addRecipe(<thaumcraft:salis_mundus>, <midnight:bloomcrystal>, 60);
mods.jei.JEI.addDescription(<thaumcraft:salis_mundus>,"Toss a Bloom Crystal into fire and wait a couple seconds. Bloom Crystals can be obtained in the Midnight dimension.");

recipes.remove(<thaumcraft:stone_arcane>);
recipes.remove(<thaumcraft:stone_arcane> * 9);
mods.botania.PureDaisy.addRecipe(<midnight:nightstone>,<thaumcraft:stone_arcane>, 150);