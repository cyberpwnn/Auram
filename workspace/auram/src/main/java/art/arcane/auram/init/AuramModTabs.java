/*
 *    MCreator note: This file will be REGENERATED on each build.
 */
package art.arcane.auram.init;

import net.minecraftforge.registries.RegistryObject;
import net.minecraftforge.registries.DeferredRegister;

import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.network.chat.Component;
import net.minecraft.core.registries.Registries;

import art.arcane.auram.AuramMod;

public class AuramModTabs {
	public static final DeferredRegister<CreativeModeTab> REGISTRY = DeferredRegister.create(Registries.CREATIVE_MODE_TAB, AuramMod.MODID);
	public static final RegistryObject<CreativeModeTab> AURAM = REGISTRY.register("auram",
			() -> CreativeModeTab.builder().title(Component.translatable("item_group.auram.auram")).icon(() -> new ItemStack(AuramModItems.BUNDLEDSTICKS.get())).displayItems((parameters, tabData) -> {
				tabData.accept(AuramModItems.BUNDLEDSTICKS.get());
				tabData.accept(AuramModItems.ROCK.get());
				tabData.accept(AuramModItems.IRONROCK.get());
				tabData.accept(AuramModItems.GOLDROCK.get());
				tabData.accept(AuramModItems.COPPERROCK.get());
				tabData.accept(AuramModItems.LEADROCK.get());
				tabData.accept(AuramModItems.TINROCK.get());
				tabData.accept(AuramModItems.SILVERROCK.get());
				tabData.accept(AuramModItems.DEEPSLATEROCK.get());
				tabData.accept(AuramModItems.DIAMONDROCK.get());
				tabData.accept(AuramModItems.EMERALDROCK.get());
				tabData.accept(AuramModItems.LAPISROCK.get());
				tabData.accept(AuramModItems.REDSTONEROCK.get());
				tabData.accept(AuramModItems.COALROCK.get());
				tabData.accept(AuramModItems.JOURNEYMAP.get());
				tabData.accept(AuramModItems.ENDERJADE.get());
			}).build());
}