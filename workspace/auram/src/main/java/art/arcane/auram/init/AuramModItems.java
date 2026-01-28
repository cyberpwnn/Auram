/*
 *    MCreator note: This file will be REGENERATED on each build.
 */
package art.arcane.auram.init;

import net.minecraftforge.registries.RegistryObject;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.DeferredRegister;

import net.minecraft.world.item.Item;

import art.arcane.auram.item.*;
import art.arcane.auram.AuramMod;

public class AuramModItems {
	public static final DeferredRegister<Item> REGISTRY = DeferredRegister.create(ForgeRegistries.ITEMS, AuramMod.MODID);
	public static final RegistryObject<Item> BUNDLEDSTICKS;
	public static final RegistryObject<Item> ROCK;
	public static final RegistryObject<Item> IRONROCK;
	public static final RegistryObject<Item> GOLDROCK;
	public static final RegistryObject<Item> COPPERROCK;
	public static final RegistryObject<Item> LEADROCK;
	public static final RegistryObject<Item> TINROCK;
	public static final RegistryObject<Item> SILVERROCK;
	public static final RegistryObject<Item> DEEPSLATEROCK;
	public static final RegistryObject<Item> DIAMONDROCK;
	public static final RegistryObject<Item> EMERALDROCK;
	public static final RegistryObject<Item> LAPISROCK;
	public static final RegistryObject<Item> REDSTONEROCK;
	public static final RegistryObject<Item> COALROCK;
	public static final RegistryObject<Item> JOURNEYMAP;
	public static final RegistryObject<Item> ENDERJADE;
	static {
		BUNDLEDSTICKS = REGISTRY.register("bundledsticks", BUNDLEDSTICKSItem::new);
		ROCK = REGISTRY.register("rock", ROCKItem::new);
		IRONROCK = REGISTRY.register("ironrock", IRONROCKItem::new);
		GOLDROCK = REGISTRY.register("goldrock", GOLDROCKItem::new);
		COPPERROCK = REGISTRY.register("copperrock", COPPERROCKItem::new);
		LEADROCK = REGISTRY.register("leadrock", LEADROCKItem::new);
		TINROCK = REGISTRY.register("tinrock", TINROCKItem::new);
		SILVERROCK = REGISTRY.register("silverrock", SILVERROCKItem::new);
		DEEPSLATEROCK = REGISTRY.register("deepslaterock", DEEPSLATEROCKItem::new);
		DIAMONDROCK = REGISTRY.register("diamondrock", DIAMONDROCKItem::new);
		EMERALDROCK = REGISTRY.register("emeraldrock", EMERALDROCKItem::new);
		LAPISROCK = REGISTRY.register("lapisrock", LAPISROCKItem::new);
		REDSTONEROCK = REGISTRY.register("redstonerock", REDSTONEROCKItem::new);
		COALROCK = REGISTRY.register("coalrock", COALROCKItem::new);
		JOURNEYMAP = REGISTRY.register("journeymap", JOURNEYMAPItem::new);
		ENDERJADE = REGISTRY.register("enderjade", ENDERJADEItem::new);
	}
	// Start of user code block custom items
	// End of user code block custom items
}