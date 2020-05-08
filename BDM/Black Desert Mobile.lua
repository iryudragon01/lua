
REG = {}

-- Ankulua
TIMEOUT = 3
SIMILAR = 0.8
WIDTH = 720
HEIGHT = 1280
attemp=1

Farm_location = Location(0,0)
Farm_lo_1 = Location(840,360)
Farm_lo_2 = Location(840,439)
Farm_lo_3 = Location(840,507)

Item_grade = Location(0,0)
item_normal= Location(417,420)
item_magic= Location(528,420)
item_rare= Location(637,420)
item_unique= Location(742,420)
item_epic= Location(850,420)
-- ========== Settings ================
Settings:setCompareDimension(true, 1280)
Settings:setScriptDimension(true, 1280)
Settings:set("MinSimilarity", 0.9)

----------Use skill---------------
function UseSkill ()
    toast("Use Skill")
    click(Location(1090,28))
    click(Location(1201,677))
    click(Location(699,476))
    wait(2)
    click("Skill_training.png")
    click("Use_Skillbooks.png")
    wait(1)
    click("exit.png")
    return
end

----------Pet Feeds------------
function PetFeeds()
    toast("Pet Feeds")
    click(Location(84,275))
    click(Location(1189, 144))  -----pet 1
    click(Location(482, 683))   -----pet feeds
    click(Location(1173, 255))  -----pet 2
    click(Location(482, 683))   -----pet feeds
    click(Location(1174, 336))  -----pet 3
    click(Location(482, 683))   -----pet feeds
    click("exit.png")
    wait(2)

end
-------------- search and click------
function SearchClick(location,pic,simi)
    Settings:set("MinSimilarity", simi)
    test2 = regionFindAllNoFindException(location,pic)
    for i, m in ipairs(test2) do
        return m
    end
end
-------------- buy --------------
function BuyItem(location)
    toast("Buy item")
    click(location)
    wait(2)
    click(Location(591,460))
    wait(30)
    click(SearchClick(Region(1034, 479, 200, 200),"item_shop.png",0.6))
    click(Location(1181,670))
    click("exit.png")
    click(Location(232, 136))   ----- home btn
    click(Location(840, 361))   ----- farm location 1
    wait(60)

end
--------------- black spirit----------
function BlackSpirit()
    toast("Black Spirit")
    click(Location(780,663))
    click(Location(554,655))
    wait(1)
    click(Location(1087,655))   ----- auto select
    click(Location(658,665))   ----- absorb
    click(Location(707,480))   ----- confirm
    wait(1)
    click(Location(35,22))   ----- back btn
    click(Location(99,527))   ----- Lightstone
    click(Location(1022,671))   ----- Auto Fusion
    click(Location(746,417))   ----- Unique btn
    click(Location(706,505))   ----- confirm btn
    wait(2)
    click(Location(35,22))   ----- back btn
    click(Location(1200,472))   ----- Fuse Crystal
    click(Location(1029,668))   ----- Auto Fusion
    click(Location(746,417))   ----- Unique btn
    click(Location(706,505))   ----- confirm btn
    wait(2)
    click("exit.png")
end
--------------- Repeatative Quese ----
function RepeatativeQuest()
    toast("Repeatative quest")
    click(Location(1121,240))
    click(Location(1121,240))
    click(Location(1121,240))
    click(Location(1121,240))
    click(Location(1121,240))
    click(Location(924,674))
    click(Location(702,520))    ----- Accept
    click(Location(882,281))    ----- Accept
    click(Location(882,281))    ----- Accept
    click(Location(86,314))    ----- under pet
    click(Location(86,314))    ----- under pet
    click(Location(232, 136))   ----- home btn
    wait(1)
    click(Location(840, 361))   ----- farm location 1

end

-------------- Use Ultimate skill-----
function UltimateSkill()
    toast(" Use Ultimate Skill")
    click(Location(1266,463))
    click(Location(1147,463))
    click(Location(1147,463))
    click(Location(1147,463))
    click(Location(1231,463))
    click(Location(1231,463))
    click(Location(1231,463))
    wait(2)
end
-------------   check bag ------------
function BagFull(pic,minsimi)
    reg = Region(526, 593, 130, 70)
    Settings:set("MinSimilarity", minsimi)
    for i=1,5,1 do
        tablelocate = regionFindAllNoFindException(reg,pic)
        for i, m in ipairs(tablelocate) do
            return m
        end
        return "not found"
    end
    wait(5)

end
    -- ==========  main program ==========
        for k=1,200,1 do
            amount= BagFull("full_amount.png",0.9)
            if amount=="not found" then
                toast("not found")
            else
                UseSkill()
                BlackSpirit()
            end
            weight= BagFull("full_weight.png",0.9)
            if weight=="not found" then
                toast("not found")
            else
                BuyItem(weight)
            end
            wait(60)
        end