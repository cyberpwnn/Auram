package inzhefop.extrautilitiesrebirth.procedures;

import net.minecraft.world.entity.Entity;

public class EnderLillyStage8ColiderProcedure {
	public static void execute(Entity entity) {
		if (entity == null)
			return;
		entity.hurt(entity.damageSources().generic(), 1);	}
}
 