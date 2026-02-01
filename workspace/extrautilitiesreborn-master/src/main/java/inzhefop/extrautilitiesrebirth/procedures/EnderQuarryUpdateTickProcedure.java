package inzhefop.extrautilitiesrebirth.procedures;

import net.minecraft.world.level.storage.loot.LootParams;
import net.minecraft.world.level.storage.loot.parameters.LootContextParams;
import net.minecraftforge.items.IItemHandlerModifiable;
import net.minecraftforge.common.capabilities.ForgeCapabilities;
import net.minecraftforge.energy.IEnergyStorage;

import net.minecraft.world.phys.Vec3;
import net.minecraft.world.phys.AABB;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.level.block.entity.BlockEntity;
import net.minecraft.world.level.block.Blocks;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.LevelAccessor;
import net.minecraft.world.level.Level;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.entity.item.ItemEntity;
import net.minecraft.world.entity.Entity;
import net.minecraft.tags.ItemTags;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.core.particles.ParticleTypes;
import net.minecraft.core.BlockPos;

import java.util.stream.Collectors;
import java.util.List;
import java.util.Comparator;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public class EnderQuarryUpdateTickProcedure {
	public static void execute(LevelAccessor world, double x, double y, double z) {
		BlockPos mainPos = BlockPos.containing(x, y, z);
		BlockEntity mainBe = world.getBlockEntity(mainPos);

		if (mainBe == null) return;
		IEnergyStorage energyStorage = mainBe.getCapability(ForgeCapabilities.ENERGY, null).orElse(null);
		IItemHandlerModifiable mainItemHandler = (IItemHandlerModifiable) mainBe.getCapability(ForgeCapabilities.ITEM_HANDLER, null).orElse(null);

		if (energyStorage == null || mainItemHandler == null) return;
		CompoundTag data = mainBe.getPersistentData();
		double speed = data.getDouble("eqspeed");
		double powerDrain = data.getDouble("eqpowerdrain");
		boolean isSilk = data.getBoolean("eqsilk");
		double fortuneMultiplier = data.getDouble("eqfortune");
		boolean holeMode = data.getBoolean("eqhole");

		double ticks = data.getDouble("ticks");
		double minedBlocks = data.getDouble("minedblocks");
		double miningX = data.getDouble("xcoord");
		double miningY = data.getDouble("ycoord");
		double miningZ = data.getDouble("zcoord");
		double state = data.getDouble("state");
		double areaMaxY = data.getDouble("areamaxy");
		double areaMaxX = data.getDouble("areamaxx");
		double areaMaxZ = data.getDouble("areamaxz");
		double areaMinZ = data.getDouble("areaminz");
		double areaDirect1 = data.getDouble("areadirect1");
		double areaDirect2 = data.getDouble("areadirect2");
		int loopIterations = (int) Math.pow(2, Math.round(speed * 0.15));
		boolean dirty = false;

		for (int i = 0; i < loopIterations; i++) {
			if (state == 1) {
				// Calculate total energy needed for this speed tier (mimicking original logic)
				int energyCost = (int) (powerDrain * loopIterations);

				if (energyStorage.getEnergyStored() >= energyCost) {
					energyStorage.extractEnergy(energyCost, false);

					if (!world.isClientSide()) {
						ticks++;
						dirty = true;
					}

					// Check if enough ticks have passed to mine a block
					if (ticks >= 20 / speed) {
						BlockPos minePos = BlockPos.containing(miningX, miningY, miningZ);
						BlockState mineState = world.getBlockState(minePos);

						if (!world.isClientSide()) {
							minedBlocks++;
							dirty = true;
						}

						boolean fullBlock = false;

						// Mining Logic
						if (mineState.getBlock() != Blocks.BEDROCK && !mineState.isAir()) {
							fullBlock = true;

							// Optimization: Use LootTables instead of spawning entities
							if (!world.isClientSide() && world instanceof ServerLevel serverLevel) {
								List<ItemStack> drops;
								if (isSilk) {
									drops = List.of(new ItemStack(mineState.getBlock()));
								} else {
									LootParams.Builder builder = new LootParams.Builder(serverLevel)
											.withParameter(LootContextParams.ORIGIN, Vec3.atCenterOf(minePos))
											.withParameter(LootContextParams.TOOL, ItemStack.EMPTY);
									drops = mineState.getDrops(builder);
								}

								for (ItemStack drop : drops) {
									if (drop.isEmpty()) continue;

									double currentMultiplier = 1;
									// Apply custom fortune logic from original code
									if (!isSilk && drop.getItem() != mineState.getBlock().asItem()) {
										if (new ItemStack(mineState.getBlock()).is(ItemTags.create(new ResourceLocation("forge:ores")))) {
											currentMultiplier = fortuneMultiplier;
										}
									}

									ItemStack toInsert = drop.copy();
									toInsert.setCount((int) (toInsert.getCount() * currentMultiplier));

									// Insert into internal buffer (Slot 0)
									mainItemHandler.setStackInSlot(0, toInsert);
								}

								world.setBlock(minePos, Blocks.AIR.defaultBlockState(), 3);
							}
						}

						// Particle Effects
						if (world instanceof ServerLevel serverLevel) {
							serverLevel.sendParticles(ParticleTypes.PORTAL, miningX + 0.5, miningY + 0.5, miningZ + 0.5, 5, 0.3, 0.3, 0.3, 0);
						}

						// Hole generation logic
						if (!holeMode && fullBlock) {
							world.setBlock(minePos, Blocks.DIRT.defaultBlockState(), 3);
						}

						// Move the Miner Coordinates
						if (miningY >= -60) {
							miningY--;
						} else {
							miningY = areaMaxY;
							if (areaDirect1 == 1) {
								if (miningZ > areaMaxZ) {
									miningZ--;
								} else {
									miningZ = areaMinZ;
									if (areaDirect2 == 2) {
										if (miningX < areaMaxX) miningX++;
										else state = 2; // Finished
									} else if (areaDirect2 == 4) {
										if (miningX > areaMaxX) miningX--;
										else state = 2; // Finished
									}
								}
							} else if (areaDirect1 == 3) {
								if (miningZ < areaMaxZ) {
									miningZ++;
								} else {
									miningZ = areaMinZ;
									if (areaDirect2 == 2) {
										if (miningX < areaMaxX) miningX++;
										else state = 2; // Finished
									} else if (areaDirect2 == 4) {
										if (miningX > areaMaxX) miningX--;
										else state = 2; // Finished
									}
								}
							}
						}
						ticks = 0;
					}
				}
			}
		}

		// 4. Batch write changes to NBT (Done once per tick)
		if (dirty) {
			data.putDouble("ticks", ticks);
			data.putDouble("minedblocks", minedBlocks);
			data.putDouble("xcoord", miningX);
			data.putDouble("ycoord", miningY);
			data.putDouble("zcoord", miningZ);
			data.putDouble("state", state);

			if (!world.isClientSide() && world instanceof Level level) {
				level.sendBlockUpdated(mainPos, world.getBlockState(mainPos), world.getBlockState(mainPos), 3);
			}
		}

		// 5. Output items to adjacent inventories
		if (mainItemHandler.getStackInSlot(0).getCount() > 0) {
			BlockPos[] adjacents = {
					mainPos.above(), mainPos.below(),
					mainPos.east(), mainPos.west(),
					mainPos.south(), mainPos.north()
			};

			boolean stop = false;
			for (int i = 0; i < 6; i++) {
				BlockEntity targetBe = world.getBlockEntity(adjacents[i]);
				if (targetBe != null) {
					IItemHandlerModifiable targetHandler = (IItemHandlerModifiable) targetBe.getCapability(ForgeCapabilities.ITEM_HANDLER, null).orElse(null);

					if (targetHandler != null) {
						ItemStack sourceStack = mainItemHandler.getStackInSlot(0);

						// Try to insert into neighbor
						for (int slot = 0; slot < targetHandler.getSlots(); slot++) {
							ItemStack targetStack = targetHandler.getStackInSlot(slot);

							if (targetStack.isEmpty() || (targetStack.getItem() == sourceStack.getItem() && targetStack.getCount() < targetStack.getMaxStackSize())) {
								int space = Math.min(targetStack.getMaxStackSize(), 64) - targetStack.getCount();
								int toAdd = Math.min(space, sourceStack.getCount());

								if (toAdd > 0) {
									if (state != 2 && state != 0 && !world.isClientSide()) {
										data.putDouble("state", 1);
										// Update state immediately if we resumed working
										if (world instanceof Level level) level.sendBlockUpdated(mainPos, world.getBlockState(mainPos), world.getBlockState(mainPos), 3);
									}

									ItemStack copy = sourceStack.copy();
									copy.setCount(targetStack.getCount() + toAdd);
									targetHandler.setStackInSlot(slot, copy);

									sourceStack.shrink(toAdd);
									mainItemHandler.setStackInSlot(0, sourceStack.isEmpty() ? ItemStack.EMPTY : sourceStack);

									if (sourceStack.isEmpty()) {
										stop = true;
										break;
									}
								}
							}
						}
					}
				}
				if (stop) break;

				// If loop finishes (index 5) without success, set state to "Full/Blocked" (3)
				if (i == 5 && !world.isClientSide()) {
					data.putDouble("state", 3);
					if (world instanceof Level level) level.sendBlockUpdated(mainPos, world.getBlockState(mainPos), world.getBlockState(mainPos), 3);
				}
			}
		}
	}
}