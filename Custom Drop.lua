function CHAT(A) SendPacket(2, "action|input\n|text|" ..A) end 
function CONSOLE(A) SendVariantList({[0] = "OnConsoleMessage", [1] = V.SYSTEM.CREDIT.."`o"..A }) end 
function BUBBLE(A, B) SendVariantList({[0] = "OnTalkBubble", [1] = A, [2] = B}) return true end
function OVERLAY(A) SendVariantList({[0] = "OnTextOverlay", [1] = A}) end 
function DIALOG(A, B) SendVariantList({[0] = "OnDialogRequest", [1] = A}, -1, B) end
function SPLIT(A, B) local T = {} for A in string.gmatch(A, "([^"..B.."]+)") do table.insert(T, A) end return T end

V = {
    SYSTEM = {
        CREDIT = ""
    },
    LOG = {
        DROP = {}
    },
    ACTION = {
        CDROP = {LAST_USED = 0, COOLDOWN = 0}
    }
}
function GET_AMOUNT(A) for _, B in pairs(GetInventory()) do if B.id == A then return math.floor(B.amount) end end return 0 end
function GET_DATA(N) tonumber(N) local W, D, B, I, DATA = N % 100, math.floor(N / 100) % 100, math.floor(N / 10000) % 100, math.floor(N / 1000000) % 100, "`w" if I == 0 and B == 0 and D == 0 and W == 0 then return "-" end if I ~= 0 then if B ~= 0 or D ~= 0 or W ~= 0 then DATA = DATA ..I.. " `bBlack Gem Lock `w" else DATA = DATA ..I.. " `bBlack Gem Lock" end end if B ~= 0 then if D ~= 0 or W ~= 0 then DATA = DATA ..B.. " `eBlue Gem Lock `w" else DATA = DATA ..B.. " `eBlue Gem Lock" end end if D ~= 0 then if W ~= 0 then DATA = DATA ..D.. " `1Diamond Lock `w" else DATA = DATA ..D.. " `1Diamond Lock" end end if W ~= 0 then DATA = DATA ..W.. " `9World Lock" end return DATA end 

function PLACE(A, B, C) SendPacketRaw(false,{type = 3, value = A, x = GetLocal().pos.x, y = GetLocal().pos.y, px = B, py = C}) end 
function WEAR(A) SendPacketRaw(false, {type = 10, value = A}) end 
function DROP(A, B) SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|".. A .. "|\nitem_count|".. B) end 
function TRASH(A, B) SendPacket(2,"action|dialog_return\ndialog_name|trash\nitem_trash|".. A .. "|\nitem_count|".. B) end 
function DEPO(A) SendPacket(2, "action|dialog_return\ndialog_name|bank_deposit\nbgl_count|" .. A) end
function WEDE(A) SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|" .. A) end

function CHECK_COOLDOWN() RunThread(function() while COOLDOWN do if CDROP then CDROP = false end if not COOLDOWN then break end CONSOLE("Please wait a seconds before dropping again...") Sleep(1500) COOLDOWN = false break end end) end

function CAN_USE_CDROP(A)
    local ACT = V.ACTION[A]
    local C = os.time()
    local T = ACT.COOLDOWN - (C - ACT.LAST_USED)
    
    if T <= 0 then
        ACT.LAST_USED = C
        return true, 0
    else
        return false, T
    end
end

function CUSTOM_DROP()
    local C, T = CAN_USE_CDROP("CDROP")
    if C then
        LogToConsole("Dropping!")
    else
        LogToConsole("Please wait " .. T .. " seconds before dropping again...")
    end
end

function CUSTOM_DROP_OLD(F) tonumber(F) if COOLDOWN then CDROP = false return end RESULT = GET_DATA(F)
WORLD_LOCK = F % 100 DIAMOND_LOCK = math.floor((F % 10000) / 100) BLUE_GEM_LOCK = math.floor((F % 1000000) / 10000) BLACK_GEM_LOCK = math.floor(F / 1000000)

-- // Debugging CONSOLE("Result : "..WORLD_LOCK.. " - " .. DIAMOND_LOCK .. " - " .. BLUE_GEM_LOCK .. " - " ..BLACK_GEM_LOCK)

