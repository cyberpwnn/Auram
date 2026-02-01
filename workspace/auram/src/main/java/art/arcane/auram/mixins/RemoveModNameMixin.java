package art.arcane.auram.mixins;

import net.minecraft.ChatFormatting;
import net.minecraft.network.chat.Component;
import net.minecraft.network.chat.Style;
import net.minecraft.network.chat.TextColor;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.TooltipFlag;
import net.minecraftforge.event.ForgeEventFactory;
import net.minecraftforge.event.entity.player.ItemTooltipEvent;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

import java.util.List;

@Mixin(ForgeEventFactory.class)
public class RemoveModNameMixin {
    @Inject(method = "onItemTooltip", at = @At("RETURN"), remap = false)
    private static void removeModNameAfterEvents(ItemStack stack, Player player, List<Component> lines, TooltipFlag flags, CallbackInfoReturnable<ItemTooltipEvent> cir) {
        if (cir.getReturnValue() == null) return;
        List<Component> tooltip = cir.getReturnValue().getToolTip();

        if (tooltip.size() > 1) {
            Component lastLine = tooltip.get(tooltip.size() - 1);
            Style style = lastLine.getStyle();
            TextColor blueColor = TextColor.fromLegacyFormat(ChatFormatting.BLUE);
            TextColor aquaColor = TextColor.fromLegacyFormat(ChatFormatting.BLUE); // Some mods use Aqua

            boolean isModNameColor = (style.getColor() != null) &&
                    (style.getColor().equals(blueColor) || style.getColor().equals(aquaColor));

            if (style.isItalic() && isModNameColor) {
                tooltip.remove(tooltip.size() - 1);
            }
        }
    }
}