// function replaceRocks(event, block, rock) {
//     event.addBlockLootModifier(block)
//         .removeLoot(Ingredient.all).pool((p) => {
//             p.addLoot(rock);
//             p.limitCount([1, 4]);
//             p.applyOreBonus("minecraft:fortune");
//         });
// }

// function replaceRocksBoosted(event, block, rock) {
//     event.addBlockLootModifier(block)
//         .removeLoot(Ingredient.all).pool((p) => {
//             p.addLoot(rock);
//             p.limitCount([3, 6]);
//             p.applyOreBonus("minecraft:fortune");
//         });
// }

// LootJS.modifiers((event) => {
//     replaceRocks(event, "minecraft:stone", "auram:rock");  
//     replaceRocks(event, "minecraft:iron_ore", "auram:ironrock");
//     replaceRocks(event, "minecraft:gold_ore", "auram:goldrock");
//     replaceRocks(event, "minecraft:copper_ore", "auram:copperrock");
//     replaceRocks(event, "thermal:tin_ore", "auram:tinrock");
//     replaceRocks(event, "thermal:lead_ore", "auram:leadrock");
//     replaceRocks(event, "thermal:silver_ore", "auram:silverrock");
//     replaceRocks(event, "minecraft:deepslate", "auram:deepslaterock");
//     replaceRocks(event, "minecraft:diamond_ore", "auram:diamondrock");
//     replaceRocks(event, "minecraft:emerald_ore", "auram:emeraldrock");
//     replaceRocks(event, "minecraft:lapis_ore", "auram:lapisrock");
//     replaceRocks(event, "minecraft:redstone_ore", "auram:redstonerock");
//     replaceRocks(event, "minecraft:coal_ore", "auram:coalrock");

//     replaceRocksBoosted(event, "minecraft:deepslate_iron_ore", "auram:ironrock");
//     replaceRocksBoosted(event, "minecraft:deepslate_gold_ore", "auram:goldrock");
//     replaceRocksBoosted(event, "minecraft:deepslate_copper_ore", "auram:copperrock");
//     replaceRocksBoosted(event, "thermal:deepslate_tin_ore", "auram:tinrock");
//     replaceRocksBoosted(event, "thermal:deepslate_lead_ore", "auram:leadrock");
//     replaceRocksBoosted(event, "thermal:deepslate_silver_ore", "auram:silverrock");
//     replaceRocksBoosted(event, "minecraft:deepslate_diamond_ore", "auram:diamondrock");
//     replaceRocksBoosted(event, "minecraft:deepslate_emerald_ore", "auram:emeraldrock");
//     replaceRocksBoosted(event, "minecraft:deepslate_lapis_ore", "auram:lapisrock");
//     replaceRocksBoosted(event, "minecraft:deepslate_redstone_ore", "auram:redstonerock");
//     replaceRocksBoosted(event, "minecraft:deepslate_coal_ore", "auram:coalrock");

//     event.addEntityLootModifier("minecraft:sheep")
//         .randomChance(0.5)
//         .addLoot("minecraft:string");
// });