import mods.artisanworktables.builder.RecipeBuilder;
#disable_search_tree

// Loot Box
RecipeBuilder.get("tailor")
  .setShaped([
    [<minecraft:emerald>, <minecraft:ender_eye>, <minecraft:emerald>],
    [<minecraft:iron_ingot>, <minecraft:gold_block>, <minecraft:iron_ingot>],
    [<minecraft:emerald>, <minecraft:iron_ingot>, <minecraft:emerald>]])
  .addTool(<ore:artisansGrimoire>, 40)
  .addOutput(<bq_standard:loot_chest:101>.withTag({hideLootInfo: 1 as byte}))
  .setExtraOutputOne(<bq_standard:loot_chest:101>.withTag({hideLootInfo: 1 as byte}), 0.05)
  .setExtraOutputTwo(<bq_standard:loot_chest:101>.withTag({hideLootInfo: 1 as byte}), 0.05)
  .setExtraOutputThree(<bq_standard:loot_chest:101>.withTag({hideLootInfo: 1 as byte}), 0.05)
  .create();

recipes.remove(<extrautils2:bagofholding>.withTag({Items: {}}));
recipes.remove(<extrautils2:bagofholding>);