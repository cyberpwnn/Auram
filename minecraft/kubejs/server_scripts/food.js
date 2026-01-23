
// COLORS of the stages
// red
// orange
// brown
// yellow
// green
// lime
// cyan
// light_blue
// blue
// magenta
// purple
// pink

const foodMapping = {
  "minecraft:lapis_lazuli": "blue",
  "minecraft:blue_dye": "blue",
  "minecraft:red_dye": "red",
  "minecraft:orange_dye": "orange",
  "minecraft:brown_dye": "brown",
  "minecraft:yellow_dye": "yellow",
  "minecraft:green_dye": "green",
  "minecraft:lime_dye": "lime",
  "minecraft:cyan_dye": "cyan",
  "minecraft:light_blue_dye": "light_blue",
  "minecraft:magenta_dye": "magenta",
  "minecraft:purple_dye": "purple",
  "minecraft:pink_dye": "pink"
};

const colorQuestMapping = {
    "blue": "6B0016E83D565636",
    "red": "00664DDF8C5CC781",
    "orange": "2991E1C716E4B863",
    "brown": "3F4DE9BAC2FEF8BA",
    "yellow": "362D8CF209890CBE",
    "green": "1AAF40633B53E483",
    "lime": "7C303654A44233DD",
    "cyan": "4A3DB306F75BEB82",
    "light_blue": "2BFB96848ABCE67A",
    "magenta": "500CC692B4393650",
    "purple": "7133B36742BFA01A",
    "pink": "51399BD5D55B3978"
};

ItemEvents.foodEaten(event => {
    const pd = event.player.persistentData;

    // Log eaten food counts, idk could be useful
    pd.eatenFoods = pd.eatenFoods || {};
    pd.eatenFoods[event.item.id] = (pd.eatenFoods[event.item.id] || 0) + 1;
    console.log(`Player ${event.player.username} has eaten ${event.item.id} ${pd.eatenFoods[event.item.id]} times`);

    // Check if the eaten food corresponds to a color stage
    for (const [itemId, stage] of Object.entries(foodMapping)) {
        if (event.item.id === itemId) {
            if(!event.player.stages.has(stage)){
                // Grant the stage
                Utils.server.runCommandSilent(`gamestage add ${event.player.username} ${stage}`);

                if(colorQuestMapping[stage]) {
                    Utils.server.runCommandSilent(`ftbquests change_progress ${event.player.username} complete ${colorQuestMapping[stage]}`);
                }

                // Mark color eaten
                pd.eatenColors = pd.eatenColors || {};
                pd.eatenColors[stage] = true;
                console.log(pd.eatenColors);
            } else {
                // idk toggle could be funny
                Utils.server.runCommandSilent(`gamestage remove ${event.player.username} ${stage}`);
            }
        }
    }
});