import mods.inworldcrafting.FluidToItem;
import mods.thaumcraft.SalisMundus;

// Sand from sandstone
FluidToItem.transform(<minecraft:sand> * 3, <liquid:water>, [<ore:sandstone>], false);

// Paper from sawdust
FluidToItem.transform(<minecraft:paper> * 5, <liquid:water>, [<ore:dustWood>], false);

// Boom Steel
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:ingotSteel>.firstItem, <ore:ingotIron>, 35);

// Boom Bloom
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<midnight:bloomcrystal> * 3, <midnight:bloomcrystal_rock>, 75);

// Coal to silicon
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<ore:itemSilicon>.firstItem, <ore:itemCoal>, 45);

// Tailors Upgrade
SalisMundus.addSingleConversion(<artisanworktables:worktable>, <artisanworktables:workstation>);
SalisMundus.addSingleConversion(<artisanworktables:workstation>, <artisanworktables:workshop>);

// Carpenter Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:1>, <artisanworktables:workstation:1>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:1>, <artisanworktables:workshop:1>);

// Mason Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:2>, <artisanworktables:workstation:2>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:2>, <artisanworktables:workshop:2>);

// Blacksmith Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:3>, <artisanworktables:workstation:3>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:3>, <artisanworktables:workshop:3>);

// Jewlers Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:4>, <artisanworktables:workstation:4>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:4>, <artisanworktables:workshop:4>);

// Worktable Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:5>, <artisanworktables:workstation:5>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:5>, <artisanworktables:workshop:5>);

// Engineers Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:6>, <artisanworktables:workstation:6>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:6>, <artisanworktables:workshop:6>);

// Mages Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:7>, <artisanworktables:workstation:7>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:7>, <artisanworktables:workshop:7>);

// Scribe Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:8>, <artisanworktables:workstation:8>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:8>, <artisanworktables:workshop:8>);

// Chemists Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:9>, <artisanworktables:workstation:9>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:9>, <artisanworktables:workshop:9>);

// Farmers Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:10>, <artisanworktables:workstation:10>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:10>, <artisanworktables:workshop:10>);

// Chefs Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:11>, <artisanworktables:workstation:11>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:11>, <artisanworktables:workshop:11>);

// Designers Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:12>, <artisanworktables:workstation:12>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:12>, <artisanworktables:workshop:12>);

// Tanners Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:13>, <artisanworktables:workstation:13>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:13>, <artisanworktables:workshop:13>);

// Potters Upgrades
SalisMundus.addSingleConversion(<artisanworktables:worktable:14>, <artisanworktables:workstation:14>);
SalisMundus.addSingleConversion(<artisanworktables:workstation:14>, <artisanworktables:workshop:14>);

// Catalyst Swapping
SalisMundus.addSingleConversion(<botania:alchemycatalyst>, <botania:conjurationcatalyst>);
SalisMundus.addSingleConversion(<botania:conjurationcatalyst>, <botanicadds:terra_catalyst>);
SalisMundus.addSingleConversion(<botanicadds:terra_catalyst>, <extrabotany:dimensioncatalyst>);
SalisMundus.addSingleConversion(<extrabotany:dimensioncatalyst>, <botania:alchemycatalyst>);

// Plank Swapping
SalisMundus.addSingleConversion(<minecraft:planks>, <minecraft:planks:1>);
SalisMundus.addSingleConversion(<minecraft:planks:1>, <minecraft:planks:2>);
SalisMundus.addSingleConversion(<minecraft:planks:2>, <minecraft:planks:3>);
SalisMundus.addSingleConversion(<minecraft:planks:3>, <minecraft:planks:4>);
SalisMundus.addSingleConversion(<minecraft:planks:4>, <minecraft:planks:5>);
SalisMundus.addSingleConversion(<minecraft:planks:5>, <minecraft:planks>);

// Slab Swapping
SalisMundus.addSingleConversion(<minecraft:wooden_slab>, <minecraft:wooden_slab:1>);
SalisMundus.addSingleConversion(<minecraft:wooden_slab:1>, <minecraft:wooden_slab:2>);
SalisMundus.addSingleConversion(<minecraft:wooden_slab:2>, <minecraft:wooden_slab:3>);
SalisMundus.addSingleConversion(<minecraft:wooden_slab:3>, <minecraft:wooden_slab:4>);
SalisMundus.addSingleConversion(<minecraft:wooden_slab:4>, <minecraft:wooden_slab:5>);
SalisMundus.addSingleConversion(<minecraft:wooden_slab:5>, <minecraft:wooden_slab>);

