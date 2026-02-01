import crafttweaker.api.recipe.replacement.Replacer;
import crafttweaker.api.recipe.replacement.type.NameFilteringRule;
import crafttweaker.api.recipe.replacement.type.ManagerFilteringRule;
import crafttweaker.api.recipe.replacement.type.ComponentFilteringRule;
import crafttweaker.api.recipe.replacement.type.ModsFilteringRule;
import crafttweaker.api.recipe.replacement.type.NotFilteringRule;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.item.IItemStack;

// Bundle of Sticks
Replacer.create()
    .filter(ManagerFilteringRule.of(<recipetype:minecraft:crafting>))
    .filter(NotFilteringRule.of(NameFilteringRule.regex("^minecraft:crafting_special_")))
    .replace<IIngredient>(<recipecomponent:crafttweaker:input/ingredients>, 
        <tag:items:forge:rods/wooden> as IIngredient, 
        <item:auram:bundled_sticks> as IIngredient)
    .execute();


craftingTable.remove(<item:auram:bundled_sticks>);
var d = <item:minecraft:stick>;
var r = <item:minecraft:string>;
craftingTable.addShaped("bundlesticksfix", <item:auram:bundled_sticks> * 6, [
    [d, r, d],
    [d, r, d],
    [d, r, d]]);