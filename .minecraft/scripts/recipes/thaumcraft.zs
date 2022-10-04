import mods.inworldcrafting.FireCrafting;

recipes.remove(<thaumcraft:salis_mundus>);
FireCrafting.addRecipe(<thaumcraft:salis_mundus>, <midnight:nightshroom_powder>, 60);
mods.jei.JEI.addDescription(<thaumcraft:salis_mundus>,"Toss Nightshroom Powder into fire and wait a couple seconds. Nightshroom powder can be obtained in the Midnight dimension.");

mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:stone_arcane>);
mods.botania.PureDaisy.addRecipe(<midnight:nightstone>,<thaumcraft:stone_arcane>, 740);