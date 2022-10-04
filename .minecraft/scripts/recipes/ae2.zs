import mods.thaumcraft.Infusion;
import thaumcraft.aspect.CTAspect;
import thaumcraft.aspect.CTAspectStack;
import mods.artisanworktables.builder.RecipeBuilder;

// Formation Core
recipes.remove(<appliedenergistics2:material:43>);
Infusion.registerRecipe("formationcorefusion", "", <appliedenergistics2:material:43>, 5, [<aspect:metallum>, <aspect:machina> * 3], <ore:crystalCertusQuartz>, [<ore:crystalFluix>, <appliedenergistics2:material:22>]);

// Annihilation Core
recipes.remove(<appliedenergistics2:material:44>);
Infusion.registerRecipe("annihilationcorefusion", "", <appliedenergistics2:material:44>, 5, [<aspect:metallum>, <aspect:machina> * 3], <ore:gemQuartz>, [<ore:crystalFluix>, <appliedenergistics2:material:22>]);

RecipeBuilder.get("designer")
  .setShaped([
    [<appliedenergistics2:material>, <appliedenergistics2:material:12>, <minecraft:redstone>],
    [<appliedenergistics2:material:12>, <opencomputers:component>, <appliedenergistics2:material:12>],
    [<minecraft:redstone>, <aether_legacy:zanite_gemstone>, <appliedenergistics2:material>]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<appliedenergistics2:material:35> * 4)
  .create();