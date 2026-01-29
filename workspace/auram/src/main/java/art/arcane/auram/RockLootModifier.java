package art.arcane.auram;

import com.google.common.base.Supplier;
import com.google.common.base.Suppliers;
import com.mojang.serialization.Codec;
import com.mojang.serialization.codecs.RecordCodecBuilder;
import it.unimi.dsi.fastutil.objects.ObjectArrayList;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.level.storage.loot.LootContext;
import net.minecraft.world.level.storage.loot.parameters.LootContextParams;
import net.minecraft.world.level.storage.loot.predicates.LootItemCondition;
import net.minecraftforge.common.loot.IGlobalLootModifier;
import net.minecraftforge.common.loot.LootModifier;
import net.minecraftforge.registries.ForgeRegistries;

import java.util.concurrent.ThreadLocalRandom;

public class RockLootModifier extends LootModifier {
    public static final Supplier<Codec<RockLootModifier>> CODEC = Suppliers.memoize(() ->
            RecordCodecBuilder.create(inst -> codecStart(inst).apply(inst, RockLootModifier::new)));

    public RockLootModifier(LootItemCondition[] conditionsIn) {
        super(conditionsIn);System.out.println(">>> ROCK MODIFIER CONSTRUCTED! <<<");
    }

    @Override
    protected ObjectArrayList<ItemStack> doApply(ObjectArrayList<ItemStack> generatedLoot, LootContext context) {
        System.out.println("RockLootModifier doApply");
        BlockState state = context.getParamOrNull(LootContextParams.BLOCK_STATE);
        if (state == null) return generatedLoot;
        ResourceLocation blockId = ForgeRegistries.BLOCKS.getKey(state.getBlock());
        if (blockId == null || !blockId.getPath().contains("ore")) {
            return generatedLoot;
        }

        String newPath = blockId.getPath().replace("ore", "rock");
        ResourceLocation rockId = ResourceLocation.tryBuild(Auram.MODID, newPath);

        if (!ForgeRegistries.ITEMS.containsKey(rockId)) {
            return generatedLoot; // If we didn't generate a rock for this, do nothing
        }

        Item rockItem = ForgeRegistries.ITEMS.getValue(rockId);

        int originalCount = 0;
        for (ItemStack stack : generatedLoot) {
            if (stack.getItem() == state.getBlock().asItem()) {
                return generatedLoot; 
            }
            originalCount += stack.getCount();
        }

        if (originalCount == 0) originalCount = 1;
        int multiplier = ThreadLocalRandom.current().nextInt(1, 5); // 1, 2, 3, 4
        int finalCount = originalCount * multiplier;
        ObjectArrayList<ItemStack> newLoot = new ObjectArrayList<>();
        while (finalCount > 0) {
            int stackSize = Math.min(finalCount, 64);
            newLoot.add(new ItemStack(rockItem, stackSize));
            finalCount -= stackSize;
        }

        return newLoot;
    }

    @Override
    public Codec<? extends IGlobalLootModifier> codec() {
        return CODEC.get();
    }
}