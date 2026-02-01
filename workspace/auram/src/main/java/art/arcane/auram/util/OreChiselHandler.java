package art.arcane.auram.util;

import art.arcane.auram.Auram;
import net.minecraft.core.BlockPos;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.tags.ItemTags;
import net.minecraft.world.InteractionResult;
import net.minecraft.world.entity.item.ItemEntity;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.item.PickaxeItem;
import net.minecraft.world.level.Level;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraftforge.event.entity.player.PlayerInteractEvent;
import net.minecraftforge.eventbus.api.SubscribeEvent;
import net.minecraftforge.fml.common.Mod;

import java.util.Map;
import java.util.Optional;
import java.util.Random;

@Mod.EventBusSubscriber(modid = Auram.MODID, bus = Mod.EventBusSubscriber.Bus.FORGE)
public class OreChiselHandler {
    @SubscribeEvent
    public static void onOreChisel(PlayerInteractEvent.RightClickBlock event) {
        Level level = event.getLevel();
        BlockPos pos = event.getPos();
        BlockState state = level.getBlockState(pos);
        Player player = event.getEntity();
        ItemStack stack = event.getItemStack();

        if (level.isClientSide) {
            if (isValidChiselTarget(stack, state)) {
                player.swing(event.getHand());
                event.setCancellationResult(InteractionResult.SUCCESS);
                event.setCanceled(true); 
            }
            return;
        }

        if (!isValidChiselTarget(stack, state)) {
            return;
        }

        if (!stack.isCorrectToolForDrops(state)) {
            return;
        }
        Optional<Map.Entry<Item, Block>> o = Auram.ROCK_ITEM_TO_ORE_BLOCK.entrySet().stream().filter((e) -> e.getValue() == state.getBlock()).findFirst();
        
        if(o.isEmpty()) {
            return;
        }

        if(!(stack.getItem() instanceof PickaxeItem)) {
            return;
        }
        
        PickaxeItem pickaxe = (PickaxeItem)stack.getItem();
        float destroySpeed = pickaxe.getDestroySpeed(stack, state);
        int bval = Math.max(Math.min(pickaxe.getTier().getEnchantmentValue() - 9, 7), 1);
        float chance = 1f/bval;
        float d = destroySpeed - 5;
        
        if(d <= 0) {
            chance = 1;
        }
        else {
            d = Math.min(10, Math.max(1, d));
            d = 1/d;
            chance += d/2;
        }
        
        chance = Math.max(0.15f, Math.min(1f, chance));

        level.playSound(null, pos, SoundEvents.UI_STONECUTTER_TAKE_RESULT, SoundSource.BLOCKS, 1.0F, 1.0F + (float)Math.random());
        popResource(level, player.getOnPos(), new ItemStack(o.get().getKey(), (int)Math.ceil(Math.random() * 4)));
        player.getCooldowns().addCooldown(stack.getItem(), Math.round(destroySpeed)+5);
        
        if (level.random.nextFloat() < chance) {
            level.destroyBlock(pos, false); // false = don't drop the block's normal loot
            level.playSound(null, pos, SoundEvents.STONE_BREAK, SoundSource.BLOCKS, 1.0F, 1.0F);
        } else {
            stack.hurtAndBreak(1, player, (p) -> p.broadcastBreakEvent(event.getHand()));
        }

        event.setCancellationResult(InteractionResult.SUCCESS);
        event.setCanceled(true);
    }

    private static boolean isValidChiselTarget(ItemStack stack, BlockState state) {
        return stack.is(ItemTags.PICKAXES) && Auram.ROCK_ITEM_TO_ORE_BLOCK.values().stream().anyMatch((b) -> b == state.getBlock());
    }

    private static void popResource(Level level, BlockPos pos, ItemStack stack) {
        ItemEntity entity = new ItemEntity(level, 
            pos.getX() + 0.5, 
            pos.getY() + 1.1, 
            pos.getZ() + 0.5, 
            stack);
        entity.setPickUpDelay(0);
        level.addFreshEntity(entity);
    }
}