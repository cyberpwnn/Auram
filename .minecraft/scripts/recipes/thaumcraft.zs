import mods.inworldcrafting.FireCrafting;
import mods.thaumcraft.SalisMundus;

recipes.remove(<thaumcraft:salis_mundus>);
FireCrafting.addRecipe(<thaumcraft:salis_mundus>, <midnight:bloomcrystal>, 60);
mods.jei.JEI.addDescription(<thaumcraft:salis_mundus>,"Toss a Bloom Crystal into fire and wait a couple seconds. Bloom Crystals can be obtained in the Midnight dimension.");

recipes.remove(<thaumcraft:stone_arcane>);
recipes.remove(<thaumcraft:stone_arcane> * 9);
mods.botania.PureDaisy.addRecipe(<midnight:nightstone>,<thaumcraft:stone_arcane>, 150);

recipes.remove(<thaumcraft:stone_ancient_tile>);
recipes.remove(<thaumcraft:stone_ancient_tile> * 9);
mods.botania.PureDaisy.addRecipe(<thaumcraft:stone_arcane>,<thaumcraft:stone_ancient_tile>, 100);

recipes.remove(<thaumcraft:stone_ancient>);
recipes.remove(<thaumcraft:stone_ancient> * 9);
mods.botania.PureDaisy.addRecipe(<thaumcraft:stone_ancient_tile>,<thaumcraft:stone_ancient>, 50);

recipes.remove(<thaumcraft:stone_eldritch_tile>);
recipes.remove(<thaumcraft:stone_eldritch_tile> * 9);
mods.botania.PureDaisy.addRecipe(<thaumcraft:stone_ancient>,<thaumcraft:stone_eldritch_tile>, 50);
mods.botania.PureDaisy.addRecipe(<minecraft:glass>,<tconstruct:clear_glass>, 100);

SalisMundus.addSingleConversion(<ore:blockPrismarineBrick>, <bloodmagic:demon_brick_1:1>);

SalisMundus.addSingleConversion(<ore:blockPeridot>, <minecraft:emerald_block>);
SalisMundus.addSingleConversion(<ore:blockEmerald>, <projectred-exploration:stone:7>);

SalisMundus.addSingleConversion(<paragongems:block_ruby>.block, <projectred-exploration:stone:5>);
SalisMundus.addSingleConversion(<ore:blockRuby>, <paragongems:block_ruby>);

SalisMundus.addSingleConversion(<paragongems:block_sapphire>.block, <projectred-exploration:stone:6>);
SalisMundus.addSingleConversion(<ore:blockSapphire>, <paragongems:block_sapphire>);
