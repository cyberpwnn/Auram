import mods.artisanworktables.builder.RecipeBuilder;
#disable_search_tree

#modloaded botania mekanism thaumcraft embers

//REMOVE BASES
recipes.remove(<immersiveengineering:wirecoil>);
recipes.remove(<immersiveengineering:wirecoil:1>);
recipes.remove(<immersiveengineering:wirecoil:2>);
recipes.remove(<immersiveengineering:wirecoil:5>);
recipes.remove(<immersiveengineering:wirecoil:6>);
recipes.remove(<immersiveengineering:wirecoil:7>);
//bp
recipes.remove(<immersiveengineering:blueprint>.withTag({blueprint: "components"}));
recipes.remove(<immersiveengineering:blueprint>.withTag({blueprint: "molds"}));
recipes.remove(<immersiveengineering:blueprint>.withTag({blueprint: "bullet"}));
recipes.remove(<immersiveengineering:blueprint>.withTag({blueprint: "specialBullet"}));
recipes.remove(<immersiveengineering:blueprint>.withTag({blueprint: "electrode"}));



//------------------------------------------------------------------------------------------------------------
//--------------------------------------------------WIRES------------------------------------------------
//------------------------------------------------------------------------------------------------------------

//-------------------------COPPER WIRES-------------------------
//IE Wires x8 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:20>, <minecraft:stick>],
    [<immersiveengineering:material:20>, <thaumcraft:ingot:2>, <immersiveengineering:material:20>],
    [<minecraft:stick>, <immersiveengineering:material:20>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil> * 8)
  .create();

//IE Wires x8 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:20>, <minecraft:stick>],
    [<immersiveengineering:material:20>, <botania:manaresource>, <immersiveengineering:material:20>],
    [<minecraft:stick>, <immersiveengineering:material:20>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil> * 8)
  .create();

//IE Wires x8 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:20>, <minecraft:stick>],
    [<immersiveengineering:material:20>, <embers:crystal_ember>, <immersiveengineering:material:20>],
    [<minecraft:stick>, <immersiveengineering:material:20>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil> * 8)
  .create();


//-----------------------ELECTRUM WIRES-----------------------
//IE Wires x8 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:21>, <minecraft:stick>],
    [<immersiveengineering:material:21>, <thaumcraft:ingot:2>, <immersiveengineering:material:21>],
    [<minecraft:stick>, <immersiveengineering:material:21>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:1> * 8)
  .create();

//IE Wires x8 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:21>, <minecraft:stick>],
    [<immersiveengineering:material:21>, <botania:manaresource>, <immersiveengineering:material:21>],
    [<minecraft:stick>, <immersiveengineering:material:21>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:1> * 8)
  .create();

//IE Wires x8 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:21>, <minecraft:stick>],
    [<immersiveengineering:material:21>, <embers:crystal_ember>, <immersiveengineering:material:21>],
    [<minecraft:stick>, <immersiveengineering:material:21>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:1> * 8)
  .create();


//-----------------------HV WIRES-----------------------
//IE Wires x8 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>],
    [<immersiveengineering:material:23>, <thaumcraft:ingot:2>, <immersiveengineering:material:23>],
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:2> * 8)
  .create();

//IE Wires x8 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>],
    [<immersiveengineering:material:23>, <thaumcraft:ingot:2>, <immersiveengineering:material:23>],
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:2> * 8)
  .create();

//IE Wires x8 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>],
    [<immersiveengineering:material:23>, <embers:crystal_ember>, <immersiveengineering:material:23>],
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:2> * 8)
  .create();
  


//-----------------------REDSTONE WIRES-----------------------
//IE Wires x8 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>],
    [<minecraft:redstone>, <thaumcraft:ingot:2>, <minecraft:redstone>],
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:5> * 8)
  .create();
    //       Semishaped
  RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <minecraft:redstone>, <minecraft:stick>],
    [<immersiveengineering:material:22>, <thaumcraft:ingot:2>, <immersiveengineering:material:22>],
    [<minecraft:stick>, <minecraft:redstone>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:5> * 8)
  .create();

