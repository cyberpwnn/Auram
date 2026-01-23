import crafttweaker.api.item.IItemStack;

/**
 * Adjusts the max durability of a tool/item.
 * 
 * - If multiplier > 0: Multiplies original durability by multiplier (rounded to nearest int).
 * - If multiplier == 0: Sets to unbreakable (maxDamage = 0).
 * - If multiplier < 0: SETS durability to the absolute value of multiplier (rounded to nearest int).
 *     Example: -32 → sets to 32, -32.6 → sets to 33.
 * - Unbreakable items (original maxDamage = 0) stay unbreakable on positive/zero multipliers,
 *   but can be made breakable via a negative multiplier.
 * - A calculated durability <= 0 becomes unbreakable.
 * - This affects ALL instances of the item globally.
 */
function setDurability(tool as IItemStack, multiplier as double) as void {
    if (multiplier < 0.0) {
        // Set mode: use absolute value, rounded to nearest
        val setValue = (-multiplier + 0.5) as int;
        tool.maxDamage = setValue;
    } else {
        // Multiply mode (including 0)
        val original = tool.maxDamage;
        if (original > 0) {
            val calculated = (original as double * multiplier + 0.5) as int;
            tool.maxDamage = calculated <= 0 ? 0 : calculated;
        }
        // If original == 0, remains unbreakable
    }
}

// The array version remains unchanged — it just calls the single-item function
function setDurabilities(tools as IItemStack[], multiplier as double) as void {
    for tool in tools {
        setDurability(tool, multiplier);
    }
}

setDurabilities([
    <item:minecraft:wooden_pickaxe>,
    <item:minecraft:wooden_axe>,
    <item:minecraft:wooden_shovel>,
    <item:minecraft:wooden_hoe>,
    <item:minecraft:wooden_sword>
] as IItemStack[], -16.0);
setDurabilities([
    <item:minecraft:stone_pickaxe>,
    <item:minecraft:stone_axe>,
    <item:minecraft:stone_shovel>,
    <item:minecraft:stone_hoe>,
    <item:minecraft:stone_sword>
] as IItemStack[], -48.0);
setDurabilities([
    <item:minecraft:iron_pickaxe>,
    <item:minecraft:iron_axe>,
    <item:minecraft:iron_shovel>,
    <item:minecraft:iron_hoe>,
    <item:minecraft:iron_sword>
] as IItemStack[], 0.65);
setDurabilities([
    <item:minecraft:diamond_pickaxe>,
    <item:minecraft:diamond_axe>,
    <item:minecraft:diamond_shovel>,
    <item:minecraft:diamond_hoe>,
    <item:minecraft:diamond_sword>
] as IItemStack[], 0.8);
setDurabilities([
    <item:minecraft:netherite_pickaxe>,
    <item:minecraft:netherite_axe>,
    <item:minecraft:netherite_shovel>,
    <item:minecraft:netherite_hoe>,
    <item:minecraft:netherite_sword>
] as IItemStack[], 1.25);

setDurability(<item:minecraft:flint_and_steel>, -4.0);