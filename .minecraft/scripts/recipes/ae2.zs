import mods.thaumcraft.Infusion;
import thaumcraft.aspect.CTAspect;
import thaumcraft.aspect.CTAspectStack;

// Formation Core
recipes.remove(<appliedenergistics2:material:43>);
Infusion.registerRecipe("formationcorefusion", "", <appliedenergistics2:material:43>, 5, [<aspect:metallum>, <aspect:machina> * 3], <ore:crystalCertusQuartz>, [<ore:crystalFluix>, <appliedenergistics2:material:22>]);

// Annihilation Core
recipes.remove(<appliedenergistics2:material:44>);
Infusion.registerRecipe("annihilationcorefusion", "", <appliedenergistics2:material:44>, 5, [<aspect:metallum>, <aspect:machina> * 3], <ore:gemQuartz>, [<ore:crystalFluix>, <appliedenergistics2:material:22>]);

