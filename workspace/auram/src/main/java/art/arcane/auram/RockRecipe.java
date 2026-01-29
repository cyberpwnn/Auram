package art.arcane.auram;

import net.minecraft.core.RegistryAccess;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.inventory.CraftingContainer;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.crafting.CraftingBookCategory;
import net.minecraft.world.item.crafting.CustomRecipe;
import net.minecraft.world.item.crafting.RecipeSerializer;
import net.minecraft.world.level.Level;
import net.minecraftforge.registries.ForgeRegistries;

public class RockRecipe extends CustomRecipe {

    public RockRecipe(ResourceLocation id, CraftingBookCategory category) {
        super(id, category);
    }

    @Override
    public boolean matches(CraftingContainer container, Level level) {
        Item firstRock = null;
        int count = 0;

        for (int i = 0; i < container.getContainerSize(); i++) {
            ItemStack stack = container.getItem(i);
            
            if (!stack.isEmpty()) {
                ResourceLocation itemId = ForgeRegistries.ITEMS.getKey(stack.getItem());
                if (itemId == null) return false;
                if (!RecipeCache.RECIPE_MAP.containsKey(itemId.toString())) {
                    return false; 
                }

                if (firstRock == null) {
                    firstRock = stack.getItem();
                } else if (stack.getItem() != firstRock) {
                    return false;
                }

                count++;
            }
        }

        return count == 4 && firstRock != null;
    }

    @Override
    public ItemStack assemble(CraftingContainer container, RegistryAccess registryAccess) {
        Item foundRock = null;
        for (int i = 0; i < container.getContainerSize(); i++) {
            ItemStack stack = container.getItem(i);
            if (!stack.isEmpty()) {
                foundRock = stack.getItem();
                break;
            }
        }

        if (foundRock == null) return ItemStack.EMPTY;
        ResourceLocation rockId = ForgeRegistries.ITEMS.getKey(foundRock);
        if (rockId == null) return ItemStack.EMPTY;
        CachedRecipe r = RecipeCache.RECIPE_MAP.get(rockId.toString());
        String outputIdString = r.drop;

        if (outputIdString != null) {
            ResourceLocation outputId = ResourceLocation.tryParse(outputIdString);
            if (ForgeRegistries.ITEMS.containsKey(outputId)) {
                return new ItemStack(ForgeRegistries.ITEMS.getValue(outputId), r.count);
            }
        }

        return ItemStack.EMPTY;
    }

    @Override
    public boolean canCraftInDimensions(int width, int height) {
        return width >= 2 && height >= 2;
    }

    @Override
    public RecipeSerializer<?> getSerializer() {
        return Auram.ROCK_RECIPE_SERIALIZER.get();
    }
}