package inzhefop.extrautilitiesrebirth.world.features.ores;

import com.mojang.serialization.Codec;
import inzhefop.extrautilitiesrebirth.procedures.EnderLillyStage1AdditionalGenerationConditionProcedure;
import net.minecraft.core.BlockPos;
import net.minecraft.world.level.WorldGenLevel;
import net.minecraft.world.level.levelgen.feature.Feature;
import net.minecraft.world.level.levelgen.feature.FeaturePlaceContext;
import net.minecraft.world.level.levelgen.feature.OreFeature;
import net.minecraft.world.level.levelgen.feature.configurations.OreConfiguration;

public class EnderLillyEndstoneFeature extends OreFeature {

	public EnderLillyEndstoneFeature(Codec<OreConfiguration> codec) {
		super(codec);
	}

	public static Feature<?> feature() {
		return new EnderLillyEndstoneFeature(OreConfiguration.CODEC);
	}

	@Override
	public boolean place(FeaturePlaceContext<OreConfiguration> context) {
		WorldGenLevel world = context.level();
		BlockPos pos = context.origin();

		if (!EnderLillyStage1AdditionalGenerationConditionProcedure.execute(world, pos.getX(), pos.getY(), pos.getZ())) {
			return false;
		}

		return super.place(context);
	}
}