ServerEvents.tick(event => {
  if (event.server.tickCount % 20 !== 0) return;

  event.server.players.forEach(player => {
    applyMapEffect(player);
    applyJadeEffect(player);
  });
});

function applyJadeEffect(player){
    const it = player.inventory.contains(Item.of('auram:enderjade'));
    const s = player.stages.has("jade");

    if(!s && it) {
        player.stages.add("jade");
    }
    else if(s && !it) {
        player.stages.remove("jade");
    }
}

function applyMapEffect(player){
    const it = player.inventory.contains(Item.of('auram:journeymap'));
    const s = player.stages.has("map");

    if(!s && it) {
        player.stages.add("map");
    } else if(s && !it) {
        player.stages.remove("map");
    }
}