package inzhefop.extrautilitiesrebirth.procedures;

import net.minecraft.tags.BlockTags; // Import Tags
import net.minecraft.world.level.LevelAccessor;
import net.minecraft.world.entity.Entity;
import net.minecraft.core.BlockPos;

public class FireAxeBlockDestroyedWithToolProcedure {
	public static void execute(LevelAccessor world, double x, double y, double z, Entity entity) {
		if (entity == null)
			return;

		// Check center block
		if (world.getBlockState(BlockPos.containing(x, y, z)).is(BlockTags.LOGS)) {

			// Check Up
			if (world.getBlockState(BlockPos.containing(x, y + 1, z)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, x, (y + 1), z, entity);
			}
			// Check Down
			if (world.getBlockState(BlockPos.containing(x, y - 1, z)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, x, (y - 1), z, entity);
			}
			// Check X+
			if (world.getBlockState(BlockPos.containing(x + 1, y, z)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, (x + 1), y, z, entity);
			}
			// Check X-
			if (world.getBlockState(BlockPos.containing(x - 1, y, z)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, (x - 1), y, z, entity);
			}
			// Check Z-
			if (world.getBlockState(BlockPos.containing(x, y, z - 1)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, x, y, (z - 1), entity);
			}
			// Check Z+
			if (world.getBlockState(BlockPos.containing(x, y, z + 1)).is(BlockTags.LOGS)) {
				FireAxeProcedureProcedure.execute(world, x, y, (z + 1), entity);
			}
		}
	}
}