// Log Swapping
SalisMundus.addSingleConversion(<minecraft:log>, <minecraft:log:1>);
SalisMundus.addSingleConversion(<minecraft:log:1>, <minecraft:log:2>);
SalisMundus.addSingleConversion(<minecraft:log:2>, <minecraft:log:3>);
SalisMundus.addSingleConversion(<minecraft:log:3>, <minecraft:log2>);
SalisMundus.addSingleConversion(<minecraft:log2>, <minecraft:log2:1>);
SalisMundus.addSingleConversion(<minecraft:log2:1>, <minecraft:log>);

// Stair Swapping
SalisMundus.addSingleConversion(<minecraft:oak_stairs>, <minecraft:spruce_stairs>);
SalisMundus.addSingleConversion(<minecraft:spruce_stairs>, <minecraft:birch_stairs>);
SalisMundus.addSingleConversion(<minecraft:birch_stairs>, <minecraft:jungle_stairs>);
SalisMundus.addSingleConversion(<minecraft:jungle_stairs>, <minecraft:acacia_stairs>);
SalisMundus.addSingleConversion(<minecraft:acacia_stairs>, <minecraft:dark_oak_stairs>);
SalisMundus.addSingleConversion(<minecraft:dark_oak_stairs>, <minecraft:oak_stairs>);

// Fence Swapping
SalisMundus.addSingleConversion(<minecraft:fence>, <minecraft:spruce_fence>);
SalisMundus.addSingleConversion(<minecraft:spruce_fence>, <minecraft:birch_fence>);
SalisMundus.addSingleConversion(<minecraft:birch_fence>, <minecraft:jungle_fence>);
SalisMundus.addSingleConversion(<minecraft:jungle_fence>, <minecraft:acacia_fence>);
SalisMundus.addSingleConversion(<minecraft:acacia_fence>, <minecraft:dark_oak_fence>);
SalisMundus.addSingleConversion(<minecraft:dark_oak_fence>, <minecraft:fence>);

// Fence Gate Swapping
SalisMundus.addSingleConversion(<minecraft:fence_gate>, <minecraft:spruce_fence_gate>);
SalisMundus.addSingleConversion(<minecraft:spruce_fence_gate>, <minecraft:birch_fence_gate>);
SalisMundus.addSingleConversion(<minecraft:birch_fence_gate>, <minecraft:jungle_fence_gate>);
SalisMundus.addSingleConversion(<minecraft:jungle_fence_gate>, <minecraft:acacia_fence_gate>);
SalisMundus.addSingleConversion(<minecraft:acacia_fence_gate>, <minecraft:dark_oak_fence_gate>);
SalisMundus.addSingleConversion(<minecraft:dark_oak_fence_gate>, <minecraft:fence_gate>);

SalisMundus.addSingleConversion(<ore:grass>, <minecraft:mycelium>);
SalisMundus.addSingleConversion(<ore:dirt>, <biomesoplenty:dirt>);
SalisMundus.addSingleConversion(<minecraft:melon_block>, <minecraft:pumpkin>);
SalisMundus.addSingleConversion(<minecraft:pumpkin>, <minecraft:lit_pumpkin>);

SalisMundus.addSingleConversion(<ore:blockQuartz>, <arcanearchives:storage_raw_quartz>);



// Enven Trades
mods.botania.ElvenTrade.addRecipe([<minecraft:bread>], [<minecraft:wheat>]);
mods.botania.ElvenTrade.addRecipe([<minecraft:grass>], [<minecraft:dirt>]);
mods.botania.ElvenTrade.addRecipe([<minecraft:golden_carrot>], [<minecraft:carrot>]);
mods.botania.ElvenTrade.addRecipe([<minecraft:golden_apple>], [<minecraft:apple>]);
mods.botania.ElvenTrade.addRecipe([<minecraft:golden_apple:1>], [<minecraft:golden_apple>]);
mods.botania.ElvenTrade.addRecipe([<botania:brewvial>.withTag({brewKey: "resistance"})], [<minecraft:diamond_chestplate>]);
mods.botania.ElvenTrade.addRecipe([<botania:brewvial>.withTag({brewKey: "overload"})], [<minecraft:diamond_axe>]);
mods.botania.ElvenTrade.addRecipe([<botania:brewvial>.withTag({brewKey: "healing"})], [<scalinghealth:crystalshard>*4]);
mods.botania.ElvenTrade.addRecipe([<botania:brewvial>.withTag({brewKey: "absorption"})], [<minecraft:shield>]);
mods.botania.ElvenTrade.addRecipe([<botania:brewvial>.withTag({brewKey: "oneforall"})], [<minecraft:ghast_tear>]);
mods.botania.ElvenTrade.addRecipe([<minecraft:melon_block>], [<minecraft:pumpkin>]);
mods.botania.ElvenTrade.addRecipe([<minecraft:pumpkin>], [<minecraft:lit_pumpkin>]);
mods.botania.ElvenTrade.addRecipe([<minecraft:speckled_melon>], [<minecraft:melon>]);
mods.botania.ElvenTrade.addRecipe([<thaumcraft:charm_undying>], [<atum:scarab>]);

