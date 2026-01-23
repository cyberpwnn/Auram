import crafttweaker.api.recipe.replacement.Replacer;
import crafttweaker.api.recipe.replacement.type.NameFilteringRule;
import crafttweaker.api.recipe.replacement.type.ManagerFilteringRule;
import crafttweaker.api.recipe.replacement.type.ComponentFilteringRule;
import crafttweaker.api.recipe.replacement.type.ModsFilteringRule;
import crafttweaker.api.recipe.replacement.type.NotFilteringRule;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.item.IItemStack;

craftingTable.addShapeless("enderjade", <item:auram:enderjade>, [<item:minecraft:emerald>,<item:thermal:enderium_coin>]);
craftingTable.addShapeless("journeymap", <item:auram:journeymap>, [<item:minecraft:map>,<item:thermal:enderium_coin>]);


// Remove existing rock to raw metal recipes
craftingTable.remove(<item:minecraft:raw_iron>);
craftingTable.remove(<item:minecraft:raw_copper>);
craftingTable.remove(<item:minecraft:raw_gold>);
craftingTable.removeByName("auram:rockcobblestone");

// Rocks to Raw Metals
craftingTable.addShapeless("rawtinrocks", <item:thermal:raw_tin>, [<item:auram:tinrock>,<item:auram:tinrock>,<item:auram:tinrock>,<item:auram:tinrock>]);
craftingTable.addShapeless("rawleadrocks", <item:thermal:raw_lead>, [<item:auram:leadrock>,<item:auram:leadrock>,<item:auram:leadrock>,<item:auram:leadrock>]);
craftingTable.addShapeless("rawsilverrocks", <item:thermal:raw_silver>, [<item:auram:silverrock>,<item:auram:silverrock>,<item:auram:silverrock>,<item:auram:silverrock>]);
craftingTable.addShapeless("rawgoldrocks", <item:minecraft:raw_gold>, [<item:auram:goldrock>,<item:auram:goldrock>,<item:auram:goldrock>,<item:auram:goldrock>]);
craftingTable.addShapeless("rawcopperrocks", <item:minecraft:raw_copper>, [<item:auram:copperrock>,<item:auram:copperrock>,<item:auram:copperrock>,<item:auram:copperrock>]);
craftingTable.addShapeless("rawironrocks", <item:minecraft:raw_iron>, [<item:auram:ironrock>,<item:auram:ironrock>,<item:auram:ironrock>,<item:auram:ironrock>]);
craftingTable.addShapeless("rockcobblestone", <item:minecraft:cobblestone>, [<item:auram:rock>, <item:auram:rock>, <item:auram:rock>, <item:auram:rock>]);
craftingTable.addShapeless("deepslaterocks", <item:minecraft:deepslate>, [<item:auram:deepslaterock>, <item:auram:deepslaterock>, <item:auram:deepslaterock>, <item:auram:deepslaterock>]);
craftingTable.addShapeless("rawdiamondrocks", <item:minecraft:diamond>, [<item:auram:diamondrock>,<item:auram:diamondrock>,<item:auram:diamondrock>,<item:auram:diamondrock>]);
craftingTable.addShapeless("rawemeraldrocks", <item:minecraft:emerald>, [<item:auram:emeraldrock>,<item:auram:emeraldrock>,<item:auram:emeraldrock>,<item:auram:emeraldrock>]);
craftingTable.addShapeless("rawlapisrocks", <item:minecraft:lapis_lazuli> * 3, [<item:auram:lapisrock>,<item:auram:lapisrock>,<item:auram:lapisrock>,<item:auram:lapisrock>]);
craftingTable.addShapeless("rawredstonerocks", <item:minecraft:redstone> * 3, [<item:auram:redstonerock>,<item:auram:redstonerock>,<item:auram:redstonerock>,<item:auram:redstonerock>]);
craftingTable.addShapeless("rawcoalrocks", <item:minecraft:coal>, [<item:auram:coalrock>,<item:auram:coalrock>,<item:auram:coalrock>,<item:auram:coalrock>]);

// Raw Metals to Rocks
craftingTable.addShapeless("tinrockfromraw", <item:auram:tinrock> * 4, [<item:thermal:raw_tin>]);
craftingTable.addShapeless("leadrockfromraw", <item:auram:leadrock> * 4, [<item:thermal:raw_lead>]);
craftingTable.addShapeless("silverrockfromraw", <item:auram:silverrock> * 4, [<item:thermal:raw_silver>]);
craftingTable.addShapeless("goldrockfromraw", <item:auram:goldrock> * 4, [<item:minecraft:raw_gold>]);
craftingTable.addShapeless("copperrockfromraw", <item:auram:copperrock> * 4, [<item:minecraft:raw_copper>]);
craftingTable.addShapeless("ironrockfromraw", <item:auram:ironrock> * 4, [<item:minecraft:raw_iron>]);
craftingTable.addShapeless("rockfromcobblestone", <item:auram:rock> * 4, [<item:minecraft:cobblestone>]);
craftingTable.addShapeless("deepslaterockfromdeepslate", <item:auram:deepslaterock> * 4, [<item:minecraft:deepslate>]);

craftingTable.addShapeless("diamondrockfromdiamond", <item:auram:diamondrock> * 4, [<item:minecraft:diamond>, <item:auram:rock>, <item:auram:rock>, <item:auram:rock>, <item:auram:rock>]);
craftingTable.addShapeless("emeraldrockfromemerald", <item:auram:emeraldrock> * 4, [<item:minecraft:emerald>, <item:auram:rock>, <item:auram:rock>, <item:auram:rock>, <item:auram:rock>]);
craftingTable.addShapeless("redstonerockfromredstone", <item:auram:redstonerock>, [<item:minecraft:redstone>, <item:auram:rock>]);
craftingTable.addShapeless("lapisrockfromlapis", <item:auram:lapisrock>, [<item:minecraft:lapis_lazuli>, <item:auram:rock>]);
craftingTable.addShapeless("coalrockfromcoal", <item:auram:coalrock> * 4, [<item:minecraft:coal>, <item:auram:rock>, <item:auram:rock>, <item:auram:rock>, <item:auram:rock>]);

// Bundle of Sticks
Replacer.create()
    .filter(ManagerFilteringRule.of(<recipetype:minecraft:crafting>))
    .filter(NotFilteringRule.of(NameFilteringRule.regex("^minecraft:crafting_special_")))
    .replace<IIngredient>(<recipecomponent:crafttweaker:input/ingredients>, 
        <tag:items:forge:rods/wooden> as IIngredient, 
        <item:auram:bundledsticks> as IIngredient)
    .execute();


craftingTable.remove(<item:auram:bundledsticks>);
var d = <item:minecraft:stick>;
var r = <item:minecraft:string>;
craftingTable.addShaped("bundlesticksfix", <item:auram:bundledsticks> * 6, [
    [d, r, d],
    [d, r, d],
    [d, r, d]]);