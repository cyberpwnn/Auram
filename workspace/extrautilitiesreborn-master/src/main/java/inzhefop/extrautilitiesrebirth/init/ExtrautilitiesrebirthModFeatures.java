package inzhefop.extrautilitiesrebirth.init;

import inzhefop.extrautilitiesrebirth.ExtrautilitiesrebirthMod;
import inzhefop.extrautilitiesrebirth.world.features.ores.EnderLillyEndstoneFeature;
import net.minecraft.world.level.levelgen.feature.Feature;
import net.minecraft.world.level.levelgen.feature.configurations.OreConfiguration;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.RegistryObject;

public class ExtrautilitiesrebirthModFeatures {
	public static final DeferredRegister<Feature<?>> REGISTRY = DeferredRegister.create(ForgeRegistries.FEATURES, ExtrautilitiesrebirthMod.MODID);
	public static final RegistryObject<Feature<?>> ENDER_LILLY_ENDSTONE = REGISTRY.register("ender_lilly_endstone", () -> new EnderLillyEndstoneFeature(OreConfiguration.CODEC));
}