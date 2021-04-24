import mods.artisanworktables.builder.RecipeBuilder;

RecipeBuilder.get("mage")
  .setShaped([
    [<enderio:item_material:12>, <tconstruct:binding>.withTag({Material: "manasteel"}), <enderio:item_material:12>],
    [<embers:shard_ember>, <thermalfoundation:material:295>, <embers:shard_ember>],
    [<plustic:pipe_piece>.withTag({Material: "starmetal"}), <thaumcraft:mechanism_complex>, <plustic:pipe_piece>.withTag({Material: "starmetal"})]])
  .addTool(<ore:artisansSolderer>, 1)
  .addOutput(<contenttweaker:enderconstruct> * 16)
  .create();