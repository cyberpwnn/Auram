package inzhefop.extrautilitiesrebirth.procedures;

import net.minecraft.network.chat.Component;
import net.minecraftforge.common.capabilities.ForgeCapabilities;


import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.level.block.entity.BlockEntity;
import net.minecraft.world.level.LevelAccessor;
import net.minecraft.world.level.Level;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.entity.Entity;
import net.minecraft.tags.ItemTags;
import net.minecraft.resources.ResourceLocation;

import net.minecraft.core.BlockPos;

import java.util.concurrent.atomic.AtomicInteger;

import inzhefop.extrautilitiesrebirth.init.ExtrautilitiesrebirthModBlocks;

public class WrenchClickedOnBlockProcedureProcedure {
	public static void execute(LevelAccessor world, double x, double y, double z, Entity entity, ItemStack itemstack) {
		if (entity == null)
			return;
		double airdistance = 0;
		if (ExtrautilitiesrebirthModBlocks.RAINBOW_GENERATOR.get() == (world.getBlockState(BlockPos.containing(x, y, z))).getBlock()) {
			itemstack.getOrCreateTag().putDouble("x", x);
			itemstack.getOrCreateTag().putDouble("y", y);
			itemstack.getOrCreateTag().putDouble("z", z);
			itemstack.getOrCreateTag().putDouble("wrenchmode", 1);
			(itemstack).setHoverName(Component.literal((("\u00A7r\u00A7fWrench [Rainbow Gen at " + x) + "" + (" " + ((y + " ") + "" + (z + "]"))))));
			if (entity instanceof Player _player && !_player.level().isClientSide())
				_player.displayClientMessage(Component.literal((("[Rainbow Gen at " + x) + "" + (" " + ((y + " ") + "" + (z + "]"))))), (true));
		} else if ((new ItemStack((world.getBlockState(BlockPos.containing(x, y, z))).getBlock()))
				.is(ItemTags.create(ResourceLocation.parse("forge:generator_eur")))) {
			if (!world.isClientSide()) {
				BlockPos _bp = BlockPos.containing(x, y, z);
				BlockEntity _blockEntity = world.getBlockEntity(_bp);
				BlockState _bs = world.getBlockState(_bp);
				if (_blockEntity != null)
					_blockEntity.getPersistentData().putDouble("rbg_x", (itemstack.getOrCreateTag().getDouble("x")));
				if (world instanceof Level _level)
					_level.sendBlockUpdated(_bp, _bs, _bs, 3);
			}
			if (!world.isClientSide()) {
				BlockPos _bp = BlockPos.containing(x, y, z);
				BlockEntity _blockEntity = world.getBlockEntity(_bp);
				BlockState _bs = world.getBlockState(_bp);
				if (_blockEntity != null)
					_blockEntity.getPersistentData().putDouble("rbg_y", (itemstack.getOrCreateTag().getDouble("y")));
				if (world instanceof Level _level)
					_level.sendBlockUpdated(_bp, _bs, _bs, 3);
			}
			if (!world.isClientSide()) {
				BlockPos _bp = BlockPos.containing(x, y, z);
				BlockEntity _blockEntity = world.getBlockEntity(_bp);
				BlockState _bs = world.getBlockState(_bp);
				if (_blockEntity != null)
					_blockEntity.getPersistentData().putDouble("rbg_z", (itemstack.getOrCreateTag().getDouble("z")));
				if (world instanceof Level _level)
					_level.sendBlockUpdated(_bp, _bs, _bs, 3);
			}
			if (entity instanceof Player _player && !_player.level().isClientSide())
				_player.displayClientMessage(Component.literal(("Binded Rainbow Generator to "
						+ (new ItemStack((world.getBlockState(BlockPos.containing(x, y, z))).getBlock())).getDisplayName().getString())), (false));
		}
		if (new Object() {
			public int getFluidTankLevel(LevelAccessor level, BlockPos pos, int tank) {
				AtomicInteger _retval = new AtomicInteger(0);
				BlockEntity _ent = level.getBlockEntity(pos);
				if (_ent != null)
					_ent.getCapability(ForgeCapabilities.FLUID_HANDLER, null)
							.ifPresent(capability -> _retval.set(capability.getFluidInTank(tank).getAmount()));
				return _retval.get();
			}
		}.getFluidTankLevel(world, BlockPos.containing(x, y, z), 1) > 0) {
			if (entity instanceof Player _player && !_player.level().isClientSide())
				_player.displayClientMessage(Component.literal(("Fluid: " + (Math.round(new Object() {
					public int getFluidTankLevel(LevelAccessor level, BlockPos pos, int tank) {
						AtomicInteger _retval = new AtomicInteger(0);
						BlockEntity _ent = level.getBlockEntity(pos);
						if (_ent != null)
							_ent.getCapability(ForgeCapabilities.FLUID_HANDLER, null)
									.ifPresent(capability -> _retval.set(capability.getFluidInTank(tank).getAmount()));
						return _retval.get();
					}
				}.getFluidTankLevel(world, BlockPos.containing(x, y, z), 1)) + " mB"))), (false));
		}
		if (!(ExtrautilitiesrebirthModBlocks.RAINBOW_GENERATOR.get() == (world.getBlockState(BlockPos.containing(x, y, z))).getBlock()
				|| ExtrautilitiesrebirthModBlocks.WIRELESS_FE_BATTERY.get() == (world.getBlockState(BlockPos.containing(x, y, z))).getBlock()
				|| (new ItemStack((world.getBlockState(BlockPos.containing(x, y, z))).getBlock()))
						.is(ItemTags.create(ResourceLocation.parse("forge:generator_eur"))))
				&& new Object() {
					public int getMaxEnergyStored(LevelAccessor level, BlockPos pos) {
						AtomicInteger _retval = new AtomicInteger(0);
						BlockEntity _ent = level.getBlockEntity(pos);
						if (_ent != null)
							_ent.getCapability(ForgeCapabilities.ENERGY, null).ifPresent(capability -> _retval.set(capability.getMaxEnergyStored()));
						return _retval.get();
					}
				}.getMaxEnergyStored(world, BlockPos.containing(x, y, z)) > 0) {
			itemstack.getOrCreateTag().putDouble("reciever_x", x);
			itemstack.getOrCreateTag().putDouble("reciever_y", y);
			itemstack.getOrCreateTag().putDouble("reciever_z", z);
			if (entity instanceof Player _player && !_player.level().isClientSide())
				_player.displayClientMessage(Component.literal(("Set Energy Reciever to "
						+ (new ItemStack((world.getBlockState(BlockPos.containing(x, y, z))).getBlock())).getDisplayName().getString())), (false));
		} else if (ExtrautilitiesrebirthModBlocks.WIRELESS_FE_BATTERY.get() == (world.getBlockState(BlockPos.containing(x, y, z))).getBlock()) {
			if (itemstack.getOrCreateTag().getDouble("reciever_y") != 0) {
				if (new Object() {
					public double getValue(LevelAccessor world, BlockPos pos, String tag) {
						BlockEntity blockEntity = world.getBlockEntity(pos);
						if (blockEntity != null)
							return blockEntity.getPersistentData().getDouble(tag);
						return -1;
					}
				}.getValue(world, BlockPos.containing(x, y, z), "connections") < 10) {
					airdistance = Math.sqrt(Math.pow(itemstack.getOrCreateTag().getDouble("reciever_x") - x, 2)
							+ Math.pow(itemstack.getOrCreateTag().getDouble("reciever_y") - y, 2)
							+ Math.pow(itemstack.getOrCreateTag().getDouble("reciever_z") - z, 2));
					if (airdistance < 10) {
						if (!world.isClientSide()) {
							BlockPos _bp = BlockPos.containing(x, y, z);
							BlockEntity _blockEntity = world.getBlockEntity(_bp);
							BlockState _bs = world.getBlockState(_bp);
							if (_blockEntity != null)
								_blockEntity.getPersistentData().putDouble("connections", (new Object() {
									public double getValue(LevelAccessor world, BlockPos pos, String tag) {
										BlockEntity blockEntity = world.getBlockEntity(pos);
										if (blockEntity != null)
											return blockEntity.getPersistentData().getDouble(tag);
										return -1;
									}
								}.getValue(world, BlockPos.containing(x, y, z), "connections") + 1));
							if (world instanceof Level _level)
								_level.sendBlockUpdated(_bp, _bs, _bs, 3);
						}
						if (!world.isClientSide()) {
							BlockPos _bp = BlockPos.containing(x, y, z);
							BlockEntity _blockEntity = world.getBlockEntity(_bp);
							BlockState _bs = world.getBlockState(_bp);
							if (_blockEntity != null)
								_blockEntity.getPersistentData().putDouble(("connection" + (Math.round(new Object() {
									public double getValue(LevelAccessor world, BlockPos pos, String tag) {
										BlockEntity blockEntity = world.getBlockEntity(pos);
										if (blockEntity != null)
											return blockEntity.getPersistentData().getDouble(tag);
										return -1;
									}
								}.getValue(world, BlockPos.containing(x, y, z), "connections")) + "x")),
										(itemstack.getOrCreateTag().getDouble("reciever_x")));
							if (world instanceof Level _level)
								_level.sendBlockUpdated(_bp, _bs, _bs, 3);
						}
						if (!world.isClientSide()) {
							BlockPos _bp = BlockPos.containing(x, y, z);
							BlockEntity _blockEntity = world.getBlockEntity(_bp);
							BlockState _bs = world.getBlockState(_bp);
							if (_blockEntity != null)
								_blockEntity.getPersistentData().putDouble(("connection" + (Math.round(new Object() {
									public double getValue(LevelAccessor world, BlockPos pos, String tag) {
										BlockEntity blockEntity = world.getBlockEntity(pos);
										if (blockEntity != null)
											return blockEntity.getPersistentData().getDouble(tag);
										return -1;
									}
								}.getValue(world, BlockPos.containing(x, y, z), "connections")) + "y")),
										(itemstack.getOrCreateTag().getDouble("reciever_y")));
							if (world instanceof Level _level)
								_level.sendBlockUpdated(_bp, _bs, _bs, 3);
						}
						if (!world.isClientSide()) {
							BlockPos _bp = BlockPos.containing(x, y, z);
							BlockEntity _blockEntity = world.getBlockEntity(_bp);
							BlockState _bs = world.getBlockState(_bp);
							if (_blockEntity != null)
								_blockEntity.getPersistentData().putDouble(("connection" + (Math.round(new Object() {
									public double getValue(LevelAccessor world, BlockPos pos, String tag) {
										BlockEntity blockEntity = world.getBlockEntity(pos);
										if (blockEntity != null)
											return blockEntity.getPersistentData().getDouble(tag);
										return -1;
									}
								}.getValue(world, BlockPos.containing(x, y, z), "connections")) + "z")),
										(itemstack.getOrCreateTag().getDouble("reciever_z")));
							if (world instanceof Level _level)
								_level.sendBlockUpdated(_bp, _bs, _bs, 3);
						}
						if (entity instanceof Player _player && !_player.level().isClientSide())
							_player.displayClientMessage(Component.literal((("Successfully established connection to "
									+ (new ItemStack((world.getBlockState(BlockPos.containing(itemstack.getOrCreateTag().getDouble("reciever_x"),
											itemstack.getOrCreateTag().getDouble("reciever_y"), itemstack.getOrCreateTag().getDouble("reciever_z"))))
											.getBlock())).getDisplayName().getString())
									+ "" + (" [Distance: " + (Math.round(airdistance) + " blocks]")))), (false));
						if (entity instanceof Player _player && !_player.level().isClientSide())
							_player.displayClientMessage(Component.literal(("Connections: " + (Math.round(new Object() {
								public double getValue(LevelAccessor world, BlockPos pos, String tag) {
									BlockEntity blockEntity = world.getBlockEntity(pos);
									if (blockEntity != null)
										return blockEntity.getPersistentData().getDouble(tag);
									return -1;
								}
							}.getValue(world, BlockPos.containing(x, y, z), "connections")) + "/10"))), (false));
					} else {
						if (entity instanceof Player _player && !_player.level().isClientSide())
							_player.displayClientMessage(Component.literal(("Distance between Reciever and FE Battery too large!"
									+ (" [Distance: " + (Math.round(airdistance) + " blocks]")))), (false));
					}
				} else {
					if (entity instanceof Player _player && !_player.level().isClientSide())
						_player.displayClientMessage(Component.literal("This FE Transmitter cannot establish anymore connections! [10/10]"), (false));
				}
			} else {
				if (entity instanceof Player _player && !_player.level().isClientSide())
					_player.displayClientMessage(Component.literal("A energy reciever was not set previously"), (false));
			}
		}
	}
}
