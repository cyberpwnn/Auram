package inzhefop.extrautilitiesrebirth.init;

import inzhefop.extrautilitiesrebirth.world.inventory.*;
import net.minecraft.world.inventory.MenuType;
import net.minecraftforge.common.extensions.IForgeMenuType;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.RegistryObject;

public class ExtrautilitiesrebirthModMenus {
	// 1. Create the DeferredRegister for MenuTypes
	public static final DeferredRegister<MenuType<?>> REGISTRY = DeferredRegister.create(ForgeRegistries.MENU_TYPES, "extrautilitiesrebirth");

	// 2. Register entries using IForgeMenuType.create (This handles the weird constructor and network data)
	public static final RegistryObject<MenuType<CreativeChestGUIMenu>> CREATIVE_CHEST_GUI = REGISTRY.register("creative_chest_gui",
			() -> IForgeMenuType.create(CreativeChestGUIMenu::new));

	public static final RegistryObject<MenuType<NormalGUIMenu>> NORMAL_GUI = REGISTRY.register("normal_gui",
			() -> IForgeMenuType.create(NormalGUIMenu::new));

	public static final RegistryObject<MenuType<MechanicalMinerGUIMenu>> MECHANICAL_MINER_GUI = REGISTRY.register("mechanical_miner_gui",
			() -> IForgeMenuType.create(MechanicalMinerGUIMenu::new));

	public static final RegistryObject<MenuType<MechanicalUserGUIMenu>> MECHANICAL_USER_GUI = REGISTRY.register("mechanical_user_gui",
			() -> IForgeMenuType.create(MechanicalUserGUIMenu::new));

	public static final RegistryObject<MenuType<ResonantorGUIMenu>> RESONANTOR_GUI = REGISTRY.register("resonantor_gui",
			() -> IForgeMenuType.create(ResonantorGUIMenu::new));

	public static final RegistryObject<MenuType<FurnaceGUIMenu>> FURNACE_GUI = REGISTRY.register("furnace_gui",
			() -> IForgeMenuType.create(FurnaceGUIMenu::new));

	public static final RegistryObject<MenuType<EnchanterGUIMenu>> ENCHANTER_GUI = REGISTRY.register("enchanter_gui",
			() -> IForgeMenuType.create(EnchanterGUIMenu::new));

	public static final RegistryObject<MenuType<TrashCanGUIMenu>> TRASH_CAN_GUI = REGISTRY.register("trash_can_gui",
			() -> IForgeMenuType.create(TrashCanGUIMenu::new));

	public static final RegistryObject<MenuType<GoldenBagGUIMenu>> GOLDEN_BAG_GUI = REGISTRY.register("golden_bag_gui",
			() -> IForgeMenuType.create(GoldenBagGUIMenu::new));

	public static final RegistryObject<MenuType<GoldenChestGUIMenu>> GOLDEN_CHEST_GUI = REGISTRY.register("golden_chest_gui",
			() -> IForgeMenuType.create(GoldenChestGUIMenu::new));

	public static final RegistryObject<MenuType<EnderQuarryGUIMenu>> ENDER_QUARRY_GUI = REGISTRY.register("ender_quarry_gui",
			() -> IForgeMenuType.create(EnderQuarryGUIMenu::new));

	public static final RegistryObject<MenuType<SorterGUIMenu>> SORTER_GUI = REGISTRY.register("sorter_gui",
			() -> IForgeMenuType.create(SorterGUIMenu::new));

	// 3. IMPORTANT: Call this method from your Main Mod class constructor
	public static void register(IEventBus bus) {
		REGISTRY.register(bus);
	}
}