RunThread(function() while CDROP do if SHOW_COLLECTED then break end if not CDROP then break end
Sleep(200)

if BLACK_GEM_LOCK > 0 then if GET_AMOUNT(11550) < math.floor(BLACK_GEM_LOCK) and GET_AMOUNT(7188) > math.floor(BLACK_GEM_LOCK)*100 then MERGE_BLACK() Sleep(100) end
DROP(11550, BLACK_GEM_LOCK) CONSOLE("Dropped  `w"..BLACK_GEM_LOCK.. " Black Gem Lock`o.") Sleep(100) table.insert(V.LOG.DROP, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..BLACK_GEM_LOCK.." Black Gem Lock`o. at |left|11550|11550|\n", DROP_ID = 11550})
end
if BLUE_GEM_LOCK > 0 then if GET_AMOUNT(7188) < math.floor(BLUE_GEM_LOCK) then SHATTER_BLACK() Sleep(100) end
DROP(7188, BLUE_GEM_LOCK) CONSOLE("Dropped  `w"..BLUE_GEM_LOCK.. " Blue Gem Lock`o.") Sleep(100) table.insert(V.LOG.DROP, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..BLUE_GEM_LOCK.." Blue Gem Lock`o. at |left|7188|7188|\n", DROP_ID = 7188})
end
if DIAMOND_LOCK > 0 then if GET_AMOUNT(1796) < math.floor(DIAMOND_LOCK) then WEAR(7188) Sleep(100) end
DROP(1796, DIAMOND_LOCK) CONSOLE("Dropped  `w"..DIAMOND_LOCK.. " Diamond Lock`o.") Sleep(100) table.insert(V.LOG.DROP, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..DIAMOND_LOCK.." Diamond Lock`o. at |left|1796|1796|\n", DROP_ID = 1796})
end
if WORLD_LOCK > 0 then if GET_AMOUNT(242) < math.floor(WORLD_LOCK) then WEAR(1796) Sleep(100) end
DROP(242, WORLD_LOCK) CONSOLE("Dropped  `w"..WORLD_LOCK.. " World Lock`o.") Sleep(100) table.insert(V.LOG.DROP, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..WORLD_LOCK.." World Lock`o. at |left|242|242|\n", DROP_ID = 242})
end CHAT(V.SYSTEM.CREDIT.."Dropping "..RESULT) if CDROP then CDROP = false COOLDOWN = true end end end)
end

CONSOLE("Running the script...")

