ServerEvents.tick(event => {
  if (event.server.tickCount % 20 !== 0) return;

  event.server.players.forEach(player => {
    applyMapEffect(player);
    applyJadeEffect(player);
  });
});

function applyJadeEffect(player) {
  const targetItem = 'auram:enderjade';
  const hasIt = checkInventoryIncludingBackpacks(player, targetItem);
  const s = player.stages.has("jade");

  if (!s && hasIt) {
    player.stages.add("jade");
  } else if (s && !hasIt) {
    player.stages.remove("jade");
  }
}

function applyMapEffect(player) {
  const targetItem = 'auram:journeymap';
  const hasIt = checkInventoryIncludingBackpacks(player, targetItem);
  const s = player.stages.has("map");

  if (!s && hasIt) {
    player.stages.add("map");
  } else if (s && !hasIt) {
    player.stages.remove("map");
  }
}

function checkInventoryIncludingBackpacks(player, targetId) {
  if (player.inventory.contains(targetId)) return true;
  let allItems = player.inventory.allItems;
  
  for (let i = 0; i < allItems.length; i++) {
    let stack = allItems[i];
    if (!stack.nbt) continue;
    if (stack.nbt.Inventory && stack.nbt.Inventory.Items) {
      let list = stack.nbt.Inventory.Items;
      for (let j = 0; j < list.length; j++) {
        if (list[j].id == targetId) return true;
      }
    }

    else if (stack.nbt.backpack_inventory && stack.nbt.backpack_inventory.items) {
      let list = stack.nbt.backpack_inventory.items;
      for (let j = 0; j < list.length; j++) {
        if (list[j].id == targetId) return true;
      }
    }
  }

  return false;
}