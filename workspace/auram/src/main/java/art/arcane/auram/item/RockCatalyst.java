package art.arcane.auram.item;

import art.arcane.auram.Auram;
import art.arcane.auram.util.CachedRecipe;
import art.arcane.auram.util.RecipeCache;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.world.InteractionHand;
import net.minecraft.world.InteractionResultHolder;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.TooltipFlag;
import net.minecraft.world.level.Level;
import net.minecraftforge.registries.ForgeRegistries;
import org.apache.commons.lang3.text.WordUtils;

import java.util.List;

public class RockCatalyst extends Item {
    public RockCatalyst() {
        super(new Properties());
    }

    @Override
    public Component getName(ItemStack stack) {
        return Component.literal("Rock Catalyst");
    }

    @Override
    public void appendHoverText(ItemStack stack, Level level, List<Component> tooltip, TooltipFlag flag) {
        if (stack.hasTag() && stack.getTag().contains("RockBins")) {
            CompoundTag bin = stack.getTag().getCompound("RockBins");
            for (String key : bin.getAllKeys()) {
                int count = bin.getInt(key);
                if (count > 0) {
                    // Formatting "minecraft:raw_iron" to "Raw Iron"
                    String name = WordUtils.capitalize(key.split(":")[1].replace("_", " "));
                    tooltip.add(Component.literal("§7- " + name + ": §f" + count + "/4"));
                }
            }
        } else {
            tooltip.add(Component.literal("§8Empty buffer"));
        }
    }

    @Override
    public InteractionResultHolder<ItemStack> use(Level level, Player player, InteractionHand hand) {
        ItemStack stack = player.getItemInHand(hand);

        // 3. SHIFT-CLICK TO DUMP
        if (player.isShiftKeyDown() && !level.isClientSide) {
            dumpContents(stack, player, level);
            return InteractionResultHolder.success(stack);
        }
        return InteractionResultHolder.pass(stack);
    }

    public int tryAddRock(ItemStack catalyst, ItemStack rockStack, Player player) {
        ResourceLocation rockId = ForgeRegistries.ITEMS.getKey(rockStack.getItem());
        CachedRecipe recipe = RecipeCache.RECIPE_MAP.get(rockId.toString());
        if (recipe == null) return 0; 
        String outputId = recipe.drop;
        int amountToAdd = rockStack.getCount();
        CompoundTag nbt = catalyst.getOrCreateTag();
        CompoundTag bin = nbt.getCompound("RockBins");

        int currentCount = bin.getInt(outputId);
        int total = currentCount + amountToAdd;
        int sets = total / 4;
        int remainder = total % 4;

        if (sets > 0) {
            Item outputItem = ForgeRegistries.ITEMS.getValue(ResourceLocation.parse(outputId));
            if (outputItem != null) {
                ItemStack reward = new ItemStack(outputItem, sets);
                if (!player.getInventory().add(reward)) {
                    player.drop(reward, false);
                }
            }
        }

        bin.putInt(outputId, remainder);
        nbt.put("RockBins", bin);

        player.level().playSound(null, player.getX(), player.getY(), player.getZ(),
                SoundEvents.TUFF_BREAK, SoundSource.PLAYERS, 0.2F, 0.2F + (player.getRandom().nextFloat() * 0.5F));
        
        return amountToAdd;
    }

    private void dumpContents(ItemStack catalyst, Player player, Level level) {
        if (!catalyst.hasTag() || !catalyst.getTag().contains("RockBins")) return;

        CompoundTag bin = catalyst.getTag().getCompound("RockBins");
        boolean droppedAnything = false;

        for (String key : bin.getAllKeys()) {
            int count = bin.getInt(key);
            if (count > 0) {
                ResourceLocation defaultRock = Auram.ORE_BLOCK_ID_TO_ROCK_ID.values().stream()
                        .filter(rl -> RecipeCache.RECIPE_MAP.get(rl.toString()).drop.equals(key))
                        .findFirst().orElse(null);
 
                if (defaultRock != null) {
                    player.drop(new ItemStack(ForgeRegistries.ITEMS.getValue(defaultRock), count), false);
                    bin.remove(key);
                    droppedAnything = true;
                }
            }
        }

        if (droppedAnything) {
            player.displayClientMessage(Component.literal("§eContents emptied."), true);
            player.level().playSound(null, player.getX(), player.getY(), player.getZ(),
                    SoundEvents.BUNDLE_DROP_CONTENTS, SoundSource.PLAYERS, 1.0F, 1.0F);
        }
    }
}
