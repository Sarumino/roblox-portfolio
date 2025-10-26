-- QuestDatabase.lua
-- Defines all quests used in the game

local QuestDatabase = {
    ["quest_collect_apples"] = {
        id = "quest_collect_apples",
        name = "Apple Collector",
        type = "collect",
        requirement = { item = "Apple", amount = 10 },
        reward = { coins = 50, xp = 10 }
    },

    ["quest_kill_slimes"] = {
        id = "quest_kill_slimes",
        name = "Slime Slayer",
        type = "kill",
        requirement = { enemy = "Slime", amount = 5 },
        reward = { coins = 100, xp = 25 }
    },

    ["quest_talk_oldman"] = {
        id = "quest_talk_oldman",
        name = "Speak to the Old Man",
        type = "talk",
        requirement = { npc = "OldMan" },
        reward = { coins = 20 }
    }
}

return QuestDatabase