AddHook("OnSendPacket", "PACKET-HOSTER", function(T, S) if S == nil then return end local VALUE, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", " "), " "), S:match("buttonClicked|(%S+)"), S if VALUE == nil or VALUE[1] == nil or VALUE == "" or VALUE[1] == "" then return end COMMAND = VALUE[1]:lower()

if COMMAND == "/cbgl" then if CHANGE_BGL_MODE == nil or CHANGE_BGL_MODE == false then CHANGE_BGL_MODE = true CONSOLE("Change BGL `2Enabled") else CHANGE_BGL_MODE = false CONSOLE("Change BGL `4Disabled") end return true end

if COMMAND == ("/wl") then if VALUE[3] ~= nil then OPTION = VALUE[3]:lower() if OPTION:find("x(%d+)") then TIMES = tonumber(OPTION:match("x(%d+)")) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(242) < tonumber(VALUE[2]*TIMES) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(VALUE[2]*TIMES) DROP(242, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(VALUE[2]*TIMES).." `9World Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]*TIMES).." `9World Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]*TIMES).." `9World Lock") end end end return true end if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(242) < tonumber(VALUE[2]) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(VALUE[2]) DROP(242, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(VALUE[2]).." `9World Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]).." `9World Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]).." `9World Lock") end end return true end 
if COMMAND == ("/dwl") then if GET_AMOUNT(242) <= 0 then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP(242, GET_AMOUNT(242)) CONSOLE("Dropped `w"..GET_AMOUNT(242).." `9World Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(242).." `9World Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(242).." `9World Lock") end end return true end 
if COMMAND == ("/dl") then if VALUE[3] ~= nil then OPTION = VALUE[3]:lower() if OPTION:find("x(%d+)") then TIMES = tonumber(OPTION:match("x(%d+)")) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(1796) < tonumber(VALUE[2]*TIMES) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(VALUE[2]*TIMES) DROP(1796, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(VALUE[2]*TIMES).." `1Diamond Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]*TIMES).." `1Diamond Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]*TIMES).." `1Diamond Lock") end end end return true end if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(1796) < tonumber(VALUE[2]) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(VALUE[2]) DROP(1796, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(VALUE[2]).." `1Diamond Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]).." `1Diamond Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]).." `1Diamond Lock") end end return true end 
if COMMAND == ("/ddl") then if GET_AMOUNT(1796) <= 0 then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP(1796, GET_AMOUNT(1796)) CONSOLE("Dropped `w"..GET_AMOUNT(1796).." `1Diamond Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(1796).." `1Diamond Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(1796).." `1Diamond Lock") end end return true end 
if COMMAND == ("/bl") then if VALUE[3] ~= nil then OPTION = VALUE[3]:lower() if OPTION:find("x(%d+)") then TIMES = tonumber(OPTION:match("x(%d+)")) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(7188) < tonumber(VALUE[2]*TIMES) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(VALUE[2]*TIMES) DROP(7188, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(VALUE[2]*TIMES).." `eBlue Gem Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]*TIMES).." `eBlue Gem Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]*TIMES).." `eBlue Gem Lock") end end end return true end if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(7188) < tonumber(VALUE[2]) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(VALUE[2]) DROP(7188, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(VALUE[2]).." `eBlue Gem Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]).." `eBlue Gem Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]).." `eBlue Gem Lock") end end return true end 
if COMMAND == ("/dbl") then if GET_AMOUNT(7188) <= 0 then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP(7188, GET_AMOUNT(7188)) CONSOLE("Dropped `w"..GET_AMOUNT(7188).." `eBlue Gem Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(7188).." `eBlue Gem Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(7188).." `eBlue Gem Lock") end end return true end 
if COMMAND == ("/bg") then if VALUE[3] ~= nil then OPTION = VALUE[3]:lower() if OPTION:find("x(%d+)") then TIMES = tonumber(OPTION:match("x(%d+)")) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(11550) < tonumber(VALUE[2]*TIMES) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(VALUE[2]*TIMES) DROP(11550, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(VALUE[2]*TIMES).." `bBlack Gem Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]*TIMES).." `bBlack Gem Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]*TIMES).." `bBlack Gem Lock") end end end return true end if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(11550) < tonumber(VALUE[2]) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(VALUE[2]) DROP(11550, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(VALUE[2]).." `bBlack Gem Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]).." `bBlack Gem Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..tonumber(VALUE[2]).." `bBlack Gem Lock") end end return true end 
if COMMAND == ("/dbg") then if GET_AMOUNT(11550) <= 0 then CONSOLE(D.ALERT.AMOUNT_LESS) return true else DROP(11550, GET_AMOUNT(11550)) CONSOLE("Dropped `w"..GET_AMOUNT(11550).." `bBlack Gem Lock") if V.BUBBLE.DROP_BUBBLE then CHAT(V.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(11550).." `bBlack Gem Lock") end if V.OVERLAY.DROP_OVERLAY then OVERLAY(V.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(11550).." `bBlack Gem Lock") end end return true end 

if COMMAND == ("/daw") then TABLE_DAW = {WL = GET_AMOUNT(242), DL = GET_AMOUNT(1796), BGL = GET_AMOUNT(7188), BLACK = GET_AMOUNT(11550)} if TABLE_DAW.WL == 0 and TABLE_DAW.DL == 0 and TABLE_DAW.BGL == 0 and TABLE_DAW.BLACK == 0 then CONSOLE(D.ALERT.AMOUNT_LESS) return true end DAW = true return true end 

if COMMAND == "/cd" and VALUE[2] then if COOLDOWN then CHECK_COOLDOWN() return true end HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif tonumber(VALUE[2]) > math.floor(HAVE_AMOUNT) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else local DROP_AMOUNT = tonumber(VALUE[2]) if not CDROP then CDROP = true else CDROP = false end CUSTOM_DROP(DROP_AMOUNT) end return true elseif COMMAND == "/cd" and not VALUE[2] then CONSOLE("Make sure provide amount to drop by typing like this : /cd <amount>") return true end
if COMMAND == "/dd" and VALUE[2] then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif tonumber(VALUE[2]*100) > math.floor(HAVE_AMOUNT) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else local DROP_AMOUNT = tonumber(VALUE[2]*100) if not CDROP then CDROP = true else CDROP = false end CUSTOM_DROP(DROP_AMOUNT) end return true elseif COMMAND == "/dd" and not VALUE[2] then CONSOLE("Make sure provide amount to drop by typing like this : /dd <amount>") return true end
if COMMAND == "/bd" and VALUE[2] then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif tonumber(VALUE[2]*10000) > math.floor(HAVE_AMOUNT) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else local DROP_AMOUNT = tonumber(VALUE[2]*10000) if not CDROP then CDROP = true else CDROP = false end CUSTOM_DROP(DROP_AMOUNT) end return true elseif COMMAND == "/db" and not VALUE[2] then CONSOLE("Make sure provide amount to drop by typing like this : /db <amount>") return true end
if COMMAND == "/bg" and VALUE[2] then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif tonumber(VALUE[2]*1000000) > math.floor(HAVE_AMOUNT) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else local DROP_AMOUNT = tonumber(VALUE[2]*1000000) if not CDROP then CDROP = true else CDROP = false end CUSTOM_DROP(DROP_AMOUNT) end return true elseif COMMAND == "/bg" and not VALUE[2] then CONSOLE("Make sure provide amount to drop by typing like this : /bg <amount>") return true end

return false end)