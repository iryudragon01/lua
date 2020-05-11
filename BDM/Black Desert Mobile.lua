
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
    click(Location(1190,86))
    click(Location(873,483))
    wait(1)
    click(Location(1236,28))
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
    click(Location(1236,28))
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
   -- existsClick("Go_to_Town.png")
    wait(2)
    local r,g,b = getColor(Location(556,446))
    wait(2)
    local r1,g1,b1 = getColor(Location(556,446))
    if(r==r1 and g==g1 and b==b1) then   ------if equal then goto town
        click(Location(591,460))
        wait(30)
        click(Location(1097,530))
        wait(1)
        click(Location(1204,530))
        click(Location(1181,670))
        click(Location(1236,28))
        click(Location(232, 136))   ----- home btn
        click(Location(840, 361))   ----- farm location 1
        wait(60)
        else
        click(location)
    end

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
    click(Location(1236,28))
end
--------------- Repeatative Quese ----
function RepeatativeQuest(location)
    toast("Repeatative quest")
    click(location)
    click(location)
    click(location)
    click(Location(826,673))
    click(Location(826,673))
    click(Location(702,520))    ----- Accept
    click(location)
    click(location)
    click(location)
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
---------------------------- loopcheck--------
function loopcheck()
    for j=1,5,1 do
        for i=0,8,1 do
            local r1,g1,b1 = getColor(Location(511+i*27,612))
            local r2,g2,b2 = getColor(Location(511+i*27,612))
            local r3,g3,b3 = getColor(Location(511+i*27,612))
            local r4,g4,b4 = getColor(Location(511+i*27,612))
            local r5,g5,b5 = getColor(Location(511+i*27,612))
            local r=(r1+r2+r3+r4+r5)/5
            local g=(g1+g2+g3+g4+g5)/5
            local b=(b1+b2+b3+b4+b5)/5
            if(r>170 and g <100 and b <100) then
                return Location((511+i*27),612)
            end
            wait(1)
        end
    end
    return 0
end

-------------------checkRepeatative
function checkRepeatative()
    local r,g,b = getColor(Location(1273,197))
    if(r>100 and r>b) then
        RepeatativeQuest(Location(1203,197))
        return
    end
end
    -- ==========  main program ==========

for j=1,555,1 do
    for i=1,20,1 do
        wait(5)
        checkRepeatative()
        wait(5)
        local loc = loopcheck()
        if (loc ~= 0) then

            UseSkill()
            BlackSpirit()
            end
        wait(5)
        loc = loopcheck()
        if (loc ~= 0) then
            BuyItem(loc)
        end
        UltimateSkill()
        existsClick("exit.png",10)
        existsClick("closeBTN.png",10)
        wait(60)
    end
    wait(5)
    PetFeeds()
end