// Mana Powder into Salis Mundus
mods.botania.ManaInfusion.addConjuration(<thaumcraft:salis_mundus>, <ore:powderMana>, 5000);

// Glass Clarity
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_glass>, <minecraft:glass>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass>, <minecraft:stained_glass>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:1>, <minecraft:stained_glass:1>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:2>, <minecraft:stained_glass:2>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:3>, <minecraft:stained_glass:3>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:4>, <minecraft:stained_glass:4>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:5>, <minecraft:stained_glass:5>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:6>, <minecraft:stained_glass:6>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:7>, <minecraft:stained_glass:7>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:8>, <minecraft:stained_glass:8>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:9>, <minecraft:stained_glass:9>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:10>, <minecraft:stained_glass:10>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:11>, <minecraft:stained_glass:11>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:12>, <minecraft:stained_glass:12>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:13>, <minecraft:stained_glass:13>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:14>, <minecraft:stained_glass:14>, 1000);
mods.botania.ManaInfusion.addConjuration(<tconstruct:clear_stained_glass:15>, <minecraft:stained_glass:15>, 1000);

mods.botania.ManaInfusion.addConjuration(<arcanearchives:raw_quartz>, <ore:gemQuartz>, 2500);

// Steak Tree
mods.botania.ManaInfusion.addAlchemy(<twilightforest:cooked_venison>, <minecraft:cooked_beef>,               10);
mods.botania.ManaInfusion.addAlchemy(<thaumic_arcana:slime_meat_cooked>, <twilightforest:cooked_venison>,    100);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:cheesesteakitem>, <thaumic_arcana:slime_meat_cooked>,     1000);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:steakfajitaitem>, <harvestcraft:cheesesteakitem>,         10000);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:salisburysteakitem>, <harvestcraft:steakfajitaitem>,      100000);
mods.botania.ManaInfusion.addAlchemy(<artifacts:everlasting_cooked_beef>, <harvestcraft:salisburysteakitem>, 1000000);

// Pork Tree
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:bbqpulledporkitem>, <minecraft:cooked_porkchop>,                 10);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:shrimpokrahushpuppiesitem>, <harvestcraft:bbqpulledporkitem>,    100);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:porklomeinitem>, <harvestcraft:shrimpokrahushpuppiesitem>,       1000);
mods.botania.ManaInfusion.addAlchemy(<abyssalcraft:porkp>, <harvestcraft:porklomeinitem>,                           10000);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:gourmetporkburgeritem>, <abyssalcraft:porkp>,                    100000);
mods.botania.ManaInfusion.addAlchemy(<artifacts:everlasting_cooked_porkchop>, <harvestcraft:gourmetporkburgeritem>, 1000000);

// Chicken Tree
mods.botania.ManaInfusion.addAlchemy(<extrabotany:friedchicken>, <minecraft:cooked_chicken>,                         10);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:chickencurryitem>, <extrabotany:friedchicken>,                    100);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:chickendinneritem>, <harvestcraft:chickencurryitem>,              1000);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:springfieldcashewchickenitem>, <harvestcraft:chickendinneritem>,  10000);
mods.botania.ManaInfusion.addAlchemy(<harvestcraft:chickenbiscuititem>, <harvestcraft:springfieldcashewchickenitem>, 100000);
mods.botania.ManaInfusion.addAlchemy(<artifacts:everlasting_cooked_chicken>, <harvestcraft:chickenbiscuititem>,      1000000);
