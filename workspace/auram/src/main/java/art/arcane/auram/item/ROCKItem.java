package art.arcane.auram.item;

import net.minecraft.network.chat.Component;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraftforge.registries.ForgeRegistries;
import org.apache.commons.lang3.text.WordUtils; // Minecraft includes this library

public class RockItem extends Item {
    public RockItem(Properties properties) {
        super(properties);
    }

    @Override
    public Component getName(ItemStack stack) {
        String path = ForgeRegistries.ITEMS.getKey(this).getPath();
        String spaced = path.replace('_', ' ');
        String capitalized = WordUtils.capitalize(spaced);
        return Component.literal(capitalized);
    }
}