//IE Wires x8 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>],
    [<minecraft:redstone>, <botania:manaresource>, <minecraft:redstone>],
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:5> * 8)
  .create();
    //       Semishaped
  RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <minecraft:redstone>, <minecraft:stick>],
    [<immersiveengineering:material:22>, <botania:manaresource>, <immersiveengineering:material:22>],
    [<minecraft:stick>, <minecraft:redstone>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:5> * 8)
  .create();

//IE Wires x8 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>],
    [<minecraft:redstone>, <embers:crystal_ember>, <minecraft:redstone>],
    [<minecraft:stick>, <immersiveengineering:material:22>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:5> * 8)
  .create();
    //       Semishaped
  RecipeBuilder.get("mason")
  .setShaped([
    [<minecraft:stick>, <minecraft:redstone>, <minecraft:stick>],
    [<immersiveengineering:material:22>, <embers:crystal_ember>, <immersiveengineering:material:22>],
    [<minecraft:stick>, <minecraft:redstone>, <minecraft:stick>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:5> * 8)
  .create();


//-----------------------INSULATED LV WIRES-----------------------
//IE Wires x4 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil>, <immersiveengineering:material:5>],
    [<immersiveengineering:wirecoil>, <thaumcraft:ingot:2>, <immersiveengineering:wirecoil>],
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil>, <immersiveengineering:material:5>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:6> * 4)
  .create();

//IE Wires x4 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil>, <immersiveengineering:material:5>],
    [<immersiveengineering:wirecoil>, <botania:manaresource>, <immersiveengineering:wirecoil>],
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil>, <immersiveengineering:material:5>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:6> * 4)
  .create();

//IE Wires x4 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil>, <immersiveengineering:material:5>],
    [<immersiveengineering:wirecoil>, <embers:crystal_ember>, <immersiveengineering:wirecoil>],
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil>, <immersiveengineering:material:5>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:6> * 4)
  .create();


//-----------------------INSULATED MV WIRES-----------------------
//IE Wires x8 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil:1>, <thaumcraft:ingot:2>],
    [<immersiveengineering:wirecoil:1>, <ore:plankWood>, <immersiveengineering:wirecoil:1>],
    [<thaumcraft:ingot:2>, <immersiveengineering:wirecoil:1>, <immersiveengineering:material:5>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:7> * 4)
  .create();
    //       Semishaped
RecipeBuilder.get("mason")
  .setShaped([
    [<thaumcraft:ingot:2>, <immersiveengineering:wirecoil:1>, <immersiveengineering:material:5>],
    [<immersiveengineering:wirecoil:1>, <ore:plankWood>, <immersiveengineering:wirecoil:1>],
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil:1>, <thaumcraft:ingot:2>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:7> * 4)
  .create();

//IE Wires x8 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil:1>, <botania:manaresource>],
    [<immersiveengineering:wirecoil:1>, <ore:plankWood>, <immersiveengineering:wirecoil:1>],
    [<botania:manaresource>, <immersiveengineering:wirecoil:1>, <immersiveengineering:material:5>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:7> * 4)
  .create();
    //       Semishaped
RecipeBuilder.get("mason")
  .setShaped([
    [<botania:manaresource>, <immersiveengineering:wirecoil:1>, <immersiveengineering:material:5>],
    [<immersiveengineering:wirecoil:1>, <ore:plankWood>, <immersiveengineering:wirecoil:1>],
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil:1>, <botania:manaresource>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:7> * 4)
  .create();


//IE Wires x8 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil:1>, <embers:crystal_ember>],
    [<immersiveengineering:wirecoil:1>, <ore:plankWood>, <immersiveengineering:wirecoil:1>],
    [<embers:crystal_ember>, <immersiveengineering:wirecoil:1>, <immersiveengineering:material:5>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:7> * 4)
  .create();
    //       Semishaped
RecipeBuilder.get("mason")
  .setShaped([
    [<embers:crystal_ember>, <immersiveengineering:wirecoil:1>, <immersiveengineering:material:5>],
    [<immersiveengineering:wirecoil:1>, <ore:plankWood>, <immersiveengineering:wirecoil:1>],
    [<immersiveengineering:material:5>, <immersiveengineering:wirecoil:1>, <embers:crystal_ember>]])
  .addTool(<ore:artisansPliers>, 1)
  .addOutput(<immersiveengineering:wirecoil:7> * 4)
  .create();

//------------------------------------------------------------------------------------------------------------
//--------------------------------------------------BLUEPRINTS------------------------------------------------
//------------------------------------------------------------------------------------------------------------

//----------------------- ENGINEERING BLUEPRINT - COMPONENT -----------------------
//IE Blueprint x1 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<thaumcraft:ingot:2>, <thermalfoundation:material:132>, <minecraft:iron_ingot>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "components"}))
  .create();

//IE Blueprint x1 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<botania:manaresource>, <thermalfoundation:material:132>, <minecraft:iron_ingot>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "components"}))
  .create();

//IE Blueprint x1 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<embers:ember_cluster>, <thermalfoundation:material:132>, <minecraft:iron_ingot>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "components"}))
  .create();

//----------------------- ENGINEERING BLUEPRINT - MOLDS -----------------------

//IE Blueprint x1 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [null, <thaumcraft:ingot:2>, null],
    [<quark:root_dye>, <thermalfoundation:material:352>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "molds"}))
  .create();

