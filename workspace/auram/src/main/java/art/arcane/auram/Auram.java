package art.arcane.auram;

import art.arcane.auram.item.RockItem;
import com.mojang.logging.LogUtils;
import com.mojang.serialization.Codec;
import net.minecraft.core.registries.Registries; // Correct registry location
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceKey;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.level.block.Block;
import net.minecraftforge.common.loot.IGlobalLootModifier;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.eventbus.api.SubscribeEvent;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.javafmlmod.FMLJavaModLoadingContext;
import net.minecraftforge.registries.*;
import org.slf4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mod(Auram.MODID)
public class Auram {
    public static final String MODID = "auram";
    private static final Logger LOGGER = LogUtils.getLogger();
    public static final DeferredRegister<Item> ITEMS = DeferredRegister.create(ForgeRegistries.ITEMS, MODID);
    public static final DeferredRegister<CreativeModeTab> CREATIVE_TABS = DeferredRegister.create(Registries.CREATIVE_MODE_TAB, MODID);
    public static final RegistryObject<Item> ROCK = ITEMS.register("rock", () -> new Item(new Item.Properties()));
    public static final DeferredRegister<Codec<? extends IGlobalLootModifier>> LOOT_MODIFIERS =
            DeferredRegister.create(ForgeRegistries.Keys.GLOBAL_LOOT_MODIFIER_SERIALIZERS, MODID);
    public static final RegistryObject<Codec<RockLootModifier>> ROCK_MODIFIER =
            LOOT_MODIFIERS.register("rock_drops", RockLootModifier.CODEC);
    public static final RegistryObject<CreativeModeTab> AURAM_TAB = CREATIVE_TABS.register("auram_tab", () -> CreativeModeTab.builder()
            .title(Component.translatable("itemGroup.auram")) // or Component.literal("Auram")
            .icon(() -> new ItemStack(ROCK.get()))
            .displayItems((params, output) -> {
                for (Item item : ForgeRegistries.ITEMS) {
                    ResourceLocation key = ForgeRegistries.ITEMS.getKey(item);
                    if (key != null && key.getNamespace().equals(MODID)) {
                        output.accept(item);
                    }
                }
            })
            .build());

    public static final List<ResourceLocation> GENERATED_ROCKS = new ArrayList<>();

    public Auram(FMLJavaModLoadingContext context) {
        IEventBus modEventBus = context.getModEventBus();
        ITEMS.register(modEventBus);
        CREATIVE_TABS.register(modEventBus);
        LOOT_MODIFIERS.register(modEventBus);
        modEventBus.register(this); 
    }

    @SubscribeEvent
    public void onRegister(RegisterEvent event) {
        if (event.getRegistryKey().equals(ForgeRegistries.Keys.ITEMS)) {
            for (Map.Entry<ResourceKey<Block>, Block> entry : ForgeRegistries.BLOCKS.getEntries()) {
                ResourceKey<Block> blockKey = entry.getKey();
                ResourceLocation blockId = blockKey.location();

                if (blockId.getPath().contains("_ore") || blockId.getPath().endsWith("ore")) {

                    String newPath = blockId.getPath().replace("ore", "rock");
                    if(newPath.equals(blockId.getPath())) newPath = newPath + "_rock";
                    ResourceLocation newId = ResourceLocation.tryBuild(MODID, newPath);

                    event.register(ForgeRegistries.Keys.ITEMS, helper -> {
                        Item.Properties props = new Item.Properties();
                        Item rockItem = new RockItem(props);
                        helper.register(newId, rockItem);
                        GENERATED_ROCKS.add(newId);
                        LOGGER.info("Generated Rock: " + newId + " from " + blockId);
                    });
                }
            }
        }
    }
}