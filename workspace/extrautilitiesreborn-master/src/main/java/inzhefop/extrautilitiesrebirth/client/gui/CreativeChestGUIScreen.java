package inzhefop.extrautilitiesrebirth.client.gui;

import net.minecraft.world.level.Level;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.network.chat.Component;
import net.minecraft.client.gui.screens.inventory.AbstractContainerScreen;
import net.minecraft.client.gui.GuiGraphics; // Import GuiGraphics
import net.minecraft.client.Minecraft;

import java.util.HashMap;

import inzhefop.extrautilitiesrebirth.world.inventory.CreativeChestGUIMenu;

import com.mojang.blaze3d.systems.RenderSystem;

public class CreativeChestGUIScreen extends AbstractContainerScreen<CreativeChestGUIMenu> {
	private final static HashMap<String, Object> guistate = CreativeChestGUIMenu.guistate;
	private final Level world;
	private final int x, y, z;
	private final Player entity;

	public CreativeChestGUIScreen(CreativeChestGUIMenu container, Inventory inventory, Component text) {
		super(container, inventory, text);
		this.world = container.world;
		this.x = container.x;
		this.y = container.y;
		this.z = container.z;
		this.entity = container.entity;
		this.imageWidth = 176;
		this.imageHeight = 166;
	}

	private static final ResourceLocation texture = new ResourceLocation("extrautilitiesrebirth:textures/screens/creative_chest_gui.png");

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
		guiGraphics.blit(texture, this.leftPos, this.topPos, 0, 0, this.imageWidth, this.imageHeight, this.imageWidth, this.imageHeight);

		// Arrow Overlay
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/screens/arrow.png"),
				this.leftPos + 71, this.topPos + 34, 0, 0, 32, 18, 32, 18);

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
		// 1.20.1: Use guiGraphics.drawString
		guiGraphics.drawString(this.font, Component.literal("Creative Chest"), 6, 5, -12829636, false);
		guiGraphics.drawString(this.font, Component.literal("Inventory"), 6, 71, -12829636, false);
	}

	@Override
	public void onClose() {
		super.onClose();
		// setSendRepeatsToGui removed in 1.20
	}

	@Override
	public void init() {
		super.init();
		// setSendRepeatsToGui removed in 1.20
	}
}