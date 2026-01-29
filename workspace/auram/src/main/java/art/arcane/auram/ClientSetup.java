package art.arcane.auram;

import net.minecraft.client.color.item.ItemColor;
import net.minecraft.client.resources.model.BakedModel;
import net.minecraft.client.resources.model.ModelResourceLocation;
import net.minecraft.resources.ResourceKey;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.Item;
import net.minecraft.world.level.block.Block;
import net.minecraftforge.api.distmarker.Dist;
import net.minecraftforge.client.event.ModelEvent;
import net.minecraftforge.client.event.RegisterColorHandlersEvent;
import net.minecraftforge.eventbus.api.SubscribeEvent;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.registries.ForgeRegistries;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Mod.EventBusSubscriber(modid = Auram.MODID, bus = Mod.EventBusSubscriber.Bus.MOD, value = Dist.CLIENT)
public class ClientSetup {
    private static final Map<Item, Integer> ROCK_COLOR_CACHE = new HashMap<>();

    @SubscribeEvent
    public static void onRegisterGeometry(ModelEvent.RegisterAdditional event) {
        event.register(Objects.requireNonNull(ResourceLocation.tryBuild(Auram.MODID, "item/rock_ore")));
    }

    @SubscribeEvent
    public static void onModifyBakingResult(ModelEvent.ModifyBakingResult event) {
        Map<ResourceLocation, BakedModel> modelRegistry = event.getModels();
        ResourceLocation parentLocation = ResourceLocation.tryBuild(Auram.MODID, "item/rock_ore");
        BakedModel parentModel = modelRegistry.get(parentLocation);

        if (parentModel == null) return;

        for (ResourceLocation rockId : Auram.GENERATED_ROCKS) {
            ModelResourceLocation itemModelRL = new ModelResourceLocation(rockId, "inventory");
            modelRegistry.put(itemModelRL, parentModel);
        }
    }
    
    @SubscribeEvent
    public static void onRegisterItemColors(RegisterColorHandlersEvent.Item event) {
        ItemColor dynamicRockColor = (stack, tintIndex) -> {
            if (tintIndex == 1) {
                Item item = stack.getItem();

                if (ROCK_COLOR_CACHE.containsKey(item)) {
                    return ROCK_COLOR_CACHE.get(item);
                }

                ResourceLocation itemKey = ForgeRegistries.ITEMS.getKey(item);
                if (itemKey != null) {
                    String blockPath = itemKey.getPath().replace("rock", "ore");

                    for (Map.Entry<ResourceKey<Block>, Block> entry : ForgeRegistries.BLOCKS.getEntries()) {
                        ResourceLocation blockId = entry.getKey().location();
                        if (blockId.getPath().equals(blockPath)) {
                            Block block = entry.getValue();
                            int color = ColorHelper.getDominantColor(block); // Use your helper
                            if (color == -1) color = block.defaultMapColor().col;

                            ROCK_COLOR_CACHE.put(item, color);
                            return color;
                        }
                    }
                }
            }
            return -1;
        };

        for (ResourceLocation rockId : Auram.GENERATED_ROCKS) {
            if (ForgeRegistries.ITEMS.containsKey(rockId)) {
                event.register(dynamicRockColor, ForgeRegistries.ITEMS.getValue(rockId));
            }
        }
    }
}