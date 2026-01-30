/*
 *    MCreator note:
 *
 *    If you lock base mod element files, you can edit this file and it won't get overwritten.
 *    If you change your modid or package, you need to apply these changes to this file MANUALLY.
 *
 *    Settings in @Mod annotation WON'T be changed in case of the base mod element
 *    files lock too, so you need to set them manually here in such case.
 *
 *    If you do not lock base mod element files in Workspace settings, this file
 *    will be REGENERATED on each build.
 *
 */
package inzhefop.extrautilitiesrebirth;

import inzhefop.extrautilitiesrebirth.init.*;
import net.minecraft.core.registries.Registries;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.RegistryObject;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

import net.minecraftforge.network.simple.SimpleChannel;
import net.minecraftforge.network.NetworkRegistry;
import net.minecraftforge.network.NetworkEvent;
import net.minecraftforge.fml.javafmlmod.FMLJavaModLoadingContext;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.eventbus.api.IEventBus;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.network.FriendlyByteBuf;

import java.util.function.Supplier;
import java.util.function.Function;
import java.util.function.BiConsumer;

@Mod("extrautilitiesrebirth")
public class ExtrautilitiesrebirthMod {
	public static final Logger LOGGER = LogManager.getLogger(ExtrautilitiesrebirthMod.class);
	public static final String MODID = "extrautilitiesrebirth";
	private static final String PROTOCOL_VERSION = "1";
	public static final SimpleChannel PACKET_HANDLER = NetworkRegistry.newSimpleChannel(ResourceLocation.tryBuild(MODID, MODID), () -> PROTOCOL_VERSION,
			PROTOCOL_VERSION::equals, PROTOCOL_VERSION::equals);
	private static int messageID = 0;
	public static final DeferredRegister<CreativeModeTab> CREATIVE_TABS = DeferredRegister.create(Registries.CREATIVE_MODE_TAB, MODID);
	public static final RegistryObject<CreativeModeTab> TAB = CREATIVE_TABS.register("auram_tab", () -> CreativeModeTab.builder()
			.title(Component.literal("Extra Utilities"))
			.icon(() -> new ItemStack(ExtrautilitiesrebirthModItems.CREATIVE_INV_SAMPLE.get()))
			.displayItems((params, output) -> {
				for (RegistryObject<Item> item : ExtrautilitiesrebirthModItems.REGISTRY.getEntries()) {
					output.accept(item.get());
				}
			})
			.build());
	
	public ExtrautilitiesrebirthMod(FMLJavaModLoadingContext context) {
		
		IEventBus bus = context.getModEventBus();
		ExtrautilitiesrebirthModBlocks.REGISTRY.register(bus);
		ExtrautilitiesrebirthModItems.REGISTRY.register(bus);
		ExtrautilitiesrebirthModMenus.register(bus);
		ExtrautilitiesrebirthModBlockEntities.REGISTRY.register(bus);
		ExtrautilitiesrebirthModFeatures.REGISTRY.register(bus);
		ExtrautilitiesrebirthModParticleTypes.REGISTRY.register(bus);
		CREATIVE_TABS.register(bus);
	}

	public static <T> void addNetworkMessage(Class<T> messageType, BiConsumer<T, FriendlyByteBuf> encoder, Function<FriendlyByteBuf, T> decoder,
			BiConsumer<T, Supplier<NetworkEvent.Context>> messageConsumer) {
		PACKET_HANDLER.registerMessage(messageID, messageType, encoder, decoder, messageConsumer);
		messageID++;
	}
}
