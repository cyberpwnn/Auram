package inzhefop.extrautilitiesrebirth.procedures;

import net.minecraft.tags.BlockTags; // Import BlockTags
import net.minecraft.world.level.Level; // Import Level
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.LevelAccessor;
import net.minecraft.world.entity.Entity;
import net.minecraft.core.BlockPos;

public class FireAxeProcedureProcedure {
	public static void execute(LevelAccessor world, double x, double y, double z, Entity entity) {
		if (entity == null)
			return;

		double y_var = 0;

		// Change 1: Check Tags instead of Material
		if (world.getBlockState(BlockPos.containing(x, y, z)).is(BlockTags.LOGS)) {
			{
				BlockPos _pos = BlockPos.containing(x, y, z);
				// Change 2: Ensure world is treated as a Level for dropping resources
				if (world instanceof Level _level) {
					Block.dropResources(world.getBlockState(_pos), _level, BlockPos.containing(x, y, z), null);
				}
				world.destroyBlock(_pos, false);
			}
		}

		y_var = -1;
		for (int index0 = 0; index0 < (int) (3); index0++) {
			// Replace all Material.WOOD checks below with .is(BlockTags.LOGS)

			if (world.getBlockState(BlockPos.containing(x, y + y_var, z)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, x, (y + y_var), z, entity);
			}
			if (world.getBlockState(BlockPos.containing(x + 1, y + y_var, z)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, (x + 1), (y + y_var), z, entity);
			}
			if (world.getBlockState(BlockPos.containing(x - 1, y + y_var, z)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, (x - 1), (y + y_var), z, entity);
			}
			if (world.getBlockState(BlockPos.containing(x + 1, y + y_var, z + 1)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, (x + 1), (y + y_var), (z + 1), entity);
			}
			if (world.getBlockState(BlockPos.containing(x + 1, y + y_var, z - 1)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, (x + 1), (y + y_var), (z - 1), entity);
			}
			if (world.getBlockState(BlockPos.containing(x - 1, y + y_var, z + 1)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, (x - 1), (y + y_var), (z + 1), entity);
			}
			if (world.getBlockState(BlockPos.containing(x - 1, y + y_var, z - 1)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, (x - 1), (y + y_var), (z - 1), entity);
			}
			if (world.getBlockState(BlockPos.containing(x, y + y_var, z - 1)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, x, (y + y_var), (z - 1), entity);
			}
			if (world.getBlockState(BlockPos.containing(x, y + y_var, z + 1)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, x, (y + y_var), (z + 1), entity);
			}
			y_var = y_var + 1;
		}
	}
}