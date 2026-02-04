package art.arcane.auram.commands;

import art.arcane.auram.recipes.IngredientFilter;
import art.arcane.auram.recipes.RecipeAlterTask;
import art.arcane.auram.recipes.RecipeWorkspace;
import art.arcane.auram.recipes.VirtualRecipe;
import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.IntegerArgumentType;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.Commands;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.crafting.Ingredient;
import net.minecraft.world.level.Level;
import net.minecraftforge.event.RegisterCommandsEvent;
import net.minecraftforge.eventbus.api.SubscribeEvent;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.atomic.AtomicInteger;

public class AuramCommands {

    @SubscribeEvent
    public void onCommandsRegister(RegisterCommandsEvent event) {
        CommandDispatcher<CommandSourceStack>  dispatcher = event.getDispatcher();
        dispatcher.register(Commands.literal("auram")
                .requires(source -> source.hasPermission(2))
                .then(Commands.argument("difficulty", IntegerArgumentType.integer(0, 100))
                        .executes(context -> {
                            int difficulty = IntegerArgumentType.getInteger(context, "difficulty");
                            return runChaosGeneration(context.getSource(), difficulty);
                        })
                )
        );
    }


    private static int runChaosGeneration(CommandSourceStack source, int difficulty) {
        Thread thread = new Thread(() -> {
            try {
                Level level = source.getLevel();
                source.sendSuccess(() -> Component.literal("§6Starting Chaos Generation (Difficulty: " + difficulty + ")..."), true);
                RecipeWorkspace workspace = new RecipeWorkspace();
                long time = System.currentTimeMillis();
                RecipeAlterTask rat = new RecipeAlterTask(workspace, source, System.currentTimeMillis(), difficulty);
                rat.execute();
                
                workspace.exportToDataPack(source.getLevel());
                source.getServer().getCommands().performPrefixedCommand(source, "reload");
                source.sendSystemMessage(Component.literal("§aChaos Generation completed in " + (System.currentTimeMillis() - time) / 1000.0 + " seconds! (Difficulty: " + (System.currentTimeMillis() - time) + "ms)"));
            } catch (Exception e) {
                source.sendFailure(Component.literal("§cAn error occurred during Chaos Generation: " + e.getMessage()));
                e.printStackTrace();
            }
        },"Chaos Generator");
        thread.start();
        return 1;
    }
 
    static int alterIngredient(RecipeWorkspace workspace, VirtualRecipe recipe, int i, double variance) {
        Ingredient original = recipe.inputs.get(i);
        if (original.isEmpty()) return 0;

        Set<Ingredient> options = workspace.getAlternatives(recipe, original, new IngredientFilter().percentLower(0.9).percentHigher(1.2));

        if (!options.isEmpty()) {
            List<Ingredient> selection = new ArrayList<>(options);
            Ingredient chosen = selection.get(ThreadLocalRandom.current().nextInt(selection.size()));
            workspace.modifyIngredient(recipe.id, i, chosen);
            return 1;
        }

        return 0;
    }
}