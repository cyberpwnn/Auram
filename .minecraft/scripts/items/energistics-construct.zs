#loader contenttweaker
#disable_search_tree

import mods.contenttweaker.Item;
import crafttweaker.game.IGame;

var ac = mods.contenttweaker.VanillaFactory.createItem("energisticsconstruct");
ac.maxStackSize = 64;
ac.rarity = "rare";
ac.register();
game.setLocalization("item.contenttweaker.energisticsconstruct.name", "Energistics Construct");
