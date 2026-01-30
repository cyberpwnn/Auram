package inzhefop.extrautilitiesrebirth.client.gui;

import net.minecraft.world.level.Level;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.network.chat.Component;
import net.minecraft.client.gui.screens.inventory.AbstractContainerScreen;
import net.minecraft.client.gui.GuiGraphics; // Import GuiGraphics
import net.minecraft.client.Minecraft;

import net.minecraft.world.level.block.entity.BlockEntity;
import net.minecraft.world.level.LevelAccessor;
import net.minecraft.core.BlockPos;

import net.minecraftforge.common.capabilities.ForgeCapabilities; // Import ForgeCapabilities

import java.util.concurrent.atomic.AtomicInteger;
import java.util.HashMap;

import inzhefop.extrautilitiesrebirth.world.inventory.FurnaceGUIMenu;

import com.mojang.blaze3d.systems.RenderSystem;

public class FurnaceGUIScreen extends AbstractContainerScreen<FurnaceGUIMenu> {
	private final static HashMap<String, Object> guistate = FurnaceGUIMenu.guistate;
	private final Level world;
	private final int x, y, z;
	private final Player entity;

	public FurnaceGUIScreen(FurnaceGUIMenu container, Inventory inventory, Component text) {
		super(container, inventory, text);
		this.world = container.world;
		this.x = container.x;
		this.y = container.y;
		this.z = container.z;
		this.entity = container.entity;
		this.imageWidth = 176;
		this.imageHeight = 166;
	}

	private static final ResourceLocation texture = new ResourceLocation("extrautilitiesrebirth:textures/screens/furnace_gui.png");

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

		// Energy Bar Holder
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/energy_bar_holder.png"),
				this.leftPos + 151, this.topPos + 7, 0, 0, 18, 72, 18, 72);

		// Energy Bar Fill
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/energybarfill.png"),
				this.leftPos + 152, this.topPos + 8, 0, 0, 16, 70, 16, 70);

		// Energy Calculation
		double power = new Object() {
			public int getEnergyStored(LevelAccessor level, BlockPos pos) {
				AtomicInteger _retval = new AtomicInteger(0);
				BlockEntity _ent = level.getBlockEntity(pos);
				if (_ent != null)
					_ent.getCapability(ForgeCapabilities.ENERGY, null).ifPresent(capability -> _retval.set(capability.getEnergyStored()));
				return _retval.get();
			}
		}.getEnergyStored(world, BlockPos.containing(x, y, z)) / 1428.57;
		int pwr = (int) power;

		// Gray Overlay (Inverse Bar)
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/gray.png"),
				this.leftPos + 152, this.topPos + 8, 0, 0, 16, 70 - pwr, 16, 70 - pwr);

		// Arrow Background
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/arrow.png"),
				this.leftPos + 63, this.topPos + 32, 0, 0, 32, 18, 32, 18);

		// Progress Calculation
		double fdf = 0;
		fdf = (new Object() {
			public double getValue(LevelAccessor world, BlockPos pos, String tag) {
				BlockEntity blockEntity = world.getBlockEntity(pos);
				if (blockEntity != null)
					return blockEntity.getPersistentData().getDouble(tag);
				return -1;
			}
		}.getValue(world, BlockPos.containing(x, y, z), "smelt")) / 4.5;
		int progress = (int) fdf;

		// Progress Arrow Fill
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/progress_arrow_fill.png"),
				this.leftPos + 69, this.topPos + 33, 0, 0, progress, 15, progress, 15);

		// Progress Arrow Negative
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/progress_arrow_negative.png"),
				this.leftPos + 69, this.topPos + 33, 0, 0, 22, 15, 22, 15);

		// Upgrade Icon
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/upgrade_icon.png"),
				this.leftPos + 8, this.topPos + 18, 0, 0, 16, 16, 16, 16);

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
		guiGraphics.drawString(this.font, Component.literal("Inventory"), 7, 72, -12829636, false);
		guiGraphics.drawString(this.font, Component.literal("Furnace"), 7, 5, -12829636, false);
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