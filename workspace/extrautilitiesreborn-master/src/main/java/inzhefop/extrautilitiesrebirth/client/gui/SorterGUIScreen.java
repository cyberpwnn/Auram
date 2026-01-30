package inzhefop.extrautilitiesrebirth.client.gui;

import net.minecraft.world.level.block.entity.BlockEntity;
import net.minecraft.world.level.Level;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.network.chat.Component;
import net.minecraft.core.BlockPos;
import net.minecraft.client.gui.screens.inventory.AbstractContainerScreen;
import net.minecraft.client.gui.GuiGraphics; // Import GuiGraphics
import net.minecraft.client.Minecraft;

import java.util.HashMap;

import inzhefop.extrautilitiesrebirth.world.inventory.SorterGUIMenu;
import inzhefop.extrautilitiesrebirth.procedures.TagAttentionSignReturnProcedure;
import inzhefop.extrautilitiesrebirth.procedures.Sorterchest2returnProcedure;
import inzhefop.extrautilitiesrebirth.procedures.Sorterchest1returnProcedure;

import com.mojang.blaze3d.systems.RenderSystem;

public class SorterGUIScreen extends AbstractContainerScreen<SorterGUIMenu> {
	private final static HashMap<String, Object> guistate = SorterGUIMenu.guistate;
	private final Level world;
	private final int x, y, z;
	private final Player entity;

	public SorterGUIScreen(SorterGUIMenu container, Inventory inventory, Component text) {
		super(container, inventory, text);
		this.world = container.world;
		this.x = container.x;
		this.y = container.y;
		this.z = container.z;
		this.entity = container.entity;
		this.imageWidth = 176;
		this.imageHeight = 166;
	}

	private static final ResourceLocation texture = new ResourceLocation("extrautilitiesrebirth:textures/screens/sorter_gui.png");

	@Override
	public void render(GuiGraphics guiGraphics, int mouseX, int mouseY, float partialTicks) {
		this.renderBackground(guiGraphics);
		super.render(guiGraphics, mouseX, mouseY, partialTicks);
		this.renderTooltip(guiGraphics, mouseX, mouseY);
	}

	@Override
	protected void renderBg(GuiGraphics guiGraphics, float partialTicks, int gx, int gy) {
		RenderSystem.setShaderColor(1, 1, 1, 1);
		RenderSystem.enableBlend();
		RenderSystem.defaultBlendFunc();

		// Main Background
		guiGraphics.blit(texture, this.leftPos, this.topPos, 0, 0, this.imageWidth, this.imageHeight);

		// Upgrade Icon
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/screens/upgrade_icon.png"),
				this.leftPos + 8, this.topPos + 23, 0, 0, 16, 16, 16, 16);

		// Name Tag Icon
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/screens/name_tag.png"),
				this.leftPos + 8, this.topPos + 42, 0, 0, 16, 16, 16, 16);

		// Conditional Rendering: Chest 1 Return
		if (Sorterchest1returnProcedure.execute(world, x, y, z)) {
			guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/screens/normal.png"),
					this.leftPos + 144, this.topPos + 24, 0, 0, 18, 14, 18, 14);
		}

		// Conditional Rendering: Chest 2 Return
		if (Sorterchest2returnProcedure.execute(world, x, y, z)) {
			guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/screens/normal.png"),
					this.leftPos + 144, this.topPos + 42, 0, 0, 18, 14, 18, 14);
		}

		// Conditional Rendering: Attention Sign
		if (TagAttentionSignReturnProcedure.execute(world, x, y, z)) {
			guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/screens/attention_sign.png"),
					this.leftPos + 27, this.topPos + 43, 0, 0, 4, 14, 4, 14);
		}

		RenderSystem.disableBlend();
	}

	@Override
	public boolean keyPressed(int key, int b, int c) {
		if (key == 256) {
			this.minecraft.player.closeContainer();
			return true;
		}
		return super.keyPressed(key, b, c);
	}

	@Override
	public void containerTick() {
		super.containerTick();
	}

	@Override
	protected void renderLabels(GuiGraphics guiGraphics, int mouseX, int mouseY) {
		String titleSuffix = new Object() {
			public String getValue(BlockPos pos, String tag) {
				BlockEntity blockEntity = world.getBlockEntity(pos);
				if (blockEntity != null)
					return blockEntity.getPersistentData().getString(tag);
				return "";
			}
		}.getValue(BlockPos.containing(x, y, z), "mtitle");

		// 1.20.1: guiGraphics.drawString
		guiGraphics.drawString(this.font, Component.literal("Sorter [" + titleSuffix + "]"), 6, 7, -12829636, false);
	}

	@Override
	public void onClose() {
		super.onClose();
		// setSendRepeatsToGui removed
	}

	@Override
	public void init() {
		super.init();
		// setSendRepeatsToGui removed
	}
}