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

import net.minecraft.world.level.LevelAccessor;
import net.minecraftforge.common.capabilities.ForgeCapabilities; // Import ForgeCapabilities

import java.util.concurrent.atomic.AtomicInteger;
import java.util.HashMap;

import inzhefop.extrautilitiesrebirth.world.inventory.NormalGUIMenu;

import com.mojang.blaze3d.systems.RenderSystem;

public class NormalGUIScreen extends AbstractContainerScreen<NormalGUIMenu> {
	private final static HashMap<String, Object> guistate = NormalGUIMenu.guistate;
	private final Level world;
	private final int x, y, z;
	private final Player entity;

	public NormalGUIScreen(NormalGUIMenu container, Inventory inventory, Component text) {
		super(container, inventory, text);
		this.world = container.world;
		this.x = container.x;
		this.y = container.y;
		this.z = container.z;
		this.entity = container.entity;
		this.imageWidth = 176;
		this.imageHeight = 166;
	}

	private static final ResourceLocation texture = new ResourceLocation("extrautilitiesrebirth:textures/screens/normal_gui.png");

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

		// Upgrade Icon
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/upgrade_icon.png"),
				this.leftPos + 7, this.topPos + 18, 0, 0, 16, 16, 16, 16);

		boolean cross = new Object() {
			public boolean getValue(LevelAccessor world, BlockPos pos, String tag) {
				BlockEntity blockEntity = world.getBlockEntity(pos);
				if (blockEntity != null)
					return blockEntity.getPersistentData().getBoolean(tag);
				return false;
			}
		}.getValue(world, BlockPos.containing(x, y, z), "valid");

		// Progress Arrow Background
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/progress_arrow_back.png"),
				this.leftPos + 83, this.topPos + 36, 0, 0, 22, 15, 22, 15);

		double progress = 0;
		progress = new Object() {
			public double getValue(LevelAccessor world, BlockPos pos, String tag) {
				BlockEntity blockEntity = world.getBlockEntity(pos);
				if (blockEntity != null)
					return blockEntity.getPersistentData().getDouble(tag);
				return -1;
			}
		}.getValue(world, BlockPos.containing(x, y, z), "progress2");

		int prg = 22 - (int) progress;

		// Progress Arrow Fill
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/progress_arrow_fill.png"),
				this.leftPos + 83, this.topPos + 36, 0, 0, prg, 15, prg, 15);

		// Progress Arrow Negative
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/progress_arrow_negative.png"),
				this.leftPos + 83, this.topPos + 36, 0, 0, 22, 15, 22, 15);

		if (!cross) {
			guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/kreuz.png"),
					this.leftPos + 87, this.topPos + 36, 0, 0, 16, 16, 16, 16);
		}

		// Energy Bar Holder
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/energy_bar_holder.png"),
				this.leftPos + 150, this.topPos + 7, 0, 0, 18, 72, 18, 72);

		double power = 0;
		power = new Object() {
			public int getEnergyStored(LevelAccessor level, BlockPos pos) {
				AtomicInteger _retval = new AtomicInteger(0);
				BlockEntity _ent = level.getBlockEntity(pos);
				if (_ent != null)
					_ent.getCapability(ForgeCapabilities.ENERGY, null).ifPresent(capability -> _retval.set(capability.getEnergyStored()));
				return _retval.get();
			}
		}.getEnergyStored(world, BlockPos.containing(x, y, z)) / 1428;
		int pwr = (int) power;

		// Energy Bar Fill
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/energybarfill.png"),
				this.leftPos + 151, this.topPos + 8, 0, 0, 16, 70, 16, 70);

		// Gray Overlay (Inverse Bar)
		guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/gray.png"),
				this.leftPos + 151, this.topPos + 8, 0, 0, 16, 70 - pwr, 16, 70 - pwr);

		if ((new Object() {
			public int getFluidTankLevel(LevelAccessor level, BlockPos pos, int tank) {
				AtomicInteger _retval = new AtomicInteger(0);
				BlockEntity _ent = level.getBlockEntity(pos);
				if (_ent != null)
					_ent.getCapability(ForgeCapabilities.FLUID_HANDLER, null)
							.ifPresent(capability -> _retval.set(capability.getFluidInTank(tank).getAmount()));
				return _retval.get();
			}
		}.getFluidTankLevel(world, BlockPos.containing(x, y, z), 1)) > 0) {
			guiGraphics.blit(new ResourceLocation("extrautilitiesrebirth:textures/lava12x2.png"),
					this.leftPos + 61, this.topPos + 36, 0, 0, 16, 16, 16, 16);
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
		String machineTitle = new Object() {
			public String getValue(BlockPos pos, String tag) {
				BlockEntity BlockEntity = world.getBlockEntity(pos);
				if (BlockEntity != null)
					return BlockEntity.getPersistentData().getString(tag);
				return "";
			}
		}.getValue(BlockPos.containing((int) x, (int) y, (int) z), "machine");

		guiGraphics.drawString(this.font, Component.literal(machineTitle), 6, 5, -12829636, false);
		guiGraphics.drawString(this.font, Component.literal("Inventory"), 6, 71, -12829636, false);
	}

	@Override
	public void onClose() {
		super.onClose();
	}

	@Override
	public void init() {
		super.init();
	}
}