//IE Blueprint x1 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [null, <botania:manaresource>, null],
    [<quark:root_dye>, <thermalfoundation:material:352>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "molds"}))
  .create();

//IE Blueprint x1 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [null, <embers:ember_cluster>, null],
    [<quark:root_dye>, <thermalfoundation:material:352>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "molds"}))
  .create();


//----------------------- ENGINEERING BLUEPRINT - PROJECTILES -----------------------

//IE Blueprint x1 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<thaumcraft:amber>, <thaumcraft:ingot:2>, <thaumcraft:amber>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "bullet"}))
  .create();

//IE Blueprint x1 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<botania:manaresource>, <botania:manaresource:1>, <botania:manaresource>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "bullet"}))
  .create();

//IE Blueprint x1 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<embers:crystal_ember>, <embers:ember_cluster>, <embers:crystal_ember>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "bullet"}))
  .create();


//----------------------- ENGINEERING BLUEPRINT - ADV PROJECTILES -----------------------

//IE Blueprint x1 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<thaumcraft:amber>, <thaumcraft:ingot:1>, <thaumcraft:amber>],
    [<quark:root_dye>, <thaumcraft:amber>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "specialBullet"}))
  .create();

//IE Blueprint x1 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<botania:manaresource>, <botania:manaresource:1>, <botania:manaresource>],
    [<quark:root_dye>, <botania:manaresource>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "specialBullet"}))
  .create();

//IE Blueprint x1 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<embers:crystal_ember>, <embers:ancient_motive_core>, <embers:crystal_ember>],
    [<quark:root_dye>, <embers:crystal_ember>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "specialBullet"}))
  .create();

  //----------------------- ENGINEERING BLUEPRINT - ARC FURNACE -----------------------

//IE Blueprint x1 (Thaumcraft)
RecipeBuilder.get("mason")
  .setShaped([
    [<thaumcraft:amber>, <minecraft:furnace>, <thaumcraft:amber>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "electrode"}))
  .create();

//IE Blueprint x1 (Botania)
RecipeBuilder.get("mason")
  .setShaped([
    [<botania:manaresource>, <minecraft:furnace>, <botania:manaresource>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "electrode"}))
  .create();

//IE Blueprint x1 (Embers)
RecipeBuilder.get("mason")
  .setShaped([
    [<embers:ancient_motive_core>, <minecraft:furnace>, <embers:ancient_motive_core>],
    [<quark:root_dye>, <quark:root_dye>, <quark:root_dye>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]])
  .addTool(<ore:artisansQuill>, 1)
  .addOutput(<immersiveengineering:blueprint>.withTag({blueprint: "electrode"}))
  .create();