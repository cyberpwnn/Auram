import mods.inworldcrafting.FluidToItem;
import mods.inworldcrafting.FireCrafting;
import mods.inworldcrafting.ExplosionCrafting;
import mods.thaumcraft.SalisMundus;

// Make Charcoal
FireCrafting.addRecipe(<minecraft:coal:1>, <ore:logWood>, 20);
FireCrafting.addRecipe(<minecraft:glass>, <ore:sand>, 40);

// Sand from sandstone
FluidToItem.transform(<minecraft:sand> * 3, <liquid:water>, [<ore:sandstone>], false);

// Paper from sawdust
FluidToItem.transform(<minecraft:paper> * 5, <liquid:water>, [<ore:dustWood>], false);

// Marble creation
FluidToItem.transform(<astralsorcery:blockmarble> * 2, <liquid:stone>, [<ore:stoneAndesite>, <ore:stoneDiorite>], false);

// Seared
FluidToItem.transform(<tconstruct:seared:1>, <liquid:lava>, [<ore:cobblestone>], false);
FluidToItem.transform(<tconstruct:seared>, <liquid:lava>, [<ore:stone>], false);

// Boom Steel
ExplosionCrafting.explodeItemRecipe(<ore:ingotSteel>.firstItem, <ore:ingotIron>, 50);

// Boom Bloom
ExplosionCrafting.explodeItemRecipe(<midnight:bloomcrystal> * 3, <midnight:bloomcrystal_rock>, 75);

// Coal to silicon
ExplosionCrafting.explodeItemRecipe(<ore:itemSilicon>.firstItem, <ore:itemCoal>, 45);

// Tailors Upgrade
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable>, <artisanworktables:workstation>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation>, <artisanworktables:workshop>, 1000);

// Carpenter Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:1>, <artisanworktables:workstation:1>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:1>, <artisanworktables:workshop:1>, 1000);

// Mason Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:2>, <artisanworktables:workstation:2>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:2>, <artisanworktables:workshop:2>, 1000);

// Blacksmith Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:3>, <artisanworktables:workstation:3>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:3>, <artisanworktables:workshop:3>, 1000);

// Jewlers Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:4>, <artisanworktables:workstation:4>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:4>, <artisanworktables:workshop:4>, 1000);

// Worktable Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:5>, <artisanworktables:workstation:5>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:5>, <artisanworktables:workshop:5>, 1000);

// Engineers Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:6>, <artisanworktables:workstation:6>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:6>, <artisanworktables:workshop:6>, 1000);

// Mages Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:7>, <artisanworktables:workstation:7>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:7>, <artisanworktables:workshop:7>, 1000);

// Scribe Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:8>, <artisanworktables:workstation:8>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:8>, <artisanworktables:workshop:8>, 1000);

// Chemists Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:9>, <artisanworktables:workstation:9>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:9>, <artisanworktables:workshop:9>, 1000);

// Farmers Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:10>, <artisanworktables:workstation:10>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:10>, <artisanworktables:workshop:10>, 1000);

// Chefs Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:11>, <artisanworktables:workstation:11>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:11>, <artisanworktables:workshop:11>, 1000);

// Designers Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:12>, <artisanworktables:workstation:12>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:12>, <artisanworktables:workshop:12>, 1000);

// Tanners Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:13>, <artisanworktables:workstation:13>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:13>, <artisanworktables:workshop:13>, 1000);

// Potters Upgrades
mods.botania.ManaInfusion.addConjuration(<artisanworktables:worktable:14>, <artisanworktables:workstation:14>, 1000);
mods.botania.ManaInfusion.addConjuration(<artisanworktables:workstation:14>, <artisanworktables:workshop:14>, 1000);

// Catalyst Swapping
SalisMundus.addSingleConversion(<botania:alchemycatalyst>, <botania:conjurationcatalyst>);
SalisMundus.addSingleConversion(<botania:conjurationcatalyst>, <botanicadds:terra_catalyst>);
SalisMundus.addSingleConversion(<botanicadds:terra_catalyst>, <extrabotany:dimensioncatalyst>);
SalisMundus.addSingleConversion(<extrabotany:dimensioncatalyst>, <botania:alchemycatalyst>);

// Plank Swapping
mods.botania.ManaInfusion.addAlchemy(<minecraft:planks>, <minecraft:planks:1>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:planks:1>, <minecraft:planks:2>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:planks:2>, <minecraft:planks:3>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:planks:3>, <minecraft:planks:4>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:planks:4>, <minecraft:planks:5>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:planks:5>, <minecraft:planks>, 250);

// Slab Swapping
mods.botania.ManaInfusion.addAlchemy(<minecraft:wooden_slab>, <minecraft:wooden_slab:1>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:wooden_slab:1>, <minecraft:wooden_slab:2>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:wooden_slab:2>, <minecraft:wooden_slab:3>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:wooden_slab:3>, <minecraft:wooden_slab:4>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:wooden_slab:4>, <minecraft:wooden_slab:5>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:wooden_slab:5>, <minecraft:wooden_slab>, 250);

// Log Swapping
mods.botania.ManaInfusion.addAlchemy(<minecraft:log>, <minecraft:log:1>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:log:1>, <minecraft:log:2>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:log:2>, <minecraft:log:3>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:log:3>, <minecraft:log2>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:log2>, <minecraft:log2:1>, 250);
mods.botania.ManaInfusion.addAlchemy(<minecraft:log2:1>, <minecraft:log>, 250);

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

// Nature stuff
SalisMundus.addSingleConversion(<ore:grass>, <minecraft:mycelium>);
SalisMundus.addSingleConversion(<ore:dirt>, <biomesoplenty:dirt>);
SalisMundus.addSingleConversion(<minecraft:melon_block>, <minecraft:pumpkin>);
SalisMundus.addSingleConversion(<minecraft:pumpkin>, <minecraft:lit_pumpkin>);

// Quartz to radiant
SalisMundus.addSingleConversion(<ore:blockQuartz>, <arcanearchives:storage_raw_quartz>);
SalisMundus.addSingleConversion(<arcanearchives:storage_raw_quartz>, <minecraft:quartz_block>);


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
