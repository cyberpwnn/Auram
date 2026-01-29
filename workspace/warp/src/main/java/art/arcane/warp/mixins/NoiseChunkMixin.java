package art.arcane.auram.mixins;

import net.minecraft.server.level.ColumnPos;
import net.minecraft.world.level.levelgen.NoiseChunk;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(NoiseChunk.class)
public class NoiseChunkMixin {
    @Inject(method = "computePreliminarySurfaceLevel(J)I", at = @At("RETURN"), cancellable = true)
    private void addNoiseToSurface(long pos, CallbackInfoReturnable<Integer> cir) {
        int baseLevel = cir.getReturnValueI();
        ColumnPos col = new ColumnPos(ColumnPos.getX(pos), ColumnPos.getZ(pos));
        int x = col.x() << 4;
        int z = col.z() << 4;
        double noise = 1 + (Math.random() * 10);
        cir.setReturnValue(baseLevel + (int) noise);
    }
}