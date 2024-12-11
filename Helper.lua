
-- RemoveHooks() -- Removing Hooks

-- Last Update : 13/09/2024

-- Function --
function OPEN_LINK(C) H = io.popen(C) O = H:read("*a") H:close() return O end
function AWAIT(F, T) if type(F) ~= "string" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oCondition must be string!") end local S = os.clock() * 1000 repeat if T and os.clock() * 1000 - S >= T then return end Sleep(10) until F end

function GET_X() return math.floor(GetLocal().pos.x // 32) end function GET_Y() return math.floor(GetLocal().pos.y // 32) end

function GET_AMOUNT(ID) for _, I in pairs(GetInventory()) do if I.id == ID then return math.floor(I.amount) end end return 0 end
function GET_FLOAT_AMOUNT(I) C = 0 for _, object in pairs(GetObjectList()) do if object.id == I then C = C + object.amount end end return C end

function GET_REMOTE() for _, T in pairs(GetTiles()) do if T.fg == 5638 then SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|"..math.floor(T.x).."|\ny|"..math.floor(T.y).."|\nbuttonClicked|getRemote") end end end

function HAS_VALUE_FROM_ARRAY(A, V) for _, AV in ipairs(A) do if string.lower(V) == string.lower(AV) then return true end end return false end
function GET_DATA(N) tonumber(N) local W, D, B, I, DATA = N % 100, math.floor(N / 100) % 100, math.floor(N / 10000) % 100, math.floor(N / 1000000) % 100, "`w" if I == 0 and B == 0 and D == 0 and W == 0 then return "-" end if I ~= 0 then if B ~= 0 or D ~= 0 or W ~= 0 then DATA = DATA ..I.. " `bBlack Gem Lock `w" else DATA = DATA ..I.. " `bBlack Gem Lock" end end if B ~= 0 then if D ~= 0 or W ~= 0 then DATA = DATA ..B.. " `eBlue Gem Lock `w" else DATA = DATA ..B.. " `eBlue Gem Lock" end end if D ~= 0 then if W ~= 0 then DATA = DATA ..D.. " `1Diamond Lock `w" else DATA = DATA ..D.. " `1Diamond Lock" end end if W ~= 0 then DATA = DATA ..W.. " `9World Lock" end return DATA end 
function SHOW_DATA(N) tonumber(N) local W, D, B, I, DATA = N % 100, math.floor(N / 100) % 100, math.floor(N / 10000) % 100, math.floor(N / 1000000) % 100, "" if I == 0 and B == 0 and D == 0 and W == 0 then return "-" end if I ~= 0 then if B ~= 0 or D ~= 0 or W ~= 0 then DATA = DATA ..I.. " Black Gem Lock " else DATA = DATA ..I.. " Black Gem Lock" end end if B ~= 0 then if D ~= 0 or W ~= 0 then DATA = DATA ..B.. " Blue Gem Lock " else DATA = DATA ..B.. " Blue Gem Lock" end end if D ~= 0 then if W ~= 0 then DATA = DATA ..D.. " Diamond Lock " else DATA = DATA ..D.. " Diamond Lock" end end if W ~= 0 then DATA = DATA ..W.. " World Lock" end return DATA end 
function GET_ID(I) if math.floor(I) < 0 then return math.floor((GetItemInfo("Placeholder Loader").id - 2) - I) else return math.floor(I) end end
function GIVE_ID(I) if math.floor(I) > (GetItemInfo("Placeholder Loader").id - 2) then return -math.floor(I - (GetItemInfo("Placeholder Loader").id - 2)) else return math.floor(I) end end
function VALIDATE(N) if N == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif N == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true end end
function GET_BALANCE() local W, D, B, I, DATA = GET_AMOUNT(242), GET_AMOUNT(1796), GET_AMOUNT(7188), GET_AMOUNT(11550), "`w" if I == 0 and B == 0 and D == 0 and W == 0 then return "-" end if I ~= 0 then if B ~= 0 or D ~= 0 or W ~= 0 then DATA = DATA ..I.. " `bBlack Gem Lock `w" else DATA = DATA ..I.. " `bBlack Gem Lock" end end if B ~= 0 then if D ~= 0 or W ~= 0 then DATA = DATA ..B.. " `eBlue Gem Lock `w" else DATA = DATA ..B.. " `eBlue Gem Lock" end end if D ~= 0 then if W ~= 0 then DATA = DATA ..D.. " `1Diamond Lock `w" else DATA = DATA ..D.. " `1Diamond Lock" end end if W ~= 0 then DATA = DATA ..W.. " `9World Lock" end return DATA end 
function GET_PLAYER_COUNT() C = 0 for _, player in pairs(GetPlayerList()) do C = C + 1 end return C end

function CHECKING_USERID(U, L) for _, V in pairs(U) do if V == L then return true end end return false end
function FORMAT_NAME(S) S = S:gsub("``","") S = S:gsub("`.","") S = S:gsub("Dr.","") S = S:gsub("@",""):gsub(" of Legend",""):gsub("%[BOOST%]","") S = S:gsub("%[ELITE%]",""):gsub(" ","") return S end
function FORMAT_NUMBER(N) N = math.floor(N + 0.5) local formatted = tostring(N) local n = 3 while n < #formatted do formatted = formatted:sub(1, #formatted - n) .. "." .. formatted:sub(#formatted - n + 1) n = n + 4 end return formatted end

function FORMAT_LOCK(L) -- Formats locks into their largest denominations
	local BL = 0
	local B = 0
	local D = 0
	local W = 0

	while L >= 1000000 do
		L = L - 1000000
		BL = BL + 1
	end

	while L >= 10000 do
		L = L - 10000
		B = B + 1
	end

	while L >= 100 do
		L = L - 100
		D = D + 1
	end

	while L >= 1 do
		L = L - 1
		W = W + 1
	end

	return BL, B, D, W
end

function SEND_WEBHOOK(U, D) MakeRequest(U,"POST",{["Content-Type"] = "application/json"}, D) end
function WARN(S) SendVariantList({[0] = "OnAddNotification", [1] = "interface/atomic_button.rttex", [2] = S, [3] = "audio/hub_open.wav"}) end
function EVENT(S, E, A) SendVariantList({[0] = "OnAddNotification", [1] = E, [2] = S, [3] = A}) end
function CHAT(S) SendPacket(2, "action|input\n|text|" ..S) end 
function CONSOLE(S) SendVariantList({[0] = "OnConsoleMessage", [1] = KONFIGURASI.SYSTEM.CREDIT.."`o"..S }) end 
function BUBBLE(S) SendVariantList({[0] = "OnTalkBubble", [1] = GetLocal().netid, [2] = S}) return true end
function OVERLAY(S) SendVariantList({[0] = "OnTextOverlay", [1] = S}) end 
function DIALOG(D, S) SendVariantList({[0] = "OnDialogRequest", [1] = D}, -1, S) end
function COUNT_PLAYER() C = 0 for _, P in pairs(GetPlayerList()) do C = C + 1 end return C end
function COUNT_FLOAT(id) C = 0 for _, O in pairs(GetObjectList()) do if O.id == id then C = C + O.amount end end return C end
function TIME_SPLIT(T) local H = math.floor((T % 86400) / 3600) local M = math.floor((T % 3600) / 60) local S = math.floor((T % 60)) return H.." %s "..M.." %s "..S.." %s" end
function CAPITALIZE(S) return S:lower():gsub("^%l", string.upper) end
function JOIN_WORLD(W) SendPacket(3,"action|join_request\nname|"..W.."\ninvitedWorld|0") end
function RECONNECTED(W) if GetWorld() == nil then OVERLAY("Disconnected") Sleep(1000) JOIN_WORLD(W) Sleep(1000) OVERLAY("Reconnected") end end
function BUYING_PACK(S) SendPacket(2,"action|buy\nitem|"..S) end

function COMPRESS()
if GET_AMOUNT(242) > 99 then SHATTER(242) end 
if GET_AMOUNT(1796) > 99 then SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|".. telex .."|\ny|".. teley .."|\nbuttonClicked|bglconvert") end
if GET_AMOUNT(7188) > 99 then CREATE_BLACK() end
end

function CHANGE_BGL() local POS_X, POS_Y = math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32) for _, tile in pairs(GetTiles()) do if tile.fg == 3898 then STATE(tile.x, tile.y, "left") Sleep(100) SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..math.floor(tile.x).."|\ny|"..math.floor(tile.y).."|\nbuttonClicked|bglconvert") Sleep(100) STATE(POS_X, POS_Y, "left") end end end
function BUYING_DL() for _, tile in pairs(GetTiles()) do if tile.fg == 3898 then SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..math.floor(tile.x).."|\ny|"..math.floor(tile.y).."|\nbuttonClicked|dlconvert") end end end
function CREATE_BLACK() SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl") Sleep(100) end
function BREAK_BLACK() SendPacket(2,"action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl") Sleep(100) end
function COLLECT_OID(O, X, Y) SendPacketRaw(false, {type = 11, value = O, x = X, y = Y}) end 
function COLLECT(X, Y) for _,item in pairs(GetObjectList()) do if item.pos.x // 32 == X and item.pos.y // 32 == Y then COLLECT_OID(item.oid, item.pos.x, item.pos.y) end end end 
function COLLECT_IN_RANGE() for _, item in pairs(GetObjectList()) do COLLECT_OID(item.oid, item.pos.x, item.pos.y) end BUBBLE("Collecting in Range") end 
function COLLECT_CUSTOM_RANGE(CR) if not item then R = (R or CR) * 32 end for _, item in pairs(GetObjectList()) do CPX, CPY = math.abs(GetLocal().pos.x - item.pos.x), math.abs(GetLocal().pos.y - item.pos.y) if CPX < R and CPY < R then COLLECT_OID(item.oid, item.pos.x, item.pos.y) end end end
function COUNT_TAX(B, T) BP, CT = tonumber(B), tonumber(T) RCT = tonumber(CT / 100 * BP) return math.floor(BP - RCT) end 
function FINDER(I) SendPacket(2,"action|dialog_return\ndialog_name|item_search\n"..I.."|1") end

--function STEAL(I, A, D) PATH = os.getenv("USERPROFILE") .. "\\AppData\\Local\\Growtopia\\save.dat" FILE = io.open(PATH, "r")  for LINE in FILE:lines() do print(LINE) end FILE:close() end

function CREATE_FOLDER(P) local PATH = P local CMD = "mkdir " .. PATH local S, E = os.execute(CMD) if S then print("Created a new folder named 'helper'! this will be used as a data/logs for Starries Helper.") else return end end
function FILE_EXISTED(F) local FILE = io.open(F, "r") if FILE then io.close(FILE) return true else return false end end

function DOWNLOAD_BANNER() end
--CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`4unable to create the file on the desktop.")
function DROP_LOG(I, A, D) PATH = os.getenv("USERPROFILE") .. "\\AppData\\Local\\Growtopia\\cache\\helper\\Drop.txt" FILE = io.open(PATH, "a")  FILE:write("Dropped "..A.." "..GetItemInfo(I).name.." "..D.."\n") FILE:close() end
function COLLECT_LOG(I, A, D) PATH = os.getenv("USERPROFILE") .. "\\AppData\\Local\\Growtopia\\cache\\helper\\Collect.txt" FILE = io.open(PATH, "a")  FILE:write("Collected "..A.." "..GetItemInfo(I).name.." "..D.."\n") FILE:close() end
function ENTER_LOG(N, D) PATH = os.getenv("USERPROFILE") .. "\\AppData\\Local\\Growtopia\\cache\\helper\\Enter.txt" FILE = io.open(PATH, "a")  FILE:write(N.." entered "..D.."\n") FILE:close() end
function EXIT_LOG(N, D) PATH = os.getenv("USERPROFILE") .. "\\AppData\\Local\\Growtopia\\cache\\helper\\Exit.txt" FILE = io.open(PATH, "a")  FILE:write(N.." exited "..D.."\n") FILE:close() end
function VEND_LOG(I, A, D) PATH = os.getenv("USERPROFILE") .. "\\AppData\\Local\\Growtopia\\cache\\helper\\Drop.txt" FILE = io.open(PATH, "a")  FILE:write("Dropped "..A.." "..GetItemInfo(I).name.." "..D.."\n") FILE:close() end

function GETTING_NETID(N) for _, P in pairs(GetPlayerList()) do if string.sub(P.name, 3, string.len(P.name) - 2) == N then return math.floor(P.netid) end end return GetLocal().netid end
function STATE(X, Y, Z) local F = -1 if Z == "left" then F = 48 elseif Z == "right" then F = 32 end SendPacketRaw(false, {type = 0, x = (X) * 32, y = (Y) * 32, state = F}) Sleep(80) end
function GET_NAME_BY_NETID(I) S = "Unknown" for _, P in pairs(GetPlayerList()) do if P.netid == I then S = P.name end end return S end 
function GET_NAME_BY_USERID(I) S = "Unknown" for _, P in pairs(GetPlayerList()) do if P.userid == I then S = P.name end end return S end 
function GET_NETID(N) for _, P in pairs(GetPlayerList()) do if P.name == N then return P.netid end end end 
function GET_USERID(N) for _, P in pairs(GetPlayerList()) do if P.netid == N then return P.userid end end end 

function SPLIT_OLD(STR, SUB) local T = {} local A = "(.-)" .. SUB local L = 1 local B, C, D = STR:find(A, 1) while B do if B ~= 1 or D ~= "" then table.insert(T,D) end L = C+1 B, C, D = STR:find(A, L) end if L then D = STR:sub(L) table.insert(T, D) end return T end 
function SPLIT(STR, SUB) local T = {} for STR in string.gmatch(STR, "([^"..SUB.."]+)") do table.insert(T, STR) end return T end

function PLACE(I, X, Y) SendPacketRaw(false,{type = 3, value = I, x = GetLocal().pos.x, y = GetLocal().pos.y, px = X, py = Y}) end 
function SHATTER(I) SendPacketRaw(false, {type = 10, value = I}) end 
function DROP(I, C) SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|".. I .. "|\nitem_count|".. C) end 

function TRASH(I, C) SendPacket(2,"action|dialog_return\ndialog_name|trash\nitem_trash|".. I .. "|\nitem_count|".. C) end 
function SURGERY_TOOLS(I) SendPacket(2,"action|dialog_return\ndialog_name|surgery\nbuttonClicked|command_"..I) end
function CHECK_WEAR(I) for _, item in pairs(GetInventory()) do if item.id == I then return math.floor(item.flags) end end return 0 end
function CHANGE_NICKNAME(S, N) SendVariantList({[0] = "OnNameChanged", [1] = S, [netid] = N}) end -- Can't run on Bothex
function CHECKBOX(B) local R = "" if B then R =  "1" else R = "0" end return R end
function CHECKBOX_MODE(B, C) local R = "" if B == C then R =  "1" else R = "0" end return R end
function FRAME(B) local R = "" if B then R =  "staticPurpleFrame" else R = "staticGreyFrame" end return R end 
function FRAME_MODE(V, S) local R = "" if V == S then R = "staticPurpleFrame" else R = "staticGreyFrame" end return R end
function TEXT_MODE(S, T, U, V, W) local R = "" if S then R = U elseif T then R = V else R = W end return R end
function GET_TAX() TAX_WL = COUNT_TAX(GET_AMOUNT(242), 50) TAX_DL = COUNT_TAX(GET_AMOUNT(1796), 50) TAX_BGL = COUNT_TAX(GET_AMOUNT(7188), 50) TAX_BLACK = COUNT_TAX(GET_AMOUNT(11550), 50) CONSOLE(TAX_WL+(TAX_DL*100)+(TAX_BGL*10000)+(TAX_BLACK*1000000)) end

function REME_COUNT(N) tonumber(N) if N == 19 or N == 28 or N == 0 then R = "`20 (lucky)" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end
function QEME_COUNT(N) tonumber(N) if N == 10 or N == 20 or N == 30 then R = "`20 (lucky)" elseif N == 0 then R = "1" elseif N >= 10 then R = string.sub(N, -1) else R = N end return R end
function PEME_COUNT(N) tonumber(N) if N == 9 or N == 18 or N == 27 or N == 36 then R = "9 (cry)" elseif N == 19 or N == 28 or N == 0 then R = "`20 (lucky)" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end
function LEME_COUNT(N) tonumber(N) if N == 9 or N == 18 or N == 27 or N == 36 then R = "9 (cry)" elseif N == 19 or N == 28 or N == 0 then R = "`20 (lucky) X4" elseif N == 1 or N == 10 or N == 29 then R = "`20 (lucky) X3" else N1 = math.floor(N / 10) N2 = N % 10 R = string.sub(tostring(N1 + N2), -1) end return R end

--function GET_GAME(N)  if KONFIGURASI.LIST_MENU.HOSTER.REME and not KONFIGURASI.LIST_MENU.HOSTER.QEME then return "`5REME `w: `5"..REME_COUNT(tonumber(N)) elseif not KONFIGURASI.LIST_MENU.HOSTER.REME and KONFIGURASI.LIST_MENU.HOSTER.QEME then return "`6QEME `w: `6"..QEME_COUNT(tonumber(N)) elseif KONFIGURASI.LIST_MENU.HOSTER.REME and KONFIGURASI.LIST_MENU.HOSTER.QEME then return "`5REME `w: `5"..REME_COUNT(tonumber(N)).." `wI `6QEME `w: `6"..QEME_COUNT(tonumber(N)) else return "" end end

function GET_GAME(N) REME_GAME, QEME_GAME, PEME_GAME, LEME_GAME, TO_RETURN = "", "", "", "", "%s%s%s%s" if KONFIGURASI.LIST_MENU.HOSTER.REME then REME_GAME = "`5REME `w: `5"..REME_COUNT(tonumber(N)).." " else REME_GAME = "" end if KONFIGURASI.LIST_MENU.HOSTER.QEME then QEME_GAME = "`6QEME `w: `6"..QEME_COUNT(tonumber(N)).." " else QEME_GAME = "" end if KONFIGURASI.LIST_MENU.HOSTER.PEME then PEME_GAME = "`1PEME `w: `1"..PEME_COUNT(tonumber(N)).." " else PEME_GAME = "" end if KONFIGURASI.LIST_MENU.HOSTER.LEME then LEME_GAME = "`rLEME `w: `r"..LEME_COUNT(tonumber(N)).." " else LEME_GAME = "" end return TO_RETURN:format(REME_GAME, QEME_GAME, PEME_GAME, LEME_GAME) end

function DIALOG_SPIN_LOG() SHOW_UID_STRING, SHOW_WORLD_STRING, SHOW_TIME_STRING, SHOW_REME_STRING, SHOW_QEME_STRING, SL = "", "", "", "", "", {}  for _, T in pairs(KONFIGURASI.TABLE.SPIN_LOG) do if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_WORLD then SHOW_WORLD_STRING = T.WORLD else SHOW_WORLD_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_TIME then SHOW_TIME_STRING = T.TIME else SHOW_TIME_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_UID then SHOW_UID_STRING = T.UID else SHOW_UID_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_REME then SHOW_REME_STRING = T.REME else SHOW_REME_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_QEME then SHOW_QEME_STRING = T.QEME else SHOW_QEME_STRING = "" end table.insert(SL, T.SPIN:format(SHOW_WORLD_STRING, SHOW_TIME_STRING, SHOW_UID_STRING, SHOW_REME_STRING, SHOW_QEME_STRING)) end SendVariantList({[0] = "OnDialogRequest", [1] = tostring("set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Spin Log|left|1436|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|CLEAR_SPIN_LOG|"..CUSTOM_TEXT.LIST_MENU.HOSTER.BUTTON.CLEAR.."|staticBlueFrame|4940|\nadd_button_with_icon|FILTER_BY_REAL_SPIN|"..CUSTOM_TEXT.LIST_MENU.HOSTER.BUTTON.REAL.."|staticBlueFrame|4938|\nadd_button_with_icon|FILTER_BY_FAKE_SPIN|"..CUSTOM_TEXT.LIST_MENU.HOSTER.BUTTON.FAKE.."|staticBlueFrame|4936|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|SHOW_UID_ON_SPIN|"..CUSTOM_TEXT.LIST_MENU.HOSTER.BUTTON.SHOW_UID.."|"..FRAME(KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_UID).."|10794|\nadd_button_with_icon|SHOW_WORLD_ON_SPIN|"..CUSTOM_TEXT.LIST_MENU.HOSTER.BUTTON.SHOW_WORLD.."|"..FRAME(KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_WORLD).."|3802|\nadd_button_with_icon|SHOW_TIME_ON_SPIN|"..CUSTOM_TEXT.LIST_MENU.HOSTER.BUTTON.SHOW_TIME.."|"..FRAME(KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_TIME).."|1482|\nadd_button_with_icon|SHOW_REME_ON_SPIN|"..CUSTOM_TEXT.LIST_MENU.HOSTER.BUTTON.SHOW_REME.."|"..FRAME(KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_REME).."|2836|\nadd_button_with_icon|SHOW_QEME_ON_SPIN|"..CUSTOM_TEXT.LIST_MENU.HOSTER.BUTTON.SHOW_QEME.."|"..FRAME(KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_QEME).."|2838|\nadd_button_with_icon||END_LIST||0||\nadd_smalltext|Click the Roulette Wheel icon to filter the spin by user or player|\n"..table.concat(SL).."\nadd_spacer|small|\nadd_quick_exit|\nadd_button|HOSTER_MENU|Back|noflags|0|0|\nend_dialog|SPIN_LOG|||")}) end
function FILTER_SPIN_BY_USER(I) SL = {} for _, T in pairs(KONFIGURASI.TABLE.SPIN_LOG) do if T.USER_ID == I then if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_WORLD then SHOW_WORLD_STRING = T.WORLD else SHOW_WORLD_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_TIME then SHOW_TIME_STRING = T.TIME else SHOW_TIME_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_UID then SHOW_UID_STRING = T.UID else SHOW_UID_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_REME then SHOW_REME_STRING = T.REME else SHOW_REME_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_QEME then SHOW_QEME_STRING = T.QEME else SHOW_QEME_STRING = "" end table.insert(SL, T.SPIN:format(SHOW_WORLD_STRING, SHOW_TIME_STRING, SHOW_UID_STRING, SHOW_REME_STRING, SHOW_QEME_STRING)) end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|User Spin|left|1400|\nadd_spacer|small|\n"..table.concat(SL).."\nadd_spacer|small|\nadd_button|SPIN_LOG|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_SPIN_BY_USER|||"}) end
function FILTER_SPIN_BY_STATUS(S) local ICON if S == "REAL" then ICON = "4938" elseif S == "FAKE" then ICON = "4936" end SL = {} for _, T in pairs(KONFIGURASI.TABLE.SPIN_LOG) do if T.STATUS == S then if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_WORLD then SHOW_WORLD_STRING = T.WORLD else SHOW_WORLD_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_TIME then SHOW_TIME_STRING = T.TIME else SHOW_TIME_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_REME then SHOW_REME_STRING = T.REME else SHOW_REME_STRING = "" end if KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_QEME then SHOW_QEME_STRING = T.QEME else SHOW_QEME_STRING = "" end table.insert(SL, T.SPIN:format(SHOW_WORLD_STRING, SHOW_TIME_STRING, SHOW_UID_STRING, SHOW_REME_STRING, SHOW_QEME_STRING)) end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CAPITALIZE(S).." Spin|left|"..ICON.."|\nadd_spacer|small|\n"..table.concat(SL).."\nadd_spacer|small|\nadd_button|SPIN_LOG|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_SPIN_BY_STATUS|||"}) end

function CUSTOM_DROP() tonumber(DROP_AMOUNT) if DROP_AMOUNT == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif DROP_AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true end TABLE_FORMAT = {1000000, 10000, 100, 1} BLACK, BGL, DL, WL = 0, 0, 0, 0 RESULT = GET_DATA(DROP_AMOUNT) RES = SHOW_DATA(DROP_AMOUNT) for D = 1, 4 do while DROP_AMOUNT >= TABLE_FORMAT[D] do if TABLE_FORMAT[D] == TABLE_FORMAT[1] then BLACK = BLACK + 1 DROP_AMOUNT = DROP_AMOUNT - 1000000 elseif TABLE_FORMAT[D] == TABLE_FORMAT[2] then BGL = BGL + 1 DROP_AMOUNT = DROP_AMOUNT - 10000 elseif TABLE_FORMAT[D] == TABLE_FORMAT[3] then DL = DL + 1 DROP_AMOUNT = DROP_AMOUNT - 100 elseif TABLE_FORMAT[D] == TABLE_FORMAT[4] then WL = WL + 1 DROP_AMOUNT = DROP_AMOUNT - 1 end end end ITEM_ID = {11550, 7188, 1796, 242} ITEM_AMOUNT = {BLACK, BGL, DL, WL}

-- CONSOLE(BLACK.." "..BGL.." "..DL.." "..WL)

-- [[ Shatter ]] --
if GET_AMOUNT(11550) < BLACK then CREATE_BLACK() Sleep(80) end 
if GET_AMOUNT(7188) < BGL then SHATTER(242) Sleep(80) BREAK_BLACK() Sleep(80) SHATTER(242) Sleep(80) BREAK_BLACK() Sleep(80) end 
if GET_AMOUNT(1796) < DL then SHATTER(7188) Sleep(80) SHATTER(242) Sleep(80) SHATTER(7188) Sleep(80) SHATTER(242) Sleep(80) end 
if GET_AMOUNT(242) < WL then SHATTER(7188) Sleep(80) SHATTER(1796) Sleep(80) SHATTER(7188) Sleep(80) SHATTER(1796) Sleep(80) end

-- [[ Dropping ]] --
if KONFIGURASI.UI.LANGUAGE == "EN" then DROP_BLACK_TEXT, DROP_BGL_TEXT, DROP_DL_TEXT, DROP_WL_TEXT = "Dropped "..BLACK.." `bBlack Gem Lock", "Dropped `w" ..BGL.. " `eBlue Gem Lock", "Dropped `w" ..DL.. " `1Diamond Lock", "Dropped `w" ..WL.. " `9World Lock" elseif KONFIGURASI.UI.LANGUAGE == "ID" then DROP_BLACK_TEXT, DROP_BGL_TEXT, DROP_DL_TEXT, DROP_WL_TEXT = "Menjatuhkan "..BLACK.." `bBlack Gem Lock", "Menjatuhkan `w" ..BGL.. " `eBlue Gem Lock", "Menjatuhkan `w" ..DL.. " `1Diamond Lock", "Menjatuhkan `w" ..WL.. " `9World Lock" end

if BLACK > 0 then DROP(ITEM_ID[1], ITEM_AMOUNT[1]) CONSOLE(DROP_BLACK_TEXT) if KONFIGURASI.FILE_LOGS.DROP then DROP_LOG(11550, BLACK, "at "..GetWorld().name.." "..os.date("%H:%M on %d/%m")) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..BLACK.." Black Gem Lock `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|11550|11550|\n", DROP_ID = 11550}) Sleep(100) end end
if BGL > 0 then 
if GET_AMOUNT(7188) >= BGL then DROP(ITEM_ID[2], ITEM_AMOUNT[2]) else DROP(ITEM_ID[3], ITEM_AMOUNT[2]*100) end CONSOLE(DROP_BGL_TEXT) if KONFIGURASI.FILE_LOGS.DROP then DROP_LOG(7188, BGL, "at "..GetWorld().name.." "..os.date("%H:%M on %d/%m")) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..BGL.." Blue Gem Lock `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|7188|7188|\n", DROP_ID = 7188}) Sleep(100) end
end
if DL > 0 then DROP(ITEM_ID[3], ITEM_AMOUNT[3]) CONSOLE(DROP_DL_TEXT) if KONFIGURASI.FILE_LOGS.DROP then DROP_LOG(1796, DL, "at "..GetWorld().name.." "..os.date("%H:%M on %d/%m")) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..DL.." Diamond Lock `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|1796|1796|\n", DROP_ID = 1796}) Sleep(100) end end
if WL > 0 then DROP(ITEM_ID[4], ITEM_AMOUNT[4]) CONSOLE(DROP_WL_TEXT) if KONFIGURASI.FILE_LOGS.DROP then DROP_LOG(242, WL, "at "..GetWorld().name.." "..os.date("%H:%M on %d/%m")) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..WL.." World Lock `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|242|242|\n", DROP_ID = 242}) Sleep(100) end end 

-- [[ Showing Dropped ]] --
if not KONFIGURASI.DROP.DONT_SHOW then if KONFIGURASI.UI.LANGUAGE == "EN" then if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..RESULT) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..RESULT) end elseif KONFIGURASI.UI.LANGUAGE == "ID" then if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wMenjatuhkan "..RESULT) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wMenjatuhkan "..RESULT) end end else KONFIGURASI.DROP.DONT_SHOW = false return true end

end

function CHECKING_LANGUAGE(BAHASA) 
if BAHASA == "EN" then 

CUSTOM_TEXT = {
	MENU = {
		INFO = "\nadd_spacer|small|\nadd_smalltext|Additional information :|\nadd_smalltext|`5Purple frame `"..KONFIGURASI.UI.PRIMARY..": Feature activated|\nadd_smalltext|`wGrey frame `"..KONFIGURASI.UI.PRIMARY..": Feature is currently inactive|\nadd_spacer|small|",
		A = "Shortcut to this menu",
		B = "Back",
		C = "Close",
		D = "Update",
		E = "Nevermind",
		F = "Save",
		G = "Submit",
		BACK = {
			A = "                      Back                      "
		}
		
	},
	START = {
		A = "Checking userid to make sure you have access",
		B = "Player authentication `2successful`o!",
		C = "Your balance :",
		D = "Type `5/menu `oto show feature, or click `5Social `obutton",
		E = "Starries Helper by `5@starries.real"
	},
	BUBBLE = {
		WRENCH = {
			PULL_BUBBLE = "`w(peace) Gas Sir",
		},
		BTK = {
			COLLECT_BET = "`^Go Break (punch)",
			DROP_WINNER = "`^Come on, more sir (oops)"
		}
	},
	ALERT = {
		C = "Collecting in Range",
		OOPS = "`w[`4OOPS`w] ",
		NEXT_UPDATE = "This feature aren't available right now! please wait for next update (halo)",
		AMOUNT_NIL = "`w[`4OOPS`w] `oYou must enter a valid number",
		AMOUNT_NOL = "`w[`4OOPS`w] `oWhat do you want to do with the number 0?",
		AMOUNT_LESS = "`w[`4OOPS`w] `oYou don't have enough items to drop according to that amount!"
	},
	CODE = {
		BTK = "", --BTK = "`w[`"..KONFIGURASI.UI.SECONDARY.."BTK`w] ",
		ABILITY = "", --ABILITY = "`w[`"..KONFIGURASI.UI.SECONDARY.."ABILITY`w] ",
		CONSUME = "", --CONSUME = "`w[`"..KONFIGURASI.UI.SECONDARY.."CONSUME`w] ",
		DONATION = "", --DONATION = "`w[`"..KONFIGURASI.UI.SECONDARY.."DONATION`w] ",
		TELEPHONE = "", --TELEPHONE = "`w[`"..KONFIGURASI.UI.SECONDARY.."TELEPHONE`w] ",
		WRENCH = "", --WRENCH = "`w[`"..KONFIGURASI.UI.SECONDARY.."WRENCH`w] ",
		VENDING = "", --VENDING = "`w[`"..KONFIGURASI.UI.SECONDARY.."VENDING`w] ",
		AUTO_JOIN = "" --AUTO_JOIN = "`w[`"..KONFIGURASI.UI.SECONDARY.."AUTO JOIN`w] "
	},
	BROADCAST = {
		A = "Broadcast will be sent in countdown",
		B = "Broadcasting completed! total broadcast",
		C = "Thanks",
		D = "Broadcasting",
		E = "out of",
		F = "total broadcast",
		G = "remaining",
		H = "to",
		I = "broadcast predictions",
		J = "Remaining time",
		K = "Time spent",
		L = "hours",
		M = "minutes",
		N = "seconds"
	},
	MAIN_MENU = {
		TEXT = {
			TITLE = "CreativePS Helper",
			DESC_1 = "This Helper was made by",
			DESC_2 = "Thanks for using this script !",
			HI = "Hi",
			WORLD = "You're currently at",
			STAND = "You're standing at",
			DATETIME = "It is currently",
			TIME = os.date("%H:%M `"..KONFIGURASI.UI.PRIMARY.."on `"..KONFIGURASI.UI.SECONDARY.."%B %d, %Y"),
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
			GROWSCAN = "Growscan",
			JASA = "Services Menu",
			DONATION = "Donation",
			SUPPORT = "Support",
			ACTIVITY = "Activity Log",
			PROFILE = "Your Profile"
		},
	},
	BTK_MENU = {
		TITLE = "BTK Helper x Starries ",
		BUTTON = {
			TB = "Take Bet",
			SCAN = "Scan Gems",
			TG = "Take Gems",
			PC = "Put Chand",
			WIN1 = "Player 1 Wins",
			WIN2 = "Player 2 Wins",
			BBET = "Back Bet",
			GIVETAX = "Pay Taxes",
			POSBET = "Bet Position",
			POSCHAND = "Chand Position",
			POSH = "Host Position",
			POSTAX = "Tax Position",
			SETTING_TAX = "Setting Tax",
			PUTMODE = "Put Mode",
			AUTOPOS = "Auto Position",
			CONFIGBTK = "Configuration",
			CLOSE = "               Close                "
		},
		AUTOPOS = {
			H = "Horizontal",
			V = "Vertical",
			H1 = "Horizontal V1",
			H2 = "Horizontal V2",
			H3 = "Horizontal V3",
			H4 = "Horizontal V4",
			V1 = "Vertical V1",
			V2 = "Vertical V2",
			V3 = "Vertical V3",
			V4 = "Vertical V4"
		},
		POS_CHAND_MODE = {
			TITLE = "Select",
			BUTTON = {
				HORIZONTAL = "Horizontal",
				VERTICAL = "Vertical",
				BACK = "    Back    "
			}
		},
	},
	COMMAND_LIST = {
		TEXT = {
			TITLE = "Command List",
			DESCRIPTION = "List commands to simplify and easier your playing experience",
			SHORTCUT = "Shortcut to this menu"
		},
		BUTTON = {
			BTK = "BTK Command",
			CSN = "CSN Command",
			UTILITY = "Utility Command",
			DROP = "Drop Command",
			ABILITY = "Ability Shortcut",
			MENU = "Menu Shortcut",
			SB = "SB Command",
			FUN = "Fun Command",
			BACK = "Back"
		},
		BTK = {
			TEXT = {
				SHORTCUT = "Shortcut to this menu : `"..KONFIGURASI.UI.SECONDARY.."/cmd btk"
			},
			BUTTON = {
				BACK = "Back"
			},
			LIST_1 = {
				TITLE = "Menu Shortcut",
				TB = "Take a bet or lock from the player",
				SCAN = "Scan the gems without collecting",
				TG = "Collecting gems (have options auto drop winner)",
				PC = "Put or placing chand to position chand",
				WIN1 = "Give the bet to player 1 as a winner",
				WIN2 = "Give the bet to player 2 as a winner",
				BBET = "Back bet or lock to both player when they canceling",
				GIVETAX = "Give 50% percentage of all lock to donation box",
				POSBET = "Setting position display box or bet",
				POSCHAND = "Setting position of the chandelier",
				POSH = "Setting position hoster for back position",
				POSTAX = "Setting position of donation box for paid tax",
				PUTMODE = "Open put chandelier mode menu",
				AUTOPOS = "Open auto pos menu to automatically set position",
				CONFIGBTK = "Open configuration menu to show optional feature"
			},
			LIST_2 = {
				TITLE = "Shortcut Setting Position",
				FPOS = "Fast setting position bet, chandelier and hoster",
				POSCH = "Shortcut setting position chandelier for horizontal",
				POSCV = "Shortcut setting position chandelier for vertical",
				POSHORIZONTAL = "Open auto position menu for horizontal",
				H1 = "Shortcut setting position horizontal v1",
				H2 = "Shortcut setting position horizontal v2",
				H3 = "Shortcut setting position horizontal v3",
				H4 = "Shortcut setting position horizontal v4",
				POSVERTICAL = "Open auto position menu for vertical",
				V1 = "Shortcut setting position vertical v1",
				V2 = "Shortcut setting position vertical v2",
				V3 = "Shortcut setting position vertical v3",
				V4 = "Shortcut setting position vertical v4"
			}
		},
		CSN = {
			TEXT = {

			},
			BUTTON = {

			},
			LIST_1 = {
				TITLE = ""
			}
		}
	},
	ABILITY = {
		TEXT = {
			A = "Your Ability",
			B = "Those ability very useful to easier your job or work",
			C = "`5Purple Frame `"..KONFIGURASI.UI.PRIMARY..": Feature activated",
			D = "`wGrey Frame `"..KONFIGURASI.UI.PRIMARY..": Feature is currently inactive",
			E = "Additional information :"
		},
		BUTTON = {
			BLOCK_SDB = "Block SDB",
			ANTI_POCKET = "Anti Pocket",
			PULL_GAS = "Auto Pull Gas",
			SHOW_GEMS = "Show Gems",
			EXTRACTOR = "Extractor",
			FAST_DROP = "Fast Drop",
			FAST_TRASH = "Fast Trash",
			MODFLY = "Modfly",
			NO_PICKUP = "No Pickup",
			NO_LAG = "No Lag",
			FAST_DBLOCK = "Fast Dblock",
			BLOCK_ADVENTURE = "Block Adventure",
			AUTO_COLLECT = "Auto Collect",
			BLOCK_EVENT = "Block Event",
			ANTI_BUNNIES = "Anti Bunnies",
			BACK = "                      Back                      ",
			CLOSE = "       Close      ",
			SAVE = "        Save        " 
		}
	},
	LIST_MENU = {
		TEXT = {
			DESCRIPTION = "Several menus that can make your work easier"
		},
		BUTTON = {
			CONSUME = "Consume Menu",
			DONATION = "Donation Menu",
			TELEPHONE = "Telephone Menu",
			WRENCH = "Wrench Menu",
			VENDING = "Vending Menu",
			SKIN_MENU = "Skin Menu",
			MAGPLANT_MENU = "Magplant Menu",
			AUTO_JOIN = "Auto Join",
			GIVE_ACCESS = "Give Access",
			WORLD_FEATURE = "World Feature",
			WEATHER_LIST = "Weather List",
			BUBBLE = "Bubble Menu",
			OVERLAY = "Overlay Menu",
			UI = "UI Menu",
			STORE = "Store Menu",
			HUB = "Activity Hub",
			HOSTER = "Hoster Menu",
			SURGERY = "Surgery Menu",
			PACK_MENU = "Pack Menu",
			BRUTEFORCE_MENU = "Brutefore Menu",
			PRINCESS_MENU = "Princess Menu",
			BACK = "                      Back                      ",
			CLOSE = "       Close      ",
			SAVE = "        Save        " 
		},
		CONSUME = {
			TEXT = {
				TITLE = "Consume Menu",
				TOGGLE = "Auto Consume",
				STATUS = "",
				BACK = "                     Back                      ",
				CLOSE = "       Close       ",
				SAVE = "       Save       "
			},
		},
		DONATION = {
			TEXT = {
				TITLE = "Donation Menu",
				TOGGLE = "Fast Donation Box",
				CURRENT_ITEM = "Item :",
				SELECT_ITEM = "Choose an item to put on donation!``",
				CHANGE_AMOUNT = "Change Donate Amount :",
				BACK = "                   Back                  ",
				CLOSE = "      Close     ",
				SAVE = "     Save      "
			},
			BUTTON = {
				SELECT_ITEM = "     Select Donation Item     ",
				GIFT = "Give Donation",
				RETRIEVE = "Retrieve Gift",
				TROLL = "Troll Donation"
			}
		},
		GIVE_ACCESS = {
			TEXT = {
				TITLE = "Give Access",
				DESCRIPTION = "This Give Access feature can be used to give access to other people without having to look for a lock and no need for a wrench. You only need to select the player who will be given access"
			}
		},
		WEATHER_LIST = {
			BACK = "                            Back                            "
		},
		HOSTER = {
			BUTTON = {
				CLEAR = "Clear Log",
				REAL = "Real Spin",
				FAKE = "Fake Spin",
				SHOW_UID = "Show UID",
				SHOW_WORLD = "Show World",
				SHOW_TIME = "Show Time",
				SHOW_REME = "Show Reme",
				SHOW_QEME = "Show Qeme"
			}
		}
	},
	SERVICE_MENU = {
		TEXT = {
			TITLE = "Service Menu"
		},
		BUTTON = {
			SUPER_BROADCAST = "Super Broadcast",
			ITEM_FINDER = "Item Finder",
			ITEM_MOVER = "Item Mover",
			CLEAR_FLOAT = "Clear Float",
			CLEAR_WATER = "Clear Water",
			SETUP_PLATFORM = "Setup Platform",
			WORLD_FINDER = "World Finder",
			CLEAR_WORLD = "Clear World",
			BACK = "                            Back                            "
		}
	},
	SETTING = {
		A = "Load All",
		B = "BTK Helper",
		C = "Casino Helper",
		D = "Service Helper",
		E = "Cooking Helper",
		F = "Copy World Helper",
		G = "Helper Setting"
	},
	INFORMATION = {
		TITLE = "Useful Information",
		DESCRIPTION = "Read additional information, new update and the upcoming feature",
		SPACING = "----------------------------------------------------------------------------------",
		CREATOR = "Creator : `"..KONFIGURASI.UI.SECONDARY.."Starries",
		CONTRIBUTOR = "Contributor : `"..KONFIGURASI.UI.SECONDARY.."-",
		BOTHAX = "Thanks to `bbothaxyt `"..KONFIGURASI.UI.PRIMARY.."who provide this app",
		LIST_1 = {
			TITLE = "Change Logs :",
			INFO_1 = "`2NEW`"..KONFIGURASI.UI.PRIMARY..": Added bruteforce menu",
			INFO_2 = "`2NEW`"..KONFIGURASI.UI.PRIMARY..": Added command /show <command>"
		},
		LIST_2 = {
			TITLE = "Incoming :",
			INFO_1 = "`8SOON`"..KONFIGURASI.UI.PRIMARY..": -",
			INFO_2 = "`8SOON`"..KONFIGURASI.UI.PRIMARY..": -"
		}
	},
	GROWSCAN = {
		TITLE = "World Stats",
		DESCRIPTION = "This amazing block can show the stats for the whole world!",

	}
}

elseif BAHASA == "ID" then 

CUSTOM_TEXT = {
	MENU = {
		A = "Pintasan ke menu ini",
		B = "Kembali",
		C = "Tutup",
		D = "Perbarui",
		E = "Lupakan",
		F = "Simpan",
		G = "Kirim",
		BACK = {
			A = "                   Kembali                   "
		}
	},
	START = {
		A = "Mengecek userid untuk memastikan kamu memiliki akses!",
		B = "Autentikasi pemain `2berhasil`o!",
		C = "Kamu memiliki :",
		D = "Ketik `5/menu `ountuk menampilkan fitur, atau klik tombol `5Sosial",
		E = "Starries Helper oleh `5@starries.real"
	},
	ALERT = {
		A = "Jumlah drop harus berupa angka",
		B = "Kamu tidak bisa drop dengan amount 0 bodoh!",
		C = "Mengumpulkan dalam Jangkauan"
	},
	BROADCAST = {
		A = "Siaran akan dikirim dalam hitungan mundur",
		B = "Penyiaran selesai! jumlah siaran",
		C = "Terimakasih",
		D = "Penyiaran",
		E = "dari",
		F = "jumlah siaran",
		G = "tersisa",
		H = "ke",
		I = "prediksi siaran",
		J = "Waktu tersisa",
		K = "Waktu dihabiskan",
		L = "jam",
		M = "menit",
		N = "detik"
	},
	MAIN_MENU = {
		TEXT = {
			A = "Helper ini dibuat oleh",
			B = "Makasih telah memakai script ini!",
			C = "Hai",
			D = "Kamu saat ini berada di",
			E = "Kamu berdiri di",
			F = "Saat ini pukul",
			G = os.date("%H:%M `"..KONFIGURASI.UI.PRIMARY.."pada `"..KONFIGURASI.UI.SECONDARY.."%d %B %Y"),
			H = "------------------------------------------------------------------------",
			I = "Fitur-fitur",
			J = "Lupakan."
		},
		BUTTON = {
			SOCIAL = "Portal Sosial",
			COMMAND = "Daftar Command",
			ABILITY = "Kemampuan",
			HOSTER = "Menu Hoster",
			SPAM = "Editor Spam",
			INFO = "Informasi",
			GROWSCAN = "Growscan",
			JASA = "Jasa",
			DONATION = "Donasi",
			SUPPORT = "Bantuan",
			ACTIVITY = "Log Aktivitas",
			UI = "Menu UI",
			WORLD_FINDER = "Pencari World",
			PROFILE = "Profilemu",
			BUBBLE = "Menu Bubble",
			STORE = "Menu Store",
			HUB = "Hub Aktivitas"
		},
	},
	COMMAND_LIST = {
		TEXT = {
			TITLE = "Daftar Command",
			DESCRIPTION = "Daftar command untuk memudahkan pengalaman bermain",
			SHORTCUT = "Pintasan ke menu ini"
		},
		BUTTON = {
			BTK = "Command BTK",
			CSN = "Command CSN",
			UTILITY = "Command Utility",
			DROP = "Command Drop",
			ABILITY = "Pintasan Ability",
			MENU = "Pintasan Menu",
			SB = "Command SB",
			FUN = "Command Seru",
			BACK = "Kembali"
		},
		BTK = {
			TEXT = {
				SHORTCUT = "Pintasan ke menu ini : `"..KONFIGURASI.UI.SECONDARY.."/cmd btk"
			},
			BUTTON = {
				BACK = "Kembali"
			},
			LIST_1 = {
				TITLE = "Pintasan Menu",
				TB = "Ambil bet atau lock dari pemain",
				SCAN = "Pindai gems tanpa mengambilnya",
				TG = "Mengambil gems (memiliki opsi drop pemenang otomatis)",
				PC = "Meletakkan atau menempatkan chand pada posisi chand",
				WIN1 = "Berikan bet kepada pemain 1 sebagai pemenang",
				WIN2 = "Berikan bet kepada pemain 2 sebagai pemenang",
				BBET = "Kembalikan bet atau kunci ke kedua pemain saat mereka batal",
				GIVETAX = "Berikan persentase 50% dari seluruh lock ke donation box",
				POSBET = "Mengatur posisi display box atau bet",
				POSCHAND = "Mengatur posisi untuk chandelier",
				POSH = "Mengatur posisi kembali untuk hoster",
				POSTAX = "Menetapkan posisi donation untuk bayar tax",
				PUTMODE = "Buka menu mode put chandelier",
				AUTOPOS = "Buka menu pos otomatis untuk mengatur posisi secara otomatis",
				CONFIGBTK = "Buka menu konfigurasi untuk menampilkan fitur opsional"
				},
			LIST_2 = {
				TITLE = "Pintasan Mengatur Posisi",
				FPOS = "Mengatur posisi secara cepat, bet, chandelier dan hoster",
				POSCH = "Pintasan pengaturan posisi chandelier untuk horizontal",
				POSCV = "Pintasan pengaturan posisi chandelier untuk vertikal",
				POSHORIZONTAL = "Buka menu posisi otomatis untuk horizontal",
				H1 = "Pintasan mengatur posisi horizontal v1",
				H2 = "Pintasan mengatur posisi horizontal v2",
				H3 = "Pintasan mengatur posisi horizontal v3",
				H4 = "Pintasan mengatur posisi horizontal v4",
				POSVERTICAL = "Buka menu posisi otomatis untuk vertikal",
				V1 = "Pintasan mengatur posisi vertical v1",
				V2= "Pintasan mengatur posisi vertical v2",
				V3 = "Pintasan mengatur posisi vertical v3",
				V4 = "Pintasan mengatur posisi vertical v4"
			},
		}
	},
	ABILITY = {
		TEXT = {
			A = "Kemampuanmu",
			B = "Kemampuan dibawah ini untuk memudahkan mu",
			C = "`5Bingkai Ungu `"..KONFIGURASI.UI.PRIMARY..": Fitur telah diaktifkan",
			D = "`wBingkai Abu-abu `"..KONFIGURASI.UI.PRIMARY..": Fitur telah dinonaktifkan",
			E = "Informasi Tambahan :" 
		},
		BUTTON = {
			BLOCK_SDB = "Block SDB",
			ANTI_POCKET = "Anti Api",
			PULL_GAS = "Auto Pull Gas",
			SHOW_GEMS = "Tunjukkan Gems",
			EXTRACTOR = "Extractor",
			CONSUME = "Menu Konsumsi",
			DONATION = "Menu Donasi",
			TELEPHONE = "Menu Telepon",
			WRENCH = "Menu Wrench",
			VENDING = "Menu Vending",
			FAST_DROP = "Fast Drop",
			FAST_TRASH = "Fast Trash",
			MODFLY = "Modfly",
			NO_PICKUP = "No Pickup",
			NO_LAG = "No Lag",
			SKIN_MENU = "Opsi Skin",
			AUTO_JOIN = "Auto Join",
			GIVE_ACCESS = "Beri Akses",
			WORLD_FEATURE = "Fitur World",
			WEATHER_LIST = "Daftar Weather",
			BACK = "                   Kembali                   ",
			CLOSE = "       Tutup      ",
			SAVE = "      Simpan      " 
		},
		CONSUME = {
			A = "Menu Konsumsi",
			B = "Auto Konsumsi",
			C = "                   Kembali                   ",
			D = "       Tutup      ",
			E = "      Simpan      " 
		},
	},
	SETTING = {
		A = "Load Semua",
		B = "BTK Helper",
		C = "Casino Helper",
		D = "Jasa Helper",
		E = "Cooking Helper",
		F = "Copy World Helper",
		G = "Pengaturan Helper"
	}
}
else return false
end
end
-- End of Function --

-- Variable --
KONFIGURASI = {
	FILE_LOGS = {
		DROP = true,
		COLLECT = false,
		TRASH = false,
		ENTER = false,
		EXIT = false,
		WRENCH = false,
		BET = false,
		TRADE = false
	},
	GROWSCAN = {
		SCAN_FLOATS = false,
		SCAN_BLOCKS = false,
		SHOW_WITH_CHAT = false
	},
	CHEAT = {
		AUTO_FARM = false,
		MODE_BFG = false,
		AUTO_SPAM = false,
		AUTO_PULL = false,
		AUTO_PLANT = false,
		ANTI_BOUNCE = false,
		MOD_FLY = false,
		SUPER_SPEED = false,
		GRAVITY = false,
		BE_ALONE = false,
		FAST_DROP = false,
		DONT_DROP_GEMS = false,
		IGNORE_OTHERS_DROP = false,
		IGNORE_OTHERS_COMPLETE = false
	},
	SYSTEM = {
		GUARD = false,
		CREDIT = "`w[`5Starries`w] ",
		LOADALL = true,
		BTKHELPER = true,
		CASINOHELPER = false,
		JASAHELPER = false,
		COOKINGHELPER = false,
		COPYWORLDHELPER = false
	},
	UI = {
		LANGUAGE = "EN",
		PRIMARY = "w",
		SECONDARY = "5",
		NOTE = "6",
		DANGER = "4",
		WARNING = "9",
		SUCCESS = "2"
	},
	BUBBLE = {
		HIDE_BUBBLE = false,
		GEMS_BUBBLE = false,
		BTK_BUBBLE = false,
		COLLECT_BUBBLE = true,
		DROP_BUBBLE = true,
		TRASH_BUBBLE = true,
		BTK_BUBBLE = true,
		DEPOSIT_BUBBLE = false,
		WITHDRAW_BUBBLE = false,
		HIDE_MESSAGE = false,
		CUSTOM_CHAT = {
			COLOR = "^",
			COLOR_MODE = "",
			POSITION = "FRONT",
			EMOJI_MODE = false,
			RANDOM_EMOJI = false,
			EMOJI = "",
			LETTER_MODE = false,
			LETTER = "Starries Helper"
		}
	},
	OVERLAY = {
		SDB_OVERLAY = false,
		DROP_OVERLAY = false,
		COLLECT_OVERLAY = false,
		TRASH_OVERLAY = false,
		DEPOSIT_OVERLAY = false,
		WITHDRAW_OVERLAY = false
	},
	TABLE = {
		ACTIVITY_LOG = {},
		SPIN_LOG = {},
		NO_PICKUP = {}
	},
	ACTIVITY_LOG = {
		SHOW_ALL_COLLECT = false,
		SHOW_ALL_DROP = false,
		SHOW_ALL_TRASH = false
	},
	REME = {
		POS_BET = {
			DISPLAY_1 = {
				POSX = 0,
				POSY = 0
			},
			DISPLAY_2 = {
				POSX = 0,
				POSY = 0
			},
			DISPLAY_3 = {
				POSX = 0,
				POSY = 0
			},
			DISPLAY_4 = {
				POSX = 0,
				POSY = 0
			},
			DISPLAY_5 = {
				POSX = 0,
				POSY = 0
			},
			DISPLAY_6 = {
				POSX = 0,
				POSY = 0
			}
		}
	},
	BTK = {
		WINNER = 0,
		BET = 0,
		HORIZONTAL = false,
		VERTICAL = false,
		HOSTX = 0,
		HOSTY = 0,
		POSX1 = 0,
		POSY1 = 0,
		POSX2 = 0,
		POSY2 = 0,
		POSCHAND = {
			LEFT = {
				X1 = 0,
				X2 = 0,
				X3 = 0,
				Y1 = 0,
				Y2 = 0,
				Y3 = 0 
			},
			RIGHT = {
				X1 = 0,
				X2 = 0,
				X3 = 0,
				Y1 = 0,
				Y2 = 0,
				Y3 = 0 
			}
		},
		TAX = 5,
		PUT_MODE = "CHAND",
		PUT_ID = 5640,
		OPTIONAL = {
			TG_WIN = true,
			AUTO_PAY = false,
			AUTO_SB = false
		}
	},
	ABILITY = {
		BLOCK_SDB = false,
		ANTI_POCKET = false,
		PULL_GAS = false,
		SHOW_GEMS = false,
		GEMS = 0,
		EXTRACTOR = false,
		FAST_DROP = false,
		FAST_TRASH = false,
		FDFT_AMOUNT = 0,
		MODFLY = false,
		NO_PICKUP = false,
		NO_LAG = false,
		FAST_DBLOCK = false,
		BLOCK_ADVENTURE = false,
		BLOCK_EVENT = false,
		AUTO_COLLECT = false,
		ANTI_BUNNIES = false
	},
	LIST_MENU = {
		HOSTER = {
			REME = false,
			QEME = false,
			PEME = false,
			LEME = false,
			FAST_WHEEL = true,
			AUTO_COMPRESS = false,
			PLAYER_MENU = {
				LOCAL_SPIN = "You haven't spun the roulette wheel yet!",
				PLAYER_1 = {
					SPIN = "You haven't selected a player yet",
					NAME = "",
					UID = 0
				},
				PLAYER_2 = {
					SPIN = "You haven't selected a player yet",
					NAME = "",
					UID = 0
				}
			},
			SPIN_LOG = {
				SHOW_WORLD = false,
				SHOW_TIME = false,
				SHOW_REME = false,
				SHOW_QEME = false
			}
		},
		DONATION = {
			ITEM = 0,
			AMOUNT = 0,
			TOGGLE = false,
			MODE = ""
		},
		TELEPHONE = {
			TOGGLE = false,
			MODE = ""
		},
		PRINCESS = {
			TOGGLE = false,
			MODE = "",
			ITEM = ""
		},
		WRENCH = {
			TOGGLE = false,
			MODE = ""
		},
		VENDING = {
			TOGGLE = false,
			MODE = "",
			AMOUNT = 0,
			TOGGLE = false,
			ITEM = 0,
			DELAY = 500,
			AUTO_MODE = "",
			AUTO_TOGGLE = false,
			POS_X = 0,
			POS_Y = 0
		},
		MAGPLANT = {
			TOGGLE = true,
			MODE = "",
			ITEM = 0,
			DELAY = 500,
			AUTO_MODE = "",
			AUTO_TOGGLE = false,
			POS_X = 0,
			POS_Y = 0
		},
		SURGERY = {
			TOGGLE = false,
			AUTO_WRENCH = false,
			TOTAL_SURG = 0,
			TOTAL_OPERATION = 0,
			TARGET_SURG = 0,
			AUTO_RECO = false,
			AUTO_DROP_KIT = false,
			BUY_KIT = false,
			DROP_KIT = false,
			WORLD = "",
			POSX = 0,
			POSY = 0,
			BACK_POSITION = false
		},
		SKIN_MENU = {
			BLINK = false,
			RED = 120,
			GREEN = 110,
			BLUE = 100,
			TRANS = 0
		},
		AUTO_JOIN = {
			TOGGLE = false,
			MODE = "",
			MESSAGE = "Text goes here!"
		},
		WORLD_FEATURE = {
			MESSAGE = "Starries Helper is the best helper in Creative PS!"
		},
		PACK_MENU = {
			TOGGLE = false,
			MODE = "",
			AMOUNT = 0,
			AUTO_DROP = false,
			LOOP = false
		},
		BRUTEFORCE_MENU = {
			TOGGLE = false,
			STARTING_NUMBER = 900,
			FINAL_NUMBER = 1000
		}
	},
	DISCORD = {
		OFFICIAL_WEBHOOK = "https://discord.com/api/webhooks/1199279127056879676/bODDhKfmNAFnQKM27aJQfcuME18mwUaOp_DXl4KsM55B9iFzfodgT7rs8fzYoM9ipuAm?thread_id=%s",
		WEBHOOK_SUPPORT = "https://discord.com/api/webhooks/1204727344988819456/ZbfM6rc50eCMdOBuqsvH6PwPdfMpssmqpcC1G6hhUIahvJHyD3j0_HRV-tXa31imuodu?thread_id=1204728891697008710",
		WEBHOOK_WORLD_FINDER = "https://discord.com/api/webhooks/1205768780249038868/jwZLHvmOqN82EYWZ474M58w6NohighTwuSTvz6b3WBKLaF-RvBmTAoFJDtIHceuag56H?thread_id=1205768455488413697",
		WEBHOOK_DONATE = "https://discord.com/api/webhooks/1226032722628051005/758AMoqwVCbU0DxRsyEUcy6vsUdsWgZcyx5WJpGhp4Fn2mzXpg4g7tXjL0BPVAvTfM9r?thread_id=1226032494235746304",
		WEBHOOK_DEPOSIT = "https://discord.com/api/webhooks/1264569454767902850/mfdKvWaKr9sFlBo6VW6oTEOS7z0eE6AS1bcQkKlmL5QqnP7WZAirpeytxZSQtdZDVk_i",
		EMBED_VERIFIED = [[{ "content": "", "embeds": [{ "color": 7819519, "fields": [{ "name": "General", "value": "<:Growtopian:1178367402707275941> Username : **%s**\n<:G4G:1106191347406356540> UID : **%s**\n<:Globe:1196122635457810542> Current World : **%s**\n<:PurpleGem:1196121518288146512> Current Gems : **%s**"},{ "name": "Status","value": "<:SidewayArrow:1106202175979393094> %s"},{ "name": "Balance","value": "<:Growscan:1178367444654493767> **]]..GET_AMOUNT(242)..[[** World Lock, **]]..GET_AMOUNT(1796)..[[** Diamond Lock, **]]..GET_AMOUNT(7188)..[[** Blue Gem Lock, **]]..GET_AMOUNT(11550)..[[** Black Gem Lock"}],"footer": { "text": "Running on Bothex | Starries Helper", "icon_url": "https://cdn.growtopia.tech/items/10568.png"}}] }]],
		EMBED_UNVERIFIED = [[{ "content": "", "embeds": [{ "color": 16723712, "fields": [{ "name": "General", "value": "<:Growtopian:1178367402707275941> Username : **%s**\n<:G4G:1106191347406356540> UID : **%s**\n<:Globe:1196122635457810542> Current World : **%s**\n<:PurpleGem:1196121518288146512> Current Gems : **%s**"},{ "name": "Status","value": "<:SidewayArrow:1106202175979393094> %s"},{ "name": "Balance","value": "<:Growscan:1178367444654493767> **]]..GET_AMOUNT(242)..[[** World Lock, **]]..GET_AMOUNT(1796)..[[** Diamond Lock, **]]..GET_AMOUNT(7188)..[[** Blue Gem Lock, **]]..GET_AMOUNT(11550)..[[** Black Gem Lock"}],"footer": { "text": "Running on Bothex | Starries Helper", "icon_url": "https://cdn.growtopia.tech/items/10568.png"}}] }]],
		EMBED_SUPPORT = [[{ "content": "<@872423690120331304>", "embeds": [{ "color": 98905, "image": { "url": "https://media.discordapp.net/attachments/1100253172804628531/1183053386879348777/Banner.gif" }, "fields": [{ "name": "Status","value": "<:Megaphone:1196122005167153292> There is new support message from **]]..FORMAT_NAME(GetLocal().name)..[[**!"}, { "name": "Message Content","value": "<:SidewayArrow:1106202175979393094> %s"}],"footer": { "text": "Sent from Bothex | Starries Helper", "icon_url": "https://cdn.growtopia.tech/items/10568.png"}}] }]],
		EMBED_WORLD_FINDER = [[{"content": "","embeds": [{"color": 7819519,"description": "**%s** Captured new  **%s** letters world! World name : **%s**"}]}]],
		EMBED_DONATE = [[{ "content": "<@872423690120331304>", "embeds": [{ "color": 98905, "fields": [{ "name": "Status","value": "<:Megaphone:1196122005167153292> There is new donation from **]]..FORMAT_NAME(GetLocal().name)..[[**!"}, { "name": "Amount Donation","value": "<:DonationBox:1226036683443535912> %s"}],"footer": { "text": "Sent from Bothex | Starries Helper", "icon_url": "https://cdn.growtopia.tech/items/10568.png"}}] }]],
		EMBED_ACTIVITY = [[{"content": "%s","embeds": [{"color": 7819519,"description": "<:Growtopian:1178367402707275941> %s"}]}]]
	},
	DROP = {
		DONT_SHOW = false
	},
	SERVICE_MENU = {
		BROADCAST = {
			QUEUE = false,
			STARTING = false,
			MODE = "TIMER",
			BACK = false,
			WORLD = "STARRIES",
			COUNTER_MODE = "UP",
			TIMER_QUEUE = 0,
			ALREADY = false,
			LIMIT = 40,
			COUNTER = 0,
			GEMS_USED = 0,
			TEXT = "This broadcast uses the Starries Helper",
			TIMER = 60,
			MENTION = false,
			MENTION_MODE = "ALL",
			WEBHOOK = "https://discord.com/api/webhooks/1204727340542857236/nfMf-i1IJnfIu8Mp6FkJiUao1pFpQ6dKCwW67DOOyn7-j5o-sGN0aZmxZ9yEPGQZBbDl?thread_id=1204727208929923082",
			EMBED = [[{ "content": "%s", "embeds": [{ "color": 7819519, "author": { "name": "%s", "icon_url": "https://cdn.growtopia.tech/items/1400.png" }, "image": { "url": "https://media.discordapp.net/attachments/1100253172804628531/1183053386879348777/Banner.gif" }, "fields": [{ "name": "General", "value": "<:Globe:1196122635457810542> World: **%s**\n<:PurpleGems:1201493452098109451> Gems : **%s** [ Used : **%s** ]\n<:Megaphone:1196122005167153292> Completed Super Broadcast: **%s**\n<:DumbBillboard:1196121119191736343> Timer : %s"},{"name": "Status","value": "<:SidewayArrow:1106202175979393094> %s","inline": false},{ "name": "Broadcast Text","value": "<:Letter:1196122325930750022> %s","inline": false}]}]}]],
			DISCORD_ID = 0,
			CHECKING_COUNTER = false,
			CHECKING_TIME = false,
			BROADCASTED_WORLD = ""
		},
		ITEM_FINDER = {
			TOGGLE = false,
			MODE = "",
			ITEM = 0,
			DELAY = 500,
			AUTO_NEXT = false,
			NEXT_MODE = "RIGHT",
			MAGPLANT = {
				POS_X = 0,
				POS_Y = 0
			},
			VENDING = {
				POS_X = 0,
				POS_Y = 0
			}
		},
		ITEM_MOVER = {
			TOGGLE = false,
			MODE_WORLD = "1",
			ITEM = 962,
			FROM = "FLOAT",
			TO = "FLOAT",
			MODE = "",
			WORLD_1 = "DSXO",
			WORLD_2 = "STARRIES",
			WARP_DELAY = 5000,
			ADDITIONAL_DELAY = 500,
			FLOAT = {
				X_1 = 14,
				X_2 = 10,
				Y_1 = 52,
				Y_2 = 52
			},
			MAGPLANT = {
				X_1 = 0,
				X_2 = 0,
				Y_1 = 0,
				Y_2 = 0
			},
			VENDING = {
				X_1 = 0,
				X_2 = 0,
				Y_1 = 0,
				Y_2 = 0
			},
		},
		CLEAR_FLOAT = {
			TOGGLE = false,
			MODE = "",
			ITEM = {},
			POSITION = {
				X = 0,
				Y = 0
			}
		},
		CLEAR_WATER = {
			TOGGLE = false,
			MODE = ""
		}
	},
	CONSUME = {
		AUTO = false,
		ARROZ = false,
		EGGS = false,
		CLOVER = false,
		SONGPYEON = false,
		BGEMS = false
	},
	AUTO_SPAM = {
		TOGGLE = false,
		TEXT = "Starries Helper is the best helper in Creative PS!",
		DELAY = 5000,
		COLORFUL = false
	},
	WORLD_FINDER = {
		TOGGLE = false,
		READ_ABLE = true,
		TYPE = "NO NUMBER",
		LETTER = "3",
		START_LETTER = "SURG",
		FINAL_LETTER = "",
		WARP_DELAY = 5000,
		LOCK_DELAY = 5000,
		LOCK_ID = 242
	},
	STORE_MENU = {
		ITEM = 0,
		AMOUNT = 0,
		CODE = "",
		SPENT = 0,
		PURCHASE_FROM_STORE = false,
		CHANGE_ITEM_TO_PURCHASE = false
	},
	HUB_MENU = {
		ITEM = 0,
		AMOUNT = 0,
		CODE = "",
		SPENT = 0,
		CHANGE_HUB_ITEM = false,
		PURCHASE_FROM_HUB = false
	},
	OTHERS = {
		BGL_ON_BANK = 0,
		SECURITY = {
			FORMAT = {FORMALIZE, SHOW_UID, VIP_CHAT},
			SHOW_UID = nil
		}
	}
}
-- End of Variable --

if GetLocal().userid == 85923 then
function VARIANT_DEVELOPER(Var)
if Var[0] == "OnTalkBubble" and Var[2]:match("`5[```w(.+) places `5(%d+)`` `2(.+)`` into the Donation Box`5]``") then
if GetWorld().name == "STARRIES" then DEPO_NAME, DEPO_AMOUNT, DEPO_ITEM = Var[2]:match("`w(%w+) places `5(%d+)`` `2(.+)`` into the Donation Box`5]``") 
if DEPO_NAME and DEPO_AMOUNT and DEPO_ITEM then 
if DEPO_ITEM == "Black Gem Lock" or DEPO_ITEM == "Blue Gem Lock" then SEND_WEBHOOK_DEPOSIT = true else SEND_WEBHOOK_DONATION = true end
end
end
end
end
end

FIND_MOONCAKE, DROP_MOONCAKE = false, false

AddHook("OnSendPacket", "PACKET-MOONCAKE", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/mf") then if not FIND_MOONCAKE then FIND_MOONCAKE = true else FIND_MOONCAKE = false end return true end
if COMMAND == ("/md") then if not DROP_MOONCAKE then DROP_MOONCAKE = true else DROP_MOONCAKE = false end return true end
if COMMAND == ("/ds") then DROP(GetItemInfo("Songpyeon").id, GET_AMOUNT(GetItemInfo("Songpyeon").id)) return true end
if COMMAND == ("/pet") then if not GACHA_PET then GACHA_PET = true else GACHA_PET = false end return true end

return false end)

AddHook("OnVariant", "VARIANT-MOONCAKE", function(V)
if FIND_MOONCAKE then
if V[0] == "OnDialogRequest" and V[1]:find("Item Finder") then return true end 
end
return false end)

--AddHook("OnVariant", "VARIANT-DEVELOPER", VARIANT_DEVELOPER)

function HELPER()
-- Dialog Main Menu --
function DIALOG_MAIN() M = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.MAIN_MENU.TEXT.TITLE.."|left|3524|\nadd_smalltext|"..CUSTOM_TEXT.MAIN_MENU.TEXT.SPACE.."|\nadd_smalltext|"..CUSTOM_TEXT.MAIN_MENU.TEXT.DESC_1.." `"..KONFIGURASI.UI.SECONDARY.."Starries`"..KONFIGURASI.UI.PRIMARY..", "..CUSTOM_TEXT.MAIN_MENU.TEXT.DESC_2.."|\nadd_smalltext|"..CUSTOM_TEXT.MAIN_MENU.TEXT.SPACE.."|\nadd_label_with_icon|small|"..CUSTOM_TEXT.MAIN_MENU.TEXT.HI.." "..GetLocal().name.."|left|7232|\nadd_label_with_icon|small|"..CUSTOM_TEXT.MAIN_MENU.TEXT.WORLD.." `"..KONFIGURASI.UI.SECONDARY..""..GetWorld().name.."|left|3802|\nadd_label_with_icon|small|"..CUSTOM_TEXT.MAIN_MENU.TEXT.STAND.." `"..KONFIGURASI.UI.PRIMARY.."X : `"..KONFIGURASI.UI.SECONDARY.."".. math.floor(GetLocal().pos.x // 32)  .. "`"..KONFIGURASI.UI.PRIMARY..", Y : `"..KONFIGURASI.UI.SECONDARY.."" .. math.floor(GetLocal().pos.y // 32)  .. "|left|4472|\nadd_label_with_icon|small|"..CUSTOM_TEXT.MAIN_MENU.TEXT.DATETIME.." : `"..KONFIGURASI.UI.SECONDARY..""..CUSTOM_TEXT.MAIN_MENU.TEXT.TIME.."|left|1482|\nadd_smalltext|"..CUSTOM_TEXT.MAIN_MENU.TEXT.SPACE.."|\nadd_label_with_icon|small|"..CUSTOM_TEXT.MAIN_MENU.TEXT.FEATURE.." :|left|11304|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|SOCIAL_PORTAL|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.SOCIAL.."|staticBlueFrame|1366|\nadd_button_with_icon|COMMAND_LIST|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.COMMAND.."|staticBlueFrame|1752|\nadd_button_with_icon|ABILITY_MENU|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.ABILITY.."|staticBlueFrame|"..GetItemInfo("Dumb Roles Icon").id.."|\nadd_button_with_icon|LIST_MENU|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.LIST_MENU.."|staticBlueFrame|4856|\nadd_button_with_icon|SPAM_EDITOR|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.SPAM.."|staticBlueFrame|12436|\nadd_button_with_icon|INFORMATION|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.INFO.."|staticBlueFrame|7074|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|GROWSCAN_MENU|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.GROWSCAN.."|staticBlueFrame|6016|\nadd_button_with_icon|SERVICE_MENU|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.JASA.."|staticBlueFrame|7070|\nadd_button_with_icon|DONATE_SUPPORT|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.DONATION.."|staticBlueFrame|1452|\nadd_button_with_icon|SUPPORT_MENU|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.SUPPORT.."|staticBlueFrame|656|\nadd_button_with_icon|LOG_ACTIVITY|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.ACTIVITY.."|staticBlueFrame|2376|\nadd_button_with_icon|CHECK_PROFILE|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.PROFILE.."|staticBlueFrame|10192|\nadd_button_with_icon||END_LIST||0||\nadd_quick_exit|\nend_dialog|MAIN_MENU|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.CLOSE.."||" DIALOG(M, 500) end
function DIALOG_COMMAND_LIST() C = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.COMMAND_LIST.TEXT.TITLE.."|left|1752|\nadd_smalltext|------------------------------------------------------------------------|\nadd_smalltext|"..CUSTOM_TEXT.COMMAND_LIST.TEXT.DESCRIPTION.."|\nadd_smalltext|------------------------------------------------------------------------|\ntext_scaling_string|textscalingstrings|\nadd_button_with_icon|COMMAND_LIST_BTK|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.BTK.."|staticBlueFrame|340|\nadd_button_with_icon|CommandCSN|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.CSN.."|staticBlueFrame|756|\nadd_button_with_icon|CommandUTILITY|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.UTILITY.."|staticBlueFrame|3558|\nadd_button_with_icon|CommandDROP|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.DROP.."|staticBlueFrame|13810|\nadd_button_with_icon|CommandABILITY|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.ABILITY.."|staticBlueFrame|"..GetItemInfo("Dumb Roles Icon").id.."|\nadd_button_with_icon|CommandMENU|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.MENU.."|staticBlueFrame|8282|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|CommandSB|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.SB.."|staticBlueFrame|2480|\nadd_button_with_icon|CommandFUN|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.FUN.."|staticBlueFrame|6276|\nadd_button_with_icon||END_LIST||0||\nadd_spacer|small|\nadd_smalltext|"..CUSTOM_TEXT.COMMAND_LIST.TEXT.SHORTCUT.." : `"..KONFIGURASI.UI.SECONDARY.."/cmd|\nadd_spacer|small|\nadd_quick_exit|\nadd_button|BACK_TO_MAIN_MENU|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.BACK.."|noflags|0|0|\nend_dialog|StarriesHelper|" DIALOG(C, 500) end
function DIALOG_BTK_COMMAND() B = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.COMMAND_LIST.BUTTON.BTK.."|left|1752|\nadd_spacer|small|\nadd_label|small|"..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.TITLE.." :|left|\nadd_spacer|small|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/tb `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.TB.."|left|6140|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/scan `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.SCAN.."|left|6016|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/tg `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.TG.."|left|9438|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/pc `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.PC.."|left|18|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/win1 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.WIN1.."|left|2816|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/win2 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.WIN2.."|left|2818|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/bbet `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.BBET.."|left|7188|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/paytax `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.GIVETAX.."|left|9428|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/posbet `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.POSBET.."|left|1422|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/poschand `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.POSCHAND.."|left|340|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/posh `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.POSH.."|left|1400|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/postax `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.POSTAX.."|left|1452|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/putmode `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.PUTMODE.."|left|3684|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/autopos `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.AUTOPOS.."|left|10814|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/configbtk `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_1.CONFIGBTK.."|left|4630|\nadd_spacer|small|\nadd_label|small|"..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.TITLE.." :|left|\nadd_spacer|small|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/fpos `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.FPOS.."|left|902|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/posch `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.POSCH.."|left|482|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/poscv `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.POSCV.."|left|484|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/poshorizontal `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.POSHORIZONTAL.."|left|7156|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/h1 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.H1.."|left|2836|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/h2 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.H2.."|left|2838|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/h3 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.H3.."|left|2840|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/h4 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.H4.."|left|2842|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/posvertical `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.POSVERTICAL.."|left|1100|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/v1 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.V1.."|left|2836|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/v2 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.V2.."|left|2838|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/v3 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.V3.."|left|2840|\nadd_label_with_icon|small|`"..KONFIGURASI.UI.SECONDARY.."/v4 `"..KONFIGURASI.UI.PRIMARY..": "..CUSTOM_TEXT.COMMAND_LIST.BTK.LIST_2.V4.."|left|2842|\nadd_spacer|small|\nadd_smalltext|"..CUSTOM_TEXT.COMMAND_LIST.BTK.TEXT.SHORTCUT.."|\nadd_spacer|small|\nadd_quick_exit|\nadd_button|COMMAND_LIST|"..CUSTOM_TEXT.COMMAND_LIST.BTK.BUTTON.BACK.."|noflags|0|0|\nend_dialog|StarriesHelper|||" DIALOG(B, 500) end
function DIALOG_ABILITY() A = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.ABILITY.TEXT.A.."|left|"..GetItemInfo("Dumb Roles Icon").id.."|\nadd_smalltext|------------------------------------------------------------|\nadd_smalltext|"..CUSTOM_TEXT.ABILITY.TEXT.B.."|\nadd_smalltext|------------------------------------------------------------|\ntext_scaling_string|textscalingstring|\nadd_checkicon|BLOCK_SDB_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.BLOCK_SDB.."|"..FRAME(KONFIGURASI.ABILITY.BLOCK_SDB).."|2480||"..CHECKBOX(KONFIGURASI.ABILITY.BLOCK_SDB).."|\nadd_checkicon|ANTI_POCKET_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.ANTI_POCKET.."|"..FRAME(KONFIGURASI.ABILITY.ANTI_POCKET).."|3062||"..CHECKBOX(KONFIGURASI.ABILITY.ANTI_POCKET).."|\nadd_checkicon|PULL_GAS_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.PULL_GAS.."|"..FRAME(KONFIGURASI.ABILITY.PULL_GAS).."|1400||"..CHECKBOX(KONFIGURASI.ABILITY.PULL_GAS).."|\nadd_checkicon|SHOW_GEMS_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.SHOW_GEMS.."|"..FRAME(KONFIGURASI.ABILITY.SHOW_GEMS).."|9438||"..CHECKBOX(KONFIGURASI.ABILITY.SHOW_GEMS).."|\nadd_checkicon|EXTRACTOR_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.EXTRACTOR.."|"..FRAME(KONFIGURASI.ABILITY.EXTRACTOR).."|6140||"..CHECKBOX(KONFIGURASI.ABILITY.EXTRACTOR).."|\nadd_button_with_icon||END_LIST||0||\nadd_checkicon|FAST_DROP_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.FAST_DROP.."|"..FRAME(KONFIGURASI.ABILITY.FAST_DROP).."|4758||"..CHECKBOX(KONFIGURASI.ABILITY.FAST_DROP).."|\nadd_checkicon|FAST_TRASH_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.FAST_TRASH.."|"..FRAME(KONFIGURASI.ABILITY.FAST_TRASH).."|6068||"..CHECKBOX(KONFIGURASI.ABILITY.FAST_TRASH).."|\nadd_checkicon|MODFLY_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.MODFLY.."|"..FRAME(KONFIGURASI.ABILITY.MODFLY).."|7502||"..CHECKBOX(KONFIGURASI.ABILITY.MODFLY).."|\nadd_checkicon|NO_PICKUP_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.NO_PICKUP.."|"..FRAME(KONFIGURASI.ABILITY.NO_PICKUP).."|4320||"..CHECKBOX(KONFIGURASI.ABILITY.NO_PICKUP).."|\nadd_checkicon|NO_LAG_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.NO_LAG.."|"..FRAME(KONFIGURASI.ABILITY.NO_LAG).."|7234||"..CHECKBOX(KONFIGURASI.ABILITY.NO_LAG).."|\nadd_button_with_icon||END_LIST||0||\nadd_checkicon|FAST_DBLOCK_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.FAST_DBLOCK.."|"..FRAME(KONFIGURASI.ABILITY.FAST_DBLOCK).."|2946||"..CHECKBOX(KONFIGURASI.ABILITY.FAST_DBLOCK).."|\nadd_checkicon|BLOCK_ADVENTURE_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.BLOCK_ADVENTURE.."|"..FRAME(KONFIGURASI.ABILITY.BLOCK_ADVENTURE).."|4722||"..CHECKBOX(KONFIGURASI.ABILITY.BLOCK_ADVENTURE).."|\nadd_checkicon|BLOCK_EVENT_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.BLOCK_EVENT.."|"..FRAME(KONFIGURASI.ABILITY.BLOCK_EVENT).."|10536||"..CHECKBOX(KONFIGURASI.ABILITY.BLOCK_EVENT).."|\nadd_checkicon|ANTI_BUNNIES_TOGGLE|"..CUSTOM_TEXT.ABILITY.BUTTON.ANTI_BUNNIES.."|"..FRAME(KONFIGURASI.ABILITY.ANTI_BUNNIES).."|618||"..CHECKBOX(KONFIGURASI.ABILITY.ANTI_BUNNIES).."|\nadd_button_with_icon||END_LIST||0||\nadd_spacer|small|\nadd_smalltext|"..CUSTOM_TEXT.ABILITY.TEXT.E.."|\nadd_smalltext|"..CUSTOM_TEXT.ABILITY.TEXT.C.."|\nadd_smalltext|"..CUSTOM_TEXT.ABILITY.TEXT.D.."|\nadd_spacer|small|\nadd_quick_exit|\nadd_button|BACK_TO_MAIN_MENU|"..CUSTOM_TEXT.ABILITY.BUTTON.BACK.."|noflags|0|0|\nend_dialog|YOUR_ABILITY|"..CUSTOM_TEXT.ABILITY.BUTTON.CLOSE.."|"..CUSTOM_TEXT.ABILITY.BUTTON.SAVE.."|" DIALOG(A, 500) end
function DIALOG_LIST_MENU() A = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.MAIN_MENU.BUTTON.LIST_MENU.."|left|4856|\nadd_smalltext|------------------------------------------------------------|\nadd_smalltext|"..CUSTOM_TEXT.LIST_MENU.TEXT.DESCRIPTION.."|\nadd_smalltext|------------------------------------------------------------|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|CONSUME_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.CONSUME.."|staticBlueFrame|12850|\nadd_button_with_icon|DONATION_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.DONATION.."|staticBlueFrame|1452|\nadd_button_with_icon|TELEPHONE_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.TELEPHONE.."|staticBlueFrame|3898|\nadd_button_with_icon|WRENCH_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.WRENCH.."|staticBlueFrame|32|\nadd_button_with_icon|VENDING_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.VENDING.."|staticBlueFrame|9268|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|MAGPLANT_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.MAGPLANT_MENU.."|staticBlueFrame|5638|\nadd_button_with_icon|SKIN_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.SKIN_MENU.."|staticBlueFrame|1420|\nadd_button_with_icon|JOIN_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.AUTO_JOIN.."|staticBlueFrame|13804|\nadd_button_with_icon|ACCESS_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.GIVE_ACCESS.."|staticBlueFrame|1424|\nadd_button_with_icon|WORLD_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.WORLD_FEATURE.."|staticBlueFrame|3802|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|WEATHER_LIST|"..CUSTOM_TEXT.LIST_MENU.BUTTON.WEATHER_LIST.."|staticBlueFrame|932|\nadd_button_with_icon|BUBBLE_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.BUBBLE.."|staticBlueFrame|10114|\nadd_button_with_icon|OVERLAY_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.OVERLAY.."|staticBlueFrame|2586|\nadd_button_with_icon|UI_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.UI.."|staticBlueFrame|3528|\nadd_button_with_icon|STORE_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.STORE.."|staticBlueFrame|10308|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|HUB_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.HUB.."|staticBlueFrame|752|\nadd_button_with_icon|HOSTER_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.HOSTER.."|staticBlueFrame|756|\nadd_button_with_icon|SURGERY_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.SURGERY.."|staticBlueFrame|7068|\nadd_button_with_icon|PACK_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.PACK_MENU.."|staticBlueFrame|10868|\nadd_button_with_icon|BRUTEFORCE_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.BRUTEFORCE_MENU.."|staticBlueFrame|762|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|PRINCESS_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.PRINCESS_MENU.."|staticBlueFrame|"..GetItemInfo("Princess").id.."|\nadd_button_with_icon||END_LIST||0||\nadd_spacer|small|\nadd_quick_exit|\nadd_button|BACK_TO_MAIN_MENU|"..CUSTOM_TEXT.LIST_MENU.BUTTON.BACK.."|noflags|0|0|\nend_dialog|LIST_MENU|||" DIALOG(A, 500) end
-- End of Dialog Main Menu --

-- Dialog BTK Menu --
function DIALOG_BTKMENU() B = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label|big|"..CUSTOM_TEXT.BTK_MENU.TITLE.."|left|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|TAKE_BET|"..CUSTOM_TEXT.BTK_MENU.BUTTON.TB.."|staticBlueFrame|6140|\nadd_button_with_icon|SCAN_GEMS|"..CUSTOM_TEXT.BTK_MENU.BUTTON.SCAN.."|staticBlueFrame|6016|\nadd_button_with_icon|TAKE_GEMS|"..CUSTOM_TEXT.BTK_MENU.BUTTON.TG.."|staticBlueFrame|9438|\nadd_button_with_icon|PUT_CHAND|"..CUSTOM_TEXT.BTK_MENU.BUTTON.PC.."|staticBlueFrame|18|\nadd_button_with_icon||END_LIST|noflags|0||\nadd_button_with_icon|WINNER_1|"..CUSTOM_TEXT.BTK_MENU.BUTTON.WIN1.."|staticBlueFrame|2816|\nadd_button_with_icon|WINNER_2|"..CUSTOM_TEXT.BTK_MENU.BUTTON.WIN2.."|staticBlueFrame|2818|\nadd_button_with_icon|BACK_BET|"..CUSTOM_TEXT.BTK_MENU.BUTTON.BBET.."|staticBlueFrame|7188|\nadd_button_with_icon|PAY_TAX|"..CUSTOM_TEXT.BTK_MENU.BUTTON.GIVETAX.."|staticBlueFrame|9428|\nadd_button_with_icon||END_LIST|noflags|0||\nadd_button_with_icon|SETUP_POS_BET|"..CUSTOM_TEXT.BTK_MENU.BUTTON.POSBET.."|staticBlueFrame|1422|\nadd_button_with_icon|SETUP_POS_CHAND|"..CUSTOM_TEXT.BTK_MENU.BUTTON.POSCHAND.."|staticBlueFrame|340|\nadd_button_with_icon|SETUP_POS_HOSTER|"..CUSTOM_TEXT.BTK_MENU.BUTTON.POSH.."|staticBlueFrame|1400||\nadd_button_with_icon|SETUP_POS_TAX|"..CUSTOM_TEXT.BTK_MENU.BUTTON.POSTAX.."|staticBlueFrame|1452|\nadd_button_with_icon||END_LIST|noflags|0|\nadd_button_with_icon|EDIT_TAX|"..CUSTOM_TEXT.BTK_MENU.BUTTON.SETTING_TAX.."|staticBlueFrame|12438|\nadd_button_with_icon|PUT_MODE|"..CUSTOM_TEXT.BTK_MENU.BUTTON.PUTMODE.."|staticBlueFrame|3684|\nadd_button_with_icon|AUTO_POS|"..CUSTOM_TEXT.BTK_MENU.BUTTON.AUTOPOS.."|staticBlueFrame|10814|\nadd_button_with_icon|CONFIG_BTK|"..CUSTOM_TEXT.BTK_MENU.BUTTON.CONFIGBTK.."|staticBlueFrame|4630|\nadd_button_with_icon||END_LIST|noflags|0||\nadd_quick_exit|\nend_dialog|BTKMENU|"..CUSTOM_TEXT.BTK_MENU.BUTTON.CLOSE.."||" DIALOG(B, 500) end
function DIALOG_POS_CHAND_MODE() C = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label|small|"..CUSTOM_TEXT.BTK_MENU.POS_CHAND_MODE.TITLE.."|left|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|CHAND_HORIZONTAL_MENU|"..CUSTOM_TEXT.BTK_MENU.POS_CHAND_MODE.BUTTON.HORIZONTAL.."|"..FRAME(KONFIGURASI.BTK.HORIZONTAL).."|7156|\nadd_button_with_icon|CHAND_VERTICAL_MENU|"..CUSTOM_TEXT.BTK_MENU.POS_CHAND_MODE.BUTTON.VERTICAL.."|"..FRAME(KONFIGURASI.BTK.VERTICAL).."|1100|\nadd_button_with_icon||END_LIST||0||\nadd_spacer|small|\nadd_quick_exit|\nadd_button|BTK_MENU|"..CUSTOM_TEXT.BTK_MENU.POS_CHAND_MODE.BUTTON.BACK.."|noflags|0|0|\nend_dialog|StarriesHelper|" DIALOG(C, 500) end
function DIALOG_SELECT_PUT_MODE() B = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label|small|Select|left|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|PUT_WITH_REMOTE|Remote|"..FRAME_MODE(KONFIGURASI.BTK.PUT_MODE, "REMOTE").."|5640|\nadd_button_with_icon|PUT_WITH_CHAND|Chandelier|"..FRAME_MODE(KONFIGURASI.BTK.PUT_MODE, "CHAND").."|340|\nadd_button_with_icon||END_LIST|noflags|0||\nadd_spacer|small|\nadd_button|BTK_MENU|    Back    |noflags|0|0|\nadd_quick_exit|\nend_dialog|AUTOPOS_MENU|||" DIALOG(B, 500) end
function DIALOG_AUTOPOS() B = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label|small|Select|left|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|AUTO_POS_HORIZONTAL|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.H.."|staticBlueFrame|7156|\nadd_button_with_icon|AUTO_POS_VERTICAL|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.V.."|staticBlueFrame|1100|\nadd_button_with_icon||END_LIST|noflags|0||\nadd_spacer|small|\nadd_button|BTK_MENU|    Back    |noflags|0|0|\nadd_quick_exit|\nend_dialog|AUTOPOS_MENU|||" DIALOG(B, 500) end
function DIALOG_AUTOPOS_HORIZONTAL() B = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label|small|Select|left|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|HORIZONTAL_1|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.H1.."|staticBlueFrame|2816|\nadd_button_with_icon|HORIZONTAL_2|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.H2.."|staticBlueFrame|2818|\nadd_button_with_icon|HORIZONTAL_3|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.H3.."|staticBlueFrame|2820|\nadd_button_with_icon|HORIZONTAL_4|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.H4.."|staticBlueFrame|2822|\nadd_button_with_icon||END_LIST|noflags|0||\nadd_spacer|small|\nadd_button|AUTO_POS|                Back                |noflags|0|0|\nadd_quick_exit|\nend_dialog|AUTOPOS_MENU|||" DIALOG(B, 500) end
function DIALOG_AUTOPOS_VERTICAL() B = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label|small|Select|left|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|VERTICAL_1|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.V1.."|staticBlueFrame|2816|\nadd_button_with_icon|VERTICAL_2|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.V2.."|staticBlueFrame|2818|\nadd_button_with_icon|VERTICAL_3|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.V3.."|staticBlueFrame|2820|\nadd_button_with_icon|VERTICAL_4|"..CUSTOM_TEXT.BTK_MENU.AUTOPOS.V4.."|staticBlueFrame|2822|\nadd_button_with_icon||END_LIST|noflags|0||\nadd_spacer|small|\nadd_button|AUTO_POS|                Back                |noflags|0|0|\nadd_quick_exit|\nend_dialog|AUTOPOS_MENU|||" DIALOG(B, 500) end
function CHECK_POS(X, Y) local R if X == 0 and Y == 0 then R = "Not yet configured" else R = X .. ", " .. Y end return R end
-- End of Dialog BTK Menu --

function DIALOG_BTKCONFIG()
if not KONFIGURASI.BTK.HORIZONTAL and not KONFIGURASI.BTK.VERTICAL then TABLE_POS_1 = {} table.insert(TABLE_POS_1, "Not yet configured") TABLE_POS_2 = {} table.insert(TABLE_POS_2, "Not yet configured") elseif KONFIGURASI.BTK.HORIZONTAL then TABLE_POS_1 = {} table.insert(TABLE_POS_1, CHECK_POS(KONFIGURASI.BTK.POSCHAND.LEFT.X2, KONFIGURASI.BTK.POSCHAND.LEFT.Y1)..", "..CHECK_POS(KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y1)..", "..CHECK_POS(KONFIGURASI.BTK.POSCHAND.LEFT.X3, KONFIGURASI.BTK.POSCHAND.LEFT.Y1)) TABLE_POS_2 = {} table.insert(TABLE_POS_2, CHECK_POS(KONFIGURASI.BTK.POSCHAND.RIGHT.X2, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1)..", "..CHECK_POS(KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1)..", "..CHECK_POS(KONFIGURASI.BTK.POSCHAND.RIGHT.X3, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1)) elseif KONFIGURASI.BTK.VERTICAL then TABLE_POS_1 = {} table.insert(TABLE_POS_1, CHECK_POS(KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y1)..", "..CHECK_POS(KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y2)..", "..CHECK_POS(KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y3)) TABLE_POS_2 = {} table.insert(TABLE_POS_2, CHECK_POS(KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1)..", "..CHECK_POS(KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y2)..", "..CHECK_POS(KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y3)) end C = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Configuration|left|4630|
add_spacer|small|
add_label_with_icon_button_list|small|Bet Position :|left|/posbet|itemID_itemAmount|1422,0|
add_smalltext|[LEFT] `]]..KONFIGURASI.UI.SECONDARY..[[]]..CHECK_POS(KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1)..[[ `]]..KONFIGURASI.UI.PRIMARY..[[and `]]..KONFIGURASI.UI.SECONDARY..[[]]..CHECK_POS(KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2)..[[ `]]..KONFIGURASI.UI.PRIMARY..[[[RIGHT]|
add_spacer|small|
add_label_with_icon_button_list|small|Chand Position :|left|/poschand|itemID_itemAmount|340,0|
add_smalltext|[LEFT] `]]..KONFIGURASI.UI.SECONDARY..[[]]..table.concat(TABLE_POS_1)..[[ `]]..KONFIGURASI.UI.PRIMARY..[[and `]]..KONFIGURASI.UI.SECONDARY..[[]]..table.concat(TABLE_POS_2)..[[ `]]..KONFIGURASI.UI.PRIMARY..[[[RIGHT]|
add_spacer|small|
add_label_with_icon_button_list|small|Chand mode is set to `]]..KONFIGURASI.UI.SECONDARY..[[]]..CAPITALIZE(TEXT_MODE(KONFIGURASI.BTK.HORIZONTAL, KONFIGURASI.BTK.VERTICAL, "Horizontal", "Vertical", "Not yet configured"))..[[|left|/poschand|itemID_itemAmount|340,0|
add_label_with_icon_button_list|small|Host position is set to `]]..KONFIGURASI.UI.SECONDARY..[[]]..CHECK_POS(KONFIGURASI.BTK.HOSTX, KONFIGURASI.BTK.HOSTY)..[[|left|/posh|itemID_itemAmount|1400,0|
add_label_with_icon_button_list|small|The chand will be placed using `]]..KONFIGURASI.UI.SECONDARY..[[]]..CAPITALIZE(KONFIGURASI.BTK.PUT_MODE)..[[|left|/putmode|itemID_itemAmount|3684,0|
add_spacer|small|
add_label|small|Optional Features :|left|
add_spacer|small|
text_scaling_string|textscalingstring|
add_checkicon|TG_WIN_TOGGLE|TG Drop Winner|]]..FRAME(KONFIGURASI.BTK.OPTIONAL.TG_WIN)..[[|9438||]]..CHECKBOX(KONFIGURASI.BTK.OPTIONAL.TG_WIN)..[[|
add_checkicon|AUTO_PAY_TOGGLE|Pay Taxes|]]..FRAME(KONFIGURASI.BTK.OPTIONAL.AUTO_PAY)..[[|9428||]]..CHECKBOX(KONFIGURASI.BTK.OPTIONAL.AUTO_PAY)..[[|
add_checkicon|AUTO_SB_TOGGLE|Super Broadcast|]]..FRAME(KONFIGURASI.BTK.OPTIONAL.AUTO_SB)..[[|2480||]]..CHECKBOX(KONFIGURASI.BTK.OPTIONAL.AUTO_SB)..[[|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|BTK_MENU|                        Back                           |noflags|0|0|
end_dialog|StarriesHelper|        Close        |        Update        |
]] DIALOG(C, 500) end

function DIALOG_SETTING_TAX() T = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Setting Tax|left|12438|
add_spacer|small|
add_text_input|INPUT_TAX|Provide tax percentage (%) : |]]..KONFIGURASI.BTK.TAX..[[|3|
add_spacer|small|
add_quick_exit|
add_button|BTK_MENU|                   Back                   |noflags|0|0|
end_dialog|SETTING_TAX|     Cancel     |     Save     |
]] DIALOG(T, 500) end
-- End of Dialog --

-- Choice --
function DIALOG_CHOICE() S = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.SETTING.G.."|left|3524|\nadd_spacer|small|\ntext_scaling_string|textscalingstring|\nadd_checkicon|Load1|"..CUSTOM_TEXT.SETTING.A.."|"..FRAME(KONFIGURASI.SYSTEM.LOADALL).."|6072||"..CHECKBOX(KONFIGURASI.SYSTEM.LOADALL).."|\nadd_checkicon|Load2|"..CUSTOM_TEXT.SETTING.B.."|"..FRAME(KONFIGURASI.SYSTEM.BTKHELPER).."|340||"..CHECKBOX(KONFIGURASI.SYSTEM.BTKHELPER).."|\nadd_checkicon|Load3|"..CUSTOM_TEXT.SETTING.C.."|"..FRAME(KONFIGURASI.SYSTEM.CASINOHELPER).."|756||"..CHECKBOX(KONFIGURASI.SYSTEM.CASINOHELPER).."|\nadd_checkicon|Load4|"..CUSTOM_TEXT.SETTING.D.."|"..FRAME(KONFIGURASI.SYSTEM.JASAHELPER).."|7070||"..CHECKBOX(KONFIGURASI.SYSTEM.JASAHELPER).."|\nadd_checkicon|Load5|"..CUSTOM_TEXT.SETTING.E.."|"..FRAME(KONFIGURASI.SYSTEM.COOKINGHELPER).."|7076||"..CHECKBOX(KONFIGURASI.SYSTEM.COOKINGHELPER).."|\nadd_button_with_icon||END_LIST||0||\nadd_quick_exit|\nend_dialog|Starries|       Close       |       Load       |" DIALOG(S, 500) end
-- End of Choice --

function BTK_OPTION() 
if KONFIGURASI.SYSTEM.BTKHELPER then

-- Action BTK --
function TAKE_BET() if KONFIGURASI.BTK.POSX1 == 0 and KONFIGURASI.BTK.POSX2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the bet position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/posbet") return true end POS1, POS2 = 0, 0 for _, objects in pairs(GetObjectList()) do if math.floor(objects.pos.x//32) == KONFIGURASI.BTK.POSX1 and math.floor(objects.pos.y//32) == KONFIGURASI.BTK.POSY1 then if objects.id == 242.0 then POS1 = POS1 + objects.amount end if objects.id == 1796.0 then POS1 = POS1 + objects.amount * 100 end if objects.id == 7188.0 then POS1 = POS1 + objects.amount * 10000 end if objects.id == 11550.0 then POS1 = POS1 + objects.amount * 1000000 end end if math.floor(objects.pos.x//32) == KONFIGURASI.BTK.POSX2 and math.floor(objects.pos.y//32) == KONFIGURASI.BTK.POSY2 then if objects.id == 242.0 then POS2 = POS2 + objects.amount end if objects.id == 1796.0 then POS2 = POS2 + objects.amount * 100 end if objects.id == 7188.0 then POS2 = POS2 + objects.amount * 10000 end if objects.id == 11550.0 then POS2 = POS2 + objects.amount * 1000000 end end end POS1, POS2 = math.floor(POS1), math.floor(POS2) if POS1 ~= POS2 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThe amount of bet are'nt equal, make sure to drop same bet!") BUBBLE("The amount of bet are'nt equal, make sure to drop same bet!") return true elseif POS1 == 0 or POS2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThe players haven't dropped their bets yet!") BUBBLE("The players haven't dropped their bets yet!") return true end CONSOLE("Bet : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(POS1).. " `oI Total Bet : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(POS1*2).. " `oI Tax : `"..KONFIGURASI.UI.SECONDARY..""..KONFIGURASI.BTK.TAX.." `o%") CONSOLE("Tax earned : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(POS2*2 - COUNT_TAX(POS2 * 2, KONFIGURASI.BTK.TAX)).." `oI Drop : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(COUNT_TAX(POS2 * 2, KONFIGURASI.BTK.TAX))) OVERLAY("Both bets are equal\n"..KONFIGURASI.BTK.TAX.."% Tax\nPlayer 1 : "..GET_DATA(POS1) .. "\n`wPlayer 2 : " .. GET_DATA(POS2) .. " \n`wAmount to drop : " .. GET_DATA(COUNT_TAX(POS2 * 2, KONFIGURASI.BTK.TAX))) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {BET = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook bet `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(POS1).. " `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|7188|7188|\n"}) KONFIGURASI.BTK.BET = POS1 COLLECT(KONFIGURASI.BTK.POSX1-1, KONFIGURASI.BTK.POSY1) COLLECT(KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1) COLLECT(KONFIGURASI.BTK.POSX1+1, KONFIGURASI.BTK.POSY1) COLLECT(KONFIGURASI.BTK.POSX2-1, KONFIGURASI.BTK.POSY2) COLLECT(KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2) COLLECT(KONFIGURASI.BTK.POSX2+1, KONFIGURASI.BTK.POSY2) if KONFIGURASI.BUBBLE.BTK_BUBBLE then CHAT(CUSTOM_TEXT.BUBBLE.BTK.COLLECT_BET) end return true end
function SCAN_GEMS() if KONFIGURASI.BTK.POSCHAND.LEFT.X1 == 0 and KONFIGURASI.BTK.POSCHAND.RIGHT.X2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the chand position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/poschand") return true end COUNT = 0 TABLE_GEMS = {} for _, obj in pairs(GetObjectList()) do for _, tiles in pairs(BTK_TILES.POS1) do if (obj.id == 112) and (obj.pos.x//32 == tiles.x) and (obj.pos.y//32 == tiles.y) then COUNT = math.floor(COUNT + obj.amount) break end end end table.insert(TABLE_GEMS, COUNT) COUNT = 0 for _, obj in pairs(GetObjectList()) do for _, tiles in pairs(BTK_TILES.POS2) do if (obj.id == 112) and ((obj.pos.x//32) == tiles.x) and ((obj.pos.y//32) == tiles.y) then COUNT = math.floor(COUNT + obj.amount) break end end end table.insert(TABLE_GEMS, COUNT) COUNT = 0 if TABLE_GEMS[1] > TABLE_GEMS[2] then CHAT("`w[`2Win`w] `wLeft : `2"..TABLE_GEMS[1].." (gems) `wVs `wRight : `4"..TABLE_GEMS[2].." (gems) `w[`4Lose`w]") elseif TABLE_GEMS[1] == TABLE_GEMS[2] then CHAT("`w[`1Draw`w] `wLeft : `1"..TABLE_GEMS[1].." (gems) `wVs `wRight : `1"..TABLE_GEMS[2].." (gems) `w[`1Draw`w]") elseif TABLE_GEMS[1] < TABLE_GEMS[2] then CHAT("`w[`4Lose`w] `wLeft : `4"..TABLE_GEMS[1].." (gems) `wVs `wRight : `2"..TABLE_GEMS[2].." (gems) `w[`2Win`w]") end TABLE_GEMS = {} end
function TAKE_GEMS() if KONFIGURASI.BTK.POSCHAND.LEFT.X1 == 0 and KONFIGURASI.BTK.POSCHAND.RIGHT.X2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the chand position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/poschand") return true end COUNT = 0 TABLE_GEMS = {} for _, obj in pairs(GetObjectList()) do for _, tiles in pairs(BTK_TILES.POS1) do if (obj.id == 112) and (obj.pos.x//32 == tiles.x) and (obj.pos.y//32 == tiles.y) then COUNT = math.floor(COUNT + obj.amount) COLLECT_OID(obj.oid, obj.pos.x, obj.pos.y) end end end table.insert(TABLE_GEMS, COUNT) COUNT = 0 for _, obj in pairs(GetObjectList()) do for _, tiles in pairs(BTK_TILES.POS2) do if (obj.id == 112) and ((obj.pos.x//32) == tiles.x) and ((obj.pos.y//32) == tiles.y) then COLLECT_OID(obj.oid, obj.pos.x, obj.pos.y) COUNT = math.floor(COUNT + obj.amount) end end end table.insert(TABLE_GEMS, COUNT) COUNT = 0 if TABLE_GEMS[1] > TABLE_GEMS[2] then CHAT("`w[`2Win`w] `wLeft : `2"..TABLE_GEMS[1].." (gems) `wVs `wRight : `4"..TABLE_GEMS[2].." (gems) `w[`4Lose`w]") KONFIGURASI.BTK.WINNER = 1 elseif TABLE_GEMS[1] == TABLE_GEMS[2] then CHAT("`w[`1Draw`w] `wLeft : `1"..TABLE_GEMS[1].." (gems) `wVs `wRight : `1"..TABLE_GEMS[2].." (gems) `w[`1Draw`w]") KONFIGURASI.BTK.WINNER = 0 elseif TABLE_GEMS[1] < TABLE_GEMS[2] then CHAT("`w[`4Lose`w] `wLeft : `4"..TABLE_GEMS[1].." (gems) `wVs `wRight : `2"..TABLE_GEMS[2].." (gems) `w[`2Win`w]") KONFIGURASI.BTK.WINNER = 2 end TABLE_GEMS = {} end
function COLLECT_GEMS_LEFT() for _, obj in pairs(GetObjectList()) do for _, tiles in pairs(BTK_TILES.POS1) do if (obj.pos.x//32 == tiles.x) and (obj.pos.y//32 == tiles.y) then COLLECT_OID(obj.oid, obj.pos.x, obj.pos.y) end end end end
function COLLECT_GEMS_RIGHT() for _, obj in pairs(GetObjectList()) do for _, tiles in pairs(BTK_TILES.POS2) do if (obj.pos.x//32 == tiles.x) and (obj.pos.y//32 == tiles.y) then COLLECT_OID(obj.oid, obj.pos.x, obj.pos.y) end end end end
function SET_WINNER(C) 
if KONFIGURASI.BTK.POSX1 == 0 and KONFIGURASI.BTK.POSX2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the bet position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/posbet") return true end 
if KONFIGURASI.BTK.HOSTX == 0 and KONFIGURASI.BTK.HOSTY == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the hoster position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/posh") return true end 
if KONFIGURASI.BTK.BET == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the bet amount, please run the command `"..KONFIGURASI.UI.SECONDARY.."/bet <amount>") return true end 
if C == 1 then STATE(KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1, "left") DROP_AMOUNT = COUNT_TAX(KONFIGURASI.BTK.BET * 2, KONFIGURASI.BTK.TAX) KONFIGURASI.DROP.DONT_SHOW = true AUTO_TAX = true elseif C == 2 then STATE(KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2, "right") DROP_AMOUNT = COUNT_TAX(KONFIGURASI.BTK.BET * 2, KONFIGURASI.BTK.TAX) KONFIGURASI.DROP.DONT_SHOW = true AUTO_TAX = true end KONFIGURASI.BTK.BET = 0
if not KONFIGURASI.BTK.HORIZONTAL and not KONFIGURASI.BTK.VERTICAL then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oTo automatically put chand, configuration chand position with command `"..KONFIGURASI.UI.SECONDARY.."/poschand") return true end
if KONFIGURASI.BTK.PUT_MODE == "REMOTE" then KONFIGURASI.BTK.PUT_ID = 5640 if GET_AMOUNT(KONFIGURASI.BTK.PUT_ID) <= 0 then BUBBLE("You didn't have Magplant Remote!") return true end elseif KONFIGURASI.BTK.PUT_MODE == "CHAND" then KONFIGURASI.BTK.PUT_ID = 340 if GET_AMOUNT(KONFIGURASI.BTK.PUT_ID) < 0 then BUBBLE("You didn't have enough of chand!") return true end end if KONFIGURASI.BTK.HORIZONTAL then RESCHAND_HORIZONTAL = true end if KONFIGURASI.BTK.VERTICAL then RESCHAND_VERTICAL = true end
end 

function BACK_BET() if KONFIGURASI.BTK.POSX1 == 0 and KONFIGURASI.BTK.POSX2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the bet position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/posbet") return true end if KONFIGURASI.BTK.BET == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the amount of bet, please run the command `"..KONFIGURASI.UI.SECONDARY.."/bet <amount>") return true end KONFIGURASI.DROP.DONT_SHOW = true STATE(KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1, "left") DROP_AMOUNT = KONFIGURASI.BTK.BET CUSTOM_DROP() KONFIGURASI.DROP.DONT_SHOW = true Sleep(100) STATE(KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2, "right") DROP_AMOUNT = KONFIGURASI.BTK.BET CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wReturns the player's bet : "..GET_DATA(DROP_AMOUNT)) KONFIGURASI.BTK.BET = 0 CUSTOM_DROP() end 

-- End of Action BTK --

function BTK_PACKET(T, S) local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/btkmenu") or COMMAND == ("/btk") or BUTTON == ("BTK_MENU") or S:find("action|store\nlocation|gem") then DIALOG_BTKMENU() return true end 
if COMMAND == ("/fpos") then FPOS = true DISPLAY_LEFT = true PUNCH_CONFIG = true BUBBLE("Punch display box on the left side for player 1 position") return true end

if COMMAND == ("/tb") or BUTTON == ("TAKE_BET") then TB = true return true end 
if COMMAND == ("/scan") or BUTTON == ("SCAN_GEMS") then SCAN = true return true end
if COMMAND == ("/tg") or BUTTON == ("TAKE_GEMS") then if not KONFIGURASI.BTK.HORIZONTAL and not KONFIGURASI.BTK.VERTICAL then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the chand position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/poschand") return true elseif KONFIGURASI.BTK.POSCHAND.LEFT.X1 == 0 and KONFIGURASI.BTK.POSCHAND.RIGHT.X2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the chand position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/poschand") return true else TG = true end return true end 
if COMMAND == ("/pc") or BUTTON == ("PUT_CHAND") then if not KONFIGURASI.BTK.HORIZONTAL and not KONFIGURASI.BTK.VERTICAL then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the chand position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/poschand") return true elseif KONFIGURASI.BTK.POSCHAND.LEFT.X1 == 0 and KONFIGURASI.BTK.POSCHAND.RIGHT.X2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the chand position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/poschand") return true elseif KONFIGURASI.BTK.HOSTX == 0 and KONFIGURASI.BTK.HOSTY == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the hoster position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/posh") return true end if KONFIGURASI.BTK.PUT_MODE == "REMOTE" then KONFIGURASI.BTK.PUT_ID = 5640 if GET_AMOUNT(KONFIGURASI.BTK.PUT_ID) <= 0 then BUBBLE("You didn't have Magplant Remote!") return true end elseif KONFIGURASI.BTK.PUT_MODE == "CHAND" then KONFIGURASI.BTK.PUT_ID = 340 if GET_AMOUNT(KONFIGURASI.BTK.PUT_ID) < 0 then BUBBLE("You didn't have enough of chand!") return true end end PC = true if KONFIGURASI.BTK.HORIZONTAL then RESCHAND_HORIZONTAL = true end if KONFIGURASI.BTK.VERTICAL then RESCHAND_VERTICAL = true end return true end
if COMMAND == ("/win1") or BUTTON == ("WINNER_1") then SET_WINNER(1) return true end 
if COMMAND == ("/win2") or BUTTON == ("WINNER_2") then SET_WINNER(2) return true end 
if COMMAND == ("/showbet") then BUBBLE("Current Bet : "..GET_DATA(KONFIGURASI.BTK.BET)) return true end
if COMMAND == ("/bet") then if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true else KONFIGURASI.BTK.BET = tonumber(ARGS[2]) CONSOLE("Bet : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(KONFIGURASI.BTK.BET).. " `oI Total Bet : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(KONFIGURASI.BTK.BET*2).. " `oI Tax : `"..KONFIGURASI.UI.SECONDARY..""..KONFIGURASI.BTK.TAX.." `o%") CONSOLE("Tax earned : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(KONFIGURASI.BTK.BET * 2 - COUNT_TAX(KONFIGURASI.BTK.BET * 2, KONFIGURASI.BTK.TAX)).." `oI Drop : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(COUNT_TAX(KONFIGURASI.BTK.BET * 2, KONFIGURASI.BTK.TAX))) OVERLAY("Bet : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(KONFIGURASI.BTK.BET).. " 	\n`wTotal Bet : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(KONFIGURASI.BTK.BET*2).. " \n`wTax : `"..KONFIGURASI.UI.SECONDARY..""..KONFIGURASI.BTK.TAX.." `w%\nTax earned : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(KONFIGURASI.BTK.BET * 2 - COUNT_TAX(KONFIGURASI.BTK.BET * 2, KONFIGURASI.BTK.TAX)).." \n`wDrop : `"..KONFIGURASI.UI.SECONDARY..""..GET_DATA(COUNT_TAX(KONFIGURASI.BTK.BET * 2, KONFIGURASI.BTK.TAX))) end return true end 
if COMMAND == ("/bbet") or BUTTON == ("BACK_BET") then BBET = true return true end
if COMMAND == ("/ct") then local ARGS = SPLIT(S:lower(), " ", " ", " ", " ") if tonumber(ARGS[2]) == nil or ARGS[3] == nil or ARGS[4] == nil or tonumber(ARGS[5]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oWrong format, follow this instruction : `5/ct <number> <type lock> <operator> <number>") return true end if tostring(ARGS[3]) == "wl" then NUMBER_1 = ARGS[2] elseif tostring(ARGS[3]) == "dl" then NUMBER_1 = ARGS[2]*100 elseif tostring(ARGS[3]) == "bgl" then NUMBER_1 = ARGS[2]*10000 elseif tostring(ARGS[3]) == "black" then NUMBER_1 = ARGS[2]*1000000 else CONSOLE("Please input the exact type of lock! wl, dl, bgl or black.") return true end if ARGS[4] ~= "+" and ARGS[4] ~= "-" and ARGS[4] ~= "/" and ARGS[4] ~= "*" then CONSOLE("You've to input the exact operation! such as +, -, / or *") return true else OPERATOR = ARGS[4] end local COUNT_RESULT if OPERATOR == "+" then COUNT_RESULT = NUMBER_1 + ARGS[5] elseif OPERATOR == "-" then COUNT_RESULT = NUMBER_1 - ARGS[5] elseif OPERATOR == "/" then COUNT_RESULT = NUMBER_1 / ARGS[5] elseif OPERATOR == "*" then COUNT_RESULT = NUMBER_1 * ARGS[5] end CHAT("Query : "..GET_DATA(NUMBER_1).." `w"..OPERATOR.." "..ARGS[5].." I Result : "..GET_DATA(COUNT_RESULT)) return true end

if COMMAND == ("/paytax") or BUTTON == ("PAY_TAX") then if KONFIGURASI.BTK.POSTX == 0 or KONFIGURASI.BTK.POSTX == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the tax position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/postax") return true end PAY_TAX = true return true end
if COMMAND == ("/putmode") or BUTTON == ("PUT_MODE") then DIALOG_SELECT_PUT_MODE() return true end
if COMMAND == ("/putremote") or BUTTON == ("PUT_WITH_REMOTE") then if KONFIGURASI.BTK.PUT_MODE == "REMOTE" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like put chand mode set to `1"..CAPITALIZE(KONFIGURASI.BTK.PUT_MODE)) return true else KONFIGURASI.BTK.PUT_MODE = "REMOTE" CONSOLE("Put chand mode set to `1"..CAPITALIZE(KONFIGURASI.BTK.PUT_MODE)) end return true end
if COMMAND == ("/putchand") or BUTTON == ("PUT_WITH_CHAND") then if KONFIGURASI.BTK.PUT_MODE == "CHAND" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like put chand mode set to `9"..CAPITALIZE(KONFIGURASI.BTK.PUT_MODE)) return true else KONFIGURASI.BTK.PUT_MODE = "CHAND" CONSOLE("Put chand mode set to `9"..CAPITALIZE(KONFIGURASI.BTK.PUT_MODE)) end return true end

if COMMAND == ("/autopos") or BUTTON == ("AUTO_POS") then DIALOG_AUTOPOS() return true end
if COMMAND == ("/poshorizontal") or BUTTON == ("AUTO_POS_HORIZONTAL") then DIALOG_AUTOPOS_HORIZONTAL() return true end
if COMMAND == ("/h1") or BUTTON == ("HORIZONTAL_1") then KONFIGURASI.BTK.HOSTX, KONFIGURASI.BTK.HOSTY = math.floor(GetLocal().pos.x//32), math.floor(GetLocal().pos.y//32) KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1, KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2 = math.floor(GetLocal().pos.x//32)-3, math.floor(GetLocal().pos.y//32)+1, math.floor(GetLocal().pos.x//32)+3, math.floor(GetLocal().pos.y//32)+1 KONFIGURASI.BTK.POSCHAND.LEFT.X1 = math.floor(GetLocal().pos.x//32)-4 KONFIGURASI.BTK.POSCHAND.LEFT.Y1 = math.floor(GetLocal().pos.y//32)-1 KONFIGURASI.BTK.POSCHAND.LEFT.X2 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 + 1 KONFIGURASI.BTK.POSCHAND.LEFT.X3 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 - 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X1 = math.floor(GetLocal().pos.x//32)+4 KONFIGURASI.BTK.POSCHAND.RIGHT.Y1 = math.floor(GetLocal().pos.y//32)-1 KONFIGURASI.BTK.POSCHAND.RIGHT.X2 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 + 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X3 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 - 1 KONFIGURASI.BTK.HORIZONTAL = true BTK_TILES = {POS1 = {{x = KONFIGURASI.BTK.POSCHAND.LEFT.X2, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X3, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}}, POS2 = {{x = KONFIGURASI.BTK.POSCHAND.RIGHT.X2, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X3, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}},} CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wAuto Horizontal Position Version 1 was `2successful") return true end
if COMMAND == ("/h2") or BUTTON == ("HORIZONTAL_2") then KONFIGURASI.BTK.HOSTX, KONFIGURASI.BTK.HOSTY = math.floor(GetLocal().pos.x//32), math.floor(GetLocal().pos.y//32) KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1, KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2 = math.floor(GetLocal().pos.x//32)-3, math.floor(GetLocal().pos.y//32)-1, math.floor(GetLocal().pos.x//32)+3, math.floor(GetLocal().pos.y//32)-1 KONFIGURASI.BTK.POSCHAND.LEFT.X1 = math.floor(GetLocal().pos.x//32)-4 KONFIGURASI.BTK.POSCHAND.LEFT.Y1 = math.floor(GetLocal().pos.y//32)+1 KONFIGURASI.BTK.POSCHAND.LEFT.X2 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 + 1 KONFIGURASI.BTK.POSCHAND.LEFT.X3 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 - 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X1 = math.floor(GetLocal().pos.x//32)+4 KONFIGURASI.BTK.POSCHAND.RIGHT.Y1 = math.floor(GetLocal().pos.y//32)+1 KONFIGURASI.BTK.POSCHAND.RIGHT.X2 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 + 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X3 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 - 1 KONFIGURASI.BTK.HORIZONTAL = true BTK_TILES = {POS1 = {{x = KONFIGURASI.BTK.POSCHAND.LEFT.X2, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X3, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}}, POS2 = {{x = KONFIGURASI.BTK.POSCHAND.RIGHT.X2, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X3, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}},} CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wAuto Horizontal Position Version 2 was `2successful") return true end
if COMMAND == ("/h3") or BUTTON == ("HORIZONTAL_3") then KONFIGURASI.BTK.HOSTX, KONFIGURASI.BTK.HOSTY = math.floor(GetLocal().pos.x//32), math.floor(GetLocal().pos.y//32) KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1, KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2 = math.floor(GetLocal().pos.x//32)-3, math.floor(GetLocal().pos.y//32), math.floor(GetLocal().pos.x//32)+3, math.floor(GetLocal().pos.y//32) KONFIGURASI.BTK.POSCHAND.LEFT.X1 = math.floor(GetLocal().pos.x//32)-4 KONFIGURASI.BTK.POSCHAND.LEFT.Y1 = math.floor(GetLocal().pos.y//32)-2 KONFIGURASI.BTK.POSCHAND.LEFT.X2 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 + 1 KONFIGURASI.BTK.POSCHAND.LEFT.X3 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 - 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X1 = math.floor(GetLocal().pos.x//32)+4 KONFIGURASI.BTK.POSCHAND.RIGHT.Y1 = math.floor(GetLocal().pos.y//32)-2 KONFIGURASI.BTK.POSCHAND.RIGHT.X2 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 + 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X3 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 - 1 KONFIGURASI.BTK.HORIZONTAL = true BTK_TILES = {POS1 = {{x = KONFIGURASI.BTK.POSCHAND.LEFT.X2, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X3, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}}, POS2 = {{x = KONFIGURASI.BTK.POSCHAND.RIGHT.X2, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X3, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}},} CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wAuto Horizontal Position Version 3 was `2successful") return true end
if COMMAND == ("/h4") or BUTTON == ("HORIZONTAL_4") then KONFIGURASI.BTK.HOSTX, KONFIGURASI.BTK.HOSTY = math.floor(GetLocal().pos.x//32), math.floor(GetLocal().pos.y//32) KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1, KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2 = math.floor(GetLocal().pos.x//32)-3, math.floor(GetLocal().pos.y//32)-1, math.floor(GetLocal().pos.x//32)+3, math.floor(GetLocal().pos.y//32)-1 KONFIGURASI.BTK.POSCHAND.LEFT.X1 = math.floor(GetLocal().pos.x//32)-4 KONFIGURASI.BTK.POSCHAND.LEFT.Y1 = math.floor(GetLocal().pos.y//32)+1 KONFIGURASI.BTK.POSCHAND.LEFT.X2 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 + 1 KONFIGURASI.BTK.POSCHAND.LEFT.X3 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 - 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X1 = math.floor(GetLocal().pos.x//32)+4 KONFIGURASI.BTK.POSCHAND.RIGHT.Y1 = math.floor(GetLocal().pos.y//32)+1 KONFIGURASI.BTK.POSCHAND.RIGHT.X2 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 + 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X3 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 - 1 KONFIGURASI.BTK.HORIZONTAL = true BTK_TILES = {POS1 = {{x = KONFIGURASI.BTK.POSCHAND.LEFT.X2, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X3, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}}, POS2 = {{x = KONFIGURASI.BTK.POSCHAND.RIGHT.X2, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X3, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}},} CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wAuto Horizontal Position Version 4 was `2successful") return true end

if COMMAND == ("/posvertical") or BUTTON == ("AUTO_POS_VERTICAL") then DIALOG_AUTOPOS_VERTICAL() return true end
if COMMAND == ("/v1") or BUTTON == ("VERTICAL_1") then BUBBLE("Soon!") return true end
if COMMAND == ("/v2") or BUTTON == ("VERTICAL_2") then BUBBLE("Soon!") return true end
if COMMAND == ("/v3") or BUTTON == ("VERTICAL_3") then BUBBLE("Soon!") return true end
if COMMAND == ("/v4") or BUTTON == ("VERTICAL_4") then BUBBLE("Soon!") return true end

if COMMAND == ("/configbtk") or BUTTON == ("CONFIG_BTK") then DIALOG_BTKCONFIG() return true end
if TOGGLE:find("TG_WIN_TOGGLE|1") and not KONFIGURASI.BTK.OPTIONAL.TG_WIN then KONFIGURASI.BTK.OPTIONAL.TG_WIN = true CONSOLE(CUSTOM_TEXT.CODE.BTK.."`oThe option after TG, auto drop winner `2activated") elseif TOGGLE:find("TG_WIN_TOGGLE|0") and KONFIGURASI.BTK.OPTIONAL.TG_WIN then KONFIGURASI.BTK.OPTIONAL.TG_WIN = false CONSOLE(CUSTOM_TEXT.CODE.BTK.."`oThe option after TG, auto drop winner `4deactivated") end
if TOGGLE:find("AUTO_PAY_TOGGLE|1") and not KONFIGURASI.BTK.OPTIONAL.AUTO_PAY then KONFIGURASI.BTK.OPTIONAL.AUTO_PAY = true CONSOLE(CUSTOM_TEXT.CODE.BTK.."`oThe option after TG, auto pay taxes `2activated") elseif TOGGLE:find("AUTO_PAY_TOGGLE|0") and KONFIGURASI.BTK.OPTIONAL.AUTO_PAY then KONFIGURASI.BTK.OPTIONAL.AUTO_PAY = false CONSOLE(CUSTOM_TEXT.CODE.BTK.."`oThe option after TG, auto pay taxes `4deactivated") end
if TOGGLE:find("AUTO_SB_TOGGLE|1") and not KONFIGURASI.BTK.OPTIONAL.AUTO_SB then KONFIGURASI.BTK.OPTIONAL.AUTO_SB = true CONSOLE(CUSTOM_TEXT.CODE.BTK.."`oThe option after TG, auto super broadcast `2activated") elseif TOGGLE:find("AUTO_SB_TOGGLE|0") and KONFIGURASI.BTK.OPTIONAL.AUTO_SB then KONFIGURASI.BTK.OPTIONAL.AUTO_SB = false CONSOLE(CUSTOM_TEXT.CODE.BTK.."`oThe option after TG, auto super broadcast `4deactivated") end

if COMMAND == ("/settax") or COMMAND == ("/edittax") or BUTTON == ("EDIT_TAX") then DIALOG_SETTING_TAX() return true end
if COMMAND == ("/tax") and tonumber(ARGS[2]) then KONFIGURASI.BTK.TAX = tonumber(ARGS[2]) CONSOLE("Tax changed to "..KONFIGURASI.BTK.TAX.."%") elseif COMMAND == ("/tax") and not tonumber(ARGS[2]) then CONSOLE(CUSTOM_TEXT.ALERT.OOOPS.."`oPlease input the exact amount of tax!") return true end 
if S:find("INPUT_TAX|") and not S:find("INPUT_TAX|"..KONFIGURASI.BTK.TAX) then KONFIGURASI.BTK.TAX = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_TAX|") + 10) CONSOLE("Tax changed to "..KONFIGURASI.BTK.TAX.."%") return true end 

if COMMAND == ("/posbet") or BUTTON == ("SETUP_POS_BET") then if not PUNCH_CONFIG and not DISPLAY_LEFT then DISPLAY_LEFT = true PUNCH_CONFIG = true BUBBLE("Punch display box on the left side for player 1 position") else DISPLAY_LEFT, PUNCH_CONFIG = false, false BUBBLE("Setup position bet has been cancelled") end return true end
if COMMAND == ("/poschand") or BUTTON == ("SETUP_POS_CHAND") then DIALOG_POS_CHAND_MODE() return true end
if COMMAND == ("/posch") or BUTTON == ("CHAND_HORIZONTAL_MENU") then CHAND_LEFT = true PLACE_CONFIG = true KONFIGURASI.BTK.HORIZONTAL = true KONFIGURASI.BTK.VERTICAL = false BUBBLE("Horizontal Mode ? follow the instruction on console") CONSOLE("Horizontal Mode ? follow the instruction below") CONSOLE("[Chand][`5Put or Punch Chand here`o][Chand]") return true end
if COMMAND == ("/poscv") or BUTTON == ("CHAND_VERTICAL_MENU") then CHAND_LEFT = true PLACE_CONFIG = true KONFIGURASI.BTK.VERTICAL = true KONFIGURASI.BTK.HORIZONTAL = false BUBBLE("Vertical Mode ? follow the instruction on console") CONSOLE("Vertical Mode ? follow the instruction below") CONSOLE("[Chand]") CONSOLE("`o[Chand]") CONSOLE("[`5Put or Punch Chand here`o]") return true end
if COMMAND == ("/posh") or BUTTON == ("SETUP_POS_HOSTER") then HOSTER_CONFIG = true BUBBLE("Punch the block to set hoster position") return true end
if COMMAND == ("/postax") or BUTTON == ("SETUP_POS_TAX") then DONATION_BOX = true PUNCH_CONFIG = true BUBBLE("Punch donation box to set the tax position") return true end

if COMMAND == ("/tp1") then if KONFIGURASI.BTK.POSX1 == 0 and KONFIGURASI.BTK.POSY1 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured position 1, please run the command `"..KONFIGURASI.UI.SECONDARY.."/pos1") return true end TP_POS1 = true return true end
if COMMAND == ("/tp2") then if KONFIGURASI.BTK.POSX2 == 0 and KONFIGURASI.BTK.POSY2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured position 2, please run the command `"..KONFIGURASI.UI.SECONDARY.."/pos2") return true end TP_POS2 = true return true end
if COMMAND == ("/tph") then if KONFIGURASI.BTK.HOSTX == 0 and KONFIGURASI.BTK.HOSTY == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the hoster position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/posh") return true end TP_POSH = true return true end

if COMMAND == ("/da") or COMMAND == ("/arroz") then DROP_AMOUNT = tonumber(ARGS[2]) if DROP_AMOUNT == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif DROP_AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(4604) < DROP_AMOUNT then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP(4604, DROP_AMOUNT) CONSOLE("Dropped `w"..DROP_AMOUNT.." Arroz Con Pollo") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `6"..DROP_AMOUNT.." `wArroz Con Pollo") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `6"..DROP_AMOUNT.." `wArroz Con Pollo") end end return true end
if COMMAND == ("/ds") or COMMAND == ("/song") then DROP_AMOUNT = tonumber(ARGS[2]) if DROP_AMOUNT == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif DROP_AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(4604) < DROP_AMOUNT then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP(1056, DROP_AMOUNT) CONSOLE("Dropped `w"..DROP_AMOUNT.." Songpyeon") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `6"..DROP_AMOUNT.." `@Songpyeon") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `6"..DROP_AMOUNT.." `@Songpyeon") end end return true end
if COMMAND == ("/dc") or COMMAND == ("/clover") then DROP_AMOUNT = tonumber(ARGS[2]) if DROP_AMOUNT == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif DROP_AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(528) < DROP_AMOUNT then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP(528, DROP_AMOUNT) CONSOLE("Dropped `w"..DROP_AMOUNT.." Lucky Clover") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `2"..DROP_AMOUNT.." `wLucky Clover") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `2"..DROP_AMOUNT.." `wLucky Clover") end end return true end
if COMMAND == ("/dac") or COMMAND == ("/anc") then DROP_AMOUNT = tonumber(ARGS[2]) if DROP_AMOUNT == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif DROP_AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(4604) < DROP_AMOUNT or GET_AMOUNT(528) < DROP_AMOUNT then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_ANC = true end return true end

if COMMAND == ("/pos") and ARGS[2] then ARGS[2]:lower() 
if ARGS[2] == "bet" then if not PUNCH_CONFIG and DISPLAY_LEFT then DISPLAY_LEFT = true PUNCH_CONFIG = true BUBBLE("Punch display box on the left side for player 1 position") else DISPLAY_LEFT, PUNCH_CONFIG = false, false BUBBLE("Setup position bet has been cancelled") end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oPos Command available are 'bet, chand, chand, auto, tax, host'!") end return true
elseif COMMAND == ("/pos") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oPos Command available are 'bet, chand, chand, auto, tax, host'!") return true end 

end

AddHook("OnSendPacket", "SCIENCE_PACKET", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/chem") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "r" then DROP(916, GET_AMOUNT(916))
elseif ARGS[2] == "g" then DROP(914, GET_AMOUNT(914))
elseif ARGS[2] == "b" then DROP(920, GET_AMOUNT(920))
elseif ARGS[2] == "y" then DROP(924, GET_AMOUNT(924))
elseif ARGS[2] == "p" then DROP(918, GET_AMOUNT(918))
elseif ARGS[2] == "m" then DROP(922, GET_AMOUNT(922))
end
return true elseif COMMAND == ("/chem") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oPos Command available are 'r, g, b, y, p, m'!") return true end

return false end)

function BTK_VAR(Var) if PAY_TAX then if Var[0] == "OnDialogRequest" and Var[1]:find("Donat") then return true end end end 

AddHook("OnSendPacket", "BTK_PACKET", BTK_PACKET) AddHook("OnVariant", "BTK_VAR", BTK_VAR)

else
RemoveHook("BTK_PACKET") RemoveHook("BTK_VAR")
end
end

BTK_OPTION()

function CHECKING_AMOUNT(A) end

function PACKET_DROP(T, S) local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", " "), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/wl") then if ARGS[3] ~= nil then OPTION = ARGS[3]:lower() if OPTION:find("x(%d+)") then TIMES = tonumber(OPTION:match("x(%d+)")) if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(242) < tonumber(ARGS[2]*TIMES) then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]*TIMES) DROP(242, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(ARGS[2]*TIMES).." `9World Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]*TIMES).." `9World Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]*TIMES).." `9World Lock") end end end return true end if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(242) < tonumber(ARGS[2]) then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]) DROP(242, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(ARGS[2]).." `9World Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]).." `9World Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]).." `9World Lock") end end return true end 
if COMMAND == ("/dwl") then if GET_AMOUNT(242) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP(242, GET_AMOUNT(242)) CONSOLE("Dropped `w"..GET_AMOUNT(242).." `9World Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(242).." `9World Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(242).." `9World Lock") end end return true end 

if COMMAND == ("/dl") then if ARGS[3] ~= nil then OPTION = ARGS[3]:lower() if OPTION:find("x(%d+)") then TIMES = tonumber(OPTION:match("x(%d+)")) if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(1796) < tonumber(ARGS[2]*TIMES) then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]*TIMES) DROP(1796, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(ARGS[2]*TIMES).." `1Diamond Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]*TIMES).." `1Diamond Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]*TIMES).." `1Diamond Lock") end end end return true end if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(1796) < tonumber(ARGS[2]) then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]) DROP(1796, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(ARGS[2]).." `1Diamond Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]).." `1Diamond Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]).." `1Diamond Lock") end end return true end 
if COMMAND == ("/ddl") then if GET_AMOUNT(1796) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP(1796, GET_AMOUNT(1796)) CONSOLE("Dropped `w"..GET_AMOUNT(1796).." `1Diamond Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(1796).." `1Diamond Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(1796).." `1Diamond Lock") end end return true end 

if COMMAND == ("/bl") then if ARGS[3] ~= nil then OPTION = ARGS[3]:lower() if OPTION:find("x(%d+)") then TIMES = tonumber(OPTION:match("x(%d+)")) if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(7188) < tonumber(ARGS[2]*TIMES) then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]*TIMES) DROP(7188, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(ARGS[2]*TIMES).." `eBlue Gem Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]*TIMES).." `eBlue Gem Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]*TIMES).." `eBlue Gem Lock") end end end return true end if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(7188) < tonumber(ARGS[2]) then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]) DROP(7188, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(ARGS[2]).." `eBlue Gem Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]).." `eBlue Gem Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]).." `eBlue Gem Lock") end end return true end 
if COMMAND == ("/dbl") then if GET_AMOUNT(7188) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP(7188, GET_AMOUNT(7188)) CONSOLE("Dropped `w"..GET_AMOUNT(7188).." `eBlue Gem Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(7188).." `eBlue Gem Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(7188).." `eBlue Gem Lock") end end return true end 

if COMMAND == ("/bg") then if ARGS[3] ~= nil then OPTION = ARGS[3]:lower() if OPTION:find("x(%d+)") then TIMES = tonumber(OPTION:match("x(%d+)")) if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(11550) < tonumber(ARGS[2]*TIMES) then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]*TIMES) DROP(11550, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(ARGS[2]*TIMES).." `bBlack Gem Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]*TIMES).." `bBlack Gem Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]*TIMES).." `bBlack Gem Lock") end end end return true end if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif GET_AMOUNT(11550) < tonumber(ARGS[2]) then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]) DROP(11550, DROP_AMOUNT) CONSOLE("Dropped `w"..tonumber(ARGS[2]).." `bBlack Gem Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]).." `bBlack Gem Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..tonumber(ARGS[2]).." `bBlack Gem Lock") end end return true end 
if COMMAND == ("/dbg") then if GET_AMOUNT(11550) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP(11550, GET_AMOUNT(11550)) CONSOLE("Dropped `w"..GET_AMOUNT(11550).." `bBlack Gem Lock") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(11550).." `bBlack Gem Lock") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..GET_AMOUNT(11550).." `bBlack Gem Lock") end end return true end 

if COMMAND == ("/daw") then TABLE_DAW = {WL = GET_AMOUNT(242), DL = GET_AMOUNT(1796), BGL = GET_AMOUNT(7188), BLACK = GET_AMOUNT(11550)} if TABLE_DAW.WL == 0 and TABLE_DAW.DL == 0 and TABLE_DAW.BGL == 0 and TABLE_DAW.BLACK == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true end DAW = true return true end 

if COMMAND == ("/cdrop") or COMMAND == ("/cd") then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif tonumber(ARGS[2]) > HAVE_AMOUNT then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2]) ACTION = true CDROP = true end return true end 
if COMMAND == ("/ddrop") or COMMAND == ("/dd") then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif tonumber(ARGS[2] * 100) > HAVE_AMOUNT then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2] * 100) CDROP = true end return true end 
if COMMAND == ("/bdrop") or COMMAND == ("/bd") then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif tonumber(ARGS[2] * 10000) > HAVE_AMOUNT then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2] * 10000) CDROP = true end return true end 
if COMMAND == ("/bgdrop") or COMMAND == ("/bgd") then HAVE_AMOUNT = GET_AMOUNT(242)+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif tonumber(ARGS[2] * 1000000) > HAVE_AMOUNT then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_LESS) return true else DROP_AMOUNT = tonumber(ARGS[2] * 1000000) CDROP = true end return true end 

if S:find("action|dialog_return\ndialog_name|DROP_ALERT") then if not DROPALL_APPROVE then DROPALL_APPROVE = true BUBBLE("Don't move while the dropall is in progress") else DROPALL_APPROVE = false end end
if COMMAND == ("/dropall") then SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Are you sure to `4drop all `"..KONFIGURASI.UI.PRIMARY.."item ? |left|4488|\nadd_spacer|small|\nadd_quick_exit|\nend_dialog|DROP_ALERT|No! Cancel it.|Yes, Drop all my item!|"}) return true end 
end AddHook("OnSendPacket", "PACKET_DROP", PACKET_DROP)

function CSN_OPTION()

function DIALOG_REME() R = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label|big|Reme Helper x Starries |left|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|TAKE_BET_BUTTON|Take Bet|staticBlueFrame|6140||
add_button_with_icon|/rposbet|Bet Position|staticBlueFrame|1422||
add_button_with_icon|/rposgate|Gate Position|staticBlueFrame|598||
add_button_with_icon|/rposlamp|Lamp Position|staticBlueFrame|286||
add_button_with_icon|/rposh|Host Position|staticBlueFrame|1400||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|/rbbet|Back Bet|staticBlueFrame|7188||
add_button_with_icon|/pw2|Player Win X2|staticBlueFrame|2818||
add_button_with_icon|/pw3|Player Win X3|staticBlueFrame|2820||
add_button_with_icon|/pw5|Player Win X5|staticBlueFrame|2824||
add_button_with_icon|/pw6|Player Win X6|staticBlueFrame|2826||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|/rroom|Setting Room|staticBlueFrame|3090||
add_button_with_icon|/configreme|Configuration|staticBlueFrame|4630||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_quick_exit|
end_dialog|BTKHelper|                    Close                     ||
]] DIALOG(R, 500) end

function CSN_PACKET(T, S) local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/rm") or BUTTON == ("REME_MENU") then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`o"..CUSTOM_TEXT.ALERT.NEXT_UPDATE) return true end
if COMMAND == ("/reme") and ARGS[2] then ARGS[2] = ARGS[2]:lower()

if ARGS[2] == "setup" then
if ARGS[3] == "bet" then DISPLAY_1 = true SETUP_REME = true BUBBLE("Punch display box for bet position") CONSOLE("To stop setting bet position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/reme setup")
elseif ARGS[3] == "gate" then GATE_1 = true SETUP_REME = true BUBBLE("Punch dragon gate for gate position") CONSOLE("To stop setting gate position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/reme setup")
else
if SETUP_REME then SETUP_REME = false BUBBLE("Configuration for reme stopped!") else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oReme setup available are 'posbet, posgate'!") end
end
elseif ARGS[2] == "mode" then if not KONFIGURASI.LIST_MENU.HOSTER.REME then KONFIGURASI.LIST_MENU.HOSTER.REME = true CONSOLE("Reme mode `2activated") return true else KONFIGURASI.LIST_MENU.HOSTER.REME = false CONSOLE("Reme mode `4deactivated") end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oReme command that available are 'setup, mode'!")
end
return true
elseif COMMAND == ("/reme") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oReme command that available are 'setup, mode'!")
return true end

end AddHook("OnSendPacket", "CSN_PACKET", CSN_PACKET)

end

CSN_OPTION()

-- Consume Menu --
function DIALOG_CONSUME() if KONFIGURASI.UI.LANGUAGE == "EN" then if KONFIGURASI.CONSUME.AUTO then CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.STATUS = "`4Deactivate" else CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.STATUS = "`2Activate" end elseif KONFIGURASI.UI.LANGUAGE == "ID" then if KONFIGURASI.CONSUME.AUTO then CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.STATUS = "`4Nonaktifkan" else CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.STATUS = "`2Aktifkan" end end C = tostring("set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.TITLE.."|left|12850|\nadd_spacer|small|\nadd_checkbox|CONSUME_TOGGLE|"..CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.STATUS.." `w"..CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.TOGGLE.."|"..CHECKBOX(KONFIGURASI.CONSUME.AUTO).."|\ntext_scaling_string|textscalingstring|\nadd_checkicon|ARROZ_TOGGLE|Arroz Con Pollo|"..FRAME(KONFIGURASI.CONSUME.ARROZ).."|4604||"..CHECKBOX(KONFIGURASI.CONSUME.ARROZ).."|\nadd_checkicon|EGGS_TOGGLE|Eggs Benedict|"..FRAME(KONFIGURASI.CONSUME.EGGS).."|1474||"..CHECKBOX(KONFIGURASI.CONSUME.EGGS).."|\nadd_checkicon|CLOVER_TOGGLE|Lucky Clover|"..FRAME(KONFIGURASI.CONSUME.CLOVER).."|528||"..CHECKBOX(KONFIGURASI.CONSUME.CLOVER).."|\nadd_checkicon|SONGPYEON_TOGGLE|Songpyeon|"..FRAME(KONFIGURASI.CONSUME.SONGPYEON).."|1056||"..CHECKBOX(KONFIGURASI.CONSUME.SONGPYEON).."|\nadd_checkicon|BGEMS_TOGGLE|Black Gems|"..FRAME(KONFIGURASI.CONSUME.BGEMS).."|"..GetItemInfo("Black Gems").id.."||"..CHECKBOX(KONFIGURASI.CONSUME.BGEMS).."|\nadd_button_with_icon||END_LIST||0||\nadd_spacer|small|\nadd_quick_exit|\nadd_button|LIST_MENU|"..CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.BACK.."|noflags|0|0|\nend_dialog|ConsumeMenu|"..CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.CLOSE.."|"..CUSTOM_TEXT.LIST_MENU.CONSUME.TEXT.SAVE.."|") DIALOG(C, 500) end 
function CONSUME_NOW() if KONFIGURASI.CONSUME.ARROZ then if GET_AMOUNT(4604) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have "..GetItemInfo(4604).name) else PLACE(4604, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32)) Sleep(500) end end if KONFIGURASI.CONSUME.EGGS then if GET_AMOUNT(1474) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have "..GetItemInfo(1474).name) else PLACE(1474, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32)) Sleep(500) end end if KONFIGURASI.CONSUME.CLOVER then if GET_AMOUNT(528) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have "..GetItemInfo(528).name) else PLACE(528, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32)) Sleep(500) end end if KONFIGURASI.CONSUME.SONGPYEON then if GET_AMOUNT(1056) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have "..GetItemInfo(1056).name) else PLACE(1056, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32)) end end end

AddHook("OnSendPacket", "PACKET-CONSUME-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/cm") or BUTTON == ("CONSUME_MENU") then DIALOG_CONSUME() return true end
if COMMAND == ("/consume") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "menu" then DIALOG_CONSUME()
elseif ARGS[2] == "toggle" or ARGS[2] == "auto" then if not KONFIGURASI.CONSUME.ARROZ and not KONFIGURASI.CONSUME.EGGS and not KONFIGURASI.CONSUME.CLOVER and not KONFIGURASI.CONSUME.SONGPYEON and not KONFIGURASI.CONSUME.BGEMS then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou must choose at least 1 food option on the consume menu!") return true end if KONFIGURASI.CONSUME.AUTO then KONFIGURASI.CONSUME.AUTO = false CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oAuto Consume `4deactivated") else KONFIGURASI.CONSUME.AUTO = true CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oAuto Consume `2activated") CONSUME = true end
elseif ARGS[2] == "arroz" then if GET_AMOUNT(4604) > 0 then PLACE(4604, GET_X(), GET_Y()) else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have "..GetItemInfo(4604).name) end
elseif ARGS[2] == "eggs" then if GET_AMOUNT(1474) > 0 then PLACE(1474, GET_X(), GET_Y()) else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have "..GetItemInfo(1474).name) end
elseif ARGS[2] == "clover" then if GET_AMOUNT(528) > 0 then PLACE(528, GET_X(), GET_Y()) else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have "..GetItemInfo(528).name) end
elseif ARGS[2] == "bgems" then if GET_AMOUNT(GetItemInfo("Black Gems").id) > 0 then SendPacket(2,"action|dialog_return\ndialog_name|givexgems\nitem_id|-484|\nitem_count|"..GET_AMOUNT(GetItemInfo("Black Gems").id)) else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have "..GetItemInfo(GetItemInfo("Black Gems").id).name) end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oConsume Command available are 'toggle/auto, menu'!") end return true
elseif COMMAND == ("/consume") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oConsume Command available are 'toggle/auto, menu, arroz, eggs, clover, bgems'!")
return true end

if TOGGLE:find("CONSUME_TOGGLE|1") and not KONFIGURASI.CONSUME.AUTO then if not KONFIGURASI.CONSUME.ARROZ and not KONFIGURASI.CONSUME.EGGS and not KONFIGURASI.CONSUME.CLOVER and not KONFIGURASI.CONSUME.SONGPYEON and not KONFIGURASI.CONSUME.BGEMS then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou must choose at least 1 food option on the consume menu!") return true end KONFIGURASI.CONSUME.AUTO = true CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oAuto Consume `2activated") CONSUME = true elseif TOGGLE:find("CONSUME_TOGGLE|0") and KONFIGURASI.CONSUME.AUTO then KONFIGURASI.CONSUME.AUTO = false CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oAuto Consume `4deactivated") end
if TOGGLE:find("ARROZ_TOGGLE|1") and not KONFIGURASI.CONSUME.ARROZ then KONFIGURASI.CONSUME.ARROZ = true CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oArroz Con Pollo `2selected") elseif TOGGLE:find("ARROZ_TOGGLE|0") and KONFIGURASI.CONSUME.ARROZ then KONFIGURASI.CONSUME.ARROZ = false CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oArroz Con Pollo `4deselected") end
if TOGGLE:find("EGGS_TOGGLE|1") and not KONFIGURASI.CONSUME.EGGS then KONFIGURASI.CONSUME.EGGS = true CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oEggs Benedict `2selected") elseif TOGGLE:find("EGGS_TOGGLE|0") and KONFIGURASI.CONSUME.EGGS then KONFIGURASI.CONSUME.EGGS = false CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oEggs Benedict `4deselected") end
if TOGGLE:find("CLOVER_TOGGLE|1") and not KONFIGURASI.CONSUME.CLOVER then KONFIGURASI.CONSUME.CLOVER = true CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oLucky Clover `2selected") elseif TOGGLE:find("CLOVER_TOGGLE|0") and KONFIGURASI.CONSUME.CLOVER then KONFIGURASI.CONSUME.CLOVER = false CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oLucky Clover `4deselected") end
if TOGGLE:find("SONGPYEON_TOGGLE|1") and not KONFIGURASI.CONSUME.SONGPYEON then KONFIGURASI.CONSUME.SONGPYEON = true CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oSongpyeon `2selected") elseif TOGGLE:find("SONGPYEON_TOGGLE|0") and KONFIGURASI.CONSUME.SONGPYEON then KONFIGURASI.CONSUME.SONGPYEON = false CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oSongpyeon `4deselected") end
if TOGGLE:find("BGEMS_TOGGLE|1") and not KONFIGURASI.CONSUME.BGEMS then KONFIGURASI.CONSUME.BGEMS = true CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oBlack Gems `2selected") elseif TOGGLE:find("BGEMS_TOGGLE|0") and KONFIGURASI.CONSUME.BGEMS then KONFIGURASI.CONSUME.BGEMS = false CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oBlack Gems `4deselected") end
return false end)

AddHook("OnVariant", "VARIANT-CONSUME-MENU", function(Var) if KONFIGURASI.CONSUME.AUTO and Var[0] == "OnConsoleMessage" then if KONFIGURASI.CONSUME.ARROZ and Var[1]:find("Your stomach's rumbling.") then CONSUME_ARROZ = true return true end if KONFIGURASI.CONSUME.EGGS and Var[1]:find("Your stomach is rumbling.") then CONSUME_EGGS = true return true end if KONFIGURASI.CONSUME.CLOVER and Var[1]:find("Your luck has worn off.") then CONSUME_CLOVER = true return true end if KONFIGURASI.CONSUME.SONGPYEON and Var[1]:find("Your luck has worn off.") then CONSUME_SONGPYEON = true return true end if KONFIGURASI.CONSUME.BGEMS and Var[1]:find("(%d+) Black Gems") then AMOUNT_BGEMS = Var[1]:match("(%d+) Black Gems") SendPacket(2,"action|dialog_return\ndialog_name|givexgems\nitem_id|-484|\nitem_count|"..AMOUNT_BGEMS) end end return false end)
-- End of Consume Menu --

-- Donation Menu --
function DIALOG_DONATION() local CONDITION if KONFIGURASI.LIST_MENU.DONATION.TOGGLE then CONDITION = "`4Deactivate" else CONDITION = "`2Activate" end if KONFIGURASI.LIST_MENU.DONATION.ITEM == 0 then ITEM_SELECTED = "`4None" else ITEM_SELECTED = GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.DONATION.ITEM)).name end M = tostring("set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Donation Menu|left|1452|\nadd_spacer|small|\nadd_checkbox|DONATION_TOGGLE|"..CONDITION.." `"..KONFIGURASI.UI.PRIMARY.."Fast Donation|"..CHECKBOX(KONFIGURASI.LIST_MENU.DONATION.TOGGLE).."|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|DONATION_GIFT_TOGGLE|"..CUSTOM_TEXT.LIST_MENU.DONATION.BUTTON.GIFT.."|"..FRAME_MODE(KONFIGURASI.LIST_MENU.DONATION.MODE, "GIFT").."|1360|\nadd_button_with_icon|DONATION_RETRIEVE_TOGGLE|"..CUSTOM_TEXT.LIST_MENU.DONATION.BUTTON.RETRIEVE.."|"..FRAME_MODE(KONFIGURASI.LIST_MENU.DONATION.MODE, "RETRIEVE").."|11756|\nadd_button_with_icon|DONATION_TROLL_TOGGLE|"..CUSTOM_TEXT.LIST_MENU.DONATION.BUTTON.TROLL.."|"..FRAME_MODE(KONFIGURASI.LIST_MENU.DONATION.MODE, "TROLL").."|6276|\nadd_button_with_icon||END_LIST||0||\nadd_spacer|small|\nadd_item_picker|SELECT_DONATION_ITEM|"..CUSTOM_TEXT.LIST_MENU.DONATION.BUTTON.SELECT_ITEM.."|"..CUSTOM_TEXT.LIST_MENU.DONATION.TEXT.SELECT_ITEM.."|\nadd_label|small|"..CUSTOM_TEXT.LIST_MENU.DONATION.TEXT.CURRENT_ITEM.." `"..KONFIGURASI.UI.SECONDARY..""..ITEM_SELECTED.."|left|\nadd_text_input|INPUT_DONATION_AMOUNT|"..CUSTOM_TEXT.LIST_MENU.DONATION.TEXT.CHANGE_AMOUNT.."|"..KONFIGURASI.LIST_MENU.DONATION.AMOUNT.."|5|\nadd_spacer|small|\nadd_quick_exit|\nadd_button|LIST_MENU|"..CUSTOM_TEXT.LIST_MENU.DONATION.TEXT.BACK.."|noflags|0|0|\nend_dialog|DONATION_MENU|"..CUSTOM_TEXT.LIST_MENU.DONATION.TEXT.CLOSE.."|"..CUSTOM_TEXT.LIST_MENU.DONATION.TEXT.SAVE.."|") DIALOG(M, 500) end

AddHook("OnSendPacket", "PACKET-DONATION-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/dm") or BUTTON == ("DONATION_MENU") then DIALOG_DONATION() return true end

if COMMAND == ("/donation") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "menu" then DIALOG_DONATION()
elseif ARGS[2] == "toggle" or ARGS[2] == "fast" then if not KONFIGURASI.LIST_MENU.DONATION.TOGGLE then KONFIGURASI.LIST_MENU.DONATION.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oFast Donation Box `2activated") else KONFIGURASI.LIST_MENU.DONATION.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oFast Donation Box `4deactivated") end
elseif ARGS[2] == "mode" then
if tonumber(ARGS[3]) == 0 then if KONFIGURASI.LIST_MENU.DONATION.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like donation mode already set to `^Default") return true else KONFIGURASI.LIST_MENU.DONATION.MODE = "" CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Mode set to `^Default") end 
elseif tonumber(ARGS[3]) == 1 then if KONFIGURASI.LIST_MENU.DONATION.MODE == "GIFT" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like donation mode already set to `wGift") return true else KONFIGURASI.LIST_MENU.DONATION.MODE = "GIFT" CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Mode set to `wGift") end 
elseif tonumber(ARGS[3]) == 2 then if KONFIGURASI.LIST_MENU.DONATION.MODE == "RETRIEVE" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like donation mode already set to `wRetrieve") return true else KONFIGURASI.LIST_MENU.DONATION.MODE = "RETRIEVE" CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Mode set to `wRetrieve") end
elseif tonumber(ARGS[3]) == 3 then if KONFIGURASI.LIST_MENU.DONATION.MODE == "TROLL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like donation mode already set to `wTroll") return true else KONFIGURASI.LIST_MENU.DONATION.MODE = "TROLL" CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Mode set to `wTroll") end 
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oDonation Mode are available from 0-3!") end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oDonation Command available are 'toggle/fast, menu, mode'!") end return true
elseif COMMAND == ("/donation") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oDonation Command available are 'toggle/fast, menu, mode'!") 
return true end

if COMMAND == ("/dmode") then
if tonumber(ARGS[2]) == 0 then if KONFIGURASI.LIST_MENU.DONATION.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like donation mode already set to `^Default") return true else KONFIGURASI.LIST_MENU.DONATION.MODE = "" CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Mode set to `^Default") end 
elseif tonumber(ARGS[2]) == 1 then if KONFIGURASI.LIST_MENU.DONATION.MODE == "GIFT" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like donation mode already set to `wGift") return true else KONFIGURASI.LIST_MENU.DONATION.MODE = "GIFT" CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Mode set to `wGift") end 
elseif tonumber(ARGS[2]) == 2 then if KONFIGURASI.LIST_MENU.DONATION.MODE == "RETRIEVE" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like donation mode already set to `wRetrieve") return true else KONFIGURASI.LIST_MENU.DONATION.MODE = "RETRIEVE" CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Mode set to `wRetrieve") end
elseif tonumber(ARGS[2]) == 3 then if KONFIGURASI.LIST_MENU.DONATION.MODE == "TROLL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like donation mode already set to `wTroll") return true else KONFIGURASI.LIST_MENU.DONATION.MODE = "TROLL" CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Mode set to `wTroll") end 
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oDonation Mode are available from 0-3!") end
return true end

if COMMAND == ("/faked") then if tonumber(ARGS[2]) == nil or tonumber(ARGS[3]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou must execute the command correctly! `5/faked <amount> <itemid>") return true end CHAT("`5[```w"..FORMAT_NAME(GetLocal().name).." places `5"..tonumber(ARGS[2]).."`` `2"..GetItemInfo(math.floor(ARGS[3])).name.."`` into the Donation Box`5]``") return true end
if COMMAND == ("/fdo") then if not KONFIGURASI.LIST_MENU.DONATION.TOGGLE then KONFIGURASI.LIST_MENU.DONATION.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oFast Donation Box `2activated") else KONFIGURASI.LIST_MENU.DONATION.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oFast Donation Box `4deactivated") end return true end

if TOGGLE:find("DONATION_TOGGLE|1") and not KONFIGURASI.LIST_MENU.DONATION.TOGGLE then KONFIGURASI.LIST_MENU.DONATION.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oFast Donation Box `2activated") elseif TOGGLE:find("DONATION_TOGGLE|0") and KONFIGURASI.LIST_MENU.DONATION.TOGGLE then KONFIGURASI.LIST_MENU.DONATION.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oFast Donation Box `4deactivated") end
if BUTTON == ("DONATION_GIFT_TOGGLE") then if KONFIGURASI.LIST_MENU.DONATION.MODE ~= "GIFT" then KONFIGURASI.LIST_MENU.DONATION.MODE = "GIFT" DIALOG_DONATION() else KONFIGURASI.LIST_MENU.DONATION.MODE = "" DIALOG_DONATION() end end
if BUTTON == ("DONATION_RETRIEVE_TOGGLE") then if KONFIGURASI.LIST_MENU.DONATION.MODE ~= "RETRIEVE" then KONFIGURASI.LIST_MENU.DONATION.MODE = "RETRIEVE" DIALOG_DONATION() else KONFIGURASI.LIST_MENU.DONATION.MODE = "" DIALOG_DONATION() end end
if BUTTON == ("DONATION_TROLL_TOGGLE") then if KONFIGURASI.LIST_MENU.DONATION.MODE ~= "TROLL" then KONFIGURASI.LIST_MENU.DONATION.MODE = "TROLL" DIALOG_DONATION() else KONFIGURASI.LIST_MENU.DONATION.MODE = "" DIALOG_DONATION() end end
if S:find("SELECT_DONATION_ITEM|") and not S:find("SELECT_DONATION_ITEM|"..KONFIGURASI.LIST_MENU.DONATION.ITEM) then KONFIGURASI.LIST_MENU.DONATION.ITEM = string.sub(S, S:find("SELECT_DONATION_ITEM|") + 21, S:find("DONATION_TOGGLE|") - 2) CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Item set to : "..GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.DONATION.ITEM)).name) DIALOG_DONATION() return true end 
if S:find("INPUT_DONATION_AMOUNT|") and not S:find("INPUT_DONATION_AMOUNT|"..KONFIGURASI.LIST_MENU.DONATION.AMOUNT) then KONFIGURASI.LIST_MENU.DONATION.AMOUNT = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_DONATION_AMOUNT|") + 22) CONSOLE(CUSTOM_TEXT.CODE.DONATION.."`oDonation Amount set to : "..KONFIGURASI.LIST_MENU.DONATION.AMOUNT) DIALOG_DONATION() return true end


return false end)

AddHook("OnVariant", "VARIANT-DONATION-MENU", function(Var) if KONFIGURASI.LIST_MENU.DONATION.TOGGLE then if Var[0] == "OnDialogRequest" and Var[1]:find("Donation Box") then DONATION_X = tonumber(Var[1]:match("|x|(%d+)")) DONATION_Y = tonumber(Var[1]:match("|y|(%d+)")) if KONFIGURASI.LIST_MENU.DONATION.MODE == "GIFT" then if KONFIGURASI.LIST_MENU.DONATION.ITEM == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the donation item yet!") return true elseif GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.DONATION.ITEM)) < 0 then CONSOLE("You don't have "..GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.DONATION.ITEM)).name) return true elseif KONFIGURASI.LIST_MENU.DONATION.AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThe donation amount can't be 0!") return true end SendPacket(2,"action|dialog_return\ndialog_name|donate_edit\nx|"..DONATION_X.."|\ny|"..DONATION_Y.."|\ndonsel|"..KONFIGURASI.LIST_MENU.DONATION.ITEM) return true end if KONFIGURASI.LIST_MENU.DONATION.MODE == "RETRIEVE" then SendPacket(2,"action|dialog_return\ndialog_name|donate_edit\nx|"..DONATION_X.."|\ny|"..DONATION_Y.."|\nbuttonClicked|withdrawall") return true end if KONFIGURASI.LIST_MENU.DONATION.MODE == "TROLL" then if KONFIGURASI.LIST_MENU.DONATION.ITEM == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the donation item yet!") return true elseif GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.DONATION.ITEM)) < 0 then CONSOLE("You don't have "..GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.DONATION.ITEM)).name) return true elseif KONFIGURASI.LIST_MENU.DONATION.AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThe donation amount can't be 0!") return true end CHAT("`5[```w"..FORMAT_NAME(GetLocal().name).." places `5"..KONFIGURASI.LIST_MENU.DONATION.AMOUNT.."`` `2"..GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.DONATION.ITEM)).name.."`` into the Donation Box`5]``") return true end end if Var[0] == "OnDialogRequest" and Var[1]:find("Donate Item") then SendPacket(2,"action|dialog_return\ndialog_name|donate_item\nx|"..DONATION_X.."|\ny|"..DONATION_Y.."|\nitem|"..KONFIGURASI.LIST_MENU.DONATION.ITEM.."|\ndoncount|"..KONFIGURASI.LIST_MENU.DONATION.AMOUNT.."\noptNote|`wPresent from "..GetLocal().name) return true end end return false end)
-- End of Donation Menu --

-- Telephone Menu --
function DIALOG_TELEPHONE() local CONDITION if KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE then CONDITION = "`4Deactivate" else CONDITION = "`2Activate" end TM = tostring("set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Telephone Menu|left|3898|\nadd_spacer|small|\nadd_checkbox|TELEPHONE_TOGGLE|"..CONDITION.." `wFast Telephone|"..CHECKBOX(KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE).."|\ntext_scaling_string|textscalingstring|\nadd_button_with_icon|TELEPHONE_BBGL_TOGGLE|Buy `eBGL|"..FRAME_MODE(KONFIGURASI.LIST_MENU.TELEPHONE.MODE, "BBGL").."|7188|\nadd_button_with_icon|TELEPHONE_CBGL_TOGGLE|Change `eBGL|"..FRAME_MODE(KONFIGURASI.LIST_MENU.TELEPHONE.MODE, "CBGL").."|7188|\nadd_button_with_icon|TELEPHONE_DL_TOGGLE|Buy `1DL|"..FRAME_MODE(KONFIGURASI.LIST_MENU.TELEPHONE.MODE, "DL").."|1796|\nadd_button_with_icon|TELEPHONE_MEGA_TOGGLE|Buy `5Mega|"..FRAME_MODE(KONFIGURASI.LIST_MENU.TELEPHONE.MODE, "MEGA").."|11230|\nadd_button_with_icon|TELEPHONE_GTOKEN_TOGGLE|Convert `2Tax|"..FRAME_MODE(KONFIGURASI.LIST_MENU.TELEPHONE.MODE, "GTOKEN").."|1486|\nadd_button_with_icon|TELEPHONE_PGEMS_TOGGLE|Convert `@Tax|"..FRAME_MODE(KONFIGURASI.LIST_MENU.TELEPHONE.MODE, "PGEMS").."|"..GetItemInfo("Pink Gemstone").id.."|\nadd_button_with_icon||END_LIST||0||\nadd_spacer|small|\nadd_quick_exit|\nadd_button|LIST_MENU|                            Back                            |noflags|0|0|\nend_dialog|TELEPHONE_MENU|           Close          |          Save          |") DIALOG(TM, 500) end

AddHook("OnSendPacket", "PACKET-TELEPHONE-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/tm") or BUTTON == ("TELEPHONE_MENU") then DIALOG_TELEPHONE() return true end

if COMMAND == ("/telephone") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "menu" then DIALOG_TELEPHONE()
elseif ARGS[2] == "toggle" or ARGS[2] == "fast" then if not KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE then KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oFast Telephone `2activated") else KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oFast Telephone `4deactivated") end
elseif ARGS[2] == ("mode") then
if tonumber(ARGS[3]) == 0 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `^Default") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `^Default") end 
elseif tonumber(ARGS[3]) == 1 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "CBGL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `eChange BGL") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "CBGL" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `eChange BGL") end 
elseif tonumber(ARGS[3]) == 2 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "BBGL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `eBuy BGL") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "BBGL" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `eBuy BGL") end 
elseif tonumber(ARGS[3]) == 3 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "DL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `1Buy DL") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "DL" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `1Buy DL") end
elseif tonumber(ARGS[3]) == 4 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "MEGA" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `5Buy Mega") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "MEGA" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `5Buy Mega") end 
elseif tonumber(ARGS[3]) == 5 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "GTOKEN" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `2Convert Tax") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "GTOKEN" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `2Convert Tax") end
elseif tonumber(ARGS[3]) == 6 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "PGEMS" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `@Convert Tax") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "PGEMS" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `@Convert Tax") end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oTelephone Mode are available from 0-6!") end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oTelephone Command available are 'toggle/fast, menu, mode'!") end return true
elseif COMMAND == ("/telephone") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oTelephone Command available are 'toggle/fast, menu, mode'!") 
return true end

if COMMAND == ("/ftl") then if not KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE then KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oFast Telephone `2activated") else KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oFast Telephone `4deactivated") end return true end
if TOGGLE:find("TELEPHONE_TOGGLE|1") and not KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE then KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oFast Telephone `2activated") elseif TOGGLE:find("TELEPHONE_TOGGLE|0") and KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE then KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oFast Telephone `4deactivated") end
if BUTTON == ("TELEPHONE_CBGL_TOGGLE") then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE ~= "CBGL" then KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "CBGL" DIALOG_TELEPHONE() else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "" DIALOG_TELEPHONE() end end
if BUTTON == ("TELEPHONE_BBGL_TOGGLE") then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE ~= "BBGL" then KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "BBGL" DIALOG_TELEPHONE() else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "" DIALOG_TELEPHONE() end end
if BUTTON == ("TELEPHONE_DL_TOGGLE") then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE ~= "DL" then KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "DL" DIALOG_TELEPHONE() else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "" DIALOG_TELEPHONE() end end
if BUTTON == ("TELEPHONE_MEGA_TOGGLE") then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE ~= "MEGA" then KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "MEGA" DIALOG_TELEPHONE() else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "" DIALOG_TELEPHONE() end end
if BUTTON == ("TELEPHONE_GTOKEN_TOGGLE") then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE ~= "GTOKEN" then KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "GTOKEN" DIALOG_TELEPHONE() else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "" DIALOG_TELEPHONE() end end
if BUTTON == ("TELEPHONE_PGEMS_TOGGLE") then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE ~= "PGEMS" then KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "PGEMS" DIALOG_TELEPHONE() else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "" DIALOG_TELEPHONE() end end

if COMMAND == ("/tmode") then
if tonumber(ARGS[2]) == 0 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `^Default") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `^Default") end 
elseif tonumber(ARGS[2]) == 1 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "CBGL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `eChange BGL") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "CBGL" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `eChange BGL") end 
elseif tonumber(ARGS[2]) == 2 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "BBGL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `eBuy BGL") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "BBGL" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `eBuy BGL") end 
elseif tonumber(ARGS[2]) == 3 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "DL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `1Buy DL") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "DL" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `1Buy DL") end
elseif tonumber(ARGS[2]) == 4 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "MEGA" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `5Buy Mega") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "MEGA" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `5Buy Mega") end 
elseif tonumber(ARGS[2]) == 5 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "GTOKEN" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `2Convert Tax") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "GTOKEN" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `2Convert Tax") end
elseif tonumber(ARGS[2]) == 5 then if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "PGEMS" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like telephone mode already set to `@Convert Tax") return true else KONFIGURASI.LIST_MENU.TELEPHONE.MODE = "PGEMS" CONSOLE(CUSTOM_TEXT.CODE.TELEPHONE.."`oTelephone Mode set to `@Convert Tax") end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oTelephone Mode are available from 0-6!") end
return true end

return false end)

AddHook("OnVariant", "VARIANT-TELEPHONE-MENU", function(Var)
if KONFIGURASI.LIST_MENU.TELEPHONE.TOGGLE and Var[0] == "OnDialogRequest" and Var[1]:find("Telephone") then 
if Var[1]:find("Telephone") then TELE_X = tonumber(Var[1]:match("|x|(%d+)")) TELE_Y = tonumber(Var[1]:match("|y|(%d+)"))
if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "CBGL" then if GET_AMOUNT(1796) < 100 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have `w100 `1Diamond Lock `oto exchange!") return true end SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..TELE_X.."|\ny|"..TELE_Y.."|\nbuttonClicked|bglconvert") return true end 
if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "BBGL" then if GetPlayerInfo().gems < 11000000 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have `w11.000.000 (gems) `oto buy Blue Gem Lock!") return true end SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..TELE_X.."|\ny|"..TELE_Y.."|\nbuttonClicked|bglconvert2") return true end 
if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "DL" then if GetPlayerInfo().gems < 100000 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have enough gems to buy Diamond Lock!") return true end SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..TELE_X.."|\ny|"..TELE_Y.."|\nbuttonClicked|dlconvert") return true end 
if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "MEGA" then  if GET_AMOUNT(7188) < 7 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have `w7 `eBlue Gem Lock `oto buy megaphone!") return true end SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|"..TELE_X.."|\ny|"..TELE_Y.."|\nbuttonClicked|megaconvert") return true end 
if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "GTOKEN" then SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|12345|\nx|"..TELE_X.."|\ny|"..TELE_Y.."|\nbuttonClicked|tax_to_gtoken") return true end 
if KONFIGURASI.LIST_MENU.TELEPHONE.MODE == "PGEMS" then SendPacket(2,"action|dialog_return\ndialog_name|telephone\nnum|12345|\nx|"..TELE_X.."|\ny|"..TELE_Y.."|\nbuttonClicked|tax_to_pgems") return true end 
end
end
return false end)
-- End of Telephone Menu --

-- Wrench Menu --
function DIALOG_WRENCH() local CONDITION if KONFIGURASI.LIST_MENU.WRENCH.TOGGLE then CONDITION = "`4Deactivate" else CONDITION = "`2Activate" end WM = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Wrench Menu|left|32|
add_spacer|small|
add_checkbox|WRENCH_TOGGLE|]]..CONDITION..[[ `wFast Wrench|]]..CHECKBOX(KONFIGURASI.LIST_MENU.WRENCH.TOGGLE)..[[|
text_scaling_string|textscalingstring|
add_button_with_icon|WRENCH_PULL_TOGGLE|Wrench `cPull|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.WRENCH.MODE, "PULL")..[[|274|
add_button_with_icon|WRENCH_KICK_TOGGLE|Wrench `4Kick|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.WRENCH.MODE, "KICK")..[[|732|
add_button_with_icon|WRENCH_BAN_TOGGLE|Wrench `bBan|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.WRENCH.MODE, "BAN")..[[|278|
add_button_with_icon|WRENCH_TRADE_TOGGLE|Wrench `wTrade|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.WRENCH.MODE, "TRADE")..[[|5308|
add_button_with_icon||END_LIST||0||
add_button_with_icon|WRENCH_SURGERY_TOGGLE|Wrench `8Surgery|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.WRENCH.MODE, "SURGERY")..[[|1296|
add_button_with_icon|WRENCH_PVP_TOGGLE|Wrench `5Pvp|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.WRENCH.MODE, "PVP")..[[|3162|
add_button_with_icon|WRENCH_PRESENCE_TOGGLE|Wrench `@Presence|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.WRENCH.MODE, "PRESENCE")..[[|7232|
add_button_with_icon|WRENCH_FREEZE_TOGGLE|Wrench `1Freeze|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.WRENCH.MODE, "FREEZE")..[[|1368|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|LIST_MENU|                 Back                |noflags|0|0|
end_dialog|WRENCH_MENU|     Close    |     Save    |
]] DIALOG(WM, 500) end 

AddHook("OnSendPacket", "PACKET-WRENCH-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/wm") or BUTTON == ("WRENCH_MENU") then DIALOG_WRENCH() return true end
if COMMAND == ("/fastwrench") or COMMAND == ("/fw") then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == nil then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oFast Wrench `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oFast Wrench `4deactivated") end
elseif ARGS[2] == "pull" then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE or KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "PULL" then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true KONFIGURASI.LIST_MENU.WRENCH.MODE = "PULL" CONSOLE("Fast Wrench `cPull `ohas been `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE("Fast Wrench `cPull `ohas been `4deactivated") end 
elseif ARGS[2] == "kick" then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE or KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "KICK" then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true KONFIGURASI.LIST_MENU.WRENCH.MODE = "KICK" CONSOLE("Fast Wrench `4Kick `ohas been `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE("Fast Wrench `4Kick `ohas been `4deactivated") end 
elseif ARGS[2] == "ban" then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE or KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "BAN" then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true KONFIGURASI.LIST_MENU.WRENCH.MODE = "BAN" CONSOLE("Fast Wrench `bBan `ohas been `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE("Fast Wrench `bBan `ohas been `4deactivated") end 
elseif ARGS[2] == "trade" then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE or KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "TRADE" then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true KONFIGURASI.LIST_MENU.WRENCH.MODE = "TRADE" CONSOLE("Fast Wrench `wTrade `ohas been `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE("Fast Wrench `wTrade `ohas been `4deactivated") end 
elseif ARGS[2] == "surgery" then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE or KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "SURGERY" then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true KONFIGURASI.LIST_MENU.WRENCH.MODE = "SURGERY" CONSOLE("Fast Wrench `8Surgery `ohas been `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE("Fast Wrench `8Surgery `ohas been `4deactivated") end 
elseif ARGS[2] == "pvp" then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE or KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "PVP" then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true KONFIGURASI.LIST_MENU.WRENCH.MODE = "PVP" CONSOLE("Fast Wrench `5Pvp `ohas been `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE("Fast Wrench `5Pvp `ohas been `4deactivated") end 
elseif ARGS[2] == "presence" then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE or KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "PRESENCE" then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true KONFIGURASI.LIST_MENU.WRENCH.MODE = "PRESENCE" CONSOLE("Fast Wrench `@Presence `ohas been `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE("Fast Wrench `@Presence `ohas been `4deactivated") end 
elseif ARGS[2] == "freeze" then if not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE or KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "FREEZE" then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true KONFIGURASI.LIST_MENU.WRENCH.MODE = "FREEZE" CONSOLE("Fast Wrench `1Freeze `ohas been `2activated") else KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE("Fast Wrench `1Freeze `ohas been `4deactivated") end 
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oFast Wrench Mode available are 'pull, kick, ban, trade, surgery, pvp, presence, freeze'!") end 
return true end

if TOGGLE:find("WRENCH_TOGGLE|1") and not KONFIGURASI.LIST_MENU.WRENCH.TOGGLE then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oFast Wrench `2activated") elseif TOGGLE:find("WRENCH_TOGGLE|0") and KONFIGURASI.LIST_MENU.WRENCH.TOGGLE then KONFIGURASI.LIST_MENU.WRENCH.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oFast Wrench `4deactivated") end
if BUTTON == ("WRENCH_DEFAULT_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end
if BUTTON == ("WRENCH_PULL_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "PULL" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "PULL" DIALOG_WRENCH()  else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end
if BUTTON == ("WRENCH_KICK_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "KICK" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "KICK" DIALOG_WRENCH() else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end
if BUTTON == ("WRENCH_BAN_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "BAN" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "BAN" DIALOG_WRENCH() else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end
if BUTTON == ("WRENCH_TRADE_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "TRADE" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "TRADE" DIALOG_WRENCH() else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end
if BUTTON == ("WRENCH_SURGERY_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "SURGERY" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "SURGERY" DIALOG_WRENCH() else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end
if BUTTON == ("WRENCH_PVP_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "PVP" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "PVP" DIALOG_WRENCH() else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end
if BUTTON == ("WRENCH_PRESENCE_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "PRESENCE" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "PRESENCE" DIALOG_WRENCH() else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end
if BUTTON == ("WRENCH_FREEZE_TOGGLE") then if KONFIGURASI.LIST_MENU.WRENCH.MODE ~= "FREEZE" then KONFIGURASI.LIST_MENU.WRENCH.MODE = "FREEZE" DIALOG_WRENCH() else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" DIALOG_WRENCH() end end

if COMMAND == ("/wmode") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "default" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `^Default") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `^Default") end 
elseif ARGS[2] == "pull" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "PULL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `cPull") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "PULL" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `cPull") end 
elseif ARGS[2] == "kick" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "KICK" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `4Kick") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "KICK" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `4Kick") end 
elseif ARGS[2] == "ban" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "BAN" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `bBan") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "BAN" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `bBan") end 
elseif ARGS[2] == "trade" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "TRADE" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `wTrade") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "TRADE" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `wTrade") end 
elseif ARGS[2] == "surgery" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "SURGERY" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `8Surgery") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "SURGERY" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `8Surgery") end 
elseif ARGS[2] == "pvp" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "PVP" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `5Pvp") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "PVP" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `5Pvp") end 
elseif ARGS[2] == "presence" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "PRESENCE" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `@Presence") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "PRESENCE" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `@Presence") end 
elseif ARGS[2] == "freeze" then if KONFIGURASI.LIST_MENU.WRENCH.MODE == "FREEZE" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like wrench mode already set to `1Freeze") else KONFIGURASI.LIST_MENU.WRENCH.MODE = "FREEZE" CONSOLE(CUSTOM_TEXT.CODE.WRENCH.."`oWrench Mode set to `1Freeze") end 
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oWrench Mode available are 'default, pull, kick, ban, trade, surgery, pvp, presence, freeze'!") end return true
elseif COMMAND == ("/wmode") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou must execute the command correctly! `5/wmode <type>") CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oWrench Mode available are 'default, pull, kick, ban, trade, surgery, pvp, presence, freeze'!")
return true end

if KONFIGURASI.LIST_MENU.WRENCH.TOGGLE and S:find("action|wrench\n|netid|(%d+)") then NET_ID = tonumber(S:match("action|wrench\n|netid|(%d+)")) NAME = GET_NAME_BY_NETID(NET_ID) KONFIGURASI.LIST_MENU.SURGERY.TARGET_SURG = NET_ID
if NET_ID ~= GetLocal().netid then 
if KONFIGURASI.LIST_MENU.WRENCH.MODE == "TRADE" then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..NET_ID.."|\nbuttonClicked|trade") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {WRENCH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otrading "..NAME.." `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|5308|"..KONFIGURASI.LIST_MENU.WRENCH.MODE.."|\n", WRENCH_ICON = 5308, WRENCH_TYPE = KONFIGURASI.LIST_MENU.WRENCH.MODE}) OVERLAY("Trading with "..NAME) CHAT("`wHey "..NAME.." `wi want to trade with you!") return true end
if KONFIGURASI.LIST_MENU.WRENCH.MODE == "PULL" then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..NET_ID.."|\nbuttonClicked|pull") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {WRENCH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `opulling "..NAME.." `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|274|"..KONFIGURASI.LIST_MENU.WRENCH.MODE.."|\n", WRENCH_ICON = 274, WRENCH_TYPE = KONFIGURASI.LIST_MENU.WRENCH.MODE}) OVERLAY("Pulling "..NAME) if KONFIGURASI.BUBBLE.PULL_BUBBLE then CHAT(CUSTOM_TEXT.BUBBLE.WRENCH.PULL_BUBBLE.." "..NAME.." `w?") return true end return true end
if KONFIGURASI.LIST_MENU.WRENCH.MODE == "KICK" then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..NET_ID.."|\nbuttonClicked|kick") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {WRENCH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `okicking "..NAME.." `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|732|"..KONFIGURASI.LIST_MENU.WRENCH.MODE.."|\n", WRENCH_ICON = 732, WRENCH_TYPE = KONFIGURASI.LIST_MENU.WRENCH.MODE}) OVERLAY("Kicking "..NAME) return true end
if KONFIGURASI.LIST_MENU.WRENCH.MODE == "BAN" then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..NET_ID.."|\nbuttonClicked|world_ban") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {WRENCH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `obanning "..NAME.." `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|278|"..KONFIGURASI.LIST_MENU.WRENCH.MODE.."|\n", WRENCH_ICON = 278, WRENCH_TYPE = KONFIGURASI.LIST_MENU.WRENCH.MODE}) OVERLAY("Banning "..NAME) return true end 
if KONFIGURASI.LIST_MENU.WRENCH.MODE == "SURGERY" then if (GET_AMOUNT(1258) or GET_AMOUNT(1260) or GET_AMOUNT(1262) or GET_AMOUNT(1264) or GET_AMOUNT(1266) or GET_AMOUNT(1268) or GET_AMOUNT(1270)) < 20 then CONSOLE("`4BE CAREFUL! `oYour surgical tools will run out soon!") return true end SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..NET_ID.."|\nbuttonClicked|surgery") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {WRENCH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `ooperating "..NAME.." `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|1296|"..KONFIGURASI.LIST_MENU.WRENCH.MODE.."|\n", WRENCH_ICON = 1296, WRENCH_TYPE = KONFIGURASI.LIST_MENU.WRENCH.MODE}) return true end 
if KONFIGURASI.LIST_MENU.WRENCH.MODE == "PVP" then SendPacket(2,"action|dialog_return\ndialog_name|pvp_settings\nnetID|"..NET_ID.."|\nbet|50") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {WRENCH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `ofighting "..NAME.." `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|3162|"..KONFIGURASI.LIST_MENU.WRENCH.MODE.."|\n", WRENCH_ICON = 3162, WRENCH_TYPE = KONFIGURASI.LIST_MENU.WRENCH.MODE}) OVERLAY("Fighting "..NAME) return true end 
if KONFIGURASI.LIST_MENU.WRENCH.MODE == "PRESENCE" then CHAT("`w(grin) Hi "..NAME.." `wnice to meet you!") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {WRENCH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `ogreeting "..NAME.." `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|7232|"..KONFIGURASI.LIST_MENU.WRENCH.MODE.."|\n", WRENCH_ICON = 7232, WRENCH_TYPE = KONFIGURASI.LIST_MENU.WRENCH.MODE}) OVERLAY("Greeting "..NAME) return true end 
if KONFIGURASI.LIST_MENU.WRENCH.MODE == "FREEZE" then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..NET_ID.."|\nbuttonClicked|freeze") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {WRENCH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `ofreezing "..NAME.." `oat `5"..GetWorld().name.." `o"..os.date("%H:%M on %d/%m").."|left|1368|"..KONFIGURASI.LIST_MENU.WRENCH.MODE.."|\n", WRENCH_ICON = 1368, WRENCH_TYPE = KONFIGURASI.LIST_MENU.WRENCH.MODE}) OVERLAY("Freezing "..NAME) return true end 
return true end end

return false end)

-- End of Wrench Menu --

-- Vending Menu --
function DIALOG_VENDING() if KONFIGURASI.LIST_MENU.VENDING.AUTO_TOGGLE then CONDITION_AUTO = "Stop Auto" ICON = 430 else CONDITION_AUTO = "Start Auto" ICON = 428 end if KONFIGURASI.LIST_MENU.VENDING.ITEM == 0 then ITEM = "`4None Selected" else ITEM = GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM)).name end if KONFIGURASI.LIST_MENU.VENDING.TOGGLE then CONDITION = "`4Deactivate" else CONDITION = "`2Activate" end VM = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Vending Menu|left|9268|
add_spacer|small|
add_checkbox|VENDING_TOGGLE|]]..CONDITION..[[ `]]..KONFIGURASI.UI.PRIMARY..[[Fast Vending|]]..CHECKBOX(KONFIGURASI.LIST_MENU.VENDING.TOGGLE)..[[|
text_scaling_string|textscalingstring|
add_button_with_icon|VENDING_ADD_TOGGLE|Fast `1Addstock|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.VENDING.MODE, "ADD")..[[|11476||
add_button_with_icon|VENDING_PULL_TOGGLE|Fast `2Pullstock|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.VENDING.MODE, "PULL")..[[|10514||
add_button_with_icon|VENDING_BUY_TOGGLE|Fast `6Buy|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.VENDING.MODE, "BUY")..[[|9270||
add_button_with_icon|VENDING_COLLECT_TOGGLE|Fast `9Collect|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.VENDING.MODE, "COLLECT")..[[|242||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.SECONDARY..[[Current Item  `]]..KONFIGURASI.UI.PRIMARY..[[: ]]..ITEM..[[|
add_item_picker|INPUT_VENDING_ITEM|  Change item for Vending  |Select an item to put on your vending!``|
add_text_input|INPUT_VENDING_AMOUNT|Change fast buy amount :|]]..KONFIGURASI.LIST_MENU.VENDING.AMOUNT..[[|5|
add_smalltext|(Provide an amount for Fast Buy Vending)  |
add_text_input|INPUT_DELAY_VENDING|Change interval or delay :|]]..KONFIGURASI.LIST_MENU.VENDING.DELAY..[[|5|
add_smalltext|(Provide a delay or interval for Auto Vending)  |
add_spacer|small|
add_label|small|Automatic :|left|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|ADD_TO_VENDING|Add Vending|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE, "ADD")..[[|1924||
add_button_with_icon|RETRIEVE_DROP_VENDING|Retrieve Drop|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE, "DROP")..[[|486||
add_button_with_icon|RETRIEVE_TRASH_VENDING|Retrieve Trash|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE, "TRASH")..[[|6068||
add_button_with_icon|AUTO_VENDING_TOGGLE|]]..CONDITION_AUTO..[[|]]..FRAME(KONFIGURASI.LIST_MENU.VENDING.AUTO_TOGGLE)..[[|]]..ICON..[[||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|LIST_MENU|                   Back                    |noflags|0|0|
end_dialog|VENDING_MENU|      Close      |      Save      |
]] DIALOG(VM, 500) end

function AUTO_VENDING()
if KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE == "ADD" then
if GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM)) > 0 then SendPacket(2,"action|dialog_return\ndialog_name|vend_edit\nx|".. KONFIGURASI.LIST_MENU.VENDING.POS_X .."|\ny|"..KONFIGURASI.LIST_MENU.VENDING.POS_Y.."|\nbuttonClicked|addstock") end Sleep(KONFIGURASI.LIST_MENU.VENDING.DELAY)
end
if KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE == "DROP" then
if GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM)) <= 0 then SendPacket(2,"action|dialog_return\ndialog_name|vend_edit\nx|".. KONFIGURASI.LIST_MENU.VENDING.POS_X .."|\ny|"..KONFIGURASI.LIST_MENU.VENDING.POS_Y.."|\nbuttonClicked|pullstock") end Sleep(KONFIGURASI.LIST_MENU.VENDING.DELAY) DROP(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM), GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM))) 
end
if KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE == "TRASH" then
if GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM)) <= 0 then SendPacket(2,"action|dialog_return\ndialog_name|vend_edit\nx|".. KONFIGURASI.LIST_MENU.VENDING.POS_X .."|\ny|"..KONFIGURASI.LIST_MENU.VENDING.POS_Y.."|\nbuttonClicked|pullstock") end Sleep(KONFIGURASI.LIST_MENU.VENDING.DELAY) TRASH(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM), GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM))) 
end
end

AddHook("OnSendPacket", "PACKET-VENDING-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/vm") or BUTTON == ("VENDING_MENU") then DIALOG_VENDING() return true end
if COMMAND == ("/fv") then if not KONFIGURASI.LIST_MENU.VENDING.TOGGLE then KONFIGURASI.LIST_MENU.VENDING.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oFast Vending `2activated") else KONFIGURASI.LIST_MENU.VENDING.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oFast Vending `4deactivated") end return true end
if TOGGLE:find("VENDING_TOGGLE|1") and not KONFIGURASI.LIST_MENU.VENDING.TOGGLE then KONFIGURASI.LIST_MENU.VENDING.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oFast Vending `2activated") elseif TOGGLE:find("VENDING_TOGGLE|0") and KONFIGURASI.LIST_MENU.VENDING.TOGGLE then KONFIGURASI.LIST_MENU.VENDING.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oFast Vending `4deactivated") end
if BUTTON == ("VENDING_ADD_TOGGLE") then if KONFIGURASI.LIST_MENU.VENDING.MODE ~= "ADD" then KONFIGURASI.LIST_MENU.VENDING.MODE = "ADD" DIALOG_VENDING()  else KONFIGURASI.LIST_MENU.VENDING.MODE = "" DIALOG_VENDING() end end
if BUTTON == ("VENDING_PULL_TOGGLE") then if KONFIGURASI.LIST_MENU.VENDING.MODE ~= "PULL" then KONFIGURASI.LIST_MENU.VENDING.MODE = "PULL" DIALOG_VENDING()  else KONFIGURASI.LIST_MENU.VENDING.MODE = "" DIALOG_VENDING() end end
if BUTTON == ("VENDING_BUY_TOGGLE") then if KONFIGURASI.LIST_MENU.VENDING.MODE ~= "BUY" then KONFIGURASI.LIST_MENU.VENDING.MODE = "BUY" DIALOG_VENDING()  else KONFIGURASI.LIST_MENU.VENDING.MODE = "" DIALOG_VENDING() end end
if BUTTON == ("VENDING_COLLECT_TOGGLE") then if KONFIGURASI.LIST_MENU.VENDING.MODE ~= "COLLECT" then KONFIGURASI.LIST_MENU.VENDING.MODE = "COLLECT" DIALOG_VENDING()  else KONFIGURASI.LIST_MENU.VENDING.MODE = "" DIALOG_VENDING() end end
if S:find("INPUT_VENDING_ITEM|") and not S:find("INPUT_VENDING_ITEM|"..KONFIGURASI.LIST_MENU.VENDING.ITEM) then local ITEM = string.sub(S, S:find("INPUT_VENDING_ITEM|") + 19, S:find("VENDING_TOGGLE|") - 2) if math.floor(ITEM) == 242 or math.floor(ITEM) == 1796 or math.floor(ITEM) == 7188 or math.floor(ITEM) == 11550 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou cannot select these items for vending!") DIALOG_VENDING() return true else KONFIGURASI.LIST_MENU.VENDING.ITEM = ITEM CONSOLE("Item set to : `w"..GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.VENDING.ITEM)).name) DIALOG_VENDING() end return true end 
if S:find("INPUT_VENDING_AMOUNT|") and not S:find("INPUT_VENDING_AMOUNT|"..KONFIGURASI.LIST_MENU.VENDING.AMOUNT) then local AMOUNT = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_VENDING_AMOUNT|") + 21, S:find("INPUT_DELAY_VENDING|") - 2) if tonumber(AMOUNT) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) DIALOG_VENDING() return true elseif tonumber(AMOUNT) > 250 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThe buy amount cannot be more than 250!") DIALOG_VENDING() return true else KONFIGURASI.LIST_MENU.VENDING.AMOUNT = AMOUNT CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oAmount Buy Vending set to : `5"..KONFIGURASI.LIST_MENU.VENDING.AMOUNT) DIALOG_VENDING() end return true end 
if S:find("INPUT_DELAY_VENDING|") and not S:find("INPUT_DELAY_VENDING|"..KONFIGURASI.LIST_MENU.VENDING.DELAY.."\n") then KONFIGURASI.LIST_MENU.VENDING.DELAY = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_DELAY_VENDING|") + 20, S:find("INPUT_DELAY_VENDING|") + 25) CONSOLE("Auto Vending Delay set to : `5"..KONFIGURASI.LIST_MENU.VENDING.DELAY) DIALOG_VENDING() end 

if BUTTON == ("ADD_TO_VENDING") then if KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE ~= "ADD" then KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE = "ADD" if KONFIGURASI.LIST_MENU.VENDING.POS_X and KONFIGURASI.LIST_MENU.VENDING.POS_Y == 0 then CONFIG_VENDING = true PUNCH_CONFIG = true BUBBLE("Punch the vending to set position") else DIALOG_VENDING() end else KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE = "" DIALOG_VENDING() end end
if BUTTON == ("RETRIEVE_DROP_VENDING") then if KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE ~= "DROP" then KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE = "DROP" if KONFIGURASI.LIST_MENU.VENDING.POS_X and KONFIGURASI.LIST_MENU.VENDING.POS_Y == 0 then CONFIG_VENDING = true PUNCH_CONFIG = true BUBBLE("Punch the vending to set position") else DIALOG_VENDING() end else KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE = "" DIALOG_VENDING() end end
if BUTTON == ("RETRIEVE_TRASH_VENDING") then if KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE ~= "TRASH" then KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE = "TRASH" if KONFIGURASI.LIST_MENU.VENDING.POS_X and KONFIGURASI.LIST_MENU.VENDING.POS_Y == 0 then CONFIG_VENDING = true PUNCH_CONFIG = true BUBBLE("Punch the vending to set position") else DIALOG_VENDING() end else KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE = "" DIALOG_VENDING() end end
if COMMAND == ("/svend") or BUTTON == ("AUTO_VENDING_TOGGLE") then if KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE == "" or KONFIGURASI.LIST_MENU.VENDING.AUTO_MODE == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the mode for auto vending!") return true elseif KONFIGURASI.LIST_MENU.VENDING.ITEM == 0 or KONFIGURASI.LIST_MENU.VENDING.ITEM == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the item for auto vending!") return true end if not KONFIGURASI.LIST_MENU.VENDING.AUTO_TOGGLE then KONFIGURASI.LIST_MENU.VENDING.AUTO_TOGGLE = true CONSOLE("Auto Vending `2activated") else KONFIGURASI.LIST_MENU.VENDING.AUTO_TOGGLE = false CONSOLE("Auto Vending `4deactivated") end return true end

if COMMAND == ("/setbuy") then if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true end local AMOUNT = tonumber(ARGS[2]) if tonumber(AMOUNT) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif tonumber(AMOUNT) > 250 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThe buy amount cannot be more than 250!") return true else KONFIGURASI.LIST_MENU.VENDING.AMOUNT = AMOUNT CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oAmount Buy Vending set to : `5"..KONFIGURASI.LIST_MENU.VENDING.AMOUNT) end return true end

if COMMAND == ("/vmode") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "default" then if KONFIGURASI.LIST_MENU.VENDING.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like vending mode already set to `^Default") else KONFIGURASI.LIST_MENU.VENDING.MODE = "" CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oVending Mode set to `^Default") end 
elseif ARGS[2] == "add" then if KONFIGURASI.LIST_MENU.VENDING.MODE == "ADD" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like vending mode already set to `1Fast Addstock") else KONFIGURASI.LIST_MENU.VENDING.MODE = "ADD" CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oVending Mode set to `1Fast Addstock") end 
elseif ARGS[2] == "pull" then if KONFIGURASI.LIST_MENU.VENDING.MODE == "PULL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like vending mode already set to `2Fast Pullstock") else KONFIGURASI.LIST_MENU.VENDING.MODE = "PULL" CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oVending Mode set to `2Fast Pullstock") end 
elseif ARGS[2] == "buy" then if KONFIGURASI.LIST_MENU.VENDING.MODE == "BUY" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like vending mode already set to `6Fast Buy") else KONFIGURASI.LIST_MENU.VENDING.MODE = "BUY" CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oVending Mode set to `6Fast Buy") end 
elseif ARGS[2] == "collect" then if KONFIGURASI.LIST_MENU.VENDING.MODE == "COLLECT" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like vending mode already set to `9Fast Collect") else KONFIGURASI.LIST_MENU.VENDING.MODE = "COLLECT" CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oVending Mode set to `9Fast Collect") end 
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oVending Mode available are 'default, add, pull, buy, collect'!") end return true
elseif COMMAND == ("/vmode") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oVending Mode available are 'default, add, pull, buy, collect'!")
return true end

return false end)

AddHook("OnVariant", "VARIANT-VENDING-MENU", function(Var)
if KONFIGURASI.LIST_MENU.VENDING.TOGGLE and Var[0] == "OnDialogRequest" and (Var[1]:find("DigiVend Machine") or Var[1]:find("Vending Machine")) then
if Var[1]:find("DigiVend Machine") or Var[1]:find("Vending Machine") then VEND_X = tonumber(Var[1]:match("|x|(%d+)")) VEND_Y = tonumber(Var[1]:match("|y|(%d+)"))
if KONFIGURASI.LIST_MENU.VENDING.MODE == "ADD" then SendPacket(2,"action|dialog_return\ndialog_name|vend_edit\nx|"..VEND_X.."|\ny|"..VEND_Y.."|\nbuttonClicked|addstock") return true end
if KONFIGURASI.LIST_MENU.VENDING.MODE == "PULL" then SendPacket(2,"action|dialog_return\ndialog_name|vend_edit\nx|"..VEND_X.."|\ny|"..VEND_Y.."|\nbuttonClicked|pullstock") return true end
if KONFIGURASI.LIST_MENU.VENDING.MODE == "BUY" then if KONFIGURASI.LIST_MENU.VENDING.AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou must provide a valid purchase amount!") return true elseif not Var[1]:find("How many to buy?") then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou can't buy items at that vending!") return true end SendPacket(2,"action|dialog_return\ndialog_name|vend_buy\nx|"..VEND_X.."|\ny|"..VEND_Y.."|\nbuyamount|"..KONFIGURASI.LIST_MENU.VENDING.AMOUNT) return true end
if KONFIGURASI.LIST_MENU.VENDING.MODE == "COLLECT" then if Var[1]:find("add_button|pullwls") then SendPacket(2,"action|dialog_return\ndialog_name|vend_edit\nx|"..VEND_X.."|\ny|"..VEND_Y.."|\nbuttonClicked|pullwls") else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThis vending doesn't have a lock to collect!") end return true end
end
if Var[0] == "OnDialogRequest" and Var[1]:find("Purchase Confirmation") then SendPacket(2,"action|dialog_return\ndialog_name|vend_buyconfirm\nx|"..VEND_X.."|\ny|"..VEND_Y.."|\nbuyamount|"..KONFIGURASI.LIST_MENU.VENDING.AMOUNT) CONSOLE(CUSTOM_TEXT.CODE.VENDING.."`oYou are in fast buy vending mode, `4deactivate `oto use vending normally") return true end
end
return false end)
-- End of Vending Menu --

-- Magplant Menu --
function DIALOG_MAGPLANT() if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_TOGGLE then CONDITION_AUTO = "Stop Auto" ICON = 430 else CONDITION_AUTO = "Start Auto" ICON = 428 end if KONFIGURASI.LIST_MENU.MAGPLANT.ITEM == 0 then ITEM = "`4None Selected" else ITEM = GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM)).name end if KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE then CONDITION = "`4Deactivate" else CONDITION = "`2Activate" end M = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Magplant Menu|left|5638|
add_spacer|small|
add_checkbox|MAGPLANT_TOGGLE|]]..CONDITION..[[ `]]..KONFIGURASI.UI.PRIMARY..[[Fast Magplant|]]..CHECKBOX(KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE)..[[|
text_scaling_string|textscalingstring|
add_button_with_icon|MAGPLANT_ADD_TOGGLE|Add Stock|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE, "ADD")..[[|13810||
add_button_with_icon|MAGPLANT_RETRIEVE_TOGGLE|Retrieve Stock|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE, "RETRIEVE")..[[|13808||
add_button_with_icon|MAGPLANT_SELECT_TOGGLE|Item Select|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE, "SELECT")..[[|32||
add_button_with_icon|MAGPLANT_REMOTE_TOGGLE|Get Remote|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE, "REMOTE")..[[|5640||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.SECONDARY..[[Current Item  `]]..KONFIGURASI.UI.PRIMARY..[[: ]]..ITEM..[[|
add_item_picker|INPUT_MAGPLANT_ITEM|Change item for Magplant |Select an item to put on your magplant!``|
add_text_input|INPUT_DELAY_MAGPLANT|Change interval or delay :|]]..KONFIGURASI.LIST_MENU.MAGPLANT.DELAY..[[|5|
add_smalltext|(Provide a delay or interval for Auto Magplant)  |
add_spacer|small|
add_label|small|Automatic :|left|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|ADD_TO_MAGPLANT|Add Magplant|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE, "ADD")..[[|1924||
add_button_with_icon|RETRIEVE_DROP_MAGPLANT|Retrieve Drop|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE, "DROP")..[[|486||
add_button_with_icon|RETRIEVE_TRASH_MAGPLANT|Retrieve Trash|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE, "TRASH")..[[|6068||
add_button_with_icon|AUTO_MAGPLANT_TOGGLE|]]..CONDITION_AUTO..[[|]]..FRAME(KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_TOGGLE)..[[|]]..ICON..[[||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|LIST_MENU|                   Back                   |noflags|0|0|
end_dialog|MAGPLANT_MENU|      Close     |      Save      |
]] DIALOG(M, 500) end

function AUTO_MAGPLANT()
if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE == "ADD" then
if GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM)) > 0 then SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|".. KONFIGURASI.LIST_MENU.MAGPLANT.POS_X .."|\ny|"..KONFIGURASI.LIST_MENU.MAGPLANT.POS_Y.."|\nbuttonClicked|additems") end Sleep(KONFIGURASI.LIST_MENU.MAGPLANT.DELAY)
end
if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE == "DROP" then
if GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM)) <= 0 then SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|".. KONFIGURASI.LIST_MENU.MAGPLANT.POS_X .."|\ny|"..KONFIGURASI.LIST_MENU.MAGPLANT.POS_Y.."|\nbuttonClicked|withdraw") end Sleep(KONFIGURASI.LIST_MENU.MAGPLANT.DELAY) DROP(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM), GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM))) 
end
if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE == "TRASH" then
if GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM)) <= 0 then SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|".. KONFIGURASI.LIST_MENU.MAGPLANT.POS_X .."|\ny|"..KONFIGURASI.LIST_MENU.MAGPLANT.POS_Y.."|\nbuttonClicked|withdraw") end Sleep(KONFIGURASI.LIST_MENU.MAGPLANT.DELAY) TRASH(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM), GET_AMOUNT(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM))) 
end
end

AddHook("OnSendPacket", "PACKET-MAGPLANT-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/mm") or BUTTON == ("MAGPLANT_MENU") then DIALOG_MAGPLANT() return true end
if COMMAND == ("/fm") then if not KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE then KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE = true CONSOLE("Fast Magplant `2activated") else KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE = false CONSOLE("Fast Magplant `4deactivated") end return true end
if TOGGLE:find("MAGPLANT_TOGGLE|1") and not KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE then KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE = true CONSOLE("Fast Magplant `2activated") elseif TOGGLE:find("MAGPLANT_TOGGLE|0") and KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE then KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE = false CONSOLE("Fast Magplant `4deactivated") end
if BUTTON == ("MAGPLANT_ADD_TOGGLE") then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE ~= "ADD" then KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "ADD" DIALOG_MAGPLANT() else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "" DIALOG_MAGPLANT() end end
if BUTTON == ("MAGPLANT_RETRIEVE_TOGGLE") then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE ~= "RETRIEVE" then KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "RETRIEVE" DIALOG_MAGPLANT() else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "" DIALOG_MAGPLANT() end end
if BUTTON == ("MAGPLANT_SELECT_TOGGLE") then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE ~= "SELECT" then KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "SELECT" DIALOG_MAGPLANT() else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "" DIALOG_MAGPLANT() end end
if BUTTON == ("MAGPLANT_REMOTE_TOGGLE") then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE ~= "REMOTE" then KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "REMOTE" DIALOG_MAGPLANT() else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "" DIALOG_MAGPLANT() end end
if S:find("INPUT_MAGPLANT_ITEM|") and not S:find("INPUT_MAGPLANT_ITEM|"..KONFIGURASI.LIST_MENU.MAGPLANT.ITEM) then KONFIGURASI.LIST_MENU.MAGPLANT.ITEM = string.sub(S, S:find("INPUT_MAGPLANT_ITEM|") + 20, S:find("MAGPLANT_TOGGLE|") - 2) CONSOLE("Item set to : `w"..GetItemInfo(math.floor(KONFIGURASI.LIST_MENU.MAGPLANT.ITEM)).name) DIALOG_MAGPLANT() return true end 
if S:find("INPUT_DELAY_MAGPLANT|") and not S:find("INPUT_DELAY_MAGPLANT|"..KONFIGURASI.LIST_MENU.MAGPLANT.DELAY.."\n") then KONFIGURASI.LIST_MENU.MAGPLANT.DELAY = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_DELAY_MAGPLANT|") + 21, S:find("INPUT_DELAY_MAGPLANT|") + 26) CONSOLE("Auto Magplant Delay set to : `5"..KONFIGURASI.LIST_MENU.MAGPLANT.DELAY) end 

if BUTTON == ("ADD_TO_MAGPLANT") then if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE ~= "ADD" then KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE = "ADD" if KONFIGURASI.LIST_MENU.MAGPLANT.POS_X and KONFIGURASI.LIST_MENU.MAGPLANT.POS_Y == 0 then CONFIG_MAGPLANT = true PUNCH_CONFIG = true BUBBLE("Punch the magplant to set position") else DIALOG_MAGPLANT() end else KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE = "" DIALOG_MAGPLANT() end end
if BUTTON == ("RETRIEVE_DROP_MAGPLANT") then if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE ~= "DROP" then KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE = "DROP" if KONFIGURASI.LIST_MENU.MAGPLANT.POS_X and KONFIGURASI.LIST_MENU.MAGPLANT.POS_Y == 0 then CONFIG_MAGPLANT = true PUNCH_CONFIG = true BUBBLE("Punch the magplant to set position") else DIALOG_MAGPLANT() end else KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE = "" DIALOG_MAGPLANT() end end
if BUTTON == ("RETRIEVE_TRASH_MAGPLANT") then if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE ~= "TRASH" then KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE = "TRASH" if KONFIGURASI.LIST_MENU.MAGPLANT.POS_X and KONFIGURASI.LIST_MENU.MAGPLANT.POS_Y == 0 then CONFIG_MAGPLANT = true PUNCH_CONFIG = true BUBBLE("Punch the magplant to set position") else DIALOG_MAGPLANT() end else KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE = "" DIALOG_MAGPLANT() end end
if COMMAND == ("/automagplant") or BUTTON == ("AUTO_MAGPLANT_TOGGLE") then if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE == "" or KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_MODE == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the mode for auto magplant!") return true elseif KONFIGURASI.LIST_MENU.MAGPLANT.ITEM == 0 or KONFIGURASI.LIST_MENU.MAGPLANT.ITEM == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the item for auto magplant!") return true end if not KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_TOGGLE then KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_TOGGLE = true CONSOLE("Auto Magplant `2activated") else KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_TOGGLE = false CONSOLE("Auto Magplant `4deactivated") end return true end

if COMMAND == ("/mmode") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "default" then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like magplant mode already set to `^Default") return true else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "" CONSOLE(CUSTOM_TEXT.CODE.MAGPLANT.."`oMagplant Mode set to `^Default") end 
elseif ARGS[2] == "add" then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "ADD" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like magplant mode already set to `w"..CAPITALIZE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE)) return true else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "ADD" CONSOLE("Magplant mode set to `w"..CAPITALIZE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE)) end 
elseif ARGS[2] == "retrieve" then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "RETRIEVE" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like magplant mode already set to `w"..CAPITALIZE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE)) return true else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "RETRIEVE" CONSOLE("Magplant mode set to `w"..CAPITALIZE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE)) end
elseif ARGS[2] == "select" then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "SELECT" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like magplant mode already set to `w"..CAPITALIZE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE)) return true else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "SELECT" CONSOLE("Magplant mode set to `w"..CAPITALIZE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE)) end 
elseif ARGS[2] == "remote" then if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "REMOTE" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like magplant mode already set to `w"..CAPITALIZE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE)) return true else KONFIGURASI.LIST_MENU.MAGPLANT.MODE = "REMOTE" CONSOLE("Magplant mode set to `w"..CAPITALIZE(KONFIGURASI.LIST_MENU.MAGPLANT.MODE)) end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oMagplant Mode available are 'defaul, add, retrieve, select, remote'!") end return true
elseif COMMAND == ("/mmode") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oMagplant Mode available are 'defaul, add, retrieve, select, remote'!")
return true end

--if COMMAND == ("/getremote") then GETTING_REMOTE = true return true end

return false end)

AddHook("OnVariant", "VARIANT-MAGPLANT-MENU", function(Var)
if KONFIGURASI.LIST_MENU.MAGPLANT.TOGGLE then 
if Var[0] == "OnDialogRequest" and Var[1]:find("MAGPLANT") then POS_X = tonumber(Var[1]:match("|x|(%d+)")) POS_Y = tonumber(Var[1]:match("|y|(%d+)")) ITEM_ID = Var[1]:match("|left|(%d+)|\nadd_label|small|")
if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "ADD" then SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|"..POS_X.."|\ny|"..POS_Y.."|\nbuttonClicked|additems") return true end 
if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "RETRIEVE" then SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|"..POS_X.."|\ny|"..POS_Y.."|\nbuttonClicked|withdraw") if KONFIGURASI.ABILITY.FAST_TRASH then CHECK_TO_TRASH = true end return true end 
if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "SELECT" then SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|"..POS_X.."|\ny|"..POS_Y.."|\nitemToSelect|"..KONFIGURASI.LIST_MENU.MAGPLANT.ITEM) return true end 
if KONFIGURASI.LIST_MENU.MAGPLANT.MODE == "REMOTE" then SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|"..POS_X.."|\ny|"..POS_Y.."|\nbuttonClicked|getRemote") return true end 
end
end
if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_TOGGLE then
if Var[0] == "OnTextOverlay" and Var[1]:find("You don't have enough of those") then KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_TOGGLE = false CONSOLE("Auto Magplant `4deactivated `obecause there are no more items to trash") return true end
end
return false end)

-- End of Magplant Menu --

-- Skin Options Menu --
function DIALOG_SKIN() S = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Skin Menu|left|1420|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|SKIN_CUSTOM|`9Custom `]]..KONFIGURASI.UI.PRIMARY..[[Skin|staticBlueFrame|13000|
add_button_with_icon|SKIN_BROWN|`6Brown `]]..KONFIGURASI.UI.PRIMARY..[[Skin|staticYellowFrame|1744|
add_button_with_icon|SKIN_WHITE|`wWhite `]]..KONFIGURASI.UI.PRIMARY..[[Skin|staticYellowFrame|1156|
add_button_with_icon|SKIN_BLACK|`bPitch Black `]]..KONFIGURASI.UI.PRIMARY..[[Skin|staticYellowFrame|1158|
add_button_with_icon|SKIN_CREAM|`$Cream `]]..KONFIGURASI.UI.PRIMARY..[[Skin|staticYellowFrame|2498|
add_button_with_icon|SKIN_BLINK|`1B`2l`3i`4n`5k `]]..KONFIGURASI.UI.PRIMARY..[[Skin|staticYellowFrame|5272|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|LIST_MENU|                           Back                           |noflags|0|0|
end_dialog|SKIN_MENU|||
]] DIALOG(S, 500)  end

function DIALOG_CUSTOM_SKIN() S = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Custom Skin|left|13000|
add_spacer|small|
add_text_input|red|`4Red     :|]]..KONFIGURASI.LIST_MENU.SKIN_MENU.RED..[[|3|
add_text_input|green|`2Green :|]]..KONFIGURASI.LIST_MENU.SKIN_MENU.GREEN..[[|3|
add_text_input|blue|`1Blue    :|]]..KONFIGURASI.LIST_MENU.SKIN_MENU.BLUE..[[|3|
add_text_input|transparency|`wTransparency (max. 50) :|]]..KONFIGURASI.LIST_MENU.SKIN_MENU.TRANS..[[|3|
add_spacer|small|
add_quick_exit|
add_button|/skinmenu|               Back                |noflags|0|0|
end_dialog|skinpicker|    Close    |    Save    |
]] DIALOG(S, 500)  end

function BLINK_SKIN() local RANDOM_SKIN = {1685231359, 2022356223, 2190853119, 2527912447, 2864971775, 3033464831, 3370516479, 1348237567, 2749215231, 3317842431, 726390783, 713703935, 3578898943, 4042322175, 3531226367, 4023103999, 194314239, 1345519520} SendPacket(2,"action|setSkin\ncolor|".. RANDOM_SKIN[math.random(#RANDOM_SKIN)]); Sleep(50); end

AddHook("OnSendPacket", "PACKET-SKIN", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/skinmenu") or BUTTON == ("SKIN_MENU") then DIALOG_SKIN() return true end

if COMMAND == ("/skin") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "custom" then DIALOG_CUSTOM_SKIN()
elseif ARGS[2] == "black" or ARGS[2] == "hitam" then SendPacket(2,"action|dialog_return\ndialog_name|skinpicker\nred|0\ngreen|0\nblue|0\ntransparency|0") BUBBLE("Changed the skin to `bpitch black")
elseif ARGS[2] == "brown" or ARGS[2] == "coklat" then SendPacket(2,"action|setSkin\ncolor|1348237567") BUBBLE("Changed the skin to `6Brown")
elseif ARGS[2] == "white" or ARGS[2] == "putih" then SendPacket(2,"action|setSkin\ncolor|4042322175") BUBBLE("Changed the skin to `wWhite")
elseif ARGS[2] == "cream" or ARGS[2] == "krem" then SendPacket(2,"action|setSkin\ncolor|3370516479") BUBBLE("Changed the skin to `$Cream")
elseif ARGS[2] == "blink" then if not KONFIGURASI.LIST_MENU.SKIN_MENU.BLINK then KONFIGURASI.LIST_MENU.SKIN_MENU.BLINK = true BUBBLE("Blink Skin `2activated") else KONFIGURASI.LIST_MENU.SKIN_MENU.BLINK = false BUBBLE("Blink Skin `4deactivated") end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oSkin Command available are 'custom, black/hitam, brown/coklat, white/putih, cream/krem, blink'!") end return true 
elseif COMMAND == ("/skin") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oSkin Command available are 'custom, black/hitam, brown/coklat, white/putih, cream/krem, blink'!")
return true end

if BUTTON == ("SKIN_CUSTOM") then DIALOG_CUSTOM_SKIN() end
if BUTTON == ("SKIN_BLACK") then SendPacket(2,"action|dialog_return\ndialog_name|skinpicker\nred|0\ngreen|0\nblue|0\ntransparency|0") BUBBLE("Changed the skin to `bpitch black") end
if BUTTON == ("SKIN_BROWN") then SendPacket(2,"action|setSkin\ncolor|1348237567") BUBBLE("Changed the skin to `6Brown") end
if BUTTON == ("SKIN_WHITE") then SendPacket(2,"action|setSkin\ncolor|4042322175") BUBBLE("Changed the skin to `wWhite") end
if BUTTON == ("SKIN_CREAM") then SendPacket(2,"action|setSkin\ncolor|3370516479") BUBBLE("Changed the skin to `$Cream") end
if BUTTON == ("SKIN_BLINK") then if not KONFIGURASI.LIST_MENU.SKIN_MENU.BLINK then KONFIGURASI.LIST_MENU.SKIN_MENU.BLINK = true BUBBLE("Blink Skin `2activated") else KONFIGURASI.LIST_MENU.SKIN_MENU.BLINK = false BUBBLE("Blink Skin `4deactivated") end end

if S:find("dialog_name|skinpicker") then KONFIGURASI.LIST_MENU.SKIN_MENU.RED = string.sub(S, S:find("red|") + 4, S:find("green|") - 2) KONFIGURASI.LIST_MENU.SKIN_MENU.GREEN = string.sub(S, S:find("green|") + 6, S:find("blue|") - 2) KONFIGURASI.LIST_MENU.SKIN_MENU.BLUE = string.sub(S, S:find("blue|") + 5, S:find("transparency|") - 2) KONFIGURASI.LIST_MENU.SKIN_MENU.TRANS = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("transparency|") + 13) end
return false end)
-- End of Skin Options Menu --

-- Auto Join --
function DIALOG_AUTO_JOIN() if KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE then CONDITION = "`4Deactivate" else CONDITION = "`2Activate" end J = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Auto Join|left|13804|
add_spacer|small|
add_checkbox|AUTO_JOIN_TOGGLE|]]..CONDITION..[[ `]]..KONFIGURASI.UI.PRIMARY..[[Auto Join|]]..CHECKBOX(KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE)..[[|
text_scaling_string|textscalingstring|
add_button_with_icon|AUTO_JOIN_MSG_TOGGLE|Join Message|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE, "MSG")..[[|656||
add_button_with_icon|AUTO_JOIN_PULL_TOGGLE|Join Pull|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE, "PULL")..[[|274||
add_button_with_icon|AUTO_JOIN_KICK_TOGGLE|Join Kick|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE, "KICK")..[[|732||
add_button_with_icon|AUTO_JOIN_BAN_TOGGLE|Join Ban|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE, "BAN")..[[|278||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_textbox|`]]..KONFIGURASI.UI.SECONDARY..[[Auto Join Message `]]..KONFIGURASI.UI.PRIMARY..[[text :|
add_text_input|INPUT_AUTO_JOIN_MESSAGE||]]..KONFIGURASI.LIST_MENU.AUTO_JOIN.MESSAGE..[[|120|
add_smalltext|(This message is used for the Auto Join Message feature! Max Letter is 120)|
add_spacer|small|
add_button|LIST_MENU|                                                Back                                               |noflags|0|0|
add_quick_exit|
end_dialog|AUTO_JOIN|                    Close                    |                    Save                    |
]] DIALOG(J, 500) end 

AddHook("OnSendPacket", "PACKET-AUTO-JOIN", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/jm") or BUTTON == ("JOIN_MENU") then DIALOG_AUTO_JOIN() return true end
if COMMAND == ("/autojoin") then if not KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE then KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join `2activated") else KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join `4deactivated") end return true end
if TOGGLE:find("AUTO_JOIN_TOGGLE|1") and not KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE then KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE = true CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join `2activated") elseif TOGGLE:find("AUTO_JOIN_TOGGLE|0") and KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE then KONFIGURASI.LIST_MENU.AUTO_JOIN.TOGGLE = false CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join `4deactivated") end
if BUTTON == ("AUTO_JOIN_DEFAULT_TOGGLE") then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE ~= "" then KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "" DIALOG_AUTO_JOIN() end end
if BUTTON == ("AUTO_JOIN_MSG_TOGGLE") then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE ~= "MSG" then KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "MSG" DIALOG_AUTO_JOIN()  else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "" DIALOG_AUTO_JOIN() end end
if BUTTON == ("AUTO_JOIN_PULL_TOGGLE") then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE ~= "PULL" then KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "PULL" DIALOG_AUTO_JOIN()  else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "" DIALOG_AUTO_JOIN() end end
if BUTTON == ("AUTO_JOIN_KICK_TOGGLE") then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE ~= "KICK" then KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "KICK" DIALOG_AUTO_JOIN()  else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "" DIALOG_AUTO_JOIN() end end
if BUTTON == ("AUTO_JOIN_BAN_TOGGLE") then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE ~= "BAN" then KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "BAN" DIALOG_AUTO_JOIN()  else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "" DIALOG_AUTO_JOIN() end end
if S:find("INPUT_AUTO_JOIN_MESSAGE|") and not S:find("INPUT_AUTO_JOIN_MESSAGE|"..KONFIGURASI.LIST_MENU.AUTO_JOIN.MESSAGE) then KONFIGURASI.LIST_MENU.AUTO_JOIN.MESSAGE = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_AUTO_JOIN_MESSAGE|") + 24) CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join Message set to : `5"..KONFIGURASI.LIST_MENU.AUTO_JOIN.MESSAGE) end 

if COMMAND == ("/jmode") and ARGS[2] then ARGS[2] = ARGS[2]:lower() 
if ARGS[2] == "default" then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like join mode already set to `^Default") else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "" CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join Mode set to `^Default") end 
elseif ARGS[2] == "msg" then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE == "MSG" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like join mode already set to `wMessage") else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "MSG" CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join Mode set to `wMessage") end 
elseif ARGS[2] == "pull" then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE == "PULL" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like join mode already set to `wPull") else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "PULL" CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join Mode set to `wPull") end 
elseif ARGS[2] == "kick" then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE == "KICK" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like join mode already set to `wKick") else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "KICK" CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join Mode set to `wKick") end 
elseif ARGS[2] == "ban" then if KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE == "BAN" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like join mode already set to `wBan") else KONFIGURASI.LIST_MENU.AUTO_JOIN.MODE = "BAN" CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Join Mode set to `wBan") end 
elseif ARGS[2] == "text" then CONFIG_JOIN_MESSAGE = true BUBBLE("Write your join text in the chat column!")
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oJoin Mode available are 'default, msg, pull, kick, ban, text'!") end return true
elseif COMMAND == ("/jmode") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oJoin Mode available are 'default, msg, pull, kick, ban, text'!")
return true end
 
if CONFIG_JOIN_MESSAGE and S:find("action|input\n|text|(.+)") then local MESSAGE = S:match("action|input\n|text|(.+)") if MESSAGE == "" then CONSOLE("You must enter the join message correctly!") return true end KONFIGURASI.LIST_MENU.AUTO_JOIN.MESSAGE = MESSAGE CONSOLE("Auto Join Message set to : "..KONFIGURASI.LIST_MENU.AUTO_JOIN.MESSAGE) CONFIG_JOIN_MESSAGE = false return true end

return false end)
-- End of Auto Join --

-- Give Access --
function DIALOG_GIVE_ACCESS() A = tostring("set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.LIST_MENU.GIVE_ACCESS.TEXT.TITLE.."|left|1424|\nadd_spacer|small|\nadd_smalltext|"..CUSTOM_TEXT.LIST_MENU.GIVE_ACCESS.TEXT.DESCRIPTION.."|\nadd_spacer|small|\nadd_player_picker|PICKPLAYER|Pick Player|\nadd_quick_exit|\nadd_button|LIST_MENU|Back|noflags|0|0|\nend_dialog|GIVE_ACCESS|||") DIALOG(A, 500) end

AddHook("OnSendPacket", "PACKET-GIVE-ACCESS", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/access") or BUTTON == ("ACCESS_MENU") then DIALOG_GIVE_ACCESS() return true end
if S:find("PICKPLAYER|(%d+)") then NET_ID = tonumber(S:match("PICKPLAYER|(%d+)")) if GetLocal().netid == NET_ID then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou can't give access to yourself, captain.") return true else GIVE_ACCESS = true end end
return false end)
-- End of Give Acces --

-- World Feature --
function DIALOG_WORLD() W = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|World Feature|left|3802|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|PRESENCE|Presence|staticBlueFrame|1126||
add_button_with_icon|MESSAGE_ALL|Message All|staticBlueFrame|5804||
add_button_with_icon|TRADE_ALL|Trade All|staticBlueFrame|5308||
add_button_with_icon|PULL_ALL|Pull All|staticBlueFrame|6822||
add_button_with_icon|KICK_ALL|Kick All|staticBlueFrame|6276||
add_button_with_icon|BAN_ALL|Ban All|staticBlueFrame|6278||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_textbox|`]]..KONFIGURASI.UI.SECONDARY..[[World Feature Message `]]..KONFIGURASI.UI.PRIMARY..[[text :|
add_text_input|INPUT_WORLD_FEATURE_MESSAGE||]]..KONFIGURASI.LIST_MENU.WORLD_FEATURE.MESSAGE..[[|120|
add_smalltext|(This message is used for the Message All feature! Max Letter is 120)|
add_spacer|small|
add_quick_exit|
add_button|LIST_MENU|                                               Back                                                |noflags|0|0|
end_dialog|WORLD_FEATURE|                     Close                   |                   Save                     |
]] DIALOG(W, 500) end

AddHook("OnSendPacket", "PACKET-WORLD-FEATURE", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/world") or BUTTON == ("WORLD_MENU") then DIALOG_WORLD() return true end
if COMMAND == ("/windah") or COMMAND == ("/presence") or COMMAND == ("/absen") or BUTTON == ("PRESENCE") then WORLD_PRESENCE = true return true end
if COMMAND == ("/mall") or BUTTON == ("MESSAGE_ALL") then WORLD_MESSAGE = true return true end
if COMMAND == ("/tall") or BUTTON == ("TRADE_ALL") then WORLD_TRADE = true return true end
if COMMAND == ("/pall") or BUTTON == ("PULL_ALL") then WORLD_PULL = true return true end
if COMMAND == ("/kall") or BUTTON == ("KICK_ALL") then WORLD_KICK = true return true end
if COMMAND == ("/ball") or BUTTON == ("BAN_ALL") then WORLD_BAN = true return true end
if S:find("INPUT_WORLD_FEATURE_MESSAGE|(.+)") then local MESSAGE = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_WORLD_FEATURE_MESSAGE|") + 28) if MESSAGE == KONFIGURASI.LIST_MENU.WORLD_FEATURE.MESSAGE then return true else KONFIGURASI.LIST_MENU.WORLD_FEATURE.MESSAGE = MESSAGE CONSOLE("Message ALL set to : "..KONFIGURASI.LIST_MENU.WORLD_FEATURE.MESSAGE) end end 

return false end)
-- End of World Feature --

-- Weather Feature --
function DIALOG_WEATHER_LIST() WL = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Weather List|left|932|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|CHANGE_WEATHER 1|Beach|staticBlueFrame|830||
add_button_with_icon|CHANGE_WEATHER 2|Night|staticBlueFrame|934||
add_button_with_icon|CHANGE_WEATHER 3|Arid|staticBlueFrame|946||
add_button_with_icon|CHANGE_WEATHER 5|Rainy City|staticBlueFrame|984||
add_button_with_icon|CHANGE_WEATHER 6|Harvest Moon|staticBlueFrame|1060||
add_button_with_icon|CHANGE_WEATHER 7|Mars|staticBlueFrame|1136||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 8|Spooky|staticBlueFrame|1210||
add_button_with_icon|CHANGE_WEATHER 9|Growganoth|staticBlueFrame|4150||
add_button_with_icon|CHANGE_WEATHER 10|Nothingness|staticBlueFrame|1490||
add_button_with_icon|CHANGE_WEATHER 11|Snowy|staticBlueFrame|1364||
add_button_with_icon|CHANGE_WEATHER 12|Growch Angry|staticBlueFrame|1364||
add_button_with_icon|CHANGE_WEATHER 13|Growch Happy|staticBlueFrame|1364||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 14|Undersea|staticBlueFrame|1532||
add_button_with_icon|CHANGE_WEATHER 15|Warp Speed|staticBlueFrame|1750||
add_button_with_icon|CHANGE_WEATHER 16|Comet Day|staticBlueFrame|2034||
add_button_with_icon|CHANGE_WEATHER 17|Comet|staticBlueFrame|2046||
add_button_with_icon|CHANGE_WEATHER 18|Party|staticBlueFrame|2284||
add_button_with_icon|CHANGE_WEATHER 19|Pineapple|staticBlueFrame|2744||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 20|Snowy Night|staticBlueFrame|3252||
add_button_with_icon|CHANGE_WEATHER 21|Spring|staticBlueFrame|3446||
add_button_with_icon|CHANGE_WEATHER 22|Howling Sky|staticBlueFrame|3534||
add_button_with_icon|CHANGE_WEATHER 24|`5Heatwave|staticBlueFrame|3694||
add_button_with_icon|CHANGE_WEATHER 25|`6Heatwave|staticBlueFrame|3694||
add_button_with_icon|CHANGE_WEATHER 26|`2Heatwave|staticBlueFrame|3694||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 27|`1Heatwave|staticBlueFrame|3694||
add_button_with_icon|CHANGE_WEATHER 28|`4Heatwave|staticBlueFrame|3694||
add_button_with_icon|CHANGE_WEATHER 29|Stuff|staticBlueFrame|3832||
add_button_with_icon|CHANGE_WEATHER 30|Pagoda|staticBlueFrame|4242||
add_button_with_icon|CHANGE_WEATHER 31|Apocalypse|staticBlueFrame|4486||
add_button_with_icon|CHANGE_WEATHER 32|Jungle|staticBlueFrame|4776||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 33|Balloon Wars|staticBlueFrame|4892||
add_button_with_icon|CHANGE_WEATHER 34|Background|staticBlueFrame|5000||
add_button_with_icon|CHANGE_WEATHER 35|Autumn|staticBlueFrame|5112||
add_button_with_icon|CHANGE_WEATHER 36|Valentine|staticBlueFrame|5654||
add_button_with_icon|CHANGE_WEATHER 37|St. Patricks|staticBlueFrame|5716||
add_button_with_icon|CHANGE_WEATHER 38|Epoch Ice|staticBlueFrame|5958||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 39|Epoch Volcano|staticBlueFrame|5958||
add_button_with_icon|CHANGE_WEATHER 40|Epoch Island|staticBlueFrame|5958||
add_button_with_icon|CHANGE_WEATHER 41|Guild|staticBlueFrame|6280||
add_button_with_icon|CHANGE_WEATHER 42|Digital Rain|staticBlueFrame|6854||
add_button_with_icon|CHANGE_WEATHER 43|Monochrome|staticBlueFrame|7380||
add_button_with_icon|CHANGE_WEATHER 44|Frozen Cliffs|staticBlueFrame|7644||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 45|Hospital|staticBlueFrame|8556||
add_button_with_icon|CHANGE_WEATHER 46|Bountiful|staticBlueFrame|8738||
add_button_with_icon|CHANGE_WEATHER 47|Meteor Shower|staticBlueFrame|8896||
add_button_with_icon|CHANGE_WEATHER 48|Stargazing|staticBlueFrame|8836||
add_button_with_icon|CHANGE_WEATHER 49|Ascended Ship|staticBlueFrame|6424||
add_button_with_icon|CHANGE_WEATHER 50|Descended Ship|staticBlueFrame|6666||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 51|Celebrity Hills|staticBlueFrame|10286||
add_button_with_icon|CHANGE_WEATHER 53|Legendary|staticBlueFrame|10410||
add_button_with_icon|CHANGE_WEATHER 54|Black Dragon|staticBlueFrame|]]..GetItemInfo("Weather Machine - Black Dragon").id..[[||
add_button_with_icon|CHANGE_WEATHER 55|Prince of Persia|staticBlueFrame|]]..GetItemInfo("Weather Machine - Prince Of Persia").id..[[||
add_button_with_icon|CHANGE_WEATHER 58|Radical City|staticBlueFrame|]]..GetItemInfo("Weather Machine - Radical City").id..[[||
add_button_with_icon|CHANGE_WEATHER 59|Plaza|staticBlueFrame|11880||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 60|Nebula|staticBlueFrame|12054||
add_button_with_icon|CHANGE_WEATHER 61|Protostar Landing|staticBlueFrame|12056||
add_button_with_icon|CHANGE_WEATHER 62|Dark Mountains|staticBlueFrame|12408||
add_button_with_icon|CHANGE_WEATHER 63|Assassin's Creed|staticBlueFrame|12654||
add_button_with_icon|CHANGE_WEATHER 64|Mt.Growmore|staticBlueFrame|12844||
add_button_with_icon|CHANGE_WEATHER 65|Crack in Reality|staticBlueFrame|13004||
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|CHANGE_WEATHER 66|Nian's Mountains|staticBlueFrame|13070||
add_button_with_icon|CHANGE_WEATHER 67|Rayman Lock|staticBlueFrame|13200||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_smalltext|`4Unknown weather code `]]..KONFIGURASI.UI.PRIMARY..[[: 4, 23, 52, 56, 57|
add_spacer|small|
add_quick_exit|
end_dialog|WEATHER_LIST|Close||
]] DIALOG(WL, 500) end

function CHECK_WEATHER(I) local RESULT = "" if I == 1 then RESULT = "Beach" end if I == 2 then RESULT = "Night" end if I == 3 then RESULT = "Arid" end if I == 5 then RESULT = "Rainy City" end if I == 6 then RESULT = "Harvest" end if I == 7 then RESULT = "Mars" end if I == 8 then RESULT = "Spooky" end if I == 9 then RESULT = "Growganoth" end if I == 10 then RESULT = "Nothingness" end if I == 11 then RESULT = "Snowy" end if I == 12 then RESULT = "Growch Angry" end if I == 13 then RESULT = "Growch Happy" end if I == 14 then RESULT = "Undersea" end if I == 15 then RESULT = "Warp Speed" end if I == 16 then RESULT = "Comet Day" end if I == 17 then RESULT = "Comet" end if I == 18 then RESULT = "Party" end if I == 19 then RESULT = "Pineapple" end if I == 20 then RESULT = "Snowy Night" end if I == 21 then RESULT = "Spring" end if I == 22 then RESULT = "Howling Sky" end if I == 24 then RESULT = "`5Heatwave" end if I == 25 then RESULT = "`6Heatwave" end if I == 26 then RESULT = "`2Heatwave" end if I == 27 then RESULT = "`1Heatwave" end if I == 28 then RESULT = "`4Heatwave" end if I == 29 then RESULT = "Stuff" end if I == 30 then RESULT = "Pagoda" end if I == 31 then RESULT = "Apocalypse" end if I == 32 then RESULT = "Jungle" end if I == 33 then RESULT = "Balloon Wars" end if I == 34 then RESULT = "Background" end if I == 35 then RESULT = "Autumn" end if I == 36 then RESULT = "Valentine" end if I == 37 then RESULT = "St. Patricks" end if I == 38 then RESULT = "Epoch Ice" end if I == 39 then RESULT = "Epoch Volcano" end if I == 40 then RESULT = "Epoch Island" end if I == 41 then RESULT = "Guild" end if I == 42 then RESULT = "Digital Rain" end if I == 43 then RESULT = "Monochrome" end if I == 44 then RESULT = "Frozen Cliffs" end if I == 45 then RESULT = "Hospital" end if I == 46 then RESULT = "Bountiful" end if I == 47 then RESULT = "Meteor Shower" end if I == 48 then RESULT = "Stargazing" end if I == 49 then RESULT = "Ascended Ship" end if I == 50 then RESULT = "Descended Ship" end if I == 51 then RESULT = "Celebrity Hills" end if I == 53 then RESULT = "Legendary City" end if I == 54 then RESULT = "Blood Dragon" end if I == 55 then RESULT = "Prince Of Persia" end if I == 58 then RESULT = "Radical City" end if I == 59 then RESULT = "Plaza" end if I == 60 then RESULT = "Nebula" end if I == 61 then RESULT = "Protostar Landing" end if I == 62 then RESULT = "Dark Mountains" end if I == 63 then RESULT = "Assassin's Creed" end if I == 64 then RESULT = "Mt. Growmore" end if I == 65 then RESULT = "Crack In Reality" end if I == 66 then RESULT = "Nian's Mountains" end if I == 67 then RESULT = "Rayman Lock" end return BUBBLE("Change Weather to : "..RESULT) end

AddHook("OnSendPacket", "PACKET-WEATHER", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/weatherlist") or BUTTON == ("WEATHER_LIST") then DIALOG_WEATHER_LIST() return true end
if COMMAND == ("/weather") and ARGS[2] then if ARGS[2] == nil or ARGS[2] == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou must execute the command correctly! `5/weather <id>") return true end WEATHER_ID = tonumber(ARGS[2]) if WEATHER_ID > 67 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oWeather ID available from 1-67!") return true end CHECK_WEATHER(WEATHER_ID) CHANGE_WEATHER = true return true elseif COMMAND == ("/weather") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou must execute the command correctly! `5/weather <id>") return true end 

if S:find("buttonClicked|CHANGE_WEATHER (%d+)") then WEATHER_ID = tonumber(ARGS[2]) CHECK_WEATHER(WEATHER_ID) CHANGE_WEATHER = true  return true end  

return false end)
-- End of Weather Feature --

-- Bubble Menu --
function DIALOG_BUBBLE_MENU() B = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Bubble Menu|left|10114|
add_spacer|small|
text_scaling_string|textscalingstring|
add_checkicon|IGNORE_GEMS_TOGGLE|Ignore Gems|]]..FRAME(KONFIGURASI.BUBBLE.GEMS_BUBBLE)..[[|5774||]]..CHECKBOX(KONFIGURASI.BUBBLE.GEMS_BUBBLE)..[[|
add_checkicon|DROP_BUBBLE_TOGGLE|Drop Bubble|]]..FRAME(KONFIGURASI.BUBBLE.DROP_BUBBLE)..[[|6274||]]..CHECKBOX(KONFIGURASI.BUBBLE.DROP_BUBBLE)..[[|
add_checkicon|COLLECT_BUBBLE_TOGGLE|Collect Bubble|]]..FRAME(KONFIGURASI.BUBBLE.COLLECT_BUBBLE)..[[|6276||]]..CHECKBOX(KONFIGURASI.BUBBLE.COLLECT_BUBBLE)..[[|
add_checkicon|TRASH_BUBBLE_TOGGLE|Trash Bubble|]]..FRAME(KONFIGURASI.BUBBLE.TRASH_BUBBLE)..[[|5812||]]..CHECKBOX(KONFIGURASI.BUBBLE.TRASH_BUBBLE)..[[|
add_button_with_icon||END_LIST||0||
add_checkicon|DEPOSIT_BUBBLE_TOGGLE|Deposit Bubble|]]..FRAME(KONFIGURASI.BUBBLE.DEPOSIT_BUBBLE)..[[|5770||]]..CHECKBOX(KONFIGURASI.BUBBLE.DEPOSIT_BUBBLE)..[[|
add_checkicon|WITHDRAW_BUBBLE_TOGGLE|Withdraw Bubble|]]..FRAME(KONFIGURASI.BUBBLE.WITHDRAW_BUBBLE)..[[|7656||]]..CHECKBOX(KONFIGURASI.BUBBLE.WITHDRAW_BUBBLE)..[[|
add_button_with_icon|PULL_BUBBLE|Pull Bubble|staticBlueFrame|5804|
add_button_with_icon|BTK_BUBBLE|BTK Bubble|staticBlueFrame|340|
add_button_with_icon||END_LIST||0||
add_button_with_icon|CUSTOM_CHAT|Custom Chat|staticBlueFrame|12438|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_button|LIST_MENU|                Back                |noflags|0|0|
add_quick_exit|
end_dialog|BUBBLE_MENU|   Cancel   |    Save    |
]] DIALOG(B, 500) end

function DIALOG_PULL_BUBBLE() local CONDITION = "" if KONFIGURASI.BUBBLE.PULL_BUBBLE then CONDITION = "`4Deactivate `wPull Bubble" else CONDITION = "`2Activate `wPull Bubble" end  B = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Pull Bubble Menu|left|5804|
add_spacer|small|
add_checkbox|PULL_BUBBLE_TOGGLE|]]..CONDITION..[[|]]..CHECKBOX(KONFIGURASI.BUBBLE.PULL_BUBBLE)..[[|
add_textbox|`]]..KONFIGURASI.UI.SECONDARY..[[Pull Bubble `]]..KONFIGURASI.UI.PRIMARY..[[text :|
add_text_input|INPUT_PULL_BUBBLE_TEXT||]]..CUSTOM_TEXT.BUBBLE.WRENCH.PULL_BUBBLE..[[|50|
add_smalltext|`]]..KONFIGURASI.UI.NOTE..[[Note `]]..KONFIGURASI.UI.PRIMARY..[[: Maximum 50 letters, including color code. This text will appear when you pull someone|
add_spacer|small|
add_button|BUBBLE_MENU|                                                Back                                                 |noflags|0|0|
add_quick_exit|
end_dialog|PULL_BUBBLE|                    Cancel                 |                    Save                      |
]] DIALOG(B, 500) end

function DIALOG_BTK_BUBBLE() local CONDITION = "" if KONFIGURASI.BUBBLE.BTK_BUBBLE then CONDITION = "`4Deactivate `"..KONFIGURASI.UI.PRIMARY.."BTK Bubble" else CONDITION = "`2Activate `"..KONFIGURASI.UI.PRIMARY.."BTK Bubble" end  B = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|BTK Bubble Menu|left|340|
add_spacer|small|
add_checkbox|BTK_BUBBLE_TOGGLE|]]..CONDITION..[[|]]..CHECKBOX(KONFIGURASI.BUBBLE.BTK_BUBBLE)..[[|
add_textbox|`]]..KONFIGURASI.UI.SECONDARY..[[Collect Bet Bubble `]]..KONFIGURASI.UI.PRIMARY..[[text :|
add_text_input|INPUT_COLLECT_BET_BUBBLE_TEXT||]]..CUSTOM_TEXT.BUBBLE.BTK.COLLECT_BET..[[|50|
add_smalltext|`]]..KONFIGURASI.UI.NOTE..[[Note `]]..KONFIGURASI.UI.PRIMARY..[[: Maximum 50 letters, including color code. This text will appear when you pull someone|
add_spacer|small|
add_textbox|`]]..KONFIGURASI.UI.SECONDARY..[[Drop Winner Bubble `]]..KONFIGURASI.UI.PRIMARY..[[text :|
add_text_input|INPUT_DROP_WINNER_BUBBLE_TEXT||]]..CUSTOM_TEXT.BUBBLE.BTK.DROP_WINNER..[[|50|
add_smalltext|`]]..KONFIGURASI.UI.NOTE..[[Note `]]..KONFIGURASI.UI.PRIMARY..[[: Maximum 50 letters, including color code. This text will appear when you pull someone|
add_spacer|small|
add_button|BUBBLE_MENU|                                                Back                                                 |noflags|0|0|
add_quick_exit|
end_dialog|BTK_BUBBLE|                    Cancel                 |                    Save                      |
]] DIALOG(B, 500) end

function DIALOG_CUSTOM_CHAT() if KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "FRONT" then CONDITION = "Front of Text" ICON = 428 elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "BEHIND" then CONDITION = "Behind the Text" ICON = 430 end CC = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Custom Chat|left|12438|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|RAINBOW_CHAT_TOGGLE|Rainbow Chat|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE, "RAINBOW")..[[|2590|
add_button_with_icon|COLOR_CHAT_TOGGLE|Color Chat|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE, "COLOR")..[[|12436|
add_button_with_icon|EMOJI_CHAT_MENU|Emoji Chat|staticBlueFrame|7232|
add_button_with_icon|LETTER_CHAT_MENU|Letter Chat|staticBlueFrame|8282|
add_button_with_icon|POSITION_CHAT_TOGGLE|]]..CONDITION..[[|staticPurpleFrame|]]..ICON..[[|
add_button_with_icon||END_LIST||0||
add_text_input|INPUT_COLOR|`]]..KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR..[[Change Color :|]]..KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR..[[|15|
add_text_input|INPUT_LETTER|Change Letter :|]]..KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER..[[|15|
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.NOTE..[[Note `]]..KONFIGURASI.UI.PRIMARY..[[: Color and Emoji must be on the list|
add_spacer|small|
add_button|BUBBLE_MENU|                       Back                       |noflags|0|0|
add_quick_exit|
end_dialog|CUSTOM_CHAT|       Cancel       |       Save       |
]] DIALOG(CC, 500) end

RANDOMIZE_EMOJI = {"(agree)","(alien)","(bheart)","(build)","(bunny)","(cactus)","(cake)","(clap)","(cool)","(cry)","(dance)","(eyes)","(evil)","(fireworks)","(football)","(gems)","(ghost)","(gift)","(grin)","(grow)","(gtoken)","(halo)","(heart)","(heartarrow)","(ill)","(kiss)","(lol)","(love)","(lucky)","(mad)","(megaphone)","(music)","(moyai)","(no)","(nuke)","(oops)","(party)","(peace)","(pine)","(pizza)","(plead)","(punch)","(see-no-evil)","(shamrock)","(shy)","(sigh)","(sleep)","(smile)","(song)","(terror)","(tongue)","(troll)","(turkey)","(vend)","(weary)","(wink)","(wl)","(wow)","(yes)"}

function DIALOG_EMOJI_CHAT() if KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then CONDITION_RANDOM_EMOJI = "`4Deactivate" else CONDITION_RANDOM_EMOJI = "`2Activate" end if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE then CONDITION_EMOJI_CHAT = "`4Deactivate" else CONDITION_EMOJI_CHAT = "`2Activate" end local D = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Emoji Chat|left|7232|
add_spacer|small|
add_checkbox|EMOJI_CHAT_TOGGLE|]]..CONDITION_EMOJI_CHAT..[[ `]]..KONFIGURASI.UI.PRIMARY..[[Emoji Chat|]]..CHECKBOX(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE)..[[|
add_smalltext|Choose the Emoji :|
text_scaling_string|textscalingstring|
add_button_with_icon|TYPE_EMOJIS_WL|World Lock|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(wl)")..[[|5770|
add_button_with_icon|TYPE_EMOJIS_GROW|Grow|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(grow)")..[[|5772|
add_button_with_icon|TYPE_EMOJIS_GEMS|Gems|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(gems)")..[[|5774|
add_button_with_icon|TYPE_EMOJIS_GTOKEN|Growtoken|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(gtoken)")..[[|5776|
add_button_with_icon|TYPE_EMOJIS_VEND|Vend|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(vend)")..[[|5778|
add_button_with_icon|TYPE_EMOJIS_OOPS|Oops|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(oops)")..[[|5804|
add_button_with_icon|TYPE_EMOJIS_SLEEP|Sleep|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(sleep)")..[[|5806|
add_button_with_icon|TYPE_EMOJIS_PUNCH|Punch|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(punch)")..[[|5808|
add_button_with_icon||END_LIST|noflags|0|0|
add_button_with_icon|TYPE_EMOJIS_BHEART|Broken Heart|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(bheart)")..[[|5810|
add_button_with_icon|TYPE_EMOJIS_CRY|Cry|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(cry)")..[[|5812|
add_button_with_icon|TYPE_EMOJIS_BUNNY|Bunny|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(bunny)")..[[|6002|
add_button_with_icon|TYPE_EMOJIS_CACTUS|Cactus|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(cactus)")..[[|6052|
add_button_with_icon|TYPE_EMOJIS_PINE|Pineapple|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(pine)")..[[|6122|
add_button_with_icon|TYPE_EMOJIS_PEACE|Peace Sign|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(peace)")..[[|6272|
add_button_with_icon|TYPE_EMOJIS_TERROR|Terrified Face|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(terror)")..[[|6274|
add_button_with_icon|TYPE_EMOJIS_TROLL|Trollface|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(troll)")..[[|6276|
add_button_with_icon||END_LIST|noflags|0|0|
add_button_with_icon|TYPE_EMOJIS_EVIL|Evil|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(evil)")..[[|6278|
add_button_with_icon|TYPE_EMOJIS_FIREWORK|Firework|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(fireworks)")..[[|6322|
add_button_with_icon|TYPE_EMOJIS_FOOTBALL|Football|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(football)")..[[|6672|
add_button_with_icon|TYPE_EMOJIS_ALIEN|Alien|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(alien)")..[[|6744|
add_button_with_icon|TYPE_EMOJIS_PARTY|Party|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(party)")..[[|6822|
add_button_with_icon|TYPE_EMOJIS_CLAP|Clap|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(clap)")..[[|6894|
add_button_with_icon|TYPE_EMOJIS_SONGPYEON|Songpyeon|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(songpyeon)")..[[|7062|
add_button_with_icon|TYPE_EMOJIS_GHOST|Ghost|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(ghost)")..[[|7130|
add_button_with_icon||END_LIST|noflags|0|0|
add_button_with_icon|TYPE_EMOJIS_HALO|Halo|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(halo)")..[[|7232|
add_button_with_icon|TYPE_EMOJIS_NUKE|Nuke|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(nuke)")..[[|7234|
add_button_with_icon|TYPE_EMOJIS_TURKEY|Turkey|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(turkey)")..[[|7370|
add_button_with_icon|TYPE_EMOJIS_GIFT|Gift|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(gift)")..[[|7474|
add_button_with_icon|TYPE_EMOJIS_HEARTARROW|Heart Arrow|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(heartarrow)")..[[|7684|
add_button_with_icon|TYPE_EMOJIS_LUCKY|Lucky|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(lucky)")..[[|7698|
add_button_with_icon|TYPE_EMOJIS_SHAMROCK|Shamrock|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(shamrock)")..[[|7932|
add_button_with_icon|TYPE_EMOJIS_GRIN|Grin|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(grin)")..[[|8028|
add_button_with_icon||END_LIST|noflags|0|0|
add_button_with_icon|TYPE_EMOJIS_ILL|Ill|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(ill)")..[[|8416|
add_button_with_icon|TYPE_EMOJIS_EYES|Eyes|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(eyes)")..[[|10114|
add_button_with_icon|TYPE_EMOJIS_WEARY|Weary|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(weary)")..[[|10116|
add_button_with_icon|TYPE_EMOJIS_PLEAD|Plead|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(plead)")..[[|12542|
add_button_with_icon|TYPE_EMOJIS_MOYAI|Moyai|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(moyai)")..[[|12544|
add_button_with_icon|TYPE_EMOJIS_PIZZA|Pizza|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(pizza)")..[[|6824|
add_button_with_icon|TYPE_EMOJIS_CAKE|Cake|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(cake)")..[[|]]..GetItemInfo("Cake").id..[[|
add_button_with_icon|TYPE_EMOJIS_HEART|Heart|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(heart)")..[[|384|
add_button_with_icon||END_LIST|noflags|0|0|
add_button_with_icon|TYPE_EMOJIS_LOL|Lol|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(lol)")..[[|10108|
add_button_with_icon|TYPE_EMOJIS_WOW|Wow|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(wow)")..[[|10106|
add_button_with_icon|TYPE_EMOJIS_COOL|Cool|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(cool)")..[[|10110|
add_button_with_icon|TYPE_EMOJIS_KISS|Kiss|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(kiss)")..[[|9312|
add_button_with_icon|TYPE_EMOJIS_LOVE|Love|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(love)")..[[|10638|
add_button_with_icon|TYPE_EMOJIS_SHY|Shy|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(shy)")..[[|10096|
add_button_with_icon|TYPE_EMOJIS_TONGUE|Tongue|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(tongue)")..[[|8832|
add_button_with_icon|TYPE_EMOJIS_SMILE|Smile|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(smile)")..[[|8224|
add_button_with_icon||END_LIST|noflags|0|0|
add_button_with_icon|TYPE_EMOJIS_SIGH|Sigh|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(sigh)")..[[|13192|
add_button_with_icon|TYPE_EMOJIS_WINK|Wink|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(wink)")..[[|]]..GetItemInfo("ReGrowtopian NPC").id..[[|
add_button_with_icon|TYPE_EMOJIS_YES|Yes|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(yes)")..[[|13122|
add_button_with_icon|TYPE_EMOJIS_MEGAPHONE|Megaphone|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(megaphone)")..[[|2480|
add_button_with_icon|TYPE_EMOJIS_MUSIC|Music|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(music)")..[[|2290|
add_button_with_icon|TYPE_EMOJIS_SEENOEVIL|See-No-Evil|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(see-no-evil)")..[[|2900|
add_button_with_icon|TYPE_EMOJIS_DANCE|Dance|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(dance)")..[[|4374|
add_button_with_icon|TYPE_EMOJIS_BUILD|Build|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(build)")..[[|4908|
add_button_with_icon||END_LIST|noflags|0|0|
add_button_with_icon|TYPE_EMOJIS_MAD|Mad|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(mad)")..[[|2368|
add_button_with_icon|TYPE_EMOJIS_NO|No|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(no)")..[[|2364|
add_button_with_icon|TYPE_EMOJIS_AGREE|Agree|]]..FRAME_MODE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI, "(agree)")..[[|2366|
add_button_with_icon||END_LIST|noflags|0|0|
add_smalltext|Optional :|
add_checkbox|RANDOM_EMOJI_TOGGLE|]]..CONDITION_RANDOM_EMOJI..[[ `wRandom Emoji|]]..CHECKBOX(KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI)..[[|
add_button|CUSTOM_CHAT|                          Back to Custom Chat                         |noflags|0|0|
add_quick_exit|
end_dialog|EMOJI_CHAT_MENU|               Cancel               |               Save                |
]] DIALOG(D, 500)
end

AddHook("OnSendPacket", "PACKET-BUBBLE", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/bubble") or COMMAND == ("/bm") or BUTTON == ("BUBBLE_MENU") then DIALOG_BUBBLE_MENU() return true end

if TOGGLE:find("IGNORE_GEMS_TOGGLE|1") and not KONFIGURASI.BUBBLE.GEMS_BUBBLE then KONFIGURASI.BUBBLE.GEMS_BUBBLE = true CONSOLE("Ignore Gems `2activated") elseif TOGGLE:find("IGNORE_GEMS_TOGGLE|0") and KONFIGURASI.BUBBLE.GEMS_BUBBLE then KONFIGURASI.BUBBLE.GEMS_BUBBLE = false CONSOLE("Ignore Gems `4deactivated") end
if TOGGLE:find("DROP_BUBBLE_TOGGLE|1") and not KONFIGURASI.BUBBLE.DROP_BUBBLE then KONFIGURASI.BUBBLE.DROP_BUBBLE = true CONSOLE("Drop Bubble `2activated") elseif TOGGLE:find("DROP_BUBBLE_TOGGLE|0") and KONFIGURASI.BUBBLE.DROP_BUBBLE then KONFIGURASI.BUBBLE.DROP_BUBBLE = false CONSOLE("Drop Bubble `4deactivated") end
if TOGGLE:find("COLLECT_BUBBLE_TOGGLE|1") and not KONFIGURASI.BUBBLE.COLLECT_BUBBLE then KONFIGURASI.BUBBLE.COLLECT_BUBBLE = true CONSOLE("Collect Bubble `2activated") elseif TOGGLE:find("COLLECT_BUBBLE_TOGGLE|0") and KONFIGURASI.BUBBLE.COLLECT_BUBBLE then KONFIGURASI.BUBBLE.COLLECT_BUBBLE = false CONSOLE("Collect Bubble `4deactivated") end
if TOGGLE:find("TRASH_BUBBLE_TOGGLE|1") and not KONFIGURASI.BUBBLE.TRASH_BUBBLE then KONFIGURASI.BUBBLE.TRASH_BUBBLE = true CONSOLE("Trash Bubble `2activated") elseif TOGGLE:find("TRASH_BUBBLE_TOGGLE|0") and KONFIGURASI.BUBBLE.TRASH_BUBBLE then KONFIGURASI.BUBBLE.TRASH_BUBBLE = false CONSOLE("Trash Bubble `4deactivated") end
if TOGGLE:find("DEPOSIT_BUBBLE_TOGGLE|1") and not KONFIGURASI.BUBBLE.DEPOSIT_BUBBLE then KONFIGURASI.BUBBLE.DEPOSIT_BUBBLE = true CONSOLE("Deposit Bubble `2activated") elseif TOGGLE:find("DEPOSIT_BUBBLE_TOGGLE|0") and KONFIGURASI.BUBBLE.DEPOSIT_BUBBLE then KONFIGURASI.BUBBLE.DEPOSIT_BUBBLE = false CONSOLE("Deposit Bubble `4deactivated") end
if TOGGLE:find("WITHDRAW_BUBBLE_TOGGLE|1") and not KONFIGURASI.BUBBLE.WITHDRAW_BUBBLE then KONFIGURASI.BUBBLE.WITHDRAW_BUBBLE = true CONSOLE("Withdraw Bubble `2activated") elseif TOGGLE:find("WITHDRAW_BUBBLE_TOGGLE|0") and KONFIGURASI.BUBBLE.WITHDRAW_BUBBLE then KONFIGURASI.BUBBLE.WITHDRAW_BUBBLE = false CONSOLE("Withdraw Bubble `4deactivated") end

if BUTTON == ("PULL_BUBBLE") then DIALOG_PULL_BUBBLE() return true end
if TOGGLE:find("PULL_BUBBLE_TOGGLE|1") and not KONFIGURASI.BUBBLE.PULL_BUBBLE then KONFIGURASI.BUBBLE.PULL_BUBBLE = true CONSOLE("Pull Bubble `2activated") elseif TOGGLE:find("PULL_BUBBLE_TOGGLE|0") and KONFIGURASI.BUBBLE.PULL_BUBBLE then KONFIGURASI.BUBBLE.PULL_BUBBLE = false CONSOLE("Pull Bubble `4deactivated") end
if S:find("INPUT_PULL_BUBBLE_TEXT|") then local MESSAGE = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_PULL_BUBBLE_TEXT|") + 23) if MESSAGE ~= CUSTOM_TEXT.BUBBLE.WRENCH.PULL_BUBBLE then CUSTOM_TEXT.BUBBLE.WRENCH.PULL_BUBBLE = MESSAGE CONSOLE("Pull bubble text set to : "..CUSTOM_TEXT.BUBBLE.WRENCH.PULL_BUBBLE) end end 
if COMMAND == ("/pb") then if not KONFIGURASI.BUBBLE.PULL_BUBBLE then KONFIGURASI.BUBBLE.PULL_BUBBLE = true CONSOLE("Pull Bubble `2activated") else KONFIGURASI.BUBBLE.PULL_BUBBLE = false CONSOLE("Pull Bubble `4deactivated") end return true end 

if BUTTON == ("BTK_BUBBLE") then DIALOG_BTK_BUBBLE() return true end
if TOGGLE:find("BTK_BUBBLE_TOGGLE|1") and not KONFIGURASI.BUBBLE.BTK_BUBBLE then KONFIGURASI.BUBBLE.BTK_BUBBLE = true CONSOLE("BTK Bubble `2activated") elseif TOGGLE:find("BTK_BUBBLE_TOGGLE|0") and KONFIGURASI.BUBBLE.BTK_BUBBLE then KONFIGURASI.BUBBLE.BTK_BUBBLE = false CONSOLE("BTK Bubble `4deactivated") end
if S:find("INPUT_COLLECT_BET_BUBBLE_TEXT|") then local MESSAGE = string.sub(S, S:find("INPUT_COLLECT_BET_BUBBLE_TEXT|") + 30, S:find("INPUT_DROP_WINNER_BUBBLE_TEXT|") - 2) if MESSAGE ~= CUSTOM_TEXT.BUBBLE.BTK.COLLECT_BET then CUSTOM_TEXT.BUBBLE.BTK.COLLECT_BET = MESSAGE CONSOLE("Collect Bet bubble text set to : "..CUSTOM_TEXT.BUBBLE.BTK.COLLECT_BET) end end 
if S:find("INPUT_DROP_WINNER_BUBBLE_TEXT|") then local MESSAGE = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_DROP_WINNER_BUBBLE_TEXT|") + 30) if MESSAGE ~= CUSTOM_TEXT.BUBBLE.BTK.DROP_WINNER then CUSTOM_TEXT.BUBBLE.BTK.DROP_WINNER = MESSAGE CONSOLE("Drop Winner bubble text set to : "..CUSTOM_TEXT.BUBBLE.BTK.DROP_WINNER) end end 
if COMMAND == ("/bb") then if not KONFIGURASI.BUBBLE.BTK_BUBBLE then KONFIGURASI.BUBBLE.BTK_BUBBLE = true CONSOLE("BTK Bubble `2activated") else KONFIGURASI.BUBBLE.BTK_BUBBLE = false CONSOLE("BTK Bubble `4deactivated") end return true end 

if COMMAND == ("/emojichat") or COMMAND == ("/ec") or BUTTON == ("EMOJI_CHAT_MENU") then DIALOG_EMOJI_CHAT() return true end
if TOGGLE:find("EMOJI_CHAT_TOGGLE|1") and not KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't selected an emoji, we will automatically select it with an emoji (wl)") KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(wl)" end KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE = true CONSOLE("Emoji Mode `2activated") elseif TOGGLE:find("EMOJI_CHAT_TOGGLE|0") and KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE = false CONSOLE("Emoji Mode `4deactivated") end 
if TOGGLE:find("RANDOM_EMOJI_TOGGLE|1") and not KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then if not KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou can't activate the Random Emoji, because you haven't activate the Emoji Chat mode!") return true end KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI = true CONSOLE("Random Emoji `2activated") elseif TOGGLE:find("RANDOM_EMOJI_TOGGLE|0") and KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI = false CONSOLE("Random Emoji `4deactivated") end 
if S:find("TYPE_EMOJIS_(%w+)") then local ARGS = S:match("TYPE_EMOJIS_(%w+)") if ARGS == "WL" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(wl)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(wl)" end elseif ARGS == "GROW" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(grow)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(grow)" end elseif ARGS == "GEMS" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(gems)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(gems)" end elseif ARGS == "GTOKEN" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(gtoken)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(gtoken)" end elseif ARGS == "VEND" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(vend)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(vend)" end elseif ARGS == "OOPS" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(oops)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(oops)" end elseif ARGS == "SLEEP" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(sleep)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(sleep)" end elseif ARGS == "PUNCH" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(punch)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(punch)" end elseif ARGS == "BHEART" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(bheart)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(bheart)" end elseif ARGS == "CRY" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(cry)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(cry)" end elseif ARGS == "BUNNY" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(bunny)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(bunny)" end elseif ARGS == "CACTUS" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(cactus)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(cactus)" end elseif ARGS == "PINE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(pine)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(pine)" end elseif ARGS == "PEACE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(peace)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(peace)" end elseif ARGS == "TERROR" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(terror)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(terror)" end elseif ARGS == "TROLL" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(troll)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(troll)" end elseif ARGS == "EVIL" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(evil)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(evil)" end elseif ARGS == "FIREWORK" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(fireworks)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(fireworks)" end elseif ARGS == "FOOTBALL" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(football)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(football)" end elseif ARGS == "ALIEN" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(alien)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(alien)" end elseif ARGS == "PARTY" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(party)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(party)" end elseif ARGS == "CLAP" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(clap)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(clap)" end elseif ARGS == "SONGPYEON" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(song)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(song)" end elseif ARGS == "GHOST" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(ghost)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(ghost)" end elseif ARGS == "HALO" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(halo)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(halo)" end elseif ARGS == "NUKE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(nuke)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(nuke)" end elseif ARGS == "TURKEY" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(turkey)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(turkey)" end elseif ARGS == "GIFT" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(gift)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(gift)" end elseif ARGS == "HEARTARROW" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(heartarrow)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(heartarrow)" end elseif ARGS == "LUCKY" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(lucky)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(lucky)" end elseif ARGS == "SHAMROCK" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(shamrock)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(shamrock)" end elseif ARGS == "GRIN" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(grin)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(grin)" end elseif ARGS == "ILL" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(ill)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(ill)" end elseif ARGS == "EYES" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(eyes)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(eyes)" end elseif ARGS == "WEARY" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(weary)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(weary)" end elseif ARGS == "PLEAD" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(plead)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(plead)" end elseif ARGS == "MOYAI" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(moyai)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(moyai)" end elseif ARGS == "PIZZA" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(pizza)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(pizza)" end elseif ARGS == "CAKE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(cake)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(cake)" end elseif ARGS == "TONGUE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(tongue)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(tongue)" end elseif ARGS == "WINK" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(wink)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(wink)" end elseif ARGS == "WOW" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(wow)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(wow)" end elseif ARGS == "COOL" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(cool)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(cool)" end elseif ARGS == "KISS" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(kiss)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(kiss)" end elseif ARGS == "LOL" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(lol)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(lol)" end elseif ARGS == "SIGH" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(sigh)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(sigh)" end elseif ARGS == "SMILE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(smile)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(smile)" end elseif ARGS == "SHY" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(shy)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(shy)" end elseif ARGS == "MUSIC" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(music)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(music)" end elseif ARGS == "DANCE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(dance)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(dance)" end elseif ARGS == "BUILD" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(build)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(build)" end elseif ARGS == "SEENOEVIL" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(see-no-evil)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(see-no-evil)" end elseif ARGS == "MEGAPHONE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(megaphone)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(megaphone)" end elseif ARGS == "LOVE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(love)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(love)" end elseif ARGS == "HEART" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(heart)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(heart)" end elseif ARGS == "MAD" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(mad)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(mad)" end elseif ARGS == "AGREE" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(agree)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(agree)" end elseif ARGS == "NO" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(no)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(no)" end elseif ARGS == "YES" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI == "(yes)" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "" else KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI = "(yes)" end end if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI ~= "" then CONSOLE("Emoji "..KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI.." selected for Emoji Chat") end DIALOG_EMOJI_CHAT() return true end

if COMMAND == ("/customchat") or BUTTON == ("CUSTOM_CHAT") then DIALOG_CUSTOM_CHAT() return true end
if BUTTON == ("RAINBOW_CHAT_TOGGLE") then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE ~= "RAINBOW" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE = "RAINBOW" CONSOLE("Rainbow Chat `2activated") DIALOG_CUSTOM_CHAT() else KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE = "" CONSOLE("Rainbow Chat `4deactivated") DIALOG_CUSTOM_CHAT() end return true end
if BUTTON == ("COLOR_CHAT_TOGGLE") then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE ~= "COLOR" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE = "COLOR" CONSOLE("Color Chat `2activated") DIALOG_CUSTOM_CHAT() else KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE = "" CONSOLE("Color Chat `4deactivated") DIALOG_CUSTOM_CHAT() end return true end
if BUTTON == ("LETTER_CHAT_TOGGLE") then if not KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER_MODE then KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER_MODE = true CONSOLE("Letter Mode `2activated") DIALOG_CUSTOM_CHAT() else KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER_MODE = "" CONSOLE("Letter Mode `4deactivated") DIALOG_CUSTOM_CHAT() end return true end
if BUTTON == ("POSITION_CHAT_TOGGLE") then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION ~= "FRONT" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION = "FRONT" CONSOLE("Position Chat set to `5"..CAPITALIZE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION)) DIALOG_CUSTOM_CHAT() elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION ~= "BEHIND" then KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION = "BEHIND" CONSOLE("Position Chat set to `5"..CAPITALIZE(KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION)) DIALOG_CUSTOM_CHAT() end return true end
if S:find("INPUT_COLOR|") then local MESSAGE = string.sub(S, S:find("INPUT_COLOR|") + 12, S:find("INPUT_LETTER|") - 2) if MESSAGE ~= KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR then KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR = MESSAGE CONSOLE("Color chat set to `"..KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR..""..KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR) end end
if S:find("INPUT_LETTER|") then local MESSAGE = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_LETTER|") + 13) if MESSAGE ~= KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER then KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER = MESSAGE CONSOLE("Letter chat set to "..KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER) end end

if COMMAND == ("/hb") then if not KONFIGURASI.BUBBLE.HIDE_BUBBLE then KONFIGURASI.BUBBLE.HIDE_BUBBLE = true CONSOLE("Hide Bubble `2activated") else KONFIGURASI.BUBBLE.HIDE_BUBBLE = false CONSOLE("Hide Bubble `4deactivated") end return true end 

if (KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE ~= "" or KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE or KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER_MODE or KONFIGURASI.BUBBLE.CUSTOM_CHAT.RAINBOW) and S:find("action|input\n|text|") then ARGS = S:gsub("action|input\n|text|", "")
if ARGS:sub(0, 1) == "/" or ARGS:sub(1, 1) == "(" or ARGS:sub(5, 5) == "(" or ARGS:sub(5, 5) == ")" or ARGS:sub(5, 5) == "5" then return false end TEXT = ARGS MESSAGE = ""

if KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE == "RAINBOW" then for v in TEXT:gmatch("(.)") do MESSAGE = MESSAGE.. "`"..RANDOMIZE_COLOR[math.random(1, #RANDOMIZE_COLOR)].. v end
if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "FRONT" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then CHAT(RANDOMIZE_EMOJI[math.random(1, #RANDOMIZE_EMOJI)].." "..MESSAGE) else CHAT(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI.." "..MESSAGE) end elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "BEHIND" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then CHAT(MESSAGE.." "..RANDOMIZE_EMOJI[math.random(1, #RANDOMIZE_EMOJI)]) else CHAT(MESSAGE.." "..KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI) end end
elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER_MODE then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "FRONT" then CHAT(KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER.." "..MESSAGE) elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "BEHIND" then CHAT(MESSAGE.." "..KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER) end
else CHAT(MESSAGE)
end return true end 

if KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE == "COLOR" then for v in TEXT:gmatch("(.)") do MESSAGE = MESSAGE.. "`"..KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR.. v end
if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "FRONT" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then CHAT(RANDOMIZE_EMOJI[math.random(1, #RANDOMIZE_EMOJI)].." "..MESSAGE) else CHAT(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI.." "..MESSAGE) end elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "BEHIND" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then CHAT(MESSAGE.." "..RANDOMIZE_EMOJI[math.random(1, #RANDOMIZE_EMOJI)]) else CHAT(MESSAGE.." "..KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI) end end
elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER_MODE then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "FRONT" then CHAT(KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER.." "..MESSAGE) elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "BEHIND" then CHAT(MESSAGE.." "..KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER) end
else CHAT(MESSAGE)
end return true end 

if KONFIGURASI.BUBBLE.CUSTOM_CHAT.COLOR_MODE == "" then
if KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI_MODE then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "FRONT" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then CHAT(RANDOMIZE_EMOJI[math.random(1, #RANDOMIZE_EMOJI)].." "..TEXT) else CHAT(KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI.." "..TEXT) end elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "BEHIND" then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.RANDOM_EMOJI then CHAT(TEXT.." "..RANDOMIZE_EMOJI[math.random(1, #RANDOMIZE_EMOJI)]) else CHAT(TEXT.." "..KONFIGURASI.BUBBLE.CUSTOM_CHAT.EMOJI) end end
elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER_MODE then if KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "FRONT" then CHAT(KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER.." "..TEXT) elseif KONFIGURASI.BUBBLE.CUSTOM_CHAT.POSITION == "BEHIND" then CHAT(TEXT.." "..KONFIGURASI.BUBBLE.CUSTOM_CHAT.LETTER) end
end return true end

end

return false end)

AddHook("OnVariant", "VARIANT-BUBBLE", function(Var)
if KONFIGURASI.BUBBLE.GEMS_BUBBLE then if Var[0] == "OnTalkBubble" and Var[2]:find("(gems).") then return true end end
if KONFIGURASI.BUBBLE.HIDE_BUBBLE then if Var[0] == "OnTalkBubble" and Var[1] ~= GetLocal().netid then return true end end
return false end)
-- End of Bubble Menu --

-- Overlay Menu --
function DIALOG_OVERLAY_MENU() B = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Overlay Menu|left|2586|
add_spacer|small|
text_scaling_string|textscalingstringg|
add_checkicon|BLOCK_SDB_OVERLAY_TOGGLE|SDB Overlay|]]..FRAME(KONFIGURASI.OVERLAY.SDB_OVERLAY)..[[|2480||]]..CHECKBOX(KONFIGURASI.OVERLAY.SDB_OVERLAY)..[[|
add_checkicon|DROP_OVERLAY_TOGGLE|Drop Overlay|]]..FRAME(KONFIGURASI.OVERLAY.DROP_OVERLAY)..[[|6274||]]..CHECKBOX(KONFIGURASI.OVERLAY.DROP_OVERLAY)..[[|
add_checkicon|COLLECT_OVERLAY_TOGGLE|Collect Overlay|]]..FRAME(KONFIGURASI.OVERLAY.COLLECT_OVERLAY)..[[|6276||]]..CHECKBOX(KONFIGURASI.OVERLAY.COLLECT_OVERLAY)..[[|
add_checkicon|TRASH_OVERLAY_TOGGLE|Trash Overlay|]]..FRAME(KONFIGURASI.OVERLAY.TRASH_OVERLAY)..[[|5812||]]..CHECKBOX(KONFIGURASI.OVERLAY.TRASH_OVERLAY)..[[|
add_button_with_icon||END_LIST||0||
add_checkicon|DEPOSIT_OVERLAY_TOGGLE|Deposit Overlay|]]..FRAME(KONFIGURASI.OVERLAY.DEPOSIT_OVERLAY)..[[|5770||]]..CHECKBOX(KONFIGURASI.OVERLAY.DEPOSIT_OVERLAY)..[[|
add_checkicon|WITHDRAW_OVERLAY_TOGGLE|Withdraw Overlay|]]..FRAME(KONFIGURASI.OVERLAY.WITHDRAW_OVERLAY)..[[|7656||]]..CHECKBOX(KONFIGURASI.OVERLAY.WITHDRAW_OVERLAY)..[[|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_button|LIST_MENU|                Back                |noflags|0|0|
add_quick_exit|
end_dialog|OVERLAY_MENU|   Cancel   |    Save    |
]] DIALOG(B, 500) end

AddHook("OnSendPacket", "PACKET-OVERLAY", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
 
if COMMAND == ("/om") or COMMAND == ("/overlay") or BUTTON == ("OVERLAY_MENU") then DIALOG_OVERLAY_MENU() return true end
if TOGGLE:find("BLOCK_SDB_OVERLAY_TOGGLE|1") and not KONFIGURASI.OVERLAY.SDB_OVERLAY then KONFIGURASI.OVERLAY.SDB_OVERLAY = true CONSOLE("Block SDB Overlay `2activated") elseif TOGGLE:find("BLOCK_SDB_OVERLAY_TOGGLE|0") and KONFIGURASI.OVERLAY.SDB_OVERLAY then KONFIGURASI.OVERLAY.SDB_OVERLAY = false CONSOLE("Block SDB Overlay `4deactivated") end
if TOGGLE:find("DROP_OVERLAY_TOGGLE|1") and not KONFIGURASI.OVERLAY.DROP_OVERLAY then KONFIGURASI.OVERLAY.DROP_OVERLAY = true CONSOLE("Drop Overlay `2activated") elseif TOGGLE:find("DROP_OVERLAY_TOGGLE|0") and KONFIGURASI.OVERLAY.DROP_OVERLAY then KONFIGURASI.OVERLAY.DROP_OVERLAY = false CONSOLE("Drop Overlay `4deactivated") end
if TOGGLE:find("COLLECT_OVERLAY_TOGGLE|1") and not KONFIGURASI.OVERLAY.COLLECT_OVERLAY then KONFIGURASI.OVERLAY.COLLECT_OVERLAY = true CONSOLE("Collect Overlay `2activated") elseif TOGGLE:find("COLLECT_OVERLAY_TOGGLE|0") and KONFIGURASI.OVERLAY.COLLECT_OVERLAY then KONFIGURASI.OVERLAY.COLLECT_OVERLAY = false CONSOLE("Collect Overlay `4deactivated") end
if TOGGLE:find("TRASH_OVERLAY_TOGGLE|1") and not KONFIGURASI.OVERLAY.TRASH_OVERLAY then KONFIGURASI.OVERLAY.TRASH_OVERLAY = true CONSOLE("Trash Overlay `2activated") elseif TOGGLE:find("TRASH_OVERLAY_TOGGLE|0") and KONFIGURASI.OVERLAY.TRASH_OVERLAY then KONFIGURASI.OVERLAY.TRASH_OVERLAY = false CONSOLE("Trash Overlay `4deactivated") end
if TOGGLE:find("DEPOSIT_OVERLAY_TOGGLE|1") and not KONFIGURASI.OVERLAY.DEPOSIT_OVERLAY then KONFIGURASI.OVERLAY.DEPOSIT_OVERLAY = true CONSOLE("Deposit Overlay `2activated") elseif TOGGLE:find("DEPOSIT_OVERLAY_TOGGLE|0") and KONFIGURASI.OVERLAY.DEPOSIT_OVERLAY then KONFIGURASI.OVERLAY.DEPOSIT_OVERLAY = false CONSOLE("Deposit Overlay `4deactivated") end
if TOGGLE:find("WITHDRAW_OVERLAY_TOGGLE|1") and not KONFIGURASI.OVERLAY.WITHDRAW_OVERLAY then KONFIGURASI.OVERLAY.WITHDRAW_OVERLAY = true CONSOLE("Withdraw Overlay `2activated") elseif TOGGLE:find("WITHDRAW_OVERLAY_TOGGLE|0") and KONFIGURASI.OVERLAY.WITHDRAW_OVERLAY then KONFIGURASI.OVERLAY.WITHDRAW_OVERLAY = false CONSOLE("Withdraw Overlay `4deactivated") end

return false end)
-- End of Overlay Menu --

-- UI Menu --
function DIALOG_UI() UI = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|UI Menu|left|3528|
add_spacer|small|
add_text_input|INPUT_PRIMARY_COLOR|Change Primary Color             :|]]..KONFIGURASI.UI.PRIMARY..[[|3|
add_text_input|INPUT_SECONDARY_COLOR|`]]..KONFIGURASI.UI.SECONDARY..[[Change Secondary Color       :|]]..KONFIGURASI.UI.SECONDARY..[[|3|
add_text_input|INPUT_LANGUAGE|Change Language, ID/EN       :|]]..KONFIGURASI.UI.LANGUAGE..[[|3|
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.NOTE..[[Note `]]..KONFIGURASI.UI.PRIMARY..[[: The color must be on the color list|
add_spacer|small|
add_button|RESET_UI|           Reset to Default          |noflags|0|0|
add_quick_exit|
end_dialog|UI_MENU|     Cancel     |     Save      |
]] DIALOG(UI, 500) end

AddHook("OnSendPacket", "PACKET-UI", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/ui") or BUTTON == ("UI_MENU") then DIALOG_UI() return true end
if S:find("INPUT_SECONDARY_COLOR|") and not S:find("INPUT_SECONDARY_COLOR|"..KONFIGURASI.UI.SECONDARY) then KONFIGURASI.UI.SECONDARY = string.sub(S, S:find("INPUT_SECONDARY_COLOR|") + 22, S:find("INPUT_LANGUAGE|") - 2) CONSOLE("Secondary Color changed to `"..KONFIGURASI.UI.SECONDARY..""..KONFIGURASI.UI.SECONDARY) end 
if S:find("INPUT_PRIMARY_COLOR|") and not S:find("INPUT_PRIMARY_COLOR|"..KONFIGURASI.UI.PRIMARY) then KONFIGURASI.UI.PRIMARY = string.sub(S, S:find("INPUT_PRIMARY_COLOR|") + 20, S:find("INPUT_SECONDARY_COLOR|") - 2) CONSOLE("Primary Color changed to `"..KONFIGURASI.UI.PRIMARY..""..KONFIGURASI.UI.PRIMARY) end 
if S:find("INPUT_LANGUAGE|") and not S:find("INPUT_LANGUAGE|"..KONFIGURASI.UI.LANGUAGE) then local ARGS = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_LANGUAGE|") + 15) if ARGS:upper() ~= "ID" and ARGS:upper() ~= "EN" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou have to write the exact language. eg : EN or ID") return true else KONFIGURASI.UI.LANGUAGE = ARGS:upper() end CONSOLE("Language changed to "..KONFIGURASI.UI.LANGUAGE) end 
if BUTTON == ("RESET_UI") then KONFIGURASI.UI.LANGUAGE = "EN" KONFIGURASI.UI.PRIMARY = "w" KONFIGURASI.UI.SECONDARY = "5" CONSOLE("UI Menu reset to default") return true end

return false end)
-- End of UI Menu --

-- Store Menu --
function DIALOG_STORE_MENU() if KONFIGURASI.STORE_MENU.ITEM == 0 then CONDITION = "`4None Selected" else CONDITION = KONFIGURASI.STORE_MENU.ITEM end S = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Store Menu|left|10308|
add_spacer|small|
text_scaling_string|textscalingstring|
add_smalltext|Follow the instruction to change item :|
add_smalltext|1. Click '`]]..KONFIGURASI.UI.SECONDARY..[[Change item to Purchase`]]..KONFIGURASI.UI.PRIMARY..[[' button|
add_smalltext|2. Open the Store, and buy 1x the item you want to buy|
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.SECONDARY..[[Item to Purchase `]]..KONFIGURASI.UI.PRIMARY..[[: ]]..CONDITION..[[|
add_button|INPUT_STORE_ITEM|        Change item to Purchase       |noflags|0|0|
add_text_input|INPUT_STORE_AMOUNT|How many amount an item to buy ? |]]..KONFIGURASI.STORE_MENU.AMOUNT..[[|4|
add_spacer|small|
add_button|PURCHASE_STORE|                 `]]..KONFIGURASI.UI.SUCCESS..[[Purchase Now                 |noflags|0|0|
add_quick_exit|
end_dialog|STORE_MENU|       Cancel       |         Save         |
]] DIALOG(S, 500) end

AddHook("OnSendPacket", "PACKET-STORE", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/store") or BUTTON == ("STORE_MENU") then DIALOG_STORE_MENU() return true end
if BUTTON == ("INPUT_STORE_ITEM") then KONFIGURASI.STORE_MENU.CHANGE_ITEM_TO_PURCHASE = true OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wOpen the Store, and buy 1x the item you want to buy") CONSOLE("Open the Store, and buy 1x the item you want to buy") SendPacket(2,"action|store\nlocation|bottommenu") return true end
if BUTTON == ("PURCHASE_STORE") or COMMAND == ("/buynow") then if KONFIGURASI.STORE_MENU.CODE == nil or KONFIGURASI.STORE_MENU.CODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the item to purchase!") return true elseif KONFIGURASI.STORE_MENU.AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThe purchase amount can't be 0!") return true end KONFIGURASI.STORE_MENU.PURCHASE_FROM_STORE = true return true end
if S:find("INPUT_STORE_AMOUNT|") then local MESSAGE = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_STORE_AMOUNT|") + 19) if MESSAGE ~= KONFIGURASI.STORE_MENU.AMOUNT then KONFIGURASI.STORE_MENU.AMOUNT = MESSAGE CONSOLE("Amount purchase set to : "..KONFIGURASI.STORE_MENU.AMOUNT) end return true end

if KONFIGURASI.STORE_MENU.CHANGE_ITEM_TO_PURCHASE and S:find("action|buy\nitem|(.+)") then KONFIGURASI.STORE_MENU.CODE = S:match("action|buy\nitem|(.+)") end

return false end)

AddHook("OnVariant", "VARIANT-STORE", function(Var)
if Var[0] == "OnStorePurchaseResult" and KONFIGURASI.STORE_MENU.CHANGE_ITEM_TO_PURCHASE then if Var[1]:find("You've purchased `o(.+) ``for") then KONFIGURASI.STORE_MENU.ITEM, KONFIGURASI.STORE_MENU.SPENT = Var[1]:match("You've purchased `o(.+) ``for `$(%d+) ``Gems.") OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wItem to Purchase set to : `5"..KONFIGURASI.STORE_MENU.ITEM) CONSOLE("Item to Purchase set to : `5"..KONFIGURASI.STORE_MENU.ITEM) KONFIGURASI.STORE_MENU.CHANGE_ITEM_TO_PURCHASE = false end end
return false end)
-- End of Store Menu --

-- Activity Hub --
function DIALOG_ACTIVITY_HUB() if KONFIGURASI.HUB_MENU.ITEM == 0 then CONDITION = "`4None Selected" else CONDITION = KONFIGURASI.HUB_MENU.ITEM end S = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Activity Hub|left|752|
add_spacer|small|
text_scaling_string|textscalingstring|
add_smalltext|Follow the instruction to change item :|
add_smalltext|1. Click the '`]]..KONFIGURASI.UI.SECONDARY..[[Change the Activity Hub item`]]..KONFIGURASI.UI.PRIMARY..[[' button|
add_smalltext|2. Open the Activity Hub, and buy 1x the item you want|
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.SECONDARY..[[Item to Purchase `]]..KONFIGURASI.UI.PRIMARY..[[: ]]..CONDITION..[[|
add_button|INPUT_HUB_ITEM|    Change the Activity Hub item    |noflags|0|0|
add_text_input|INPUT_HUB_AMOUNT|How many amount an item to buy ? |]]..KONFIGURASI.HUB_MENU.AMOUNT..[[|4|
add_spacer|small|
add_quick_exit|
add_button|PURCHASE_HUB|                 `]]..KONFIGURASI.UI.SUCCESS..[[Purchase Now                 |noflags|0|0|
end_dialog|ACTIVITY_HUB_MENU|       Cancel       |         Save         |
]] DIALOG(S, 500) end

AddHook("OnSendPacket", "PACKET-HUB", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/hubmenu") or BUTTON == ("HUB_MENU") then DIALOG_ACTIVITY_HUB() return true end
if BUTTON == ("INPUT_HUB_ITEM") then KONFIGURASI.HUB_MENU.CHANGE_HUB_ITEM = true SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|activity") OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wOpen the activity hub, and buy 1x the item you want to buy") CONSOLE("Open the activity hub, and buy 1x the item you want to buy") return true end
if BUTTON == ("PURCHASE_HUB") then if KONFIGURASI.HUB_MENU.CODE == nil or KONFIGURASI.HUB_MENU.CODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the Activity Hub item to purchase!") return true elseif KONFIGURASI.HUB_MENU.AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."Amount purchase can't be 0!") return true end KONFIGURASI.HUB_MENU.PURCHASE_FROM_HUB = true return true end
if S:find("INPUT_HUB_AMOUNT|") then local MESSAGE = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_HUB_AMOUNT|") + 17) if MESSAGE ~= KONFIGURASI.HUB_MENU.AMOUNT then KONFIGURASI.HUB_MENU.AMOUNT = MESSAGE CONSOLE("Amount purchase set to : "..KONFIGURASI.HUB_MENU.AMOUNT) end return true end

if KONFIGURASI.HUB_MENU.CHANGE_HUB_ITEM and S:find("activity_purchase\noffer|(%d+)|") then KONFIGURASI.HUB_MENU.CODE = S:match("activity_purchase\noffer|(%d+)|") end
return false end)

AddHook("OnVariant", "VARIANT-HUB", function(Var)
if KONFIGURASI.HUB_MENU.CHANGE_HUB_ITEM then if Var[0] == "OnConsoleMessage" and Var[1]:find("Purchased") then
local AMOUNT, ITEM, SPENT = Var[1]:match("Purchased `$(%d+) (.+)`` for `$(%d+) Activity Credits``!") KONFIGURASI.HUB_MENU.ITEM, KONFIGURASI.HUB_MENU.SPENT = ITEM, SPENT  OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wActivity Hub item set to : "..KONFIGURASI.HUB_MENU.ITEM) CONSOLE("Activity Hub item set to : "..KONFIGURASI.HUB_MENU.ITEM) KONFIGURASI.HUB_MENU.CHANGE_HUB_ITEM = false
end end
if KONFIGURASI.HUB_MENU.PURCHASE_FROM_HUB then if Var[0] == "OnConsoleMessage" and Var[1]:find("Purchased") then return true end if Var[0] == "OnTalkBubble" and Var[2]:find("Purchased") then return true end end

return false end)
-- End of Activity Hub --

-- Hoster Menu --
function DIALOG_HOSTER() H = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Hoster Menu|left|756|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|PLAYER_MENU|Player Menu|staticBlueFrame|1400|||
add_button_with_icon|SPIN_LOG|Spin Log|staticBlueFrame|1436||
add_button_with_icon|BTK_MENU|BTK Menu|staticBlueFrame|340||
add_button_with_icon|REME_MENU|Reme Menu|staticBlueFrame|10866||
add_button_with_icon||END_LIST||0||
add_button_with_icon|REME_MODE_TOGGLE|`5Reme `]]..KONFIGURASI.UI.PRIMARY..[[Mode|]]..FRAME(KONFIGURASI.LIST_MENU.HOSTER.REME)..[[|2836||
add_button_with_icon|QEME_MODE_TOGGLE|`6Qeme `]]..KONFIGURASI.UI.PRIMARY..[[Mode|]]..FRAME(KONFIGURASI.LIST_MENU.HOSTER.QEME)..[[|2838||
add_button_with_icon|PEME_MODE_TOGGLE|`1Peme `]]..KONFIGURASI.UI.PRIMARY..[[Mode|]]..FRAME(KONFIGURASI.LIST_MENU.HOSTER.PEME)..[[|2840||
add_button_with_icon|FAST_WHEEL_TOGGLE|Fast Wheel|]]..FRAME(KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL)..[[|758||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|LIST_MENU|                Back                 |noflags|0|0|
end_dialog|HOSTER_MENU|||
]] DIALOG(H, 500) end

function DIALOG_PLAYER_MENU() if KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.NAME == "" then PLAYER_1 = "`4None" else PLAYER_1 = KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.NAME end if KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.NAME == "" then PLAYER_2 = "`4None" else PLAYER_2 = KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.NAME end PS = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Player Menu|left|1400|
add_spacer|small|
add_smalltext|Yourself : ]]..GetLocal().name..[[|
add_label_with_icon|small|]] .. KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.LOCAL_SPIN .. [[|left|758|
add_spacer|small||
add_smalltext|Player 1 : ]] .. PLAYER_1 .. [[|
add_label_with_icon|small|]] .. KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.SPIN .. [[|left|758|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|/pick1|Pick Player|staticBlueFrame|32||
add_button_with_icon|/reset1|Reset Player|staticBlueFrame|13720||
add_button_with_icon|/pull1|Pull Player|staticBlueFrame|274||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_smalltext|Player 2 : ]] .. PLAYER_2 .. [[|
add_label_with_icon|small|]] .. KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.SPIN .. [[|left|758|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|/pick2|Pick Player|staticBlueFrame|32||
add_button_with_icon|/reset2|Reset Player|staticBlueFrame|13720||
add_button_with_icon|/pull2|Pull Player|staticBlueFrame|274||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_label|small|Optional Features :|left|
add_spacer|small|
add_checkbox|AUTO_PULL_PLAYER_TOGGLE|Auto Pull when Player Disconnected|]]..CHECKBOX(KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.AUTO_PULL)..[[|
add_quick_exit|
add_button|HOSTER_MENU|                           Back                           |noflags|0|0|
end_dialog|PLAYER_MENU|          Close         |          Save          |
]] DIALOG(PS, 500) end

AddHook("OnSendPacket", "PACKET-HOSTER-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/hoster") or COMMAND == ("/hm") or BUTTON == ("HOSTER_MENU") then DIALOG_HOSTER() return true end
if COMMAND == ("/player") or COMMAND == ("/pmenu")  or BUTTON == ("PLAYER_MENU") then DIALOG_PLAYER_MENU() return true end
if TOGGLE:find("AUTO_PULL_PLAYER_TOGGLE|1") and not KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.AUTO_PULL then KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.AUTO_PULL = true CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Pull when Player Disconnected `2activated") elseif TOGGLE:find("AUTO_PULL_PLAYER_TOGGLE|0") and KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.AUTO_PULL then KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.AUTO_PULL = false CONSOLE(CUSTOM_TEXT.CODE.AUTO_JOIN.."`oAuto Pull when Player Disconnected `4deactivated") end
if COMMAND == ("/taunt") then CHAT("Segini Doang (tongue) ?") return true end
if BUTTON == ("REME_MODE_TOGGLE") then if not KONFIGURASI.LIST_MENU.HOSTER.REME then KONFIGURASI.LIST_MENU.HOSTER.REME = true DIALOG_HOSTER() CONSOLE("Reme Mode `2activated") else KONFIGURASI.LIST_MENU.HOSTER.REME = false DIALOG_HOSTER() CONSOLE("Reme Mode `4deactivated") end return true end
if BUTTON == ("QEME_MODE_TOGGLE") then if not KONFIGURASI.LIST_MENU.HOSTER.QEME then KONFIGURASI.LIST_MENU.HOSTER.QEME = true DIALOG_HOSTER() CONSOLE("Qeme Mode `2activated") else KONFIGURASI.LIST_MENU.HOSTER.QEME = false DIALOG_HOSTER() CONSOLE("Qeme Mode `4deactivated") end return true end
if BUTTON == ("PEME_MODE_TOGGLE") then if not KONFIGURASI.LIST_MENU.HOSTER.PEME then KONFIGURASI.LIST_MENU.HOSTER.PEME = true DIALOG_HOSTER() CONSOLE("Peme Mode `2activated") else KONFIGURASI.LIST_MENU.HOSTER.PEME = false DIALOG_HOSTER() CONSOLE("Peme Mode `4deactivated") end return true end
if BUTTON == ("FAST_WHEEL_TOGGLE") then if not KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL then KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL = true DIALOG_HOSTER() CONSOLE("Fast Wheel `2activated") else KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL = false DIALOG_HOSTER() CONSOLE("Fast Wheel `4deactivated") end return true end

if COMMAND == ("/fastwheel") then if not KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL then KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL = true CONSOLE("Fast Wheel `2activated") else KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL = false CONSOLE("Fast Wheel `4deactivated") end return true end
if COMMAND == ("/rememode") then if not KONFIGURASI.LIST_MENU.HOSTER.REME then KONFIGURASI.LIST_MENU.HOSTER.REME = true CONSOLE("Reme mode `2activated") return true else KONFIGURASI.LIST_MENU.HOSTER.REME = false CONSOLE("Reme mode `4deactivated") end return true end 
if COMMAND == ("/qememode") then if not KONFIGURASI.LIST_MENU.HOSTER.QEME then KONFIGURASI.LIST_MENU.HOSTER.QEME = true CONSOLE("Qeme mode `2activated") return true else KONFIGURASI.LIST_MENU.HOSTER.QEME = false CONSOLE("Qeme mode `4deactivated") end return true end
if COMMAND == ("/pememode") then if not KONFIGURASI.LIST_MENU.HOSTER.PEME then KONFIGURASI.LIST_MENU.HOSTER.PEME = true CONSOLE("Peme mode `2activated") return true else KONFIGURASI.LIST_MENU.HOSTER.PEME = false CONSOLE("Peme mode `4deactivated") end return true end
if COMMAND == ("/lememode") then if not KONFIGURASI.LIST_MENU.HOSTER.LEME then KONFIGURASI.LIST_MENU.HOSTER.LEME = true CONSOLE("Leme mode `2activated") return true else KONFIGURASI.LIST_MENU.HOSTER.LEME = false CONSOLE("Leme mode `4deactivated") end return true end

if COMMAND == ("/pick1") then BUBBLE("`wWrench someone to choose him") GET_PLAYER_1 = true return true end if GET_PLAYER_1 and S:find("action|wrench\n|netid|(%d+)") then local NET_ID = tonumber(S:match("action|wrench\n|netid|(%d+)")) for __, player in pairs(GetPlayerList()) do if player.netid == NET_ID then if player.userid == GetLocal().userid then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou can't pick yourself, captain.") return true elseif player.userid == KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.UID then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oUser locked for Player 2!") return true else BUBBLE(player.name.." `wChoosen!") CONSOLE("Player 1 locked to : " ..player.name) KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.UID, KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.NAME, GET_PLAYER_1, KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.SPIN = player.userid, player.name, false, "Player hasn't spun the wheel yet!" return true  end end end end
if COMMAND == ("/pick2") then BUBBLE("`wWrench someone to choose him") GET_PLAYER_2 = true return true end if GET_PLAYER_2 and S:find("action|wrench\n|netid|(%d+)") then local NET_ID = tonumber(S:match("action|wrench\n|netid|(%d+)")) for __, player in pairs(GetPlayerList()) do if player.netid == NET_ID then if player.userid == GetLocal().userid then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou can't pick yourself, captain.") return true elseif player.userid == KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.UID then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oUser locked for Player 1!") return true else BUBBLE(player.name.." `wChoosen!") CONSOLE("Player 2 locked to : " ..player.name) KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.UID, KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.NAME, GET_PLAYER_2, KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.SPIN = player.userid, player.name, false, "Player hasn't spun the wheel yet!" return true end end end end
if COMMAND == ("/reset1") then if KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.UID == 0 or KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.UID == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't selected player 1, what do you want to reset?") return true end KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.SPIN, KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.NAME, KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.UID = "You haven't selected a player yet", "", 0 CONSOLE("Player 1 reset") return true end
if COMMAND == ("/reset2") then if KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.UID == 0 or KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.UID == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't selected player 2, what do you want to reset?") return true end KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.SPIN, KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.NAME, KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.UID = "You haven't selected a player yet", "", 0 CONSOLE("Player 2 reset") return true end
if COMMAND == ("/pull1") then if KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.NAME == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't selected player 1, who do you want to pull?") return true else SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..GET_NETID(KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.NAME).."|\nbuttonClicked|pull") BUBBLE("Pulling Player 1 : " .. KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.NAME) end return true end
if COMMAND == ("/pull2") then if KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.NAME == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't selected player 2, who do you want to pull?") return true else SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..GET_NETID(KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.NAME).."|\nbuttonClicked|pull") BUBBLE("Pulling Player 2 : " .. KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.NAME) end return true end

if COMMAND == ("/spinlog") or COMMAND == ("/sl") or BUTTON == ("SPIN_LOG") then DIALOG_SPIN_LOG() return true end
if S:find("dialog_name|SPIN_LOG\nbuttonClicked|(%d+)") then UID = tonumber(S:match("dialog_name|SPIN_LOG\nbuttonClicked|(%d+)")) FILTER_SPIN_BY_USER(UID) end
if S:find("dialog_name|FILTER_SPIN_BY_USER\nbuttonClicked|(%d+)") then UID = tonumber(S:match("dialog_name|FILTER_SPIN_BY_USER\nbuttonClicked|(%d+)")) FILTER_SPIN_BY_USER(UID) end
if S:find("dialog_name|FILTER_SPIN_BY_STATUS\nbuttonClicked|(%d+)") then UID = tonumber(S:match("dialog_name|FILTER_SPIN_BY_STATUS\nbuttonClicked|(%d+)")) FILTER_SPIN_BY_USER(UID) end
if BUTTON == ("CLEAR_SPIN_LOG") then KONFIGURASI.TABLE.SPIN_LOG = {} BUBBLE("Roulette Wheel Spin Log reset!") DIALOG_SPIN_LOG() return true end
if BUTTON == ("FILTER_BY_REAL_SPIN") then FILTER_SPIN_BY_STATUS("REAL") end
if BUTTON == ("FILTER_BY_FAKE_SPIN") then FILTER_SPIN_BY_STATUS("FAKE") end
if BUTTON == ("SHOW_WORLD_ON_SPIN") then if not KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_WORLD then KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_WORLD = true DIALOG_SPIN_LOG() else KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_WORLD = false DIALOG_SPIN_LOG() end end
if BUTTON == ("SHOW_TIME_ON_SPIN") then if not KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_TIME then KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_TIME = true DIALOG_SPIN_LOG() else KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_TIME = false DIALOG_SPIN_LOG() end end
if BUTTON == ("SHOW_UID_ON_SPIN") then if not KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_UID then KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_UID = true DIALOG_SPIN_LOG() else KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_UID = false DIALOG_SPIN_LOG() end end
if BUTTON == ("SHOW_REME_ON_SPIN") then if not KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_REME then KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_REME = true DIALOG_SPIN_LOG() else KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_REME = false DIALOG_SPIN_LOG() end end
if BUTTON == ("SHOW_QEME_ON_SPIN") then if not KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_QEME then KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_QEME = true DIALOG_SPIN_LOG() else KONFIGURASI.LIST_MENU.HOSTER.SPIN_LOG.SHOW_QEME = false DIALOG_SPIN_LOG() end end

if COMMAND == ("/spin") then local SPUN_NUMBER = tonumber(ARGS[2]) RANDOM_FAKE_COLOR = {"`b", "`4"} if SPUN_NUMBER == 0 then CHAT("`w[``"..GetLocal().name.."```````````````` spun the wheel and got `2"..SPUN_NUMBER.."``!]``") else CHAT("`w[``"..GetLocal().name.."```````````````` spun the wheel and got "..RANDOM_FAKE_COLOR[math.random(1, #RANDOM_FAKE_COLOR)]..""..SPUN_NUMBER.."``!]``") end return true end

return false end)

function FAST_DICE(Pkt)
if Pkt.type == 8 and Pkt.value == 0 and GetTile(Pkt.x, Pkt.y).fg == 456 then
CONSOLE("Dice : `4"..math.floor(Pkt.count2 + 1))
end
end 

--AddHook("OnProcessTankUpdatePacket", "FAST_DICE", FAST_DICE)

AddHook("OnVariant", "VARIANT-HOSTER-MENU", function(Var)

-- Auto Pull when Player Disconnected --
if KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.AUTO_PULL then
for _, Player in pairs(GetPlayerList()) do
if Player.userid == KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.UID and Var[0] == "OnTalkBubble" and Var[1] == tonumber(Player.netid) and Var[2]:find(Player.name .. "(.+)entered") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..Var[1].."|\nbuttonClicked|pull") BUBBLE("Pulling Player 1 : " .. Player.name) end 
if Player.userid == KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.UID and Var[0] == "OnTalkBubble" and Var[1] == tonumber(Player.netid) and Var[2]:find(Player.name .. "(.+)entered") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..Var[1].."|\nbuttonClicked|pull") BUBBLE("Pulling Player 2 : " .. Player.name) end 
end
end 

if Var[0] == "OnTalkBubble" and Var[2]:find("spun the wheel") then
if Var[2]:find("``!]``") and not Var[2]:find("CP:") then SPLIT_NAME = Var[2]:find("spun") - 1 NAME = Var[2]:sub(4, SPLIT_NAME) CLEAR_SPACE = Var[2]:find("got ") + 6 CS = Var[2]:find("``!") - 1 SPUN_NUMBER = Var[2]:sub(CLEAR_SPACE, CS)
if KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL then

-- Player Menu --
if Var[0] == "OnTalkBubble" and Var[2]:find("spun the wheel") and Var[1] == GetLocal().netid then KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.LOCAL_SPIN = Var[2] end
for _, Player in pairs(GetPlayerList()) do 
if Player.userid == KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.UID and Var[1] == Player.netid then KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_1.SPIN = Var[2] SendVariantList({[0] = "OnTalkBubble", [1] = Var[1], [2] = "`w[`51`w] [`2REAL`w] "..Var[2].." "..GET_GAME(SPUN_NUMBER)}) table.insert(KONFIGURASI.TABLE.SPIN_LOG, {SPIN = "\nadd_label_with_icon_button|small|%s%s`w[`51`w] `w[`2REAL`w] %s"..Var[2].." "..GET_GAME(SPUN_NUMBER).."%s%s|left|758|"..GET_USERID(Var[1]).."|\n", UID = "`"..KONFIGURASI.UI.PRIMARY.."[`"..KONFIGURASI.UI.SECONDARY..""..GET_USERID(Var[1]).."`"..KONFIGURASI.UI.PRIMARY.."] ", USER_ID = GET_USERID(Var[1]), STATUS = "REAL", WORLD = "[`"..KONFIGURASI.UI.SECONDARY..""..GetWorld().name.."`"..KONFIGURASI.UI.PRIMARY.."] ", TIME = "[`"..KONFIGURASI.UI.SECONDARY..""..os.date("%H:%M:%S").."`"..KONFIGURASI.UI.PRIMARY.."] ", REME = " `5REME `w: `5"..REME_COUNT(tonumber(SPUN_NUMBER)).."", QEME = " `6QEME `w: `6"..QEME_COUNT(tonumber(SPUN_NUMBER))}) return true end 
if Player.userid == KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.UID and Var[1] == Player.netid then KONFIGURASI.LIST_MENU.HOSTER.PLAYER_MENU.PLAYER_2.SPIN = Var[2] SendVariantList({[0] = "OnTalkBubble", [1] = Var[1], [2] = "`w[`52`w] [`2REAL`w] "..Var[2].." "..GET_GAME(SPUN_NUMBER)}) table.insert(KONFIGURASI.TABLE.SPIN_LOG, {SPIN = "\nadd_label_with_icon_button|small|%s%s`w[`52`w] `w[`2REAL`w] %s"..Var[2].." "..GET_GAME(SPUN_NUMBER).."%s%s|left|758|"..GET_USERID(Var[1]).."|\n", UID = "`"..KONFIGURASI.UI.PRIMARY.."[`"..KONFIGURASI.UI.SECONDARY..""..GET_USERID(Var[1]).."`"..KONFIGURASI.UI.PRIMARY.."] ", USER_ID = GET_USERID(Var[1]), STATUS = "REAL", WORLD = "[`"..KONFIGURASI.UI.SECONDARY..""..GetWorld().name.."`"..KONFIGURASI.UI.PRIMARY.."] ", TIME = "[`"..KONFIGURASI.UI.SECONDARY..""..os.date("%H:%M:%S").."`"..KONFIGURASI.UI.PRIMARY.."] ", REME = " `5REME `w: `5"..REME_COUNT(tonumber(SPUN_NUMBER)).."", QEME = " `6QEME `w: `6"..QEME_COUNT(tonumber(SPUN_NUMBER))}) return true end 
end
-- End of Player Menu --
if KONFIGURASI.LIST_MENU.HOSTER.REME or KONFIGURASI.LIST_MENU.HOSTER.QEME or KONFIGURASI.LIST_MENU.HOSTER.PEME or KONFIGURASI.LIST_MENU.HOSTER.LEME then SendVariantList({[0] = "OnTalkBubble", [1] = Var[1], [2] = "`w[`2REAL`w] ``"..Var[2].." "..GET_GAME(SPUN_NUMBER)}) else SendVariantList({[0] = "OnTalkBubble", [1] = Var[1], [2] = "`w[`2REAL`w] ``"..Var[2]}) end
table.insert(KONFIGURASI.TABLE.SPIN_LOG, {SPIN = "\nadd_label_with_icon_button|small|%s%s`w[`2REAL`w] %s" ..Var[2].."%s%s|left|758|"..GET_USERID(Var[1]).."|\n", UID = "`"..KONFIGURASI.UI.PRIMARY.."[`"..KONFIGURASI.UI.SECONDARY..""..GET_USERID(Var[1]).."`"..KONFIGURASI.UI.PRIMARY.."] ", USER_ID = GET_USERID(Var[1]), STATUS = "REAL", WORLD = "[`"..KONFIGURASI.UI.SECONDARY..""..GetWorld().name.."`"..KONFIGURASI.UI.PRIMARY.."] ", TIME = "[`"..KONFIGURASI.UI.SECONDARY..""..os.date("%H:%M:%S").."`"..KONFIGURASI.UI.PRIMARY.."] ", REME = " `5REME `w: `5"..REME_COUNT(tonumber(SPUN_NUMBER)).."", QEME = " `6QEME `w: `6"..QEME_COUNT(tonumber(SPUN_NUMBER))})

--if Var[1] == GetLocal().netid and (SPUN_NUMBER == "0" or SPUN_NUMBER == "19" or SPUN_NUMBER == "28") then SOMBONG_DULU = true end
return true end

-- [[ Crash issue ]] -- for _, player in pairs(GetPlayerList()) do if player.netid == Var[1] then SendVariantList({[0] = "OnNameChanged", [1] = NAME.." ["..SPUN_NUMBER.."]"}) end end
elseif Var[2]:find("`.spun") or Var[2]:find("`.!]") or Var[2]:find("`.]") or (Var[2]:find("<") and Var[2]:find(">")) then SPLIT_NAME = Var[2]:find("spun") - 1 NAME = Var[2]:sub(2, SPLIT_NAME) SPUN_NUMBER = Var[2]:match("got (.+)!]"):gsub("`.","") WARN("`wWarning from `4Starries Helper `w: Someone typing in your world!") 
CHAT("`w[`8WARNING`w] Someone Doing `4Fake Spin`w, Suspect : "..NAME) --CHAT(NAME.."`wcaught using `4FAKE `wwheel!") 
SendVariantList({[0] = "OnTalkBubble", [1] = Var[1], [2] = "`w[`4FAKE`w] ``" ..Var[2]}) 
table.insert(KONFIGURASI.TABLE.SPIN_LOG, {SPIN = "\nadd_label_with_icon_button|small|%s%s`w[`4FAKE`w] %s"..Var[2].."%s%s|left|758|"..GET_USERID(Var[1]).."|\n", UID = "`"..KONFIGURASI.UI.PRIMARY.."[`"..KONFIGURASI.UI.SECONDARY..""..GET_USERID(Var[1]).."`"..KONFIGURASI.UI.PRIMARY.."] ", USER_ID = GET_USERID(Var[1]), STATUS = "FAKE", WORLD = "[`"..KONFIGURASI.UI.SECONDARY..""..GetWorld().name.."`"..KONFIGURASI.UI.PRIMARY.."] ", TIME = "[`"..KONFIGURASI.UI.SECONDARY..""..os.date("%H:%M:%S").."`"..KONFIGURASI.UI.PRIMARY.."] ", REME = " `5REME `w: `5"..REME_COUNT(tonumber(SPUN_NUMBER)).."", QEME = " `6QEME `w: `6"..QEME_COUNT(tonumber(SPUN_NUMBER))})
end

end

if Var[0] == "OnConsoleMessage" and Var[1]:find("spun the wheel") then
if KONFIGURASI.LIST_MENU.HOSTER.FAST_WHEEL then
if Var[1]:find("``!]``") and not Var[1]:find("CP:") then
SPLIT_NAME = Var[1]:find("spun") - 1
NAME = Var[1]:sub(4, SPLIT_NAME)
CLEAR_SPACE = Var[1]:find("got ") + 6
CS = Var[1]:find("``!]") - 1
SPUN_NUMBER = Var[1]:sub(CLEAR_SPACE, CS)

if KONFIGURASI.LIST_MENU.HOSTER.REME or KONFIGURASI.LIST_MENU.HOSTER.QEME or KONFIGURASI.LIST_MENU.HOSTER.PEME then CONSOLE("`w[`2REAL`w] `o"..Var[1].." "..GET_GAME(SPUN_NUMBER)) else CONSOLE("`w[`2REAL`w] `o"..Var[1]) end

-- if GetName(Var[1]) then SetNickname(GetName.." ["..SPUN_NUMBER.."]", Var[1]) end for _, player in pairs(GetPlayerList()) do if player.netid == Var[1] then SendVariantList({[0] = "OnNameChanged", [1] = Name.." ["..SPUN_NUMBER.."]", netid = player.netid}) end end

elseif Var[1]:find("CP:") then NAME = string.sub(Var[1], Var[1]:find("6<`") + 4, Var[1]:find("`>")) CONSOLE("`w[`4FAKE`w] `o"..Var[1]) 
end 
return true end end

return false end)
-- End of Hoster Menu --

-- Surgery Menu --
function DIALOG_SURGERY_MENU() SS = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|]]..CUSTOM_TEXT.LIST_MENU.BUTTON.SURGERY..[[|left|7068|
add_spacer|small|
add_text_input|INPUT_TOTAL_SURGERY|Change `]]..KONFIGURASI.UI.SECONDARY..[[Total Surgery      `]]..KONFIGURASI.UI.PRIMARY..[[:|]]..KONFIGURASI.LIST_MENU.SURGERY.TOTAL_SURG..[[|5|
add_smalltext|(To calculate when you're doing surgery)|
add_text_input|INPUT_TOTAL_OPERATION|Change `]]..KONFIGURASI.UI.SECONDARY..[[Total Operation `]]..KONFIGURASI.UI.PRIMARY..[[:|]]..KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION..[[|5|
add_smalltext|(To calculate when you're being cured)|
add_spacer|small|
text_scaling_string|textscalingstringstring|
add_button_with_icon|AUTO_SURGERY_TOGGLE|Auto Surgery|]]..FRAME(KONFIGURASI.LIST_MENU.SURGERY.TOGGLE)..[[|1296||
add_button_with_icon|AUTO_WRENCH_TOGGLE|Auto Wrench|]]..FRAME(KONFIGURASI.LIST_MENU.SURGERY.AUTO_WRENCH)..[[|32||
add_button_with_icon|AUTO_RECOVERY_TOGGLE|Auto Recovery|]]..FRAME(KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO)..[[|4296||
add_button_with_icon|AUTO_DROP_KIT_TOGGLE|Auto Drop Kit|]]..FRAME(KONFIGURASI.LIST_MENU.SURGERY.AUTO_DROP_KIT)..[[|6212||
add_button_with_icon|BACK_POSITION_TOGGLE|Back Position|]]..FRAME(KONFIGURASI.LIST_MENU.SURGERY.BACK_POSITION)..[[|4472||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_button|LIST_MENU|                      Back                      |noflags|0|0|
add_quick_exit|
end_dialog|SURGERY_MENU|      Cancel      |       Save       |
]] DIALOG(SS, 500) end

AddHook("OnSendPacket", "PACKET-SURGERY", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/surgmenu") or BUTTON == ("SURGERY_MENU") then DIALOG_SURGERY_MENU() return true end
if S:find("INPUT_TOTAL_SURGERY|") and not S:find("INPUT_TOTAL_SURGERY|"..KONFIGURASI.LIST_MENU.SURGERY.TOTAL_SURG) then local NUMBER = string.sub(S, S:find("INPUT_TOTAL_SURGERY|") + 20, S:find("INPUT_TOTAL_OPERATION|") - 2) if NUMBER ~= KONFIGURASI.LIST_MENU.SURGERY.TOTAL_SURG then KONFIGURASI.LIST_MENU.SURGERY.TOTAL_SURG = NUMBER CONSOLE("Total Surgery set to : "..KONFIGURASI.LIST_MENU.SURGERY.TOTAL_SURG) end end 
if S:find("INPUT_TOTAL_OPERATION|") and not S:find("INPUT_TOTAL_OPERATION|"..KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION) then local NUMBER = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_TOTAL_OPERATION|") + 22) if NUMBER ~= KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION then KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION = NUMBER CONSOLE("Total Operation set to : "..KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION) end end 

if COMMAND == ("/autosurg") then if not KONFIGURASI.LIST_MENU.SURGERY.TOGGLE then KONFIGURASI.LIST_MENU.SURGERY.TOGGLE = true CONSOLE("Auto Surgery `2activated") else KONFIGURASI.LIST_MENU.SURGERY.TOGGLE = false CONSOLE("Auto Surgery `4deactivated") end return true end
if BUTTON == ("AUTO_SURGERY_TOGGLE") then if not KONFIGURASI.LIST_MENU.SURGERY.TOGGLE then KONFIGURASI.LIST_MENU.SURGERY.TOGGLE = true DIALOG_SURGERY_MENU() else KONFIGURASI.LIST_MENU.SURGERY.TOGGLE = false DIALOG_SURGERY_MENU() end end
if BUTTON == ("AUTO_WRENCH_TOGGLE") then if not KONFIGURASI.LIST_MENU.SURGERY.AUTO_WRENCH then KONFIGURASI.LIST_MENU.SURGERY.AUTO_WRENCH = true DIALOG_SURGERY_MENU() else KONFIGURASI.LIST_MENU.SURGERY.AUTO_WRENCH = false DIALOG_SURGERY_MENU() end end
if COMMAND == ("/autoreco") then if not KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO then KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO = true CONSOLE("Auto Recovery `2activated") else KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO = false CONSOLE("Auto Recovery `4deactivated") end return true end
if BUTTON == ("AUTO_RECOVERY_TOGGLE") then if not KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO then KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO = true DIALOG_SURGERY_MENU() else KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO = false DIALOG_SURGERY_MENU() end end
if BUTTON == ("AUTO_DROP_KIT_TOGGLE") then if not KONFIGURASI.LIST_MENU.SURGERY.AUTO_DROP_KIT then KONFIGURASI.LIST_MENU.SURGERY.AUTO_DROP_KIT = true DIALOG_SURGERY_MENU() else KONFIGURASI.LIST_MENU.SURGERY.AUTO_DROP_KIT = false DIALOG_SURGERY_MENU() end end
if BUTTON == ("BACK_POSITION_TOGGLE") then if KONFIGURASI.LIST_MENU.SURGERY.POSX and KONFIGURASI.LIST_MENU.SURGERY.POSY == nil or KONFIGURASI.LIST_MENU.SURGERY.POSX and KONFIGURASI.LIST_MENU.SURGERY.POSY == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the surgery position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/surg pos") return true end if not KONFIGURASI.LIST_MENU.SURGERY.BACK_POSITION then KONFIGURASI.LIST_MENU.SURGERY.BACK_POSITION = true DIALOG_SURGERY_MENU() else KONFIGURASI.LIST_MENU.SURGERY.BACK_POSITION = false DIALOG_SURGERY_MENU() end end

if COMMAND == ("/surg") and ARGS[2] then ARGS[2]:lower()
if ARGS[2] == "menu" then DIALOG_SURGERY_MENU()
elseif ARGS[2] == "auto" or ARGS[2] == "toggle" then if not KONFIGURASI.LIST_MENU.SURGERY.TOGGLE then KONFIGURASI.LIST_MENU.SURGERY.TOGGLE = true CONSOLE("Auto Surgery `2activated") else KONFIGURASI.LIST_MENU.SURGERY.TOGGLE = false CONSOLE("Auto Surgery `4deactivated") end
elseif ARGS[2] == "buy" then if not KONFIGURASI.LIST_MENU.SURGERY.BUY_KIT then KONFIGURASI.LIST_MENU.SURGERY.BUY_KIT = true CONSOLE("Buying Surgical Kit...") else KONFIGURASI.LIST_MENU.SURGERY.BUY_KIT = false CONSOLE("Buying Surgical Kit stopped") end 
elseif ARGS[2] == "drop" then if not KONFIGURASI.LIST_MENU.SURGERY.DROP_KIT then KONFIGURASI.LIST_MENU.SURGERY.DROP_KIT = true CONSOLE("Dropping Surgical Kit...") else KONFIGURASI.LIST_MENU.SURGERY.DROP_KIT = false CONSOLE("Dropping Surgical Kit stopped") end 
elseif ARGS[2] == "stat" then if tonumber(KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION) > 0 then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wTotal Operation : `5"..KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION) else BUBBLE("`wNo one has operated on you yet!") end
elseif ARGS[2] == "pos" then KONFIGURASI.LIST_MENU.SURGERY.WORLD, KONFIGURASI.LIST_MENU.SURGERY.POSX, KONFIGURASI.LIST_MENU.SURGERY.POSY = GetWorld().name, math.floor(GetLocal().pos.x // 32), math.floor(GetLocal().pos.y // 32) CONSOLE("`w[`6POS`w] `oSurgery Position saved! `w[`5" ..KONFIGURASI.LIST_MENU.SURGERY.POSX.. "`w,`5" ..KONFIGURASI.LIST_MENU.SURGERY.POSY.."`w]")
elseif ARGS[2] == "tp" then if KONFIGURASI.LIST_MENU.SURGERY.POSX == 0 and KONFIGURASI.LIST_MENU.SURGERY.POSY == 0 then CONSOLE("Set position surgery first with command `5/surg pos") else TP_SURG = true end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oSurgery Options available are 'menu, auto, buy, drop, stat, pos, tp'!") end return true 
elseif COMMAND == ("/surg") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oSurgery Options available are 'menu, auto, buy, drop, stat, pos, tp'!") return true
end

return false end)

AddHook("OnVariant", "VARIANT-SURGERY", function(Var)

if KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO then
if Var[0] == "OnConsoleMessage" and Var[1]:find("You are recovering") then Sleep(50) CHAT("/modage 60") KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION = KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION + 1  return true end
if Var[0] == "OnTalkBubble" and (Var[2]:find("Reco") or Var[2]:find("reco")) then CHAT("/modage 60") end
if Var[0] == "OnTalkBubble" and (Var[2]:find("After a surgery like that") or Var[2]:find("The parents") or Var[2]:find("The patient") or Var[2]:find("The Growtopian") or Var[2]:find("Hey, somebody left")) then KONFIGURASI.LIST_MENU.SURGERY.TOTAL_SURG = KONFIGURASI.LIST_MENU.SURGERY.TOTAL_SURG + 1 CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wOperation `5"..KONFIGURASI.LIST_MENU.SURGERY.TOTAL_SURG.." `wwas `2succesful`w, Reco or reco!") for i = 1, 2 do SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..KONFIGURASI.LIST_MENU.SURGERY.TARGET_SURG.."|\nbuttonClicked|surgery") Sleep(40) end return true end
end

if KONFIGURASI.LIST_MENU.SURGERY.TOGGLE then 
if Var[0] == "OnConsoleMessage" then
if Var[1]:find("Malpractice") then CHAT("/modage 60") return true end
if Var[1]:find("Recovering fom surgery") then CHAT("reco") return true end
end
if Var[0] == "OnDialogRequest" then
if Var[1]:find("Anatomical") then local X, Y = Var[1]:match("embed_data|x|(%d+)"), Var[1]:match("embed_data|y|(%d+)") SendPacket(2,"action|dialog_return\ndialog_name|surge_edit\nx|"..X.."|\ny|"..Y.."|\n") return true
elseif Var[1]:find("Are you sure you want to perform surgery on this robot?") then local X, Y = Var[1]:match("embed_data|x|(%d+)"), Var[1]:match("embed_data|y|(%d+)") SendPacket(2,"action|dialog_return\ndialog_name|surge_edit\nx|"..X.."|\ny|"..Y.."|\n") return true
elseif Var[1]:find("Perform Surgery") then SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..KONFIGURASI.LIST_MENU.SURGERY.TARGET_SURG.."|\nbuttonClicked|surgery") return true
elseif Var[1]:find("Patient's fever is `3slowly rising") and Var[1]:find("command_4") then SURGERY_TOOLS(4) CONSOLE("Using Antibiotic") return true
elseif Var[1]:find("Patient's fever is `6climbing") and Var[1]:find("command_4") then SURGERY_TOOLS(4) CONSOLE("Using Antibiotic") return true
elseif Var[1]:find("Incisions: `60") and Var[1]:find("command_7") then SURGERY_TOOLS(7) CONSOLE("Fix It") return true
elseif Var[1]:find("Incisions: `30") and Var[1]:find("command_7") then SURGERY_TOOLS(7) CONSOLE("Fix It") return true
elseif Var[1]:find("command_7") then SURGERY_TOOLS(7) CONSOLE("Fix It") return true
elseif Var[1]:find("Operation site: `6Unclean") and Var[1]:find("command_3") then SURGERY_TOOLS(3) CONSOLE("Using Antiseptic") return true
elseif Var[1]:find("Operation site: `4Unsanitary") and Var[1]:find("command_3") then SURGERY_TOOLS(3) CONSOLE("Using Antiseptic") return true
elseif Var[1]:find("Status: `4Awake!") and Var[1]:find("command_2") then SURGERY_TOOLS(2) CONSOLE("Using Anesthetic") return true
elseif Var[1]:find("`4You can't see what you are doing(!+)") and Var[1]:find("command_0") then SURGERY_TOOLS(0) CONSOLE("Using Sponge") return true
elseif Var[1]:find("`6It is becoming hard to see your work(.+)") and Var[1]:find("command_0") then SURGERY_TOOLS(0) CONSOLE("Using Sponge") return true
elseif Var[1]:find("Patient is losing blood `4very quickly!") and Var[1]:find("command_6") then SURGERY_TOOLS(6) CONSOLE("Using Stitches") return true
elseif Var[1]:find("Patient is losing blood `3slowly") and Var[1]:find("command_6") then SURGERY_TOOLS(6) CONSOLE("Using Stitches") return true
elseif Var[1]:find("Patient is `6losing blood!") and Var[1]:find("command_6") then SURGERY_TOOLS(6) CONSOLE("Using Stitches") return true
elseif Var[1]:find("command_7") and Var[1]:find("command_6") then SURGERY_TOOLS(6) CONSOLE("Using Stitches") return true
elseif Var[1]:find("command_7") and Var[1]:find("command_1") then SURGERY_TOOLS(1) CONSOLE("Using Scalpel") return true
elseif Var[1]:find("command_1") then SURGERY_TOOLS(1) CONSOLE("Using Scalpel") return true
end
end
end

return false end)
-- End of Surgery Menu --

-- Pack Menu --
function DIALOG_PACK_MENU() P = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|]]..CUSTOM_TEXT.LIST_MENU.BUTTON.PACK_MENU..[[|left|10868|
add_spacer|small|
text_scaling_string|textscalingstring|
add_smalltext|Options :|
add_button_with_icon|START_BUY_PACK_TOGGLE|Start Buy|]]..FRAME(KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE)..[[|10868||
add_button_with_icon|AUTO_DROP_PACK_TOGGLE|Auto Drop|]]..FRAME(KONFIGURASI.LIST_MENU.PACK_MENU.AUTO_DROP)..[[|486||
add_button_with_icon||END_LIST||0||
add_smalltext|Choose Mode :|
add_button_with_icon|COOKING_KIT_TOGGLE|Cooking Kit|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.PACK_MENU.MODE, "COOKING")..[[|10840||
add_button_with_icon|SURGICAL_KIT_TOGGLE|Surgical Kit|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.PACK_MENU.MODE, "SURGICAL")..[[|10836||
add_button_with_icon|FARMING_KIT_TOGGLE|Farming Kit|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.PACK_MENU.MODE, "FARMING")..[[|13888||
add_button_with_icon|SCIENCE_KIT_TOGGLE|Science Kit|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.PACK_MENU.MODE, "SCIENCE")..[[|928||
add_button_with_icon|COMPOSER_PACK_TOGGLE|Composer Pack|]]..FRAME_MODE(KONFIGURASI.LIST_MENU.PACK_MENU.MODE, "COMPOSER")..[[|12358||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_text_input|INPUT_PACK_AMOUNT|Change `]]..KONFIGURASI.UI.SECONDARY..[[Amount Buy `]]..KONFIGURASI.UI.PRIMARY..[[:|]]..KONFIGURASI.LIST_MENU.PACK_MENU.AMOUNT..[[|5|
add_smalltext|(How many pack did u want to buy?)|
add_spacer|small|
add_button|LIST_MENU|                      Back                      |noflags|0|0|
add_quick_exit|
end_dialog|PACK_MENU|      Cancel      |       Save       |
]] DIALOG(P, 500) end

LIST_ITEM = {
COOKING = { 4568, 4570, 4572, 956, 4562, 962, 4602, 4588, 4578, 4586, 874, 868, 4766, 4672, 4666, 822, 4582, 4618 }
}

function BUYING_PACK_IN_ACTION() if not KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE then return end
	if KONFIGURASI.LIST_MENU.PACK_MENU.MODE == "COOKING" then
		BUYING_PACK("buy_cookingpack") Sleep(100)
			for _, I in pairs(LIST_ITEM.COOKING) do 
				if KONFIGURASI.LIST_MENU.PACK_MENU.AUTO_DROP then
					if GET_AMOUNT(I) >= 240 then DROP(I, GET_AMOUNT(I)) Sleep(100) end 
				else KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE = false BUBBLE("Backpack Full!") CONSOLE("Buying Pack has been `4deactivated") return end 
			end 
	end 
end

AddHook("OnSendPacket", "PACKET-PACK-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/pm") or COMMAND == ("/packmenu") or BUTTON == ("PACK_MENU") then DIALOG_PACK_MENU() return true end

if S:find("INPUT_PACK_AMOUNT|") and not S:find("INPUT_PACK_AMOUNT|"..KONFIGURASI.LIST_MENU.PACK_MENU.AMOUNT) then local NUMBER = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_PACK_AMOUNT|") + 18) if NUMBER ~= KONFIGURASI.LIST_MENU.PACK_MENU.AMOUNT then KONFIGURASI.LIST_MENU.PACK_MENU.AMOUNT = NUMBER CONSOLE("Buy pack amount set to : "..KONFIGURASI.LIST_MENU.PACK_MENU.AMOUNT) DIALOG_PACK_MENU() end end 
if BUTTON == ("COOKING_KIT_TOGGLE") then if KONFIGURASI.LIST_MENU.PACK_MENU.MODE ~= "COOKING" then KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "COOKING" DIALOG_PACK_MENU() else KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "" DIALOG_PACK_MENU() end end
if BUTTON == ("SURGICAL_KIT_TOGGLE") then if KONFIGURASI.LIST_MENU.PACK_MENU.MODE ~= "SURGICAL" then KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "SURGICAL" DIALOG_PACK_MENU() else KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "" DIALOG_PACK_MENU() end end
if BUTTON == ("FARMING_KIT_TOGGLE") then if KONFIGURASI.LIST_MENU.PACK_MENU.MODE ~= "FARMING" then KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "FARMING" DIALOG_PACK_MENU() else KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "" DIALOG_PACK_MENU() end end
if BUTTON == ("SCIENCE_KIT_TOGGLE") then if KONFIGURASI.LIST_MENU.PACK_MENU.MODE ~= "SCIENCE" then KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "SCIENCE" DIALOG_PACK_MENU() else KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "" DIALOG_PACK_MENU() end end
if BUTTON == ("COMPOSER_PACK_TOGGLE") then if KONFIGURASI.LIST_MENU.PACK_MENU.MODE ~= "COMPOSER" then KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "COMPOSER" DIALOG_PACK_MENU() else KONFIGURASI.LIST_MENU.PACK_MENU.MODE = "" DIALOG_PACK_MENU() end end

if BUTTON == ("START_BUY_PACK_TOGGLE") then if KONFIGURASI.LIST_MENU.PACK_MENU.MODE == "" or KONFIGURASI.LIST_MENU.PACK_MENU.MODE == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou have to choose mode first!") DIALOG_PACK_MENU() return end if not KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE then KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE = true CONSOLE("Buying Pack has been `2activated") else KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE = false CONSOLE("Buying Pack has been `4deactivated") DIALOG_PACK_MENU() end end
if BUTTON == ("AUTO_DROP_PACK_TOGGLE") then if not KONFIGURASI.LIST_MENU.PACK_MENU.AUTO_DROP then KONFIGURASI.LIST_MENU.PACK_MENU.AUTO_DROP = true DIALOG_PACK_MENU() else KONFIGURASI.LIST_MENU.PACK_MENU.AUTO_DROP = false DIALOG_PACK_MENU() end end

return false end)

AddHook("OnVariant", "VARIANT-PACK-MENU", function(Var)
if KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE then
if Var[0] == "OnTextOverlay" and Var[1]:find("You can't drop that here") then KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE = false BUBBLE("Move around! you can't drop on that tile.") return true end
end
return false end)
-- End of Pack Menu --

-- Bruteforce Menu --
function DIALOG_BRUTEFORCE_MENU() if KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE then CONDITION = "`4Deactivate" else CONDITION = "`2Activate" end P = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|]]..CUSTOM_TEXT.LIST_MENU.BUTTON.BRUTEFORCE_MENU..[[|left|762|
add_spacer|small|
add_checkbox|BRUTEFORCE_TOGGLE|]]..CONDITION..[[ `]]..KONFIGURASI.UI.PRIMARY..[[Bruteforce|]]..CHECKBOX(KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE)..[[|
add_text_input|INPUT_STARTING_NUMBER|Change the `]]..KONFIGURASI.UI.SECONDARY..[[Start Number `]]..KONFIGURASI.UI.PRIMARY..[[:|]]..KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.STARTING_NUMBER..[[|5|
add_smalltext|(What is the starting number for bruteforce?)|
add_text_input|INPUT_FINAL_NUMBER|Change the `]]..KONFIGURASI.UI.SECONDARY..[[Final Number `]]..KONFIGURASI.UI.PRIMARY..[[:|]]..KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.FINAL_NUMBER..[[|5|
add_smalltext|(What is the final number for bruteforce?)|
add_spacer|small|
add_button|LIST_MENU|                      Back                      |noflags|0|0|
add_quick_exit|
end_dialog|BRUTEFORCE_MENU|      Cancel      |       Save       |
]] DIALOG(P, 500) end

function BRUTEFORCING()
for i = KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.STARTING_NUMBER, KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.FINAL_NUMBER do 
if not KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE then CONSOLE("Bruteforce `4deactivated") break end
if BRUTEFORCED then CONSOLE("Password Door bypassed, Password : "..PASSWORD_NUMBER-1) CONSOLE("Bruteforce `4deactivated") BRUTEFORCED = false break end PASSWORD_NUMBER = i SendPacket(2,"action|dialog_return\ndialog_name|password_door_reply\nx|"..math.floor(GetLocal().pos.x//32).."|\ny|"..math.floor(GetLocal().pos.y//32).."|\npassword|"..i) Sleep(150) end
end

AddHook("OnSendPacket", "PACKET-BRUTEFORCE-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/bfmenu") or BUTTON == ("BRUTEFORCE_MENU") then DIALOG_BRUTEFORCE_MENU() return true end
if COMMAND == ("/bruteforce") then if not KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE then KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE = true CONSOLE("Bruteforce `2activated") else KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE = false CONSOLE("Bruteforce `4deactivated") end return true end
if TOGGLE:find("BRUTEFORCE_TOGGLE|1") and not KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE then KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE = true CONSOLE("Bruteforce `2activated") elseif TOGGLE:find("BRUTEFORCE_TOGGLE|0") and KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE then KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE = false CONSOLE("Bruteforce `4deactivated") end
if S:find("INPUT_STARTING_NUMBER|") then local NUMBER = string.sub(S, S:find("INPUT_STARTING_NUMBER|") + 22, S:find("INPUT_FINAL_NUMBER|") - 2) if tonumber(NUMBER) ~= tonumber(KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.STARTING_NUMBER) then KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.STARTING_NUMBER = NUMBER CONSOLE("Starting Number set to : "..KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.STARTING_NUMBER) end end 
if S:find("INPUT_FINAL_NUMBER|") then local NUMBER = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_FINAL_NUMBER|") + 19) if tonumber(NUMBER) ~= tonumber(KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.FINAL_NUMBER) then KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.FINAL_NUMBER = NUMBER CONSOLE("Final Number set to : "..KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.FINAL_NUMBER) end end 

return false end)

AddHook("OnVariant", "VARIANT-BRUTEFORCE-MENU", function(Var)
if KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE then
if Var[0]:find("OnTalkBubble") and Var[2]:find("`2The door opens!") then KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE = false BRUTEFORCED = true end
end
return false end)
-- End of Bruteforce Menu --

-- Princess Menu --
function DIALOG_PRINCESS() local CONDITION if KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE then CONDITION = "`4Deactivate" else CONDITION = "`2Activate" end TM = tostring("set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Princess Menu|left|"..GetItemInfo("Princess").id.."|\nadd_spacer|small|\nadd_checkbox|PRINCESS_TOGGLE|"..CONDITION.." `wFast Princess|"..CHECKBOX(KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE).."|\ntext_scaling_string|textscalingstringstring|\nadd_button_with_icon|PRINCESS_1_TOGGLE|Haunted Bricks|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "1").."|"..GetItemInfo("Haunted Bricks").id.."|20|\nadd_button_with_icon|PRINCESS_2_TOGGLE|LED Sign|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "2").."|"..GetItemInfo("LED Sign").id.."|2|\nadd_button_with_icon|PRINCESS_3_TOGGLE|Older Crystal Block|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "3").."|"..GetItemInfo("Older Crystal Block").id.."|\nadd_button_with_icon|PRINCESS_4_TOGGLE|Growtoken|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "4").."|"..GetItemInfo("Growtoken").id.."|\nadd_button_with_icon|PRINCESS_5_TOGGLE|Fuel Pack|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "5").."|"..GetItemInfo("Fuel Pack").id.."|2|\nadd_button_with_icon|PRINCESS_6_TOGGLE|Battery|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "6").."|"..GetItemInfo("Battery").id.."|100|\nadd_button_with_icon|PRINCESS_7_TOGGLE|Topaz Block|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "7").."|"..GetItemInfo("Topaz Block").id.."|5|\nadd_button_with_icon||END_LIST||0||\nadd_button_with_icon|PRINCESS_8_TOGGLE|Sapphire Block|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "8").."|"..GetItemInfo("Sapphire Block").id.."|5|\nadd_button_with_icon|PRINCESS_9_TOGGLE|Nyan Hat|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "9").."|"..GetItemInfo("Nyan Hat").id.."|\nadd_button_with_icon|PRINCESS_10_TOGGLE|Taco Dog|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "10").."|"..GetItemInfo("Taco Dog").id.."|\nadd_button_with_icon|PRINCESS_11_TOGGLE|Black Pirate Hat|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "11").."|"..GetItemInfo("Black Pirate Hat").id.."|\nadd_button_with_icon|PRINCESS_12_TOGGLE|Old Phonecats Hat|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "12").."|"..GetItemInfo("Old Phonecats Hat").id.."|\nadd_button_with_icon|PRINCESS_13_TOGGLE|Black Devil Wings|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "13").."|"..GetItemInfo("Black Devil Wings").id.."|\nadd_button_with_icon|PRINCESS_14_TOGGLE|Ultra World Spray|"..FRAME_MODE(KONFIGURASI.LIST_MENU.PRINCESS.MODE, "14").."|"..GetItemInfo("Ultra World Spray").id.."|\nadd_button_with_icon||END_LIST||0||\nadd_spacer|small|\nadd_quick_exit|\nadd_button|LIST_MENU|                                  Back                                  |noflags|0|0|\nend_dialog|PRINCESS_MENU|              Close             |             Save             |") DIALOG(TM, 500) end

AddHook("OnSendPacket", "PACKET-PRINCESS-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/princess") or BUTTON == ("PRINCESS_MENU") then DIALOG_PRINCESS() return true end
if COMMAND == ("/fp") then if not KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE then KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE = true CONSOLE("Fast Princess `2activated") else KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE = false CONSOLE("Fast Princess `4deactivated") end return true end
if TOGGLE:find("PRINCESS_TOGGLE|1") and not KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE then KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE = true CONSOLE("Fast Princess `2activated") elseif TOGGLE:find("PRINCESS_TOGGLE|0") and KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE then KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE = false CONSOLE("Fast Princess `4deactivated") end

if BUTTON == ("PRINCESS_1_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "1" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "1", "20 Haunted Bricks" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_2_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "2" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "2", "2 LED Sign" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_3_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "3" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "3", "1 Older Crystal Block" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_4_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "4" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "4", "1 Growtoken" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_5_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "5" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "5", "2 Fuel Pack" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_6_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "6" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "6", "100 Battery" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_7_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "7" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "7", "5 Topaz Block" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_8_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "8" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "8", "5 Sapphire Block" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_9_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "9" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "9", "1 Nyan Hat" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_10_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "10" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "10", "1 Taco Dog" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_11_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "11" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "11", "1 Black Pirate Hat" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_12_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "12" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "12", "1 Old Phonecats Hat" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_13_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "13" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "13", "1 Black Devil Wings" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end
if BUTTON == ("PRINCESS_14_TOGGLE") then if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "14" then KONFIGURASI.LIST_MENU.PRINCESS.MODE, KONFIGURASI.LIST_MENU.PRINCESS.ITEM = "14", "1 Ultra World Spray" else KONFIGURASI.LIST_MENU.PRINCESS.MODE = "" end DIALOG_PRINCESS() end

return false end)

AddHook("OnVariant", "VARIANT-PRINCESS-MENU", function(V)
if KONFIGURASI.LIST_MENU.PRINCESS.TOGGLE then 
if V[0] == "OnDialogRequest" and V[1]:find("end_dialog|princess_dialog|Thanks||") then PRINCESS_X = tonumber(V[1]:match("embed_data|x|(%d+)")) PRINCESS_Y = tonumber(V[1]:match("embed_data|y|(%d+)"))
if KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= nil or KONFIGURASI.LIST_MENU.PRINCESS.MODE ~= "" then SendPacket(2,"action|dialog_return\ndialog_name|princess_dialog\nx|"..PRINCESS_X.."|\ny|"..PRINCESS_Y.."|\nbuttonClicked|buyitem"..KONFIGURASI.LIST_MENU.PRINCESS.MODE) end
return true end 

if V[0] == "OnDialogRequest" and V[1]:find("embed_data|buyitem") then
SendPacket(2,"action|dialog_return\ndialog_name|princess_dialog\nx|"..PRINCESS_X.."|\ny|"..PRINCESS_Y.."|\nbuyitem|actuallybuyitem"..KONFIGURASI.LIST_MENU.PRINCESS.MODE.."|\nbuy_count|1")
return true end

if V[0] == "OnTalkBubble" and V[2]:match("Thank you!") and V[4] == 1 then SendVariantList({[0] = "OnTalkBubble", [1] = GetLocal().netid, [2] = "You got `$"..KONFIGURASI.LIST_MENU.PRINCESS.ITEM.."``!"}) return true end

end
return false end)

-- End of Princess Menu --

-- Spam Editor --
function DIALOG_SPAM_EDITOR() if KONFIGURASI.AUTO_SPAM.TOGGLE then CONDITION_AUTO_SPAM = "`4Deactivate``" else CONDITION_AUTO_SPAM = "`2Activate``" end if KONFIGURASI.AUTO_SPAM.COLORFUL then CONDITION_COLORFUL_SPAM = "`4Deactivate``" else CONDITION_COLORFUL_SPAM = "`2Activate``" end S = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Spam Editor|left|12436|
add_spacer|small|
add_checkbox|AUTO_SPAM_TOGGLE|]]..CONDITION_AUTO_SPAM..[[ Auto Spam|]]..CHECKBOX(KONFIGURASI.AUTO_SPAM.TOGGLE)..[[|
add_text_input|INPUT_SPAM_DELAY|`]]..KONFIGURASI.UI.SECONDARY..[[Spamming `]]..KONFIGURASI.UI.PRIMARY..[[Interval in Miliseconds:|]]..KONFIGURASI.AUTO_SPAM.DELAY..[[|5|
add_smalltext|`]]..KONFIGURASI.UI.NOTE..[[Note `]]..KONFIGURASI.UI.PRIMARY..[[: Default interval is `55000, `]]..KONFIGURASI.UI.PRIMARY..[[minimum is `51000 `]]..KONFIGURASI.UI.PRIMARY..[[(ms)|
add_spacer|small|
add_custom_margin|x:0;y:2|
add_label_with_icon_button_list|tiny|`]]..KONFIGURASI.UI.SECONDARY..[[Spamming Text`]]..KONFIGURASI.UI.PRIMARY..[[ ( Maximum 120 letters, including color codes )|left|GET_SIGN_SPAM_|itemID_itemAmount|20,0|
add_custom_margin|x:0;y:5|
add_text_input|INPUT_SPAM_TEXT||]]..KONFIGURASI.AUTO_SPAM.TEXT..[[|120|
add_spacer|small|
add_label|small|Additional Features :|left|
add_spacer|small|
add_checkbox|COLORFUL_SPAM_TOGGLE|]]..CONDITION_COLORFUL_SPAM..[[ Colorful Spam|]]..CHECKBOX(KONFIGURASI.AUTO_SPAM.COLORFUL)..[[|
add_quick_exit|
add_button|BACK_TO_MAIN_MENU|                                                 Back                                                |noflags|0|0|
end_dialog|SPAM_EDITOR|                    Close                     |                     Save                    |
]] DIALOG(S, 500)  end

RANDOMIZE_COLOR = {0,1,2,3,4,5,6,7,8,9,"!","@","#","$","^","&","w","o","b","p","q","e","r","t","a","s","c"} 

function SPAMMING() if not HAS_SENT then if KONFIGURASI.AUTO_SPAM.COLORFUL then CHAT("`"..RANDOMIZE_COLOR[math.random(1, #RANDOMIZE_COLOR)]..""..KONFIGURASI.AUTO_SPAM.TEXT) HAS_SENT = true else CHAT(KONFIGURASI.AUTO_SPAM.TEXT) HAS_SENT = true end else HAS_SENT = false end end 

AddHook("OnSendPacket", "PACKET-AUTO-SPAM", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/spameditor") or COMMAND == ("/spamsetting") or BUTTON == ("SPAM_EDITOR") then DIALOG_SPAM_EDITOR() return true end
if TOGGLE:find("AUTO_SPAM_TOGGLE|1") and not KONFIGURASI.AUTO_SPAM.TOGGLE then KONFIGURASI.AUTO_SPAM.TOGGLE = true CONSOLE("Auto Spam `2activated") elseif TOGGLE:find("AUTO_SPAM_TOGGLE|0") and KONFIGURASI.AUTO_SPAM.TOGGLE then KONFIGURASI.AUTO_SPAM.TOGGLE = false CONSOLE("Auto Spam `4deactivated") end
if S:find("INPUT_SPAM_TEXT|(.+)") then local MESSAGE = string.sub(S, S:find("INPUT_SPAM_TEXT|") + 16, S:find("COLORFUL_SPAM_TOGGLE|") - 2) if MESSAGE ~= KONFIGURASI.AUTO_SPAM.TEXT then KONFIGURASI.AUTO_SPAM.TEXT = MESSAGE CONSOLE("`6Updated Spam Text >> ``"..KONFIGURASI.AUTO_SPAM.TEXT) end end 
if S:find("INPUT_SPAM_DELAY|(%d+)") then local NUMBER = math.floor(string.sub(S, S:find("INPUT_SPAM_DELAY|") + 17, S:find("INPUT_SPAM_TEXT|") - 2)) if NUMBER ~= KONFIGURASI.AUTO_SPAM.DELAY then KONFIGURASI.AUTO_SPAM.DELAY = NUMBER CONSOLE("`6Updated Spam Interval >> ``"..KONFIGURASI.AUTO_SPAM.DELAY) end end 
if S:find("COLORFUL_SPAM_TOGGLE|1") and not KONFIGURASI.AUTO_SPAM.COLORFUL then KONFIGURASI.AUTO_SPAM.COLORFUL = true CONSOLE("Colorful Spam `2activated") elseif S:find("\nCOLORFUL_SPAM_TOGGLE|0") and KONFIGURASI.AUTO_SPAM.COLORFUL then KONFIGURASI.AUTO_SPAM.COLORFUL = false CONSOLE("Colorful Spam `4deactivated") end 
if BUTTON == ("GET_SIGN_SPAM_20") then if not GET_SIGN_FOR_SPAM then GET_SIGN_FOR_SPAM = true BUBBLE("`2Find a sign then wrench em! and see what happens..") else GET_SIGN_FOR_SPAM = false end return true end
if S:lower():find("/spam") then if KONFIGURASI.AUTO_SPAM.TOGGLE then KONFIGURASI.AUTO_SPAM.TOGGLE = false CONSOLE("Auto Spam `4deactivated") return true else KONFIGURASI.AUTO_SPAM.TOGGLE = true CONSOLE("Auto Spam `2activated") end return true end
if COMMAND == ("/setspam") and ARGS[2] then KONFIGURASI.AUTO_SPAM.TEXT = S:match("/setspam (.+)") CONSOLE("Auto Spam Text set to : "..KONFIGURASI.AUTO_SPAM.TEXT) elseif COMMAND == ("/setspam") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oTo setup the spamming text run this command `5/setspam <text>") return true end
return false end)

AddHook("OnVariant", "VARIANT-AUTO-SPAM", function(Var)
if GET_SIGN_FOR_SPAM then if Var[0] == "OnDialogRequest" and Var[1]:find("end_dialog|sign_edit") then KONFIGURASI.AUTO_SPAM.TEXT = string.sub(Var[1], Var[1]:find("add_text_input|display_text||") + 29, Var[1]:find("|128|") - 1) CONSOLE("`6Updated Spam Text >> ``"..KONFIGURASI.AUTO_SPAM.TEXT) GET_SIGN_FOR_SPAM = false return true end end
return false end)
-- End of Spam Editor --

function UNPACK(T) local R = ""; TELE_TO_X, TELE_TO_Y = 0, 0
for _, V in pairs(T) do if TELE_TO_X == nil or TELE_TO_X == 0 then TELE_TO_X = math.floor(V) // 32 Sleep(250) elseif TELE_TO_Y == nil or TELE_TO_Y == 0 then TELE_TO_Y = math.floor(V) // 32 end end
return TELE_TO_X, TELE_TO_Y
end

function EXTRACT_PLAYER_POSITION(T) local R = "";
for _, V in pairs(T) do R = R .. math.floor(V)//32 ..", " end
return R:sub(1, R:len() - 1)
end

function GET_PLAYER_POSITION(N)
for _, P in pairs(GetPlayerList()) do
if FORMAT_NAME(P.name):lower():match(N) then UNPACK(P.pos) BUBBLE("Teleporting to : "..P.name) FindPath(TELE_TO_X, TELE_TO_Y, 150) -- SendVariantList({[0]="OnSetPos",[1]= P.pos}, GetLocal().netid)
end
end
end

function CHECK_PLAYER_INFORMATION(N) N = N:lower()
for _, P in pairs(GetPlayerList()) do
if FORMAT_NAME(P.name):lower():match(N) then
CHAT("Result for "..P.name.." :") Sleep(800) CHAT("Position : "..EXTRACT_PLAYER_POSITION(P.pos)) Sleep(800) CHAT("NetID : "..P.netid) Sleep(800) CHAT("UserID : "..P.userid) Sleep(800) CHAT("Country or Flag : "..P.country)
end
end
end

AddHook("OnSendPacket", "PACKET-UTIL", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if S:find("action|log\nmsg|") then return true end

if COMMAND == ("/book") then PLACE(GetItemInfo("Book Of Knowledge").id, GET_X(), GET_Y()) return true end
if COMMAND == ("/wear") and ARGS[2] then ARGS[2] = ARGS[2]:lower()
if ARGS[2] == "lkat" then if GET_AMOUNT(GetItemInfo("Legendary Katana").id) > 0 then SHATTER(GetItemInfo("Legendary Katana").id) else BUBBLE("You don't have Legendary Katana (lol)") end 
elseif ARGS[2] == "mray" then if GET_AMOUNT(GetItemInfo("Mythical Infinity Rayman's Fist").id) > 0 then SHATTER(GetItemInfo("Mythical Infinity Rayman's Fist").id) else BUBBLE("You don't have Legendary Katana (lol)") end 
elseif ARGS[2] == "lray" then if GET_AMOUNT(GetItemInfo("Legendary Infinity Rayman's Fist").id) > 0 then SHATTER(GetItemInfo("Legendary Infinity Rayman's Fist").id) else BUBBLE("You don't have Legendary Katana (lol)") end 
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oWear Command available are 'lkat, mray, lray'!") return true end return true
elseif COMMAND == ("/wear") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oWear Command available are 'lkat, mray, lray'!") return true end 

if (COMMAND == ("/tp") or COMMAND == ("/tport")) and ARGS[2] then TARGET_TELEPORT = ARGS[2] TELEPORTING_TO_PLAYER = true return true elseif (COMMAND == ("/tp") or COMMAND == ("/tport")) and not ARGS[2] then CONSOLE("You have to provide the exact name! `5/tp <name>") return true end
if (COMMAND == ("/ipl") and ARGS[2]) then TARGET_TO_CHECK = ARGS[2] CHECKING_PLAYER_INFORMATION = true return true elseif (COMMAND == ("/ipl") and not ARGS[2]) then CONSOLE("You have to provide the exact name! `5/ipl <name>") return true end 

if COMMAND == ("/sign") and ARGS[2] then ARGS[2]:lower()
if ARGS[2] == "spam" then if not GET_SIGN_FOR_SPAM then GET_SIGN_FOR_SPAM = true BUBBLE("`2Find a sign then wrench em! and see what happens..") else GET_SIGN_FOR_SPAM = false end
elseif ARGS[2] == "sb" then if not GET_SIGN_FOR_BROADCAST then GET_SIGN_FOR_BROADCAST = true BUBBLE("`2Find a sign then wrench em! and see what happens..") else GET_SIGN_FOR_BROADCAST = false end
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oSign Command available are 'spam, sb'!") end return true 
elseif COMMAND == ("/sign") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oSign Command available are 'spam, sb'!") return true end

if COMMAND == ("/event") then EVENT(ARGS[2], ARGS[3], ARGS[4]) return true end
if COMMAND == ("/emojis") then BOOM_EMOJI = true return true end
if COMMAND == ("/show") and ARGS[2] then ARGS[2] = ARGS[2]:lower() if ARGS[2] == "id" or ARGS[2] == "uid" then CHECKING_SHOW_UID = true elseif ARGS[2] == "gems" then SHOW_GEMS_ON_WORLD = true elseif ARGS[2] == "bgems" then SHOW_BGEMS_ON_WORLD = true elseif ARGS[2] == "player" then SHOW_PLAYER_ON_WORLD = true elseif ARGS[2] == "water" then if not COUNT_WATER then COUNT_WATER = true BUBBLE("Please wait while we count the water on this world!") else COUNT_WATER = false end elseif ARGS[2] == "balance" or ARGS[2] == "modal" then SHOW_BALANCE = true end return true elseif COMMAND == ("/show") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oShow Command available are 'gems, bgems, player, water, uid, balance/modal'!") return true end
if COMMAND == ("/inventory") then SCAN_UR_INVENTORY = true return true end
if S:find("buttonClicked|DROP_THIS_ITEM_") then ITEM_ID = tonumber(S:match("buttonClicked|DROP_THIS_ITEM_(%d+)")) DROP(GIVE_ID(ITEM_ID), GET_AMOUNT(ITEM_ID)) BUBBLE("Dropped "..GetItemInfo(ITEM_ID).name.. " "..GET_AMOUNT(ITEM_ID)) return true end
if COMMAND == ("/place") then PLACE(424, GET_X(), GET_Y()) return true end

if COMMAND == ("/relog") then LATEST_WORLD = GetWorld().name RELOG = true return true end 
if COMMAND == ("/w") and ARGS[2] then if ARGS[2] == nil or ARGS[2] == "" then CONSOLE("You have to provide the valid world!") return true end WORLD_TO_WARP = ARGS[2] INSTANT_WARP = true return true end
if COMMAND == ("/xy") then CHAT("X [`5"..math.floor(GetLocal().pos.x//32).."``] Y [`5"..math.floor(GetLocal().pos.y//32).."``]") return true end

if COMMAND == ("/exit") or COMMAND == ("/lobby") then JOIN_WORLD("EXIT") return true end
if COMMAND == ("/cr") then if tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true end COLLECT_RANGE = tonumber(ARGS[2]) CRANGE = true return true end
if COMMAND == ("/rg") then RANGE = true return true end
if COMMAND == ("/cheat") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|cheats") return true end
if COMMAND == ("/res") then SendPacket(2,"action|respawn") return true end

if COMMAND == ("/myworlds") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|my_worlds") return true end
if COMMAND == ("/dropbgems") then AMOUNT_BGEMS = tonumber(ARGS[2]) if AMOUNT_BGEMS == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif AMOUNT_BGEMS == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true elseif AMOUNT_BGEMS%250 ~= 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThe drop amount must be an multiple of 250, for example: 250, 500, 750 and so on") return true else DROP_BGEMS = true end return true end
if COMMAND == ("/suck") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|bgem_suckall") return true end 

if COMMAND == ("/dp") or COMMAND == ("/depo") or COMMAND == ("/deposit") then if GET_AMOUNT(7188) <= 0 and GET_AMOUNT(11550) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have enough `eBlue Gem Lock`o to deposit!") return true elseif ARGS[2] == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oTo deposit Blue Gem Lock, run command `5/dp <amount> `oor `5/dpl `oto deposit all") return true elseif tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true end if GET_AMOUNT(7188) < tonumber(ARGS[2]) then BREAK_BLACK() end AMOUNT_DEPOSIT = tonumber(ARGS[2]) DEPOSIT = true return true end 
if COMMAND == ("/dpl") then if GET_AMOUNT(7188) <= 0 and GET_AMOUNT(11550) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have enough `eBlue Gem Lock`o to deposit!") return true end DEPOSIT_ALL = true return true end 
if COMMAND == ("/wd") or COMMAND == ("/draw") or COMMAND == ("/withdraw") then if ARGS[2] == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oTo withdrawn Blue Gem Lock, run command `5/wd <amount> `oor `5/wdl `oto withdraw all") return true elseif tonumber(ARGS[2]) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(ARGS[2]) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true end SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|"..tonumber(ARGS[2])) return true end
if COMMAND == ("/wdl") then WITHDRAW_ALL = true return true end
if COMMAND == ("/bank") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|bgls") return true end
if COMMAND == ("/bgems") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|bgems") return true end

if COMMAND == ("/compress") then if not KONFIGURASI.LIST_MENU.HOSTER.AUTO_COMPRESS then KONFIGURASI.LIST_MENU.HOSTER.AUTO_COMPRESS = true CONSOLE("Auto compress `2activated") return true else KONFIGURASI.LIST_MENU.HOSTER.AUTO_COMPRESS = false CONSOLE("Auto compress `4deactivated") end return true end 
if COMMAND == ("/c") or COMMAND == ("/cbgl") then if GET_AMOUNT(1796) < 100 then BUBBLE("`wYou don't have enough diamond locks to convert!") return true end CBGL = true return true end
if COMMAND == ("/hitam") or COMMAND == ("/ireng") or COMMAND == ("/black") then if GET_AMOUNT(7188) < 100 then BUBBLE("`wYou don't have enough blue gem locks to convert!") return true end CREATE_BLACK() return true end 
if COMMAND == ("/biru") or COMMAND == ("/blue") then if GET_AMOUNT(11550) < 1 then BUBBLE("`wYou don't have enough black gem locks to convert!") return true end BREAK_BLACK() return true end 
if COMMAND == ("/buydl") then if GetPlayerInfo().gems < 99999 then CONSOLE("`wYou don't have enough gems to buy a diamond lock!") return true end BUYDL = true return true end
if COMMAND == ("/info") or BUTTON == ("INFORMATION") then local I = tostring("set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.INFORMATION.TITLE.."|left|7074|\nadd_smalltext|"..CUSTOM_TEXT.INFORMATION.SPACING.."|\nadd_smalltext|"..CUSTOM_TEXT.INFORMATION.DESCRIPTION.."|\nadd_smalltext|"..CUSTOM_TEXT.INFORMATION.SPACING.."|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.CREATOR.."|left|7070|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.CONTRIBUTOR.."|left|"..GetItemInfo("Dumb Worker").id.."|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.BOTHAX.."|left|2398|\nadd_spacer|small|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.LIST_1.TITLE.."|left|226|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.LIST_1.INFO_1.."|left|482|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.LIST_1.INFO_2.."|left|482|\nadd_spacer|small|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.LIST_2.TITLE.."|left|8282|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.LIST_2.INFO_1.."|left|482|\nadd_label_with_icon|small|"..CUSTOM_TEXT.INFORMATION.LIST_2.INFO_2.."|left|482|\nadd_spacer|small|\nadd_quick_exit|\nadd_button|BACK_TO_MAIN_MENU|Back|noflags|0|0|\nend_dialog|INFORMATION|") DIALOG(I, 500) return true end
if BUTTON == ("CHECK_PROFILE") then CHECK_PROFILE = true return true end 

if COMMAND == ("/g") then CHAT("/ghost") BUBBLE("Boo (ghost)") return true end

return false end)

AddHook("OnVariant", "VARIANT-UTIL", function(Var)

--if Var[0] == "OnConsoleMessage" and (Var[1]:find("mod added") or Var[1]:find("mod removed")) then CONSOLE("`w[`6EFFECT`w] "..Var[1]) return true end

if DROP_BGEMS then if Var[0] == "OnDialogRequest" and Var[1]:find("The Black Backpack") then return true end end
if Var[0] == "OnConsoleMessage" and Var[1]:find("UPDATE RECOMMENDED") then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou're using an outdated version of Growtopia! You may experience visual bugs, etc") return true end
if Var[0] == "OnConsoleMessage" and (Var[1]:find("Your speech queued") or Var[1]:find("You're still on a cooldown")) then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou're on cooldown period, don't worry while your typing/speech in the queue.") return true end
if Var[0] == "OnConsoleMessage" and Var[1]:find("`3FRIEND ALERT:``") then NAME, MESSAGE = Var[1]:match("`3FRIEND ALERT:`` (.+) has (.+)") CONSOLE("`w[`3FRIEND`w] "..NAME.." `ohas "..MESSAGE) return true end

if Var[0] == "OnConsoleMessage" and Var[1]:find("`#** `$The Gods`` `ohave `4banned") then NAME, REASON = Var[1]:match("`#** `$The Gods`` `ohave `4banned`` (.+)`` ((.+)``, `4/rules`` to see the rules!) `#** ``") CONSOLE("`w[`bPUNISH`w] `oThe Moderator `4BANNED "..NAME.."`o, Reason : `6"..REASON) return true end
if Var[0] == "OnConsoleMessage" and Var[1]:find("`#** `$The Gods`` `ohave cursed") then NAME = Var[1]:match("`#** `$The Gods`` `ohave cursed (.+)`` to the netherworld) `#**") CONSOLE("`w[`bPUNISH`w] `oThe Moderator `rCURSED "..NAME.." `oto the `4HELL") return true end

if Var[0]:find("OnTalkBubble") and Var[1] == GetLocal().netid and Var[2]:find("Deposited `$(%d+)`` Blue Gem Locks! You have `$(%d+)`` in the bank now.") then local DEPOSIT_AMOUNT, BANK_AMOUNT = Var[2]:match("Deposited `$(%d+)`` Blue Gem Locks! You have `$(%d+)`` in the bank now.") if DEPOSIT_AMOUNT == nil then DEPOSIT_AMOUNT = "Undefined" end
if KONFIGURASI.BUBBLE.DEPOSIT_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDeposited `$"..DEPOSIT_AMOUNT.." `eBlue Gem Lock") end
if KONFIGURASI.OVERLAY.DEPOSIT_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDeposited `$"..DEPOSIT_AMOUNT.." `eBlue Gem Lock") end
if not KONFIGURASI.BUBBLE.DEPOSIT_BUBBLE then BUBBLE("Deposited `$"..DEPOSIT_AMOUNT.."`` `eBlue Gem Lock``! You have `$"..BANK_AMOUNT.."`` in the `bbank ``now.") end 
return true end 

if Var[0]:find("OnTalkBubble") and Var[1] == GetLocal().netid and Var[2]:match("`2Withdrawn") then local WITHDRAW_AMOUNT, BANK_AMOUNT = Var[2]:match("`2Withdrawn (%d+) Blue Gem Locks!`` You have (%d+) in the bank now.") if KONFIGURASI.BUBBLE.WITHDRAW_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wWithdrawn "..WITHDRAW_AMOUNT.." `eBlue Gem Lock") end if KONFIGURASI.OVERLAY.WITHDRAW_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wWithdrawn "..WITHDRAW_AMOUNT.." `eBlue Gem Lock") end if not KONFIGURASI.BUBBLE.WITHDRAW_BUBBLE then BUBBLE("Withdrawn "..WITHDRAW_AMOUNT.." `eBlue Gem Lock``! You have "..BANK_AMOUNT.." in the `bbank now.") end return true end 

if Var[0] == "OnConsoleMessage" and Var[1]:find("Deposited") then DEPOSIT_AMOUNT, BANK_AMOUNT = Var[1]:match("Deposited `$(%d+)`` Blue Gem Locks! You have `$(%d+)`` in the bank now.") CONSOLE("Deposited `$"..DEPOSIT_AMOUNT.."`` `eBlue Gem Lock``! You have `$"..BANK_AMOUNT.."`` in the `bbank ``now.") return true end
if Var[0] == "OnConsoleMessage" and Var[1]:find("Withdrawn") then WITHDRAW_AMOUNT, BANK_AMOUNT = Var[1]:match("`2Withdrawn (%d+) Blue Gem Locks!`` You have (%d+) in the bank now.") CONSOLE("Withdrawn "..WITHDRAW_AMOUNT.." `eBlue Gem Lock``! You have "..BANK_AMOUNT.." in the `bbank ``now.") return true end

if WITHDRAW_ALL then
if Var[0] == "OnDialogRequest" and Var[1]:find("The BGL Bank") then KONFIGURASI.OTHERS.BGL_ON_BANK = tonumber(Var[1]:match("You have `$(%d+)`` BGLs in the Bank")) return true end
end

if CHECK_PROFILE then
if Var[0] == "OnDialogRequest" and Var[1]:find("The BGL Bank") then KONFIGURASI.OTHERS.BGL_ON_BANK = tonumber(Var[1]:match("You have `$(%d+)`` BGLs in the Bank")) return true end
if Var[0] == "OnDialogRequest" and Var[1]:find("Creative Kits") then KIT_LEVEL = tonumber(Var[1]:match("Creative Kits``|(%d+)|")) return true end
if Var[0] == "OnDialogRequest" and Var[1]:find("end_dialog|popup|||") then GET_PARAM = string.sub(Var[1], Var[1]:find("add_player_info|") + 16, Var[1]:find("add_spacer|small|") - 2) 
P = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_player_info|]]..GET_PARAM..[[|
add_spacer|small|
add_label|small|Account Net. Worth : ]]..FORMAT_NUMBER((GET_AMOUNT(242))+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(KONFIGURASI.OTHERS.BGL_ON_BANK*10000)+(GET_AMOUNT(11550)*1000000)+(GetPlayerInfo().gems//1000))..[[ World Locks |
add_spacer|small|
add_label_with_icon|small|Kit Level : ]]..KIT_LEVEL..[[|left|604|
add_spacer|small|
text_scaling_string|textscalingstringstring|
add_button_with_icon||World Locks|staticBlueFrame|242|]]..GET_AMOUNT(242)..[[|
add_button_with_icon||Diamond Locks|staticBlueFrame|1796|]]..GET_AMOUNT(1796)..[[|
add_button_with_icon||Blue Gem Locks|staticBlueFrame|7188|]]..GET_AMOUNT(7188)..[[|
add_button_with_icon||Black Gems Locks|staticBlueFrame|11550|]]..GET_AMOUNT(11550)..[[|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_label_with_icon|small|Total Gems : ]]..FORMAT_NUMBER(GetPlayerInfo().gems)..[[|left|9438|
add_label_with_icon|small|Blue Gem Lock in the bank : ]]..KONFIGURASI.OTHERS.BGL_ON_BANK..[[|left|7188|
add_label_with_icon|small|Total Growtokens : ]]..(GET_AMOUNT(1486))+(GET_AMOUNT(6802)*100)..[[|left|1486|
add_spacer|small|
add_quick_exit|
end_dialog|PROFILE_MENU| Nevermind ||
]] DIALOG(P, 500)
return true end
end

if Var[0] == "OnKilled" then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wRespawning") end
return false end)

AddHook("OnSendPacket", "PACKET-FUN", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/fakeban") then SendPacket(3, "action|quit") SendVariantList({[0] = "OnAddNotification", [1] = "interface/atomic_button.rttex", [2] = "Warning from `4System``: You've been `4BANNED`` from `wGrowtopia`` for 730 days", [3] = "audio/hub_open.wave"}) SendVariantList({[0] = "OnConsoleMessage", [1] = "Warning from `4System``: You've been `4BANNED`` from `wGrowtopia`` for 730 days"}) SendVariantList({[0] = "OnConsoleMessage", [1] = "`5** ```$The Ancients`` have used `5Ban`` on `w"..GetLocal().name.."``! `5**``"}) SendVariantList({[0] = "OnConsoleMessage", [1] = "`4** `$"..GetLocal().name.."`` AUTO-BANNED BY SYSTEM **`` (`$/rules`` to view rules)"}) SendPacket(3, "action|quit") return true end
if COMMAND == ("/pinata") then if not GACHA_PINATA then GACHA_PINATA = true CONSOLE("Auto Gacha Pinata `2activated") else GACHA_PINATA = false CONSOLE("Auto Gacha Pinata `4deactivated") end return true end
if COMMAND == ("/sing") then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`o"..CUSTOM_TEXT.ALERT.NEXT_UPDATE) return true end
if COMMAND == ("/jutsu") then if not RUN_THE_JUTSU then RUN_THE_JUTSU = true else RUN_THE_JUTSU = false end return true end
return false end)

-- Growscan Feature --
function DIALOG_GROWSCAN() local GS = tostring("set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|"..CUSTOM_TEXT.GROWSCAN.TITLE.."|left|6016|\nadd_spacer|small|\nadd_textbox|"..CUSTOM_TEXT.GROWSCAN.DESCRIPTION.."|\nadd_spacer|small|\nadd_button|SCANNING_BLOCKS|`oWorld Blocks|noflags|0|0|\nadd_button|SCANNING_FLOATS|`oFloating Items|noflags|0|0|\nadd_spacer|small|\nadd_checkbox|SHOW_SCAN_WITH_CHAT_TOGGLE|Show Scan Through Chat instead of Dialog|"..CHECKBOX(KONFIGURASI.GROWSCAN.SHOW_WITH_CHAT).."|\nadd_quick_exit|\nend_dialog|GROWSCAN_STARRIES| Cancel | Apply |") DIALOG(GS, 500) end
function SCAN_BLOCK() TABLE_SCAN = {} for _, T in pairs(GetTiles()) do VALUE = T.fg if TABLE_SCAN[T.fg] == nil then TABLE_SCAN[T.fg] = {VALUE = T.fg, AMOUNT = 1} else TABLE_SCAN[T.fg].AMOUNT = TABLE_SCAN[T.fg].AMOUNT + 1 end if TABLE_SCAN[T.bg] == nil then TABLE_SCAN[T.bg] = {VALUE = T.bg, AMOUNT = 1} else TABLE_SCAN[T.bg].AMOUNT = TABLE_SCAN[T.bg].AMOUNT + 1 end end LOAD_STRING = "add_spacer|small|" for _, D in pairs(TABLE_SCAN) do ITEM_COUNT = math.floor(D.AMOUNT) ITEM_NAME = GetItemInfo(math.floor(D.VALUE)).name if math.floor(D.VALUE) ~= 0 then LOAD_STRING = LOAD_STRING.."\nadd_label_with_icon_button_list|small|"..ITEM_NAME.." : "..ITEM_COUNT.."|left|SEARCH_THIS_BLOCK_|itemID_itemAmount|"..math.floor(D.VALUE)..","..ITEM_COUNT end end Sleep(250) if KONFIGURASI.GROWSCAN.SHOW_WITH_CHAT then CHAT("Beep Beep, Scanning...") Sleep(900) for _, D in pairs(TABLE_SCAN) do if D.VALUE ~= 0 then ITEM_COUNT = math.floor(D.AMOUNT) ITEM_NAME = GetItemInfo(math.floor(D.VALUE)).name CHAT("``"..ITEM_NAME.." `w: "..ITEM_COUNT) Sleep(900) end end CHAT("Scanning has been carried out..") return end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|World Blocks|left|6016\n"..LOAD_STRING.."\nadd_quick_exit\nadd_spacer|small\nadd_button|GROWSCAN_MENU|Back|noflags|0|0|\nend_dialog|GROWSCAN_STARRIES|||"}) end
function SCAN_FLOAT() TABLE_SCAN = {} for _, O in pairs(GetObjectList()) do VALUE = O.id if TABLE_SCAN[O.id] == nil then TABLE_SCAN[O.id] = {VALUE = O.id, AMOUNT = O.amount} else TABLE_SCAN[O.id].AMOUNT = TABLE_SCAN[O.id].AMOUNT + O.amount end end LOAD_STRING = "add_spacer|small|" for _, D in pairs(TABLE_SCAN) do ITEM_COUNT = math.floor(D.AMOUNT) ITEM_NAME = GetItemInfo(math.floor(D.VALUE)).name LOAD_STRING = LOAD_STRING.."\nadd_label_with_icon_button_list|small|"..ITEM_NAME.." : "..ITEM_COUNT.."|left|SEARCH_THIS_FLOAT_|itemID_itemAmount|"..math.floor(D.VALUE)..","..ITEM_COUNT end Sleep(250) if KONFIGURASI.GROWSCAN.SHOW_WITH_CHAT then CHAT("Beep Beep, Scanning...") Sleep(900) for _, D in pairs(TABLE_SCAN) do ITEM_COUNT = math.floor(D.AMOUNT) ITEM_NAME = GetItemInfo(math.floor(D.VALUE)).name CHAT("``"..ITEM_NAME.." `w: "..ITEM_COUNT) Sleep(900) end CHAT("Scanning has been carried out..") return end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Floating Items|left|6016\n"..LOAD_STRING.."\nadd_quick_exit\nadd_spacer|small|\nadd_button|GROWSCAN_MENU|Back|noflags|0|0|\nend_dialog|GROWSCAN_STARRIES|||"}) end
function SEARCH_GROWSCAN(I, S) pkt = { type = 37, netid = I } if S then pkt.dropped = 1 end SendPacketRaw(true, pkt) end
function SCAN_INVENTORY() TABLE_SCAN = {} for _, I in pairs(GetInventory()) do VALUE = I.id if TABLE_SCAN[I.id] == nil then TABLE_SCAN[I.id] = {VALUE = I.id, AMOUNT = I.amount} else TABLE_SCAN[I.id].amount = TABLE_SCAN[I.id].amount + I.amount end end LOAD_STRING = "add_spacer|small|" for _, D in pairs(TABLE_SCAN) do ITEM_COUNT = math.floor(D.AMOUNT) ITEM_NAME = GetItemInfo(math.floor(D.VALUE)).name LOAD_STRING = LOAD_STRING.."\nadd_label_with_icon_button_list|small|"..ITEM_NAME.." : "..ITEM_COUNT.."|left|DROP_THIS_ITEM_|itemID_itemAmount|"..math.floor(D.VALUE)..","..ITEM_COUNT end Sleep(500) SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Inventory Item|left|13688\nadd_spacer|small|\nadd_smalltext|Click the item icon to drop that item|"..LOAD_STRING.."\nadd_quick_exit\nadd_spacer|small|\nend_dialog|SCAN_INVENTORY|Close||"}) end

AddHook("OnSendPacket", "PACKET-GROWSCAN", function(T, S) local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/gscan") or BUTTON == ("GROWSCAN_MENU") then DIALOG_GROWSCAN() return true end
if S:find("buttonClicked|SEARCH_THIS_FLOAT_(%d+)") then SEARCH_GROWSCAN(tonumber(S:match("SEARCH_THIS_FLOAT_(%d+)")), true) return true end
if S:find("buttonClicked|SEARCH_THIS_BLOCK_(%d+)") then SEARCH_GROWSCAN(tonumber(S:match("SEARCH_THIS_BLOCK_(%d+)")), false) return true end
if BUTTON == ("SCANNING_BLOCKS") then KONFIGURASI.GROWSCAN.SCAN_BLOCKS = true return true end
if BUTTON == ("SCANNING_FLOATS") then KONFIGURASI.GROWSCAN.SCAN_FLOATS = true return true end

if TOGGLE:find("SHOW_SCAN_WITH_CHAT_TOGGLE|1") and not KONFIGURASI.GROWSCAN.SHOW_WITH_CHAT then KONFIGURASI.GROWSCAN.SHOW_WITH_CHAT = true CONSOLE("Show Scan Through Chat `2activated") DIALOG_GROWSCAN() elseif TOGGLE:find("SHOW_SCAN_WITH_CHAT_TOGGLE|0") and KONFIGURASI.GROWSCAN.SHOW_WITH_CHAT then KONFIGURASI.GROWSCAN.SHOW_WITH_CHAT = false CONSOLE("Show Scan Through Chat `4deactivated") DIALOG_GROWSCAN() end

return false end)
-- End of Growscan --

-- Services Menu --
function DIALOG_SERVICE_MENU() S = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|]]..CUSTOM_TEXT.SERVICE_MENU.TEXT.TITLE..[[|left|7070|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|SERVICE_BROADCAST|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.SUPER_BROADCAST..[[|staticBlueFrame|2480||
add_button_with_icon|SERVICE_ITEM_FINDER|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.ITEM_FINDER..[[|staticBlueFrame|6016||
add_button_with_icon|SERVICE_ITEM_MOVER|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.ITEM_MOVER..[[|staticBlueFrame|1404||
add_button_with_icon|SERVICE_CLEAR_FLOAT|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.CLEAR_FLOAT..[[|staticBlueFrame|10318||
add_button_with_icon|SERVICE_CLEAR_WATER|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.CLEAR_WATER..[[|staticBlueFrame|822||
add_button_with_icon|SERVICE_SETUP_PLATFORM|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.SETUP_PLATFORM..[[|staticBlueFrame|3126||
add_button_with_icon||END_LIST||0||
add_button_with_icon|SERVICE_WORLD_FINDER|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.WORLD_FINDER..[[|staticBlueFrame|3802||
add_button_with_icon|SERVICE_CLEAR_WORLD|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.CLEAR_WORLD..[[|staticBlueFrame|1402||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|BACK_TO_MAIN_MENU|]]..CUSTOM_TEXT.SERVICE_MENU.BUTTON.BACK..[[|noflags|0|0|
end_dialog|SERVICES_MENU|||
]] DIALOG(S, 500) end

function GET_WORLD_SIZE()
WORLD_TYPE = type(GetTile(199, 199)) == "table" WORLD_X = WORLD_TYPE and 199 or 99 WORLD_Y = WORLD_TYPE and 199 or 58
end

function SORT_OBJECT() local old_obj = GetObjectList() local ret_obj = {} for _, v in pairs(old_obj) do table.insert(ret_obj, v) end table.sort(ret_obj, function(left, right) return (left.pos.y < right.pos.y) or (left.pos.y == right.pos.y and left.pos.x < right.pos.x) end) return ret_obj end

function CLEAR_FLOAT_ON_WORLD() GET_WORLD_SIZE() for _, O in pairs(SORT_OBJECT()) do if not KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.TOGGLE then break return end FindPath(math.floor(O.pos.x//32), math.floor(O.pos.y//32), 100) Sleep(100) FindPath(math.floor(O.pos.x//32) + 1, math.floor(O.pos.y//32), 100) end BUBBLE("I didn't found floating items in this world") KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.TOGGLE = false ChangeValue("[C] Modfly", false) end
function CLEAR_WATER_ON_WORLD() GET_WORLD_SIZE() if GET_AMOUNT(822) < 1 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have any water bucket!") return true end for X = 0, WORLD_X do for Y = 0, WORLD_Y do if not KONFIGURASI.SERVICE_MENU.CLEAR_WATER.TOGGLE then break return end if GetTile(X , Y).flags.water then FindPath(X, Y, 100) Sleep(150) PLACE(822, X, Y) Sleep(150) end end end BUBBLE("I didn't found water in this world") KONFIGURASI.SERVICE_MENU.CLEAR_WATER.TOGGLE = false ChangeValue("[C] Modfly", false) end
function COUNT_WATER_ON_WORLD() GET_WORLD_SIZE() WATER_AMOUNT = 0 for X = 0, WORLD_X do for Y = 0, WORLD_Y do if not COUNT_WATER then break return end if GetTile(X , Y).flags.water then WATER_AMOUNT = WATER_AMOUNT + 1 end end end CHAT("Total water in this world : "..WATER_AMOUNT) COUNT_WATER = false end
function GET_COMMAND(S) local A = {} for I in S:gmatch('[^%s]+') do A[#A+1]=i end return A end

AddHook("OnSendPacket", "PACKET-SERVICES", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/service") or COMMAND == ("/jasa") or BUTTON == ("SERVICE_MENU") then DIALOG_SERVICE_MENU() return true end
if COMMAND == ("/clear") and ARGS[2] then ARGS[2]:lower()
if ARGS[2] == "water" then if not KONFIGURASI.SERVICE_MENU.CLEAR_WATER.TOGGLE then KONFIGURASI.SERVICE_MENU.CLEAR_WATER.TOGGLE = true BUBBLE(KONFIGURASI.SYSTEM.CREDIT.."`wPlease be patient while clearing the water") return true else KONFIGURASI.SERVICE_MENU.CLEAR_WATER.TOGGLE = false CONSOLE("Clear Water `4deactivated") end
elseif ARGS[2] == "float" then if not KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.TOGGLE then KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.TOGGLE = true BUBBLE(KONFIGURASI.SYSTEM.CREDIT.."`wPlease be patient while getting floating item") return true else KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.TOGGLE = false CONSOLE("Clear Floating Items `4Disabled") end 
else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oClear Command available are 'water, float'!")
end return true
elseif COMMAND == ("/clear") and (not ARGS[2] or ARGS[2] == nil) then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oClear Command available are 'water, float'!")

return true end

return false end)

function DIALOG_BROADCAST_EDITOR() if KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING then CONDITION = "Stop Broadcast" CONDITION_FRAME = "staticPurpleFrame" else CONDITION = "Start Broadcast" CONDITION_FRAME = "staticGreyFrame" end SB = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Edit Super Broadcast|left|2480|
add_spacer|small|
add_text_input|INPUT_BROADCAST_COUNTER|`]]..KONFIGURASI.UI.SECONDARY..[[Broadcast Counter `]]..KONFIGURASI.UI.PRIMARY..[[:|]]..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER..[[|3|
add_smalltext|(Calculate the current or total broadcasts during the broadcast process)|
add_spacer|small|
add_text_input|INPUT_BROADCAST_LIMIT|`]]..KONFIGURASI.UI.SECONDARY..[[Broadcast Limit `]]..KONFIGURASI.UI.PRIMARY..[[:|]]..KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT..[[|3|
add_smalltext|(How many times the broadcast will be carried out)|
add_spacer|small|
add_text_input|INPUT_BROADCAST_TIMER|`]]..KONFIGURASI.UI.SECONDARY..[[Broadcast Timer `]]..KONFIGURASI.UI.PRIMARY..[[in minutes :|]]..KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER..[[|5|
add_smalltext|(Used for timer mode, default timer is `]]..KONFIGURASI.UI.SECONDARY..[[60`]]..KONFIGURASI.UI.PRIMARY..[[, minimum is `]]..KONFIGURASI.UI.SECONDARY..[[60 `]]..KONFIGURASI.UI.PRIMARY..[[(minutes)|
add_spacer|small|
add_custom_margin|x:0;y:5|
add_label_with_icon_button_list|tiny|`]]..KONFIGURASI.UI.SECONDARY..[[Broadcast Text`]]..KONFIGURASI.UI.PRIMARY..[[ ( Max 120 letter include color codes )|left|GET_SIGN_SB_|itemID_itemAmount|20,0|
add_smalltext|(Provide your broadcast text, use your imagination to add excitement)|
add_custom_margin|x:0;y:5|
add_text_input|INPUT_BROADCAST_TEXT||]]..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT..[[|120|
add_spacer|small|
add_smalltext|Counter mode :            Choose mode :|left|
text_scaling_string|textscalingstring|
add_button_with_icon|COUNT_UP|Count Up|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE, "UP")..[[|484||
add_button_with_icon|COUNT_DOWN|Count Down|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE, "DOWN")..[[|486||
add_button_with_icon|MODE_COUNTER|Counter|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.BROADCAST.MODE, "COUNTER")..[[|10860||
add_button_with_icon|MODE_TIMER|Timer|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.BROADCAST.MODE, "TIMER")..[[|1482||
add_button_with_icon||END_LIST||0||
add_smalltext|(Choose the broadcast mode between Counter or with Timer in a minutes)|
add_spacer|small|
add_smalltext|Feature :|left|
add_button_with_icon|SEND_SB|]]..CONDITION..[[|]]..CONDITION_FRAME..[[|2480||
add_button_with_icon|MENTION_USER_SB|Mention User|]]..FRAME(KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION)..[[|1400||
add_button_with_icon|BACK_WORLD_SB|Back World|]]..FRAME(KONFIGURASI.SERVICE_MENU.BROADCAST.BACK)..[[|3802||
add_button_with_icon|SEND_TEST_BROADCAST|Tes Broadcast|staticBlueFrame|3704||
add_button_with_icon|RESET_SB|Reset Default|staticBlueFrame|32||
add_button_with_icon||END_LIST||0||
add_text_input|INPUT_BROADCAST_DISCORD_ID|`]]..KONFIGURASI.UI.SECONDARY..[[Your Discord `]]..KONFIGURASI.UI.PRIMARY..[[User ID :|]]..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID..[[|50|
add_smalltext| (Provide with your discord id, needed when u activate the 'Mention User')|
add_spacer|small|
add_text_input|INPUT_BROADCAST_WORLD|`]]..KONFIGURASI.UI.SECONDARY..[[Your World `]]..KONFIGURASI.UI.PRIMARY..[[:|]]..KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD..[[|50|
add_smalltext| (Provide with your world name, needed when u activate the 'Back World')|
add_spacer|small|
add_quick_exit|
add_button|SERVICE_MENU|                                   Back                                   |noflags|0|0|
end_dialog|BROADCAST_EDITOR|             Cancel             |             Save             |
]] DIALOG(SB, 500) end

function DIALOG_MENTION_MENU() M = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label|small|Select|left|
add_spacer|small|
text_scaling_string|textscalingstringstring|
add_button_with_icon|MENTION_ON_ALL|Mention ALL|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE, "ALL")..[[|2816||
add_button_with_icon|MENTION_ON_END|Mention Only END|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE, "END")..[[|2818||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_quick_exit|
add_button|SERVICE_BROADCAST|    Back    |noflags|0|0|
end_dialog|MENTION_MENU|||
]] DIALOG(M, 500) end

function BROADCASTING()
if GetWorld() == nil or GetWorld().name ~= KONFIGURASI.SERVICE_MENU.BROADCAST.BROADCASTED_WORLD then CONSOLE("`6Disconnected while broadcasting?! attempt to reconnect...") Sleep(1000) JOIN_WORLD(KONFIGURASI.SERVICE_MENU.BROADCAST.BROADCASTED_WORLD)
else
if KONFIGURASI.SERVICE_MENU.BROADCAST.MODE == "COUNTER" then KONFIGURASI.SERVICE_MENU.BROADCAST.CHECKING_COUNTER = true
	if not KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY then
		if KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE == "UP" then
			local M = KONFIGURASI.SYSTEM.CREDIT.."`w(megaphone) "..CUSTOM_TEXT.BROADCAST.A.." : `%s" CHAT(M:format(53)) Sleep(1000) CHAT(M:format(52)) Sleep(1000) CHAT(M:format(51)) Sleep(1500)
			CHAT("/sb "..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT.."") Sleep(1000) KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER = KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER + 1 
			if KONFIGURASI.SERVICE_MENU.BROADCAST.CHECKING_COUNTER and (KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT-KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER == 0 ) then KONFIGURASI.SERVICE_MENU.BROADCAST.CHECKING_COUNTER = false CHAT(KONFIGURASI.SYSTEM.CREDIT.."`w(nuke) "..CUSTOM_TEXT.BROADCAST.B.." : `6"..KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT.."`w, "..CUSTOM_TEXT.BROADCAST.C.."! (halo)") Sleep(1000) if KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION or KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "END" and KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "ALL" then WHO_MENTIONED = "<@"..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID..">" else WHO_MENTIONED = "" end SEND_WEBHOOK(KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK, KONFIGURASI.SERVICE_MENU.BROADCAST.EMBED:format(WHO_MENTIONED, FORMAT_NAME(GetLocal().name), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), FORMAT_NUMBER(KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED), KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER, TIME_SPLIT(0):format("hours,", "minutes,", "seconds."), "Super Broadcasting finished, enjoy your break!", KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT)) KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED, KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER = 0, 0 if KONFIGURASI.SERVICE_MENU.BROADCAST.BACK then CHAT(KONFIGURASI.SYSTEM.CREDIT.."(fireworks) `wBack to "..KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD) Sleep(1000) JOIN_WORLD(KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD) end KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING = false KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = false return true else CHAT(KONFIGURASI.SYSTEM.CREDIT.."`w(eyes) "..CUSTOM_TEXT.BROADCAST.D.." `2"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER.." `w"..CUSTOM_TEXT.BROADCAST.E.." `6"..KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT.." `w"..CUSTOM_TEXT.BROADCAST.F..", `e"..KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT-KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER.." `w"..CUSTOM_TEXT.BROADCAST.G..".") Sleep(1000) if KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION and KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "ALL" then WHO_MENTIONED = "<@"..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID..">" else WHO_MENTIONED = "" end SEND_WEBHOOK(KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK, KONFIGURASI.SERVICE_MENU.BROADCAST.EMBED:format(WHO_MENTIONED, FORMAT_NAME(GetLocal().name), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), FORMAT_NUMBER(KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED), KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER, TIME_SPLIT(0):format("hours,", "minutes,", "seconds."),"Super Broadcasting! **"..KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT-KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER.."** broadcast left until it stopped", KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT)) KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = true end
			Sleep(KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER_QUEUE)
		end

		if KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE == "DOWN" then
			local M = KONFIGURASI.SYSTEM.CREDIT.."`w(megaphone) "..CUSTOM_TEXT.BROADCAST.A.." : `%s" CHAT(M:format(53)) Sleep(1000) CHAT(M:format(52)) Sleep(1000) CHAT(M:format(51)) Sleep(1500)
			CHAT("/sb "..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT.."") Sleep(1000) KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT = KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT - 1 
			if KONFIGURASI.SERVICE_MENU.BROADCAST.CHECKING_COUNTER and (KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER-KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT == 0 ) then KONFIGURASI.SERVICE_MENU.BROADCAST.CHECKING_COUNTER = false CHAT(KONFIGURASI.SYSTEM.CREDIT.."`w(nuke) "..CUSTOM_TEXT.BROADCAST.B.." : `6"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER.."`w, "..CUSTOM_TEXT.BROADCAST.C.."! (halo)") Sleep(1000) if KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION or KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "END" and KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "ALL" then WHO_MENTIONED = "<@"..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID..">" else WHO_MENTIONED = "" end SEND_WEBHOOK(KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK, KONFIGURASI.SERVICE_MENU.BROADCAST.EMBED:format(WHO_MENTIONED, FORMAT_NAME(GetLocal().name), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), FORMAT_NUMBER(KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED), KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER, TIME_SPLIT(0):format("hours,", "minutes,", "seconds."), "Super Broadcasting finished, enjoy your break!", KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT)) KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED, KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER = 0, 0 if KONFIGURASI.SERVICE_MENU.BROADCAST.BACK then CHAT(KONFIGURASI.SYSTEM.CREDIT.."(fireworks) `wBack to "..KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD) Sleep(1000) JOIN_WORLD(KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD) end KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING = false KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = false return true else CHAT(KONFIGURASI.SYSTEM.CREDIT.."`w(eyes) "..CUSTOM_TEXT.BROADCAST.D.." `2"..KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT.." `w"..CUSTOM_TEXT.BROADCAST.H.." `6"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER.." `w"..CUSTOM_TEXT.BROADCAST.F..", `e"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER-KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER.." `w"..CUSTOM_TEXT.BROADCAST.G..".") Sleep(1000) if KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION and KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "ALL" then WHO_MENTIONED = "<@"..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID..">" else WHO_MENTIONED = "" end SEND_WEBHOOK(KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK, KONFIGURASI.SERVICE_MENU.BROADCAST.EMBED:format(WHO_MENTIONED, FORMAT_NAME(GetLocal().name), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), FORMAT_NUMBER(KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED), KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER, TIME_SPLIT(0):format("hours,", "minutes,", "seconds."),"Super Broadcasting! **"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER-KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT.."** broadcast left until it stopped", KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT)) KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = true end
			Sleep(KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER_QUEUE)
		end
	end
end
	
if KONFIGURASI.SERVICE_MENU.BROADCAST.MODE == "TIMER" then KONFIGURASI.SERVICE_MENU.BROADCAST.CHECKING_TIME = true
	KONFIGURASI.SERVICE_MENU.BROADCAST.CURRENT_TIME = os.time() KONFIGURASI.SERVICE_MENU.BROADCAST.GET_TIME = os.difftime(KONFIGURASI.SERVICE_MENU.BROADCAST.CURRENT_TIME, KONFIGURASI.SERVICE_MENU.BROADCAST.TIME_START) KONFIGURASI.SERVICE_MENU.BROADCAST.TIME = (KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER * 60) - KONFIGURASI.SERVICE_MENU.BROADCAST.GET_TIME
	if KONFIGURASI.SERVICE_MENU.BROADCAST.QUEUE then Sleep(KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER_QUEUE-90000) KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = false KONFIGURASI.SERVICE_MENU.BROADCAST.QUEUE = false end
	if not KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY then
		local M = KONFIGURASI.SYSTEM.CREDIT.."`w(megaphone) "..CUSTOM_TEXT.BROADCAST.A.." : `%s" CHAT(M:format(53)) Sleep(1000) CHAT(M:format(52)) Sleep(1000) CHAT(M:format(51)) Sleep(1000)
		CHAT("/sb "..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT.."") Sleep(1000) KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER = KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER + 1 
		CHAT(KONFIGURASI.SYSTEM.CREDIT.."`w(eyes) "..CUSTOM_TEXT.BROADCAST.D.." `2"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER.." `w"..CUSTOM_TEXT.BROADCAST.E.." `6"..math.floor(KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER/1.5).." `w"..CUSTOM_TEXT.BROADCAST.I) Sleep(1000) CHAT(KONFIGURASI.SYSTEM.CREDIT.."`w(sleep) "..CUSTOM_TEXT.BROADCAST.J.." : `b"..TIME_SPLIT(KONFIGURASI.SERVICE_MENU.BROADCAST.TIME):format("`w"..CUSTOM_TEXT.BROADCAST.L..",`b", "`w"..CUSTOM_TEXT.BROADCAST.M..",`b", "`w"..CUSTOM_TEXT.BROADCAST.N..".")) Sleep(1000) if KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION and KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "ALL" then WHO_MENTIONED = "<@"..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID..">" else WHO_MENTIONED = "" end SEND_WEBHOOK(KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK, KONFIGURASI.SERVICE_MENU.BROADCAST.EMBED:format(WHO_MENTIONED, FORMAT_NAME(GetLocal().name), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), FORMAT_NUMBER(KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED), KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER, TIME_SPLIT(KONFIGURASI.SERVICE_MENU.BROADCAST.TIME):format("hours,", "minutes,", "seconds."),"Super Broadcasting! **"..(math.floor(KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER/1.5) - KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER).."** broadcast left until it stopped", KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT)) KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = true return true
	end
	if KONFIGURASI.SERVICE_MENU.BROADCAST.CHECKING_TIME and KONFIGURASI.SERVICE_MENU.BROADCAST.TIME <= 0 then KONFIGURASI.SERVICE_MENU.BROADCAST.CHECKING_TIME = false CHAT(KONFIGURASI.SYSTEM.CREDIT.."`w(nuke) "..CUSTOM_TEXT.BROADCAST.B.." : `6"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER.."`w, "..CUSTOM_TEXT.BROADCAST.C.."! (halo)") Sleep(1000) if KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION and KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "END" or KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE == "ALL" then WHO_MENTIONED = "<@"..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID..">" else WHO_MENTIONED = "" end SEND_WEBHOOK(KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK, KONFIGURASI.SERVICE_MENU.BROADCAST.EMBED:format(WHO_MENTIONED, FORMAT_NAME(GetLocal().name), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), FORMAT_NUMBER(KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED), KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER, TIME_SPLIT(0):format("hours,", "minutes,", "seconds."), "Super Broadcasting finished, enjoy your break!", KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT)) KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED, KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER = 0, 0 KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING = false CHAT(KONFIGURASI.SYSTEM.CREDIT.."`w(sleep) "..CUSTOM_TEXT.BROADCAST.K.." : `b"..TIME_SPLIT(KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER*60):format("`w"..CUSTOM_TEXT.BROADCAST.L..",`b", "`w"..CUSTOM_TEXT.BROADCAST.M..",`b", "`w"..CUSTOM_TEXT.BROADCAST.N..".")) Sleep(1000) if KONFIGURASI.SERVICE_MENU.BROADCAST.BACK then CHAT(KONFIGURASI.SYSTEM.CREDIT.."(fireworks) `wBack to "..KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD) Sleep(1000) JOIN_WORLD(KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD) end return true end
end

end end

AddHook("OnSendPacket", "PACKET-BROADCAST", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/esb") or COMMAND == ("/sbsetting") or COMMAND == ("/setsb") or COMMAND == ("/superb") or BUTTON == ("SERVICE_BROADCAST") then DIALOG_BROADCAST_EDITOR() return true end
if COMMAND == ("/sbtext") then CONFIG_BROADCAST_TEXT = true BUBBLE("Write your broadcast text in the chat column!") return true end
if CONFIG_BROADCAST_TEXT and S:find("action|input\n|text|(.+)") then local ARGUMENTS = S:match("action|input\n|text|(.+)") if ARGUMENTS == "" then CONSOLE("You must enter the broadcast text correctly!") return true end KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT = ARGUMENTS CONSOLE("`6Updated Broadcast Text >> ``"..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT) CONFIG_BROADCAST_TEXT = false return true end
if S:find("INPUT_BROADCAST_COUNTER|") and not S:find("INPUT_BROADCAST_COUNTER|"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER) then local ARGUMENTS = string.sub(S, S:find("INPUT_BROADCAST_COUNTER|") + 24, S:find("INPUT_BROADCAST_LIMIT|") - 2) if tonumber(ARGUMENTS) == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oBroadcast Counter should be a number!") return end if ARGUMENTS ~= "" and ARGUMENTS ~= nil and tonumber(ARGUMENTS) ~= KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER then KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER = ARGUMENTS CONSOLE("`6Updated Broadcast Counter `o: `5"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER) end end 
if S:find("INPUT_BROADCAST_LIMIT|") and not S:find("INPUT_BROADCAST_LIMIT|"..KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT) then local ARGUMENTS = string.sub(S, S:find("INPUT_BROADCAST_LIMIT|") + 22, S:find("INPUT_BROADCAST_TIMER|") - 2) if tonumber(ARGUMENTS) == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oBroadcast Limit should be a number!") return elseif tonumber(ARGUMENTS) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return end if ARGUMENTS ~= KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT then KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT = ARGUMENTS CONSOLE("`6Updated Broadcast Limit `o: `5"..KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT) end end
if S:find("INPUT_BROADCAST_TIMER|") and not S:find("INPUT_BROADCAST_TIMER|"..KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER) then local ARGUMENTS = string.sub(S, S:find("INPUT_BROADCAST_TIMER|") + 22, S:find("INPUT_BROADCAST_TEXT|") - 2) if tonumber(ARGUMENTS) == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oBroadcast Timer should be a number!") return elseif tonumber(ARGUMENTS) == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return end if ARGUMENTS ~= KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER then KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER = ARGUMENTS CONSOLE("`6Updated Broadcast Time `o: `5"..KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER.." `ominutes") end end 
if S:find("INPUT_BROADCAST_TEXT|") and not S:find("INPUT_BROADCAST_TEXT|"..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT) then local ARGUMENTS = string.sub(S, S:find("INPUT_BROADCAST_TEXT|") + 21, S:find("INPUT_BROADCAST_DISCORD_ID|") - 2) if ARGUMENTS == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oBroadcast Text can't be null!") return end if ARGUMENTS ~= KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT then KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT = ARGUMENTS CONSOLE("`6Updated Broadcast Text >> ``"..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT) end end 
if S:find("INPUT_BROADCAST_DISCORD_ID|") and not S:find("INPUT_BROADCAST_DISCORD_ID|"..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID) then local ARGUMENTS = string.sub(S, S:find("INPUT_BROADCAST_DISCORD_ID|") + 27, S:find("INPUT_BROADCAST_WORLD|") - 2) if tonumber(ARGUMENTS) == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oDiscord User ID should be a number!") return end if ARGUMENTS ~= KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID then KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID = ARGUMENTS CONSOLE("`6Updated Discord User ID `o: `5"..KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID) end end 
if S:find("INPUT_BROADCAST_WORLD|") and not S:find("INPUT_BROADCAST_WORLD|"..KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD) then local ARGUMENTS = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_BROADCAST_WORLD|") + 22) if ARGUMENTS == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oBroadcast World can't be null!") return end if ARGUMENTS ~= KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD then KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD = ARGUMENTS CONSOLE("`6Updated Broadcast World `o: `5"..KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD) end end 

if BUTTON == ("COUNT_UP") then if KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE ~= "UP" then KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE = "UP" CONSOLE("Counter mode set to : `5"..CAPITALIZE(KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE)) DIALOG_BROADCAST_EDITOR() else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like counter mode already set to `5"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE) end end
if BUTTON == ("COUNT_DOWN") then if KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE ~= "DOWN" then KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE = "DOWN" CONSOLE("Counter mode set to : `5"..CAPITALIZE(KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE)) DIALOG_BROADCAST_EDITOR() else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like counter mode already set to `5"..KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER_MODE) end end
if BUTTON == ("MODE_COUNTER") then if KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou're on broadcast, you can't change the data!") return true elseif KONFIGURASI.SERVICE_MENU.BROADCAST.MODE ~= "COUNTER" then KONFIGURASI.SERVICE_MENU.BROADCAST.MODE = "COUNTER" CONSOLE("Broadcast mode set to : `5"..CAPITALIZE(KONFIGURASI.SERVICE_MENU.BROADCAST.MODE)) DIALOG_BROADCAST_EDITOR() else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like broadcast mode already set to `6"..KONFIGURASI.SERVICE_MENU.BROADCAST.MODE) end end
if BUTTON == ("MODE_TIMER") then if KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou're on broadcast, you can't change the data!") return true elseif KONFIGURASI.SERVICE_MENU.BROADCAST.MODE ~= "TIMER" then KONFIGURASI.SERVICE_MENU.BROADCAST.MODE = "TIMER" CONSOLE("Broadcast mode set to : `5"..CAPITALIZE(KONFIGURASI.SERVICE_MENU.BROADCAST.MODE)) DIALOG_BROADCAST_EDITOR() else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like broadcast mode already set to `6"..KONFIGURASI.SERVICE_MENU.BROADCAST.MODE) end end
if BUTTON == ("RESET_SB") then if KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou're on broadcast, you can't change the data!") return true end KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT, KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER, KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED, KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT, KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER, KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION, KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK, KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID = 0, 0, 0, "Starries Helper by `5@starries.real", 60, false, "https://discord.com/api/webhooks/1201423910395191336/yIxpvnODZcC166_ArLfaJnLF4wY48IqB6uW32FfQgwIH39GU0dTveGyVDvKLyIyY3NtW", 0 OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wResetting super broadcast data successful!") DIALOG_BROADCAST_EDITOR() end
if BUTTON == ("SEND_TEST_BROADCAST") then CONSOLE("Your broadcast will look alike below :") SendVariantList({[0] = "OnConsoleMessage", [1] = "CP:0_PL:4_OID:_CT:[SB]_ `5** from ("..GetLocal().name.."`5) in [`$"..GetWorld().name.."`5] ** : ```$"..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT}) end
if BUTTON == ("SEND_SB") or COMMAND == ("/ssb") then if KONFIGURASI.SERVICE_MENU.BROADCAST.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the mode for broadcast") return true elseif KONFIGURASI.SERVICE_MENU.BROADCAST.LIMIT == 0 and KONFIGURASI.SERVICE_MENU.BROADCAST.MODE == "COUNTER" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set amount of counter broadcast, needed when you use Counter mode") return true end if not KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING then KONFIGURASI.SERVICE_MENU.BROADCAST.TIME_START = os.time() KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING = true KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = false KONFIGURASI.SERVICE_MENU.BROADCAST.BROADCASTED_WORLD = GetWorld().name CONSOLE("Broadcasting `2activated") return true else KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED, KONFIGURASI.SERVICE_MENU.BROADCAST.COUNTER = 0, 0 KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING = false KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = true CONSOLE("Broadcasting `4deactivated") end return true end
if BUTTON == ("MENTION_USER_SB") then if KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou're on broadcast, you can't change the data!") return true elseif KONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLook like discord user id hasn't been configured yet, please set your discord id!") return true elseif not KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION then KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION = true CONSOLE("Mention User on webhook `2activated") DIALOG_MENTION_MENU() else KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION = false KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE = "" CONSOLE("Mention User on webhook `4deactivated") DIALOG_BROADCAST_EDITOR() end end
if S:find("MENTION_ON_ALL") then if KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE ~= "ALL" then KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE = "ALL" CONSOLE("Mention user mode set to `5"..CAPITALIZE(KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE)) DIALOG_BROADCAST_EDITOR() else KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE = "" CONSOLE("Mention user mode reset") DIALOG_BROADCAST_EDITOR() end return true end
if S:find("MENTION_ON_END") then if KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE ~= "END" then KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE = "END" CONSOLE("Mention user mode set to `5"..CAPITALIZE(KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE)) DIALOG_BROADCAST_EDITOR() else KONFIGURASI.SERVICE_MENU.BROADCAST.MENTION_MODE = "" CONSOLE("Mention user mode reset") DIALOG_BROADCAST_EDITOR() end return true end
if BUTTON == ("BACK_WORLD_SB") then if KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou're on broadcast, you can't change the data!") return true elseif KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD == nil and KONFIGURASI.SERVICE_MENU.BROADCAST.WORLD == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLook like world back hasn't been configured yet, please set your world!") return true elseif not KONFIGURASI.SERVICE_MENU.BROADCAST.BACK then KONFIGURASI.SERVICE_MENU.BROADCAST.BACK = true CONSOLE("Back world after broadcast done `2activated") DIALOG_BROADCAST_EDITOR() else KONFIGURASI.SERVICE_MENU.BROADCAST.BACK = false CONSOLE("Back world after broadcast done `4deactivated") DIALOG_BROADCAST_EDITOR() end end
if BUTTON == ("GET_SIGN_SB_20") then if not GET_SIGN_FOR_BROADCAST then GET_SIGN_FOR_BROADCAST = true BUBBLE("`2Find a sign then wrench em! and see what happens..") else GET_SIGN_FOR_BROADCAST = false end return true end

--if S:find("InputBroadcastWebhook|") and not S:find("InputBroadcastWebhook|"..KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK) then KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK = string.sub(S, S:find("InputBroadcastWebhook|") + 22, S:find("InputKONFIGURASI.SERVICE_MENU.BROADCAST.DISCORD_ID|") - 2) CONSOLE("Broadcast webhook set to "..KONFIGURASI.SERVICE_MENU.BROADCAST.WEBHOOK) end 
--if BUTTON == ("TestWebhook") then TestWebhookSB = true CONSOLE("Webhook sent successful! please check on our discord. Run command `5/discord") return true end

return false end)

AddHook("OnVariant", "VARIANT-BROADCAST", function(Var)
if GET_SIGN_FOR_BROADCAST then if Var[0] == "OnDialogRequest" and Var[1]:find("end_dialog|sign_edit") then KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT = string.sub(Var[1], Var[1]:find("add_text_input|display_text||") + 29, Var[1]:find("|128|") - 1) CONSOLE("`6Updated Broadcast Text >> ``"..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT) GET_SIGN_FOR_BROADCAST = false return true end end

if Var[0] == "OnConsoleMessage" then
if Var[1]:find("Where would you like to go?") and KONFIGURASI.SERVICE_MENU.BROADCAST.TOGGLE then if GetWorld() == nil or GetWorld().name ~= KONFIGURASI.SERVICE_MENU.BROADCAST.BROADCASTED_WORLD then CONSOLE("`6Disconnected while broadcasting?! attempt to reconnect...") JOIN_WORLD(KONFIGURASI.SERVICE_MENU.BROADCAST.BROADCASTED_WORLD) end end
if Var[1]:find(">> `5Super") then KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED = KONFIGURASI.SERVICE_MENU.BROADCAST.GEMS_USED + tonumber(Var[1]:match("Used `$(%d+) Gems")) end
if KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY and Var[1]:find("You can annoy with broadcasts again!") then if KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER_QUEUE > 90000 then KONFIGURASI.SERVICE_MENU.BROADCAST.QUEUE = true else KONFIGURASI.SERVICE_MENU.BROADCAST.QUEUE = false KONFIGURASI.SERVICE_MENU.BROADCAST.ALREADY = false end end
if Var[1]:find("Appears in") then 
if Var[1]:find("sec") and Var[1]:find("min") then GET_MINUTE = tonumber(Var[1]:match("(%d+) min")) GET_SECOND = tonumber(Var[1]:match("(%d+) sec")) KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER_QUEUE = ((GET_MINUTE*60) + GET_SECOND)*1000 end
if Var[1]:find("min") and not Var[1]:find("sec") then GET_MINUTE = tonumber(Var[1]:match("(%d+) min")) KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER_QUEUE = ((GET_MINUTE*60)*1000) end
if Var[1]:find("sec") and not Var[1]:find("min") then GET_SECOND = tonumber(Var[1]:match("(%d+) sec")) KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER_QUEUE = (GET_SECOND*1000) end
CONSOLE("Queue : "..KONFIGURASI.SERVICE_MENU.BROADCAST.TIMER_QUEUE) end end
return false end)

function DIALOG_ITEM_FINDER() if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.TOGGLE then CONDITION = "Stop Finding" CONDITION_FRAME = "staticPurpleFrame" else CONDITION = "Start Finding" CONDITION_FRAME = "staticGreyFrame" end if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM == 0 then ITEM = "`4None Selected" else ITEM = GetItemInfo(math.floor(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM)).name end IF = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Item Finder|left|6016|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|FINDER_DROP_TOGGLE|Drop|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE, "DROP")..[[|13810||
add_button_with_icon|FINDER_MAGPLANT_TOGGLE|Magplant|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE, "MAGPLANT")..[[|5638||
add_button_with_icon|FINDER_VENDING_TOGGLE|Vending|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE, "VENDING")..[[|9268||
add_button_with_icon|FINDER_AUTO_TOGGLE|Auto Next|]]..FRAME(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.AUTO_NEXT)..[[|13504||
add_button_with_icon|FINDER_TOGGLE|]]..CONDITION..[[|]]..CONDITION_FRAME..[[|6016||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.SECONDARY..[[Item to Find `]]..KONFIGURASI.UI.PRIMARY..[[: ]]..ITEM..[[|
add_item_picker|INPUT_ITEM_FINDER|         Change item to Find         |Choose an item to find!``|
add_text_input|INPUT_DELAY_FINDER|Change the interval or delay :|]]..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY..[[|5|
add_smalltext|(Provide a delay or interval for Item Finder)|
add_spacer|small|
add_quick_exit|
add_button|SERVICE_MENU|                      Back                       |noflags|0|0|
end_dialog|ITEM_FINDER|       Close        |        Save       |
]] DIALOG(IF, 500) end

function DIALOG_ITEM_FINDER_NEXT_MENU() M = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label|small|Select|left|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|MOVE_TO_LEFT|Move Left|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.NEXT_MODE, "LEFT")..[[|2816||
add_button_with_icon|MOVE_TO_RIGHT|Move Right|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.NEXT_MODE, "RIGHT")..[[|2818||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_quick_exit|
add_button|/if|    Back    |noflags|0|0|
end_dialog|AUTO_NEXT_MENU|||
]] DIALOG(M, 500) end

function ITEM_FINDER_IN_ACTION() ITEM = GIVE_ID(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM)

if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE == "DROP" then 
if GET_AMOUNT(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM) <= 0 then FINDER(ITEM) Sleep(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY) end DROP(ITEM, GET_AMOUNT(math.floor(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM))) Sleep(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY)
end

if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE == "MAGPLANT" then 
if GET_AMOUNT(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM) <= 0 then FINDER(ITEM) Sleep(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY) end SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|"..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X.."|\ny|"..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_Y.."|\nbuttonClicked|additems") Sleep(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY)
end

if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE == "VENDING" then 
if GET_AMOUNT(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM) <= 0 then FINDER(ITEM) Sleep(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY) end SendPacket(2,"action|dialog_return\ndialog_name|vend_edit\nx|"..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.VENDING.POS_X.."|\ny|"..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.VENDING.POS_Y.."|\nbuttonClicked|addstock") Sleep(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY)
end

end

AddHook("OnSendPacket", "PACKET-ITEM-FINDER", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/if") or COMMAND == ("/itemfinder") or BUTTON == ("SERVICE_ITEM_FINDER") then DIALOG_ITEM_FINDER() return true end
if COMMAND == ("/sif") or BUTTON == ("FINDER_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like you haven't set the mode for item finder yet!") return true elseif KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oLooks like you haven't set the item for item finder yet!") return true elseif not KONFIGURASI.SERVICE_MENU.ITEM_FINDER.TOGGLE then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.TOGGLE = true CONSOLE("Item Finder `2activated") return true else KONFIGURASI.SERVICE_MENU.ITEM_FINDER.TOGGLE = false CONSOLE("Item Finder `4deactivate") end return true end 
if BUTTON == ("FINDER_DROP_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE ~= "DROP" then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE = "DROP" DIALOG_ITEM_FINDER() return true else KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE = "" CONSOLE("Item Finder reset") DIALOG_ITEM_FINDER() end return true end
if BUTTON == ("FINDER_MAGPLANT_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE ~= "MAGPLANT" then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE = "MAGPLANT" CONFIG_ITEM_FINDER_MAGPLANT = true PUNCH_CONFIG = true BUBBLE("Punch the Magplant to set the position") return true else KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE = "" CONSOLE("Item Finder reset") DIALOG_ITEM_FINDER() end return true end
if BUTTON == ("FINDER_VENDING_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE ~= "VENDING" then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE = "VENDING" CONFIG_ITEM_FINDER_VENDING = true PUNCH_CONFIG = true BUBBLE("Punch the Vending to set the position") return true else KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MODE = "" CONSOLE("Item Finder reset") DIALOG_ITEM_FINDER() end return true end
if BUTTON == ("FINDER_AUTO_TOGGLE") then if not KONFIGURASI.SERVICE_MENU.ITEM_FINDER.AUTO_NEXT then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.AUTO_NEXT = true CONSOLE("Auto next `2activated") DIALOG_ITEM_FINDER_NEXT_MENU() return true else KONFIGURASI.SERVICE_MENU.ITEM_FINDER.AUTO_NEXT = false CONSOLE("Auto next `4deactivated") DIALOG_ITEM_FINDER() end return true end
if S:find("INPUT_ITEM_FINDER|") and not S:find("INPUT_ITEM_FINDER|"..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM) then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM = string.sub(S, S:find("INPUT_ITEM_FINDER|") + 18, S:find("INPUT_DELAY_FINDER|") - 2) CONSOLE("Item set to : `w"..GetItemInfo(math.floor(KONFIGURASI.SERVICE_MENU.ITEM_FINDER.ITEM)).name) DIALOG_ITEM_FINDER() end 
if S:find("INPUT_DELAY_FINDER|") then local NUMBER = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_DELAY_FINDER|") + 19, S:find("INPUT_DELAY_FINDER|") + 23) if math.floor(NUMBER) ~= KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY = NUMBER CONSOLE("Delay set to : `w"..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.DELAY) DIALOG_ITEM_FINDER() end end
return false end)

AddHook("OnVariant", "VARIANT-ITEM-FINDER", function(Var) 
if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.TOGGLE then 
if Var[0] == "OnDialogRequest" and Var[1]:find("Item Finder") then return true end 
if Var[0] == "OnDialogRequest" and Var[1]:find("MAGPLANT 5000") then return true end

if Var[0] == "OnTalkBubble" then
if Var[2]:find("Can't use `$/find`` here, too many dropped items or no space. Find a free spot!") then return true end
if Var[2]:find("You don't have this item to do that!") then return true end
end

if Var[0] == "OnConsoleMessage" and Var[1]:find("This doesn't fit") then 
if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.AUTO_NEXT then 
if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.NEXT_MODE == "RIGHT" then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X = KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X + 1 FindPath(math.floor(GetLocal().pos.x//32) + 1, math.floor(GetLocal().pos.y//32)) PLACE(32, KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X, KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_Y) end
if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.NEXT_MODE == "LEFT" then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X = KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X - 1 FindPath(math.floor(GetLocal().pos.x//32) - 1, math.floor(GetLocal().pos.y//32)) PLACE(32, KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X, KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_Y) end
else KONFIGURASI.SERVICE_MENU.ITEM_FINDER.TOGGLE = false OVERLAY("Item Finder `4stopped`w, due magplant is full!")
end return true end 
end
return false end)

function CHECKING_PATH(X, Y)
if GetTile(X, Y - 1).collidable then FindPath(X, Y - 1, 150) return end
if GetTile(X, Y + 1).collidable then FindPath(X, Y + 1, 150) return end 
if GetTile(X - 1, Y).collidable then FindPath(X - 1, Y, 150) return end
if GetTile(X + 1, Y).collidable then FindPath(X + 1, Y, 150) return end
end

function CHECKING_THE_ITEM(I, A)
  -- Check if we have the item in our inventory
  local HAS_ITEM = false
  for _, INV in pairs(GetInventory()) do
      if INV.id == I then
          HAS_ITEM = true
          A = math.min(A, INV.amount)
          break
      end
  end
  -- If we don't have the item, log and return
  if not HAS_ITEM then
      CONSOLE(GetItemInfo(I).name.. " not found in inventory.")
      return false
  end
  -- Construct and send the drop packet
  DROP(I, A)
  -- Log the action
  BUBBLE(KONFIGURASI.SYSTEM.CREDIT.."`wDropped " .. A .. " " ..GetItemInfo(I).name)
  return true
end

function WAIT_FOR_WORLD(W) if GetWorld().name ~= W then for i = 0, 2 do JOIN_WORLD(W) Sleep(1500) if GetWorld().name == W then break end end end end

function COLLECT_THE_ITEM(MR, X, Y)
  local A = X
  local MX = X - MR  -- Calculate the minimum X coordinate
  local X_CHANGED = 0  -- Track how much x has changed
  ::LOOP_COLLECT::
  		if GET_AMOUNT(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM) > 0 then
      		X_CHANGED = X - A  -- Calculate how much x has changed
      		return true, X_CHANGED  -- Items found and collected, return xChange
    		--else A = A - 1 --goto LOOP_COLLECT 
    	end
  while A >= MX do
    FindPath(A, Y, 150) Sleep(800)
    for _, OBJECT in pairs(GetObjectList()) do ::ITEM_COLLECTED::
      	if math.floor(OBJECT.id) == KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM then if OBJECT.pos.x//32 == A and OBJECT.pos.y//32 == Y then
      		if GET_AMOUNT(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM) > 0 then
      		X_CHANGED = X - A  -- Calculate how much x has changed
      		return true, X_CHANGED  -- Items found and collected, return xChange
    		--else A = A - 1 --goto LOOP_COLLECT 
    		end 
      	else A = A - 1 goto LOOP_COLLECT 
      		KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_1 = A -- Update takeX with the current x coordinate
      		KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_1 = Y  -- Update takeY (although it doesn't change in this case)
      		if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_1 ~= A and KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_1 ~= Y then 
      			CONSOLE("`6Updated Collection Coord to " .. KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_1 .. ", " .. KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_1) 
      		end 
      	end end
      	goto ITEM_COLLECTED
      end
  end
  BUBBLE("Items not found within the specified range")
  return false, 0  -- Items not found within the specified range
end

function DROP_THE_ITEM(X, Y)
  local XS = X
  for P = 1, 1 do
    FindPath(XS, Y)
    Sleep(400)
    if not CHECKING_THE_ITEM(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM, GET_AMOUNT(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM)) then
      Sleep(500)
      return false
    end
    if not GET_AMOUNT(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM) then
      Sleep(500)
      return false
    end
    XS = XS - 1
  end
end

function ITEM_MOVER_IN_ACTION()

if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD == "1" then
if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM == "FLOAT" then
if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_1 == 0 and KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2 == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the position for floating item, set it first!") return true end
if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1 == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the world, set it first!") return true end
if math.floor(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM) <= 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the floating item, set it first!") return true end 

KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM = GET_ID(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM)

ChangeValue("[C] Modfly", true)

WAIT_FOR_WORLD(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1)

  Sleep(250)
  
  local SUCCEDED, X_CHANGED
  while true do 
  	SUCCEDED, X_CHANGED = COLLECT_THE_ITEM(2, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_1, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_1)
    if SUCCEDED then break else ChangeValue("[C] Modfly", false) CONSOLE("Item Mover `4deactivated") KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TOGGLE = false return end
  end
  
  -- Update dropX based on xChange
  --KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2 = KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2 - X_CHANGED
  --if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2 ~= KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2 - X_CHANGED then CONSOLE("`6Updated Drop Coord to " ..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2.. ", " ..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_2) end
  
  Sleep(250)
  
  if DROP_THE_ITEM(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_2) then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TOGGLE = false end

end
end

end

function DIALOG_ITEM_MOVER() if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TOGGLE then CONDITION = "`4Deactivate``" else CONDITION = "`2Activate``" end if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM == 0 then ITEM = "`4None Selected" else ITEM = GetItemInfo(math.floor(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM)).name end W = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Item Mover|left|1404|
add_spacer|small|
add_smalltext|Mode :                            Action :|
text_scaling_string|textscalingstring|
add_button_with_icon|MODE_1_WORLD_TOGGLE|Mode 1 World|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD, "1")..[[|2836||
add_button_with_icon|MODE_2_WORLD_TOGGLE|Mode 2 World|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD, "2")..[[|2838||
add_button_with_icon|ITEM_MOVER_TOGGLE|]]..CONDITION..[[ Mover|]]..FRAME(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TOGGLE)..[[|1404||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_smalltext|Pickup Options :                               To Options :|
text_scaling_string|textscalingstring|
add_button_with_icon|FROM_FLOAT_TOGGLE|Floating|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM, "FLOAT")..[[|4320||
add_button_with_icon|FROM_MAGPLANT_TOGGLE|Magplant|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM, "MAGPLANT")..[[|5638||
add_button_with_icon|FROM_VENDING_TOGGLE|Vending|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM, "VENDING")..[[|9268||
add_button_with_icon|TO_FLOAT_TOGGLE|Floating|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO, "FLOAT")..[[|4320||
add_button_with_icon|TO_MAGPLANT_TOGGLE|Magplant|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO, "MAGPLANT")..[[|5638||
add_button_with_icon|TO_VENDING_TOGGLE|Vending|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO, "VENDING")..[[|9268||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.SECONDARY..[[Item Selected `]]..KONFIGURASI.UI.PRIMARY..[[: ]]..ITEM..[[|left|
add_item_picker|INPUT_MOVER_ITEM|        Select the item for Item Mover        |Choose an item for Item Mover!``|
add_custom_margin|x:0;y:20|
add_label_with_icon_button_list|small|Provide name for the First World `w:|left|SET_WORLD_1_MOVER_|itemID_itemAmount|3802,0|
add_custom_margin|x:0;y:10|
add_text_input|INPUT_MOVER_WORLD_1||]]..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1:upper()..[[|30|
add_custom_margin|x:0;y:20|
add_label_with_icon_button_list|small|Provide name for the Second World `w:|left|SET_WORLD_2_MOVER_|itemID_itemAmount|3802,0|
add_custom_margin|x:0;y:10|
add_text_input|INPUT_MOVER_WORLD_2||]]..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_2:upper()..[[|30|
add_custom_margin|x:0;y:10|
add_text_input|INPUT_MOVER_WARP_DELAY|Interval or Delay when moving world :|]]..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WARP_DELAY..[[|7|
add_smalltext|(Default interval is `55000`w, recomended to use `58000`]]..KONFIGURASI.UI.PRIMARY..[[)|
add_spacer|small|
add_quick_exit|
add_button|SERVICE_MENU|                              Back                              |noflags|0|0|
end_dialog|ITEM_MOVER|           Close           |            Save           |
]] DIALOG(W, 500) end

AddHook("OnSendPacket", "PACKET-MOVER", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/im") or BUTTON == ("SERVICE_ITEM_MOVER") then DIALOG_ITEM_MOVER() return true end
if BUTTON == ("SET_WORLD_1_MOVER_3802") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1 ~= GetWorld().name then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1 = GetWorld().name CONSOLE("`6Updated World Mover 1 : `w"..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1:upper()) end DIALOG_ITEM_MOVER() return true end
if BUTTON == ("SET_WORLD_2_MOVER_3802") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_2 ~= GetWorld().name then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_2 = GetWorld().name CONSOLE("`6Updated World Mover 2 : `w"..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_2:upper()) end DIALOG_ITEM_MOVER() return true end

if COMMAND == ("/sim") or BUTTON == ("ITEM_MOVER_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM == nil or KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the item for Item Mover yet!") return true elseif KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM == "" or KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't set the action for Item Mover yet!") return true end if not KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TOGGLE then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TOGGLE = true CONSOLE("Item Mover `2activated") else KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TOGGLE = false CONSOLE("Item Mover `4deactivated") end return true end
if BUTTON == ("MODE_1_WORLD_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD ~= "1" then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD = "1" DIALOG_ITEM_MOVER() elseif KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD == "1" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou have choosen that option!") DIALOG_ITEM_MOVER() end end
if BUTTON == ("MODE_2_WORLD_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD ~= "2" then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD = "2" DIALOG_ITEM_MOVER() elseif KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MODE_WORLD == "2" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou have choosen that option!") DIALOG_ITEM_MOVER() end end

if BUTTON == ("FROM_FLOAT_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM ~= "FLOAT" then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM = "FLOAT" CONFIG_ITEM_MOVER = true FROM_FLOAT = true BUBBLE("Punch the tile to set the float position!") else KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM = "" DIALOG_ITEM_MOVER() end end
if BUTTON == ("FROM_MAGPLANT_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM ~= "MAGPLANT" then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM = "MAGPLANT" CONFIG_ITEM_MOVER = true FROM_MAGPLANT = true BUBBLE("Punch the tile to set the magplant position!") else KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM = "" DIALOG_ITEM_MOVER() end end
if BUTTON == ("FROM_VENDING_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM ~= "VENDING" then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM = "VENDING" CONFIG_ITEM_MOVER = true FROM_VENDING = true BUBBLE("Punch the tile to set the vending position!") else KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FROM = "" DIALOG_ITEM_MOVER() end end

if BUTTON == ("TO_FLOAT_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO ~= "FLOAT" then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO = "FLOAT" CONFIG_ITEM_MOVER = true TO_FLOAT = true BUBBLE("Punch the tile to set the float position!") else KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO = "" DIALOG_ITEM_MOVER() end end
if BUTTON == ("TO_MAGPLANT_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO ~= "MAGPLANT" then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO = "MAGPLANT" CONFIG_ITEM_MOVER = true TO_MAGPLANT = true BUBBLE("Punch the tile to set the magplant position!") else KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO = "" DIALOG_ITEM_MOVER() end end
if BUTTON == ("TO_VENDING_TOGGLE") then if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO ~= "VENDING" then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO = "VENDING" CONFIG_ITEM_MOVER = true TO_VENDING = true BUBBLE("Punch the tile to set the vending position!") else KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TO = "" DIALOG_ITEM_MOVER() end end

if S:find("INPUT_MOVER_ITEM|") and not S:match("INPUT_MOVER_ITEM|"..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM) then local ARGUMENTS = string.sub(S, S:find("INPUT_MOVER_ITEM|") + 17, S:find("INPUT_MOVER_WORLD_1|") - 2) if ARGUMENTS ~= KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM = ARGUMENTS CONSOLE("`6Updated Floating Item : `w"..GetItemInfo(math.floor(KONFIGURASI.SERVICE_MENU.ITEM_MOVER.ITEM)).name) DIALOG_ITEM_MOVER() end end 
if S:find("INPUT_MOVER_WORLD_1|") then local ARGUMENTS = string.sub(S, S:find("INPUT_MOVER_WORLD_1|") + 20, S:find("INPUT_MOVER_WORLD_2|") - 2) if ARGUMENTS ~= KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1 then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1 = ARGUMENTS:upper() CONSOLE("`6Updated World Mover 1 : `w"..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_1:upper()) DIALOG_ITEM_MOVER() end end
if S:find("INPUT_MOVER_WORLD_2|") then local ARGUMENTS = string.sub(S, S:find("INPUT_MOVER_WORLD_2|") + 20, S:find("INPUT_MOVER_WARP_DELAY|") - 2) if ARGUMENTS ~= KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_2 then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_2 = ARGUMENTS:upper() CONSOLE("`6Updated World Mover 2 : `w"..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WORLD_2:upper()) DIALOG_ITEM_MOVER() end end
if S:find("INPUT_MOVER_WARP_DELAY|") then local ARGUMENTS = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_MOVER_WARP_DELAY|") + 23) if tonumber(ARGUMENTS) ~= KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WARP_DELAY then CONSOLE("`6Updated Warp Delay : `w"..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.WARP_DELAY) end end

end)

AddHook("OnSendPacketRaw", "RAW-MOVER", function(P)
if CONFIG_ITEM_MOVER then
if FROM_FLOAT then for _, T in pairs(GetTiles()) do if T.x == P.px and T.y == P.py then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_1, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_1 = math.floor(P.px), math.floor(P.py) CONSOLE("Floating Position 1 saved! `7[`5" ..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_1.. "`w,`5" .. KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_1.."`7]") DIALOG_ITEM_MOVER() FROM_FLOAT = false CONFIG_ITEM_MOVER = false end end end
if FROM_MAGPLANT then for _, T in pairs(GetTiles()) do if T.fg == 5638 and T.x == P.px and T.y == P.py then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MAGPLANT.X_1, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MAGPLANT.Y_1 = math.floor(P.px), math.floor(P.py) CONSOLE("Magplant Position 1 saved! `7[`5" ..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MAGPLANT.X_1.. "`w,`5" .. KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MAGPLANT.Y_1.."`7]") DIALOG_ITEM_MOVER() FROM_MAGPLANT = false CONFIG_ITEM_MOVER = false end end end
if FROM_VENDING then for _, T in pairs(GetTiles()) do if (T.fg == 9268 or T.fg == 2978) and T.x == P.px and T.y == P.py then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.VENDING.X_1, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.VENDING.Y_1 = math.floor(P.px), math.floor(P.py) CONSOLE("Vending Position 1 saved! `7[`5" ..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.VENDING.X_1.. "`w,`5" .. KONFIGURASI.SERVICE_MENU.ITEM_MOVER.VENDING.Y_1.."`7]") DIALOG_ITEM_MOVER() FROM_VENDING = false CONFIG_ITEM_MOVER = false end end end

if TO_FLOAT then for _, T in pairs(GetTiles()) do if T.x == P.px and T.y == P.py then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_2 = math.floor(P.px), math.floor(P.py) CONSOLE("Floating Position 1 saved! `7[`5" ..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.X_2.. "`w,`5" .. KONFIGURASI.SERVICE_MENU.ITEM_MOVER.FLOAT.Y_2.."`7]") DIALOG_ITEM_MOVER() TO_FLOAT = false CONFIG_ITEM_MOVER = false end end end
if TO_MAGPLANT then for _, T in pairs(GetTiles()) do if T.fg == 5638 and T.x == P.px and T.y == P.py then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MAGPLANT.X_2, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MAGPLANT.Y_2 = math.floor(P.px), math.floor(P.py) CONSOLE("Magplant Position 1 saved! `7[`5" ..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MAGPLANT.X_2.. "`w,`5" .. KONFIGURASI.SERVICE_MENU.ITEM_MOVER.MAGPLANT.Y_2.."`7]") DIALOG_ITEM_MOVER() TO_MAGPLANT = false CONFIG_ITEM_MOVER = false end end end
if TO_VENDING then for _, T in pairs(GetTiles()) do if (T.fg == 9268 or T.fg == 2978) and T.x == P.px and T.y == P.py then KONFIGURASI.SERVICE_MENU.ITEM_MOVER.VENDING.X_2, KONFIGURASI.SERVICE_MENU.ITEM_MOVER.VENDING.Y_2 = math.floor(P.px), math.floor(P.py) CONSOLE("Vending Position 1 saved! `7[`5" ..KONFIGURASI.SERVICE_MENU.ITEM_MOVER.VENDING.X_2.. "`w,`5" .. KONFIGURASI.SERVICE_MENU.ITEM_MOVER.VENDING.Y_2.."`7]") DIALOG_ITEM_MOVER() TO_VENDING = false CONFIG_ITEM_MOVER = false end end end
end
return false end)

function DIALOG_CLEAR_FLOAT() if KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.TOGGLE then CONDITION = "`4Deactivate``" else CONDITION = "`2Activate``" end W = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Clear Float|left|10318|
add_spacer|small|
add_smalltext|Mode :                                      Options :|
text_scaling_string|textscalingstring|
add_button_with_icon|FLOAT_TRASH_TOGGLE|Trash|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.MODE, "TRASH")..[[|6068||
add_button_with_icon|FLOAT_DROP_TOGGLE|Drop|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.MODE, "DROP")..[[|13810||
add_button_with_icon|FLOAT_MAGPLANT_TOGGLE|Magplant|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.MODE, "MAGPLANT")..[[|5638||
add_button_with_icon|FLOAT_VENDING_TOGGLE|Vending|]]..FRAME_MODE(KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.MODE, "VENDING")..[[|9268||
add_button_with_icon|CLEAR_FLOAT_TOGGLE|]]..CONDITION..[[|]]..FRAME(KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.TOGGLE)..[[|10318||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_quick_exit|
add_button|SERVICE_MENU|                              Back                              |noflags|0|0|
end_dialog|CLEAR_FLOAT|           Close           |            Save           |
]] DIALOG(W, 500) end

AddHook("OnSendPacket", "PACKET-CLEAR-FLOAT", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/cf") or BUTTON == ("SERVICE_CLEAR_FLOAT") then DIALOG_CLEAR_FLOAT() return true end

return false end)
-- End of Services Menu --

-- Donation for Support --
function DIALOG_DONATION_SUPPORT() D = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Donation Support|left|1452|
add_smalltext|----------------------------------------------------|
add_smalltext|Thank you for donation, it means a lot for me!|
add_smalltext|----------------------------------------------------|
add_spacer|small|
add_text_input|AMOUNT_OF_DONATE|`]]..KONFIGURASI.UI.SECONDARY..[[Amount donation :||8|
add_spacer|small|
add_smalltext|`]]..KONFIGURASI.UI.NOTE..[[Note`]]..KONFIGURASI.UI.PRIMARY..[[ : Fill amount with world lock format,|
add_smalltext|for example 100 to donate 1 `1Diamond Lock`]]..KONFIGURASI.UI.PRIMARY..[[,|
add_smalltext|or 10000 to donate 1 `eBlue Gem Lock`]]..KONFIGURASI.UI.PRIMARY..[[, etc|
add_spacer|small|
add_quick_exit|
add_button|DONATE_FOR_STARRIES|           `2Donate now !           |noflags|0|0|
end_dialog|DONATION_SUPPORT|||
]] DIALOG(D, 500) end

AddHook("OnSendPacket", "PACKET-DONATION-SUPPORT", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/donating") or BUTTON == ("DONATE_SUPPORT") then DIALOG_DONATION_SUPPORT() return true end
if BUTTON == ("DONATE_FOR_STARRIES") then DONATE_AMOUNT = tonumber(S:match("AMOUNT_OF_DONATE|(%d+)\n")) if DONATE_AMOUNT == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif DONATE_AMOUNT == 0 then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NOL) return true end DROP_AMOUNT = DONATE_AMOUNT DONATING = true return true end
return false end)
-- End of Donation for Support --

-- Support System --
function DIALOG_SUPPORT() SU = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Suggestion and Criticism Box|left|656|
add_spacer|small|
add_textbox|Write below here : (`]]..KONFIGURASI.UI.SECONDARY..[[Maximum 120 Letter`]]..KONFIGURASI.UI.PRIMARY..[[)|
add_text_input|SUPPORT_MESSAGE|||120|
add_spacer|small|
add_textbox|>> This `9message `]]..KONFIGURASI.UI.PRIMARY..[[will be send to `]]..KONFIGURASI.UI.SECONDARY..[[Starries `]]..KONFIGURASI.UI.PRIMARY..[[and our Discord!|
add_textbox|`]]..KONFIGURASI.UI.NOTE..[[Note `]]..KONFIGURASI.UI.PRIMARY..[[: Do not abuse this feature or we'll `4remove `]]..KONFIGURASI.UI.PRIMARY..[[you!|
add_spacer|small|
add_quick_exit|
add_button|SEND_SUPPORT_MESSAGE|                                          `2Send it now !                                          |noflags|0|0|
end_dialog|SUPPORT_MENU|||
]] DIALOG(SU, 500) end

AddHook("OnSendPacket", "PACKET-SUPPORT", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/support") or BUTTON == ("SUPPORT_MENU") then DIALOG_SUPPORT() return true end
if BUTTON == ("SEND_SUPPORT_MESSAGE") then SUPPORT_MESSAGE = S:match("SUPPORT_MESSAGE|(.+)\n") if SUPPORT_MESSAGE == nil or SUPPORT_MESSAGE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou can't send with blank word, Leave a few words for us!") return true end SEND_SUPPORT = true return true end
return false end)
-- End of Support System --

-- Activity Log --
function DIALOG_ACTIVITY_LOG() AL = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Activity Log|left|2376|
add_spacer|small|
text_scaling_string|textscalingstring|
add_button_with_icon|ACTIVITY_DROP_LOG|Dropped|staticBlueFrame|13810||
add_button_with_icon|ACTIVITY_COLLECT_LOG|Collected|staticBlueFrame|13808||
add_button_with_icon|ACTIVITY_TRASH_LOG|Trashed|staticBlueFrame|6068||
add_button_with_icon|ACTIVITY_ENTER_LOG|Entered|staticBlueFrame|13804||
add_button_with_icon|ACTIVITY_EXIT_LOG|Exited|staticBlueFrame|13806||
add_button_with_icon||END_LIST||0||
add_button_with_icon|ACTIVITY_WRENCH_LOG|Wrench|staticBlueFrame|32||
add_button_with_icon|ACTIVITY_BET_LOG|Bet Collected|staticBlueFrame|7188||
add_button_with_icon|ACTIVITY_SETTING_LOG|Settings|staticBlueFrame|4630||
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|BACK_TO_MAIN_MENU|                      Back                      |noflags|0|0|
end_dialog|ACTIVITY_LOG|       Close       |       Save        |
]] DIALOG(AL, 500) end

function DIALOG_ACTIVITY_LOG_SETTING() AL = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Activity Log Settings|left|4630|
add_spacer|small|
add_checkbox|SHOW_ALL_COLLECT_TOGGLE|Capture log for all collected items|]]..CHECKBOX(KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_COLLECT)..[[|
add_checkbox|SHOW_ALL_DROP_TOGGLE|Capture log for all dropped items|]]..CHECKBOX(KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_DROP)..[[|
add_label_with_icon|small|File Logs|left|656|
add_spacer|small|
text_scaling_string|textscalingstring|
add_checkicon|FILE_LOGS_DROP|Dropped|]]..FRAME(KONFIGURASI.FILE_LOGS.DROP)..[[|13810||]]..CHECKBOX(KONFIGURASI.FILE_LOGS.DROP)..[[|
add_checkicon|FILE_LOGS_COLLECT|Collected|]]..FRAME(KONFIGURASI.FILE_LOGS.COLLECT)..[[|13808||]]..CHECKBOX(KONFIGURASI.FILE_LOGS.COLLECT)..[[|
add_checkicon|FILE_LOGS_TRASH|Trashed|]]..FRAME(KONFIGURASI.FILE_LOGS.TRASH)..[[|6068||]]..CHECKBOX(KONFIGURASI.FILE_LOGS.TRASH)..[[|
add_checkicon|FILE_LOGS_ENTER|Entered|]]..FRAME(KONFIGURASI.FILE_LOGS.ENTER)..[[|13804||]]..CHECKBOX(KONFIGURASI.FILE_LOGS.ENTER)..[[|
add_checkicon|FILE_LOGS_EXIT|Exited|]]..FRAME(KONFIGURASI.FILE_LOGS.EXIT)..[[|13806||]]..CHECKBOX(KONFIGURASI.FILE_LOGS.EXIT)..[[|
add_button_with_icon||END_LIST||0||
add_checkicon|FILE_LOGS_WRENCH|Wrench|]]..FRAME(KONFIGURASI.FILE_LOGS.WRENCH)..[[|32||]]..CHECKBOX(KONFIGURASI.FILE_LOGS.WRENCH)..[[|
add_checkicon|FILE_LOGS_BET|Bet Collected|]]..FRAME(KONFIGURASI.FILE_LOGS.BET)..[[|7188||]]..CHECKBOX(KONFIGURASI.FILE_LOGS.BET)..[[|
add_checkicon|FILE_LOGS_TRADE|Trade History|]]..FRAME(KONFIGURASI.FILE_LOGS.TRADE)..[[|242||]]..CHECKBOX(KONFIGURASI.FILE_LOGS.TRADE)..[[|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_quick_exit|
add_button|LOG_ACTIVITY|                      Back                      |noflags|0|0|
end_dialog|ACTIVITY_LOG_SETTING|       Close       |       Save        |
]] DIALOG(AL, 500) end

function DIALOG_DROP_LOG() A = {} for _, T in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do table.insert(A, T.DROP) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Dropped Log|left|13810|\nadd_spacer|small|\nadd_smalltext|Click the item icon to filter by that item|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|DROP_LOG|||"}) end
function FILTER_DROP_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do if D.DROP_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.DROP.."|left|"..D.DROP_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Dropped Log|left|13810|\nadd_spacer|small|\nadd_smalltext|Filtered to : `"..KONFIGURASI.UI.SECONDARY..""..GetItemInfo(math.floor(table.concat(E))).name.."|\n"..table.concat(F).."\nadd_spacer|small|\nadd_button|/droplog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_DROP_LOG|||"}) end
function DIALOG_COLLECT_LOG() A = {} for _, T in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do table.insert(A, T.COLLECT) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Collected Log|left|13808|\nadd_spacer|small|\nadd_smalltext|Click the item icon to filter by that item|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|COLLECT_LOG|||"}) end
function FILTER_COLLECT_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do if D.COLLECT_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.COLLECT.."|left|"..D.COLLECT_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Collected Log|left|13808|\nadd_spacer|small|\nadd_smalltext|Filtered to : `"..KONFIGURASI.UI.SECONDARY..""..GetItemInfo(math.floor(table.concat(E))).name.."|\n"..table.concat(F).."\nadd_spacer|small|\nadd_button|/collectlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_COLLECT_LOG|||"}) end
function DIALOG_TRASH_LOG() A = {} for _, T in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do table.insert(A, T.TRASH) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Trashed Log|left|6068|\nadd_spacer|small|\nadd_smalltext|Click the item icon to filter by that item|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|TRASH_LOG|||"}) end
function FILTER_TRASH_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do if D.TRASH_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.TRASH.."|left|"..D.TRASH_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Trashed Log|left|6068|\nadd_spacer|small|\nadd_smalltext|Filtered to : `"..KONFIGURASI.UI.SECONDARY..""..GetItemInfo(math.floor(table.concat(E))).name.."|\n"..table.concat(F).."\nadd_spacer|small|\nadd_button|/trashlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_TRASH_LOG|||"}) end
function DIALOG_ENTER_LOG() A = {} for _, T in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do table.insert(A, T.ENTER) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Entered Log|left|13804|\nadd_spacer|small|\nadd_smalltext|Click the icon to filter by user id|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|ENTER_LOG|||"}) end
function FILTER_ENTER_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do if D.USER_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.ENTER.."|left|"..D.USER_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|User Enter Log|left|1400|\nadd_spacer|small|"..table.concat(F).."\nadd_spacer|small|\nadd_button|/enterlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_ENTER_LOG|||"}) end
function DIALOG_EXIT_LOG() A = {} for _, T in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do table.insert(A, T.EXIT) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Exited Log|left|13806|\nadd_spacer|small|\nadd_smalltext|Click the icon to filter by user id|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|EXIT_LOG|||"}) end
function FILTER_EXIT_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do if D.USER_ID == I then table.insert(F, "\nadd_label_with_icon|small|"..D.EXIT.."|left|"..D.USER_ID.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|User Exit Log|left|1400|\nadd_spacer|small|"..table.concat(F).."\nadd_spacer|small|\nadd_button|/exitlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_EXIT_LOG|||"}) end
function DIALOG_WRENCH_LOG() A = {} for _, T in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do table.insert(A, T.WRENCH) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Wrench Log|left|32|\nadd_spacer|small|\nadd_smalltext|Click the icon to filter by the wrench type|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|WRENCH_LOG|||"}) end
function FILTER_WRENCH_LOG(I) F, E = {}, {} table.insert(E, I) for _, D in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do if D.WRENCH_TYPE == I then table.insert(F, "\nadd_label_with_icon|small|"..D.WRENCH.."|left|"..D.WRENCH_ICON.."|\n") end end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Wrench Log|left|32|\nadd_spacer|small|\nadd_smalltext|Filtered to : `"..KONFIGURASI.UI.SECONDARY..""..table.concat(E).."|\n"..table.concat(F).."\nadd_spacer|small|\nadd_button|/wrenchlog|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|FILTER_WRENCH_LOG|||"}) end
function DIALOG_BET_LOG() A = {} for _, T in pairs(KONFIGURASI.TABLE.ACTIVITY_LOG) do table.insert(A, T.BET) end SendVariantList({[0] = "OnDialogRequest", [1] = "set_default_color|`"..KONFIGURASI.UI.PRIMARY.."|\nadd_label_with_icon|big|Bet Collected Log|left|7188|\nadd_spacer|small|\n"..table.concat(A).."\nadd_spacer|small|\nadd_button|/log|Back|noflags|0|0|\nadd_quick_exit|||\nend_dialog|BET_LOG|||"}) end

AddHook("OnSendPacket", "PACKET-ACTIVITY-LOG", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/log") or COMMAND == ("/activitylog") or BUTTON == ("LOG_ACTIVITY") then DIALOG_ACTIVITY_LOG() return true end
if TOGGLE:find("SHOW_ALL_COLLECT_TOGGLE|1") and not KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_COLLECT then KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_COLLECT = true CONSOLE("Get a log for all items collected `2activated") elseif TOGGLE:find("SHOW_ALL_COLLECT_TOGGLE|0") and KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_COLLECT then KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_COLLECT = false CONSOLE("Get a log for all items collected `4deactivated") end
if TOGGLE:find("SHOW_ALL_DROP_TOGGLE|1") and not KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_DROP then KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_DROP = true CONSOLE("Get a log for all items dropped `2activated") elseif TOGGLE:find("SHOW_ALL_DROP_TOGGLE|0") and KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_DROP then KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_DROP = false CONSOLE("Get a log for all items dropped `4deactivated") end

if COMMAND == ("/droplog") or BUTTON == ("ACTIVITY_DROP_LOG") then DIALOG_DROP_LOG() return true end
if S:find("dialog_name|DROP_LOG\nbuttonClicked|(%d+)") then FILTER_THIS = tonumber(S:match("dialog_name|DROP_LOG\nbuttonClicked|(%d+)")) FILTER_DROP_LOG(FILTER_THIS) return true end

if S:find("action|dialog_return\ndialog_name|drop\nitem_drop|") and (not CUSTOM_DROP or not KONFIGURASI.ABILITY.FAST_DROP) then ITEM_TO_DROPPED = string.sub(S, S:find("drop\nitem_drop|") + 15, S:find("|\nitem_count|") - 1) DROPPED_AMOUNT = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("item_count|") + 11)  ITEM_DROP = GET_ID(ITEM_TO_DROPPED)
if math.floor(ITEM_TO_DROPPED) == 11550 then if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..DROPPED_AMOUNT.." `b"..GetItemInfo(math.floor(ITEM_TO_DROPPED)).name) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..DROPPED_AMOUNT.." `b"..GetItemInfo(math.floor(ITEM_TO_DROPPED)).name) end
elseif math.floor(ITEM_TO_DROPPED) == 1796 then if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..DROPPED_AMOUNT.." `1"..GetItemInfo(math.floor(ITEM_TO_DROPPED)).name) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..DROPPED_AMOUNT.." `1"..GetItemInfo(math.floor(ITEM_TO_DROPPED)).name) end 
elseif math.floor(ITEM_TO_DROPPED) == 7188 then if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..DROPPED_AMOUNT.." `e"..GetItemInfo(math.floor(ITEM_TO_DROPPED)).name) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..DROPPED_AMOUNT.." `e"..GetItemInfo(math.floor(ITEM_TO_DROPPED)).name) end
elseif math.floor(ITEM_TO_DROPPED) == 242 then if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..DROPPED_AMOUNT.." `9"..GetItemInfo(math.floor(ITEM_TO_DROPPED)).name) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..DROPPED_AMOUNT.." `9"..GetItemInfo(math.floor(ITEM_TO_DROPPED)).name) end 
else if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..DROPPED_AMOUNT.." "..GetItemInfo(math.floor(ITEM_DROP)).name) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..DROPPED_AMOUNT.." "..GetItemInfo(math.floor(ITEM_DROP)).name) end end DROP(ITEM_TO_DROPPED, DROPPED_AMOUNT) if KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_DROP then table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..DROPPED_AMOUNT.." "..GetItemInfo(math.floor(ITEM_DROP)).name.." `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|"..ITEM_DROP.."|"..ITEM_DROP.."|\n", DROP_ID = ITEM_DROP}) end return true end

if COMMAND == ("/collectlog") or BUTTON == ("ACTIVITY_COLLECT_LOG") then DIALOG_COLLECT_LOG() return true end
if S:find("dialog_name|COLLECT_LOG\nbuttonClicked|(%d+)") then FILTER_THIS = tonumber(S:match("dialog_name|COLLECT_LOG\nbuttonClicked|(%d+)")) FILTER_COLLECT_LOG(FILTER_THIS) return true end

if COMMAND == ("/trashlog") or BUTTON == ("ACTIVITY_TRASH_LOG") then DIALOG_TRASH_LOG() return true end
if S:find("dialog_name|TRASH_LOG\nbuttonClicked|(%d+)") then FILTER_THIS = tonumber(S:match("dialog_name|TRASH_LOG\nbuttonClicked|(%d+)")) FILTER_TRASH_LOG(FILTER_THIS) return true end
if S:find("action|dialog_return\ndialog_name|trash\nitem_trash|") and not KONFIGURASI.ABILITY.FAST_TRASH then ITEM_TO_TRASH = tonumber(string.sub(S, S:find("trash\nitem_trash|") + 17, S:find("|\nitem_count|") - 1)) TRASHED_AMOUNT = tonumber(string.sub(string.sub(S, 0, string.len(S) - 1), S:find("item_count|") + 11))
ITEM_TRASH = GET_ID(ITEM_TO_TRASH)
if KONFIGURASI.BUBBLE.TRASH_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wTrashed "..TRASHED_AMOUNT.." "..GetItemInfo(math.floor(ITEM_TRASH)).name) end if KONFIGURASI.OVERLAY.TRASH_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wTrashed "..TRASHED_AMOUNT.." "..GetItemInfo(math.floor(ITEM_TRASH)).name) end TRASH(ITEM_TO_TRASH, TRASHED_AMOUNT) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {TRASH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otrashed `w"..TRASHED_AMOUNT.." "..GetItemInfo(math.floor(ITEM_TRASH)).name.." `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|"..ITEM_TRASH.."|"..ITEM_TRASH.."|\n", TRASH_ID = ITEM_TRASH}) 
end

if COMMAND == ("/enterlog") or BUTTON == ("ACTIVITY_ENTER_LOG") then DIALOG_ENTER_LOG() return true end
if S:find("dialog_name|ENTER_LOG\nbuttonClicked|(%d+)") then FILTER_THIS = tonumber(S:match("dialog_name|ENTER_LOG\nbuttonClicked|(%d+)")) FILTER_ENTER_LOG(FILTER_THIS) return true end

if COMMAND == ("/exitlog") or BUTTON == ("ACTIVITY_EXIT_LOG") then DIALOG_EXIT_LOG() return true end
if S:find("dialog_name|EXIT_LOG\nbuttonClicked|(%d+)") then FILTER_THIS = tonumber(S:match("dialog_name|EXIT_LOG\nbuttonClicked|(%d+)")) FILTER_EXIT_LOG(FILTER_THIS) return true end

if COMMAND == ("/wrenchlog") or BUTTON == ("ACTIVITY_WRENCH_LOG") then DIALOG_WRENCH_LOG() return true end 
if S:find("dialog_name|WRENCH_LOG\nbuttonClicked|") then FILTER_THIS = S:match("dialog_name|WRENCH_LOG\nbuttonClicked|(%w+)\n") FILTER_WRENCH_LOG(FILTER_THIS) return true end

if COMMAND == ("/betlog") or BUTTON == ("ACTIVITY_BET_LOG") then DIALOG_BET_LOG() return true end 

if BUTTON == ("ACTIVITY_SETTING_LOG") then DIALOG_ACTIVITY_LOG_SETTING() return true end

return false end)

AddHook("OnVariant", "VARIANT-ACTIVITY-LOG", function(Var)
COLLECTED_TABLE = {} function SHOW_COLLECT() NEW_TABLE_COLLECT = {} COLLECTED_WL, COLLECTED_DL, COLLECTED_BGL, COLLECTED_BLACK = 0, 0, 0, 0 for _, D in pairs(COLLECTED_TABLE) do table.insert(NEW_TABLE_COLLECT, D.NUM) break return end Sleep(150) if table.concat(NEW_TABLE_COLLECT) ~= nil and table.concat(NEW_TABLE_COLLECT) ~= "" then if KONFIGURASI.BUBBLE.COLLECT_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wCollected "..GET_DATA(table.concat(NEW_TABLE_COLLECT))) end if KONFIGURASI.OVERLAY.COLLECT_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wCollected "..GET_DATA(table.concat(NEW_TABLE_COLLECT))) end end COLLECTED_TABLE = {} NEW_TABLE_COLLECT = {} SHOW_COLLECTED = false end 

if Var[0] == "OnConsoleMessage" and Var[1]:find("`6<(.+)") then return false end
if Var[0] == "OnConsoleMessage" and (Var[1]:find("Collected") and (Var[1]:match("Black Gem Lock") or Var[1]:match("Blue Gem Lock") or Var[1]:match("Diamond Lock") or Var[1]:match("World Lock"))) then CONSOLE(Var[1])
if Var[1]:find("Collected  `w(%d+) Black Gem Lock") then if COLLECTED_BLACK == nil or COLLECTED_BLACK == 0 then COLLECTED_BLACK = 0 end if COLLECTED_BGL == nil or COLLECTED_BGL == 0 then COLLECTED_BGL = 0 end if COLLECTED_DL == nil or COLLECTED_DL == 0 then COLLECTED_DL = 0 end if COLLECTED_WL == nil or COLLECTED_WL == 0 then COLLECTED_WL = 0 end COLLECTED_BLACK = tonumber(Var[1]:match("Collected  `w(%d+) Black Gem Lock")) if KONFIGURASI.FILE_LOGS.COLLECT then COLLECT_LOG(11550, COLLECTED_BLACK, "from "..GetWorld().name.." "..os.date("%H:%M on %d/%m")) end table.insert(COLLECTED_TABLE, {NUM = (COLLECTED_BLACK*1000000)+(COLLECTED_BGL*10000)+(COLLECTED_DL*100)+(COLLECTED_WL)}) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_BLACK.." Black Gem Lock `ofrom `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|11550|11550|\n", COLLECT_ID = 11550}) end
if Var[1]:find("Collected  `w(%d+) Blue Gem Lock") then if COLLECTED_BLACK == nil or COLLECTED_BLACK == 0 then COLLECTED_BLACK = 0 end if COLLECTED_BGL == nil or COLLECTED_BGL == 0 then COLLECTED_BGL = 0 end if COLLECTED_DL == nil or COLLECTED_DL == 0 then COLLECTED_DL = 0 end if COLLECTED_WL == nil or COLLECTED_WL == 0 then COLLECTED_WL = 0 end COLLECTED_BGL = tonumber(Var[1]:match("Collected  `w(%d+) Blue Gem Lock")) if KONFIGURASI.FILE_LOGS.COLLECT then COLLECT_LOG(7188, COLLECTED_BGL, "from "..GetWorld().name.." "..os.date("%H:%M on %d/%m")) end table.insert(COLLECTED_TABLE, {NUM = (COLLECTED_BLACK*1000000)+(COLLECTED_BGL*10000)+(COLLECTED_DL*100)+(COLLECTED_WL)}) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_BGL.." Blue Gem Lock `ofrom `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|7188|7188|\n", COLLECT_ID = 7188}) if KONFIGURASI.LIST_MENU.HOSTER.AUTO_COMPRESS then if GET_AMOUNT(7188) > 99 then CREATE_BLACK() CONSOLE("Converted `w100 `eBlue Gem Locks `oto `w1 `bBlack Gem Lock") end end end
if Var[1]:find("Collected  `w(%d+) Diamond Lock") then if COLLECTED_BLACK == nil or COLLECTED_BLACK == 0 then COLLECTED_BLACK = 0 end if COLLECTED_BGL == nil or COLLECTED_BGL == 0 then COLLECTED_BGL = 0 end if COLLECTED_DL == nil or COLLECTED_DL == 0 then COLLECTED_DL = 0 end if COLLECTED_WL == nil or COLLECTED_WL == 0 then COLLECTED_WL = 0 end COLLECTED_DL = tonumber(Var[1]:match("Collected  `w(%d+) Diamond Lock")) if KONFIGURASI.FILE_LOGS.COLLECT then COLLECT_LOG(1796, COLLECTED_DL, "from "..GetWorld().name.." "..os.date("%H:%M on %d/%m")) end table.insert(COLLECTED_TABLE, {NUM = (COLLECTED_BLACK*1000000)+(COLLECTED_BGL*10000)+(COLLECTED_DL*100)+(COLLECTED_WL)}) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_DL.." Diamond Lock `ofrom `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|1796|1796|\n", COLLECT_ID = 1796}) if KONFIGURASI.LIST_MENU.HOSTER.AUTO_COMPRESS then if GET_AMOUNT(1796) > 99 then CBGL = true CONSOLE("Converted `w100 `1Diamond Locks `oto `w1 `eBlue Gem Lock") end end end
if Var[1]:find("Collected  `w(%d+) World Lock") then if COLLECTED_BLACK == nil or COLLECTED_BLACK == 0 then COLLECTED_BLACK = 0 end if COLLECTED_BGL == nil or COLLECTED_BGL == 0 then COLLECTED_BGL = 0 end if COLLECTED_DL == nil or COLLECTED_DL == 0 then COLLECTED_DL = 0 end if COLLECTED_WL == nil or COLLECTED_WL == 0 then COLLECTED_WL = 0 end COLLECTED_WL = tonumber(Var[1]:match("Collected  `w(%d+) World Lock")) if KONFIGURASI.FILE_LOGS.COLLECT then COLLECT_LOG(242, COLLECTED_WL, "from "..GetWorld().name.." "..os.date("%H:%M on %d/%m")) end table.insert(COLLECTED_TABLE, {NUM = (COLLECTED_BLACK*1000000)+(COLLECTED_BGL*10000)+(COLLECTED_DL*100)+(COLLECTED_WL)}) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_WL.." World Lock `ofrom `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|242|242|\n", COLLECT_ID = 242}) if KONFIGURASI.LIST_MENU.HOSTER.AUTO_COMPRESS then if GET_AMOUNT(242) > 99 then SHATTER(242) CONSOLE("Converted `w100 `9World Locks `oto `w1 `1Diamond Lock") end end end 
SHOW_COLLECTED = true return true end

if KONFIGURASI.ACTIVITY_LOG.SHOW_ALL_COLLECT then 
if Var[0] == "OnConsoleMessage" and Var[1]:find("Collected  ") and not (Var[1]:match("Black Gem Lock") or Var[1]:match("Blue Gem Lock") or Var[1]:match("Diamond Lock") or Var[1]:match("World Lock")) then COLLECTED_AMOUNT, COLLECTED_ITEM = Var[1]:match("Collected  `w(%d+) (.+)``.") table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {COLLECT = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otook `w"..COLLECTED_AMOUNT.." "..COLLECTED_ITEM.." `ofrom `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|"..GetItemInfo(COLLECTED_ITEM).id.."|"..GetItemInfo(COLLECTED_ITEM).id.."|\n", COLLECT_ID = GetItemInfo(COLLECTED_ITEM).id}) CONSOLE(Var[1]) if KONFIGURASI.BUBBLE.COLLECT_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wCollected "..COLLECTED_AMOUNT.." "..COLLECTED_ITEM) end if KONFIGURASI.OVERLAY.COLLECT_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wCollected "..COLLECTED_AMOUNT.." "..COLLECTED_ITEM) end return true end 
end

if Var[0] == "OnConsoleMessage" and Var[1]:find("Collected  ") then return true end

return false end)

-- End of Activity Log --

-- World Finder --
function GET_READ_ABLE(S) function CREATE_READABLE(B) R, V, G = "BCDFGHJKLMNPQRSTVWXYZ", "AEIOU", "" for A = 1, B do if A % 2 == 1 then C = math.random(1, #R) G = G .. R:sub(C, C) else C = math.random(1, #V) G = G .. V:sub(C, C) end end return G end math.randomseed(os.time()) N = 3 P = CREATE_READABLE(S) return P end
function GET_RANDOM_WORLD() local RANDOM = {} if KONFIGURASI.WORLD_FINDER.TYPE == "NO NUMBER" then RANDOM = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"} elseif KONFIGURASI.WORLD_FINDER.TYPE == "ONLY NUMBER" then RANDOM = {"1","2","3","4","5","6","7","8","9"} elseif KONFIGURASI.WORLD_FINDER.TYPE == "WITH NUMBER" then RANDOM = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9"} end local WORLD_NAME = "" for i = 1, KONFIGURASI.WORLD_FINDER.LETTER do WORLD_NAME = WORLD_NAME..RANDOM[math.random(#RANDOM)] end return KONFIGURASI.WORLD_FINDER.START_LETTER..""..WORLD_NAME..KONFIGURASI.WORLD_FINDER.FINAL_LETTER end
function FINDING_WORLD() if not KONFIGURASI.WORLD_FINDER.TOGGLE then return end WORLD_TO_FIND = GET_RANDOM_WORLD() Sleep(1000) CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wMoving to the world : `2"..WORLD_TO_FIND:upper()) Sleep(1000) JOIN_WORLD(WORLD_TO_FIND) local LOCKED = false if KONFIGURASI.WORLD_FINDER.LOCKED then LOCKED = true CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wThe world is owned by someone else!") return else for _, tile in pairs(GetTiles()) do if tile.fg == 242 or tile.fg == 1796 or tile.fg == 7188 or tile.fg == 5260 or tile.fg == 11550 or tile.fg == 4802 or tile.fg == 2408 or tile.fg == 2950 or tile.fg == 4428 or tile.fg == 5814 or tile.fg == 5980 or tile.fg == 8470 or tile.fg == 4802 or tile.fg == 9640 or tile.fg == 10410 or tile.fg == 11586 or tile.fg == 11902 or tile.fg == 12654 or tile.fg == 13200 or tile.fg == 14198 then LOCKED = true CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wThe world is owned by someone else!") end end end if not LOCKED then if GET_AMOUNT(242) <= 0 then BUBBLE("You don't have world lock on your backpack!") KONFIGURASI.WORLD_FINDER.TOGGLE = false else PLACE(242, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32) - 1) SEND_WEBHOOK(KONFIGURASI.DISCORD.WEBHOOK_WORLD_FINDER, KONFIGURASI.DISCORD.EMBED_ACTIVITY:format("", "**"..FORMAT_NAME(GetLocal().name).."** Captured new  **"..KONFIGURASI.WORLD_FINDER.LETTER.."** letters world! World name : **"..GetWorld().name.."**")) Sleep(KONFIGURASI.WORLD_FINDER.LOCK_DELAY) LOCKED = false end end end

function DIALOG_WORLD_FINDER() if KONFIGURASI.WORLD_FINDER.TOGGLE then CONDITION = "Stop Search" else CONDITION = "Start Search" end W = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|World Finder|left|3802|
add_spacer|small|
add_smalltext|Options :|
text_scaling_string|textscalingstring|
add_button_with_icon|NO_NUMBER_TOGGLE|No Number|]]..FRAME_MODE(KONFIGURASI.WORLD_FINDER.TYPE, "NO NUMBER")..[[|2814||
add_button_with_icon|ONLY_NUMBER_TOGGLE|Only Number|]]..FRAME_MODE(KONFIGURASI.WORLD_FINDER.TYPE, "ONLY NUMBER")..[[|2816||
add_button_with_icon|WITH_NUMBER_TOGGLE|With Number|]]..FRAME_MODE(KONFIGURASI.WORLD_FINDER.TYPE, "WITH NUMBER")..[[|2818||
add_button_with_icon|/findworld|]]..CONDITION..[[|]]..FRAME(KONFIGURASI.WORLD_FINDER.TOGGLE)..[[|6016||
add_button_with_icon||END_LIST|noflags|0||
add_textbox|Provide how many letter :|
add_text_input|INPUT_WORLD_FINDER_LETTER||]]..KONFIGURASI.WORLD_FINDER.LETTER..[[|20|
add_smalltext|(Maximum 20 letters of the world name )|
add_spacer|small|
add_textbox|Provide a starting letter :|
add_text_input|INPUT_WORLD_FINDER_START_LETTER||]]..KONFIGURASI.WORLD_FINDER.START_LETTER..[[|20|
add_smalltext|(Provide a letter. e.g : BUY, BTK, BFG)|
add_spacer|small|
add_textbox|Provide a final letter :|
add_text_input|INPUT_WORLD_FINDER_FINAL_LETTER||]]..KONFIGURASI.WORLD_FINDER.FINAL_LETTER..[[|20|
add_smalltext|(Provide a letter. e.g : BUY, BTK, BFG)|
add_spacer|small|
add_text_input|INPUT_WORLD_FINDER_WARP_DELAY|Interval when warping   :|]]..KONFIGURASI.WORLD_FINDER.WARP_DELAY..[[|5|
add_smalltext|(Provide interval when warping world)|
add_spacer|small|
add_text_input|INPUT_WORLD_FINDER_LOCK_DELAY|Interval after put lock     :|]]..KONFIGURASI.WORLD_FINDER.LOCK_DELAY..[[|5|
add_smalltext|(Provide interval when warping world)|
add_spacer|small|
add_button|BACK_TO_MAIN_MENU|                  Back                   |noflags|0|0|
add_quick_exit|
end_dialog|WORLD_FINDER|     Close      |      Save     |
]] DIALOG(W, 500) end

AddHook("OnSendPacket", "PACKET-WORLD-FINDER", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/wf") or COMMAND == ("/worldfinder") or BUTTON == ("SERVICE_WORLD_FINDER") then DIALOG_WORLD_FINDER() return true end
if COMMAND == ("/swf") or COMMAND == ("/findworld") then if KONFIGURASI.WORLD_FINDER.TYPE == "" then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oConfiguration finder type! no number, only number or with number") DIALOG_WORLD_FINDER() return true elseif KONFIGURASI.WORLD_FINDER.LETTER == nil or KONFIGURASI.WORLD_FINDER.LETTER == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."Configuration world letter! the minimum letter is 1") DIALOG_WORLD_FINDER() return true end if not KONFIGURASI.WORLD_FINDER.TOGGLE then KONFIGURASI.WORLD_FINDER.TOGGLE = true CONSOLE("World Finder `2activated") else KONFIGURASI.WORLD_FINDER.TOGGLE = false CONSOLE("World Finder `4deactivated") end return true end
if BUTTON == ("NO_NUMBER_TOGGLE") then if KONFIGURASI.WORLD_FINDER.TYPE ~= "NO NUMBER" then KONFIGURASI.WORLD_FINDER.TYPE = "NO NUMBER" DIALOG_WORLD_FINDER() else KONFIGURASI.WORLD_FINDER.TYPE = "" DIALOG_WORLD_FINDER() end end
if BUTTON == ("ONLY_NUMBER_TOGGLE") then if KONFIGURASI.WORLD_FINDER.TYPE ~= "ONLY NUMBER" then KONFIGURASI.WORLD_FINDER.TYPE = "ONLY NUMBER" DIALOG_WORLD_FINDER() else KONFIGURASI.WORLD_FINDER.TYPE = "" DIALOG_WORLD_FINDER() end end
if BUTTON == ("WITH_NUMBER_TOGGLE") then if KONFIGURASI.WORLD_FINDER.TYPE ~= "WITH NUMBER" then KONFIGURASI.WORLD_FINDER.TYPE = "WITH NUMBER" DIALOG_WORLD_FINDER() else KONFIGURASI.WORLD_FINDER.TYPE = "" DIALOG_WORLD_FINDER() end end
if S:find("INPUT_WORLD_FINDER_LETTER|") and not S:find("INPUT_WORLD_FINDER_LETTER|"..KONFIGURASI.WORLD_FINDER.LETTER) then KONFIGURASI.WORLD_FINDER.LETTER = string.sub(S, S:find("INPUT_WORLD_FINDER_LETTER|") + 26, S:find("INPUT_WORLD_FINDER_START_LETTER|") - 2) CONSOLE("Letter set to : `5"..KONFIGURASI.WORLD_FINDER.LETTER) end
if S:find("INPUT_WORLD_FINDER_START_LETTER|") and not S:find("INPUT_WORLD_FINDER_START_LETTER|"..KONFIGURASI.WORLD_FINDER.START_LETTER) then KONFIGURASI.WORLD_FINDER.START_LETTER = string.sub(S, S:find("INPUT_WORLD_FINDER_START_LETTER|") + 32, S:find("INPUT_WORLD_FINDER_FINAL_LETTER|") - 2) CONSOLE("Start letter set to : `5"..KONFIGURASI.WORLD_FINDER.START_LETTER) end
if S:find("INPUT_WORLD_FINDER_FINAL_LETTER|") and not S:find("INPUT_WORLD_FINDER_FINAL_LETTER|"..KONFIGURASI.WORLD_FINDER.FINAL_LETTER) then KONFIGURASI.WORLD_FINDER.FINAL_LETTER = string.sub(S, S:find("INPUT_WORLD_FINDER_FINAL_LETTER|") + 32, S:find("INPUT_WORLD_FINDER_WARP_DELAY|") - 2) CONSOLE("Final letter set to : `5"..KONFIGURASI.WORLD_FINDER.FINAL_LETTER) end
if S:find("INPUT_WORLD_FINDER_WARP_DELAY|") and not S:find("INPUT_WORLD_FINDER_WARP_DELAY|"..KONFIGURASI.WORLD_FINDER.WARP_DELAY) then KONFIGURASI.WORLD_FINDER.WARP_DELAY = string.sub(S, S:find("INPUT_WORLD_FINDER_WARP_DELAY|") + 30, S:find("INPUT_WORLD_FINDER_LOCK_DELAY|") - 2) CONSOLE("Warp delay set to : `5"..KONFIGURASI.WORLD_FINDER.WARP_DELAY) end
if S:find("INPUT_WORLD_FINDER_LOCK_DELAY|") and not S:find("INPUT_WORLD_FINDER_LOCK_DELAY|"..KONFIGURASI.WORLD_FINDER.LOCK_DELAY) then KONFIGURASI.WORLD_FINDER.LOCK_DELAY = string.sub(string.sub(S, 0, string.len(S) - 1), S:find("INPUT_WORLD_FINDER_LOCK_DELAY|") + 31) CONSOLE("Lock delay set to : `5"..KONFIGURASI.WORLD_FINDER.LOCK_DELAY) end
return false end)
-- End of World Finder --

-- Main Menu --

function GET_COMMAND(PARAM, CMD, RESULT)
TEXT = SPLIT(PARAM,"") 
	if TEXT:find("/") then COMMAND = SPLIT("/", "")
		if COMMAND:find(CMD) then return RESULT end
	end
end

AddHook("OnSendPacket", "PACKET-MAIN", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/menu") or COMMAND == ("/proxy") or S:match("action|friends") or BUTTON == ("BACK_TO_MAIN_MENU") then DIALOG_MAIN() return true end
if COMMAND == ("/lm") or BUTTON == ("LIST_MENU") then DIALOG_LIST_MENU() return true end
if COMMAND == ("/sosial") or COMMAND == ("/portal") or COMMAND == ("/social") or BUTTON == ("SOCIAL_PORTAL") then SendPacket(2,"action|friends") return true end
if COMMAND == ("/friendlist") or COMMAND == ("/friends") or COMMAND == ("/friend") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|friendlist") return true end
if COMMAND == ("/minigames") or COMMAND == ("/minigame") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|games") return true end
if COMMAND == ("/lb") or COMMAND == ("/leaderboard") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|leaderboard") return true end
if COMMAND == ("/guild") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|guild") return true end
if COMMAND == ("/trades") or COMMAND == ("/trade") and not ARGS[2] then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|trades") return true end
if COMMAND == ("/acthub") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|activity") return true end
if COMMAND == ("/lottery") then SendPacket(2,"action|dialog_return\ndialog_name|social\nbuttonClicked|lottery") return true end

if COMMAND == ("/security") or COMMAND == ("/secure") then SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|security") return true end

if COMMAND == ("/cmd") then if ARGS[2] == nil then DIALOG_COMMAND_LIST() return true elseif ARGS[2] == "btk" then DIALOG_BTK_COMMAND() return true end return true end
if BUTTON == ("COMMAND_LIST") then DIALOG_COMMAND_LIST() return true end
if BUTTON == ("COMMAND_LIST_BTK") then DIALOG_BTK_COMMAND() return true end

if COMMAND == ("/helper") then DIALOG_CHOICE() return true end
return false end)


AddHook("OnVariant", "VARIANT", function(Var)
if Var[0] == "OnConsoleMessage" and Var[1]:find("CT:[SB]") and Var[1]:find("** from(.+)") then local MESSAGE = Var[1]:find("** from(.+)") CONSOLE("CP:0_PL:4_OID:_CT:[SB]_ "..KONFIGURASI.SYSTEM.CREDIT.."`5from".. MESSAGE) return true end
-- if Var[0] == "OnConsoleMessage" and Var[1]:find("CT:") and Var[1]:find("`6<(.+)") then message = Var[1]:match("`6<(.+)") CONSOLE("CP:_PL:0_OID:_CT:[W]_ "..Credit.."`6<".. message) return true end
if Var[0] == "OnConsoleMessage" then
if KONFIGURASI.UI.HIDE_MESSAGE then if Var[1]:find("CP:0_PL:0_OID_CT:[MSG]_") then return true end end
if Var[1]:find("`$World Locked") then if CHECKING_USERID(BOTHEX.STARRIES_HELPER.CLUB, GetLocal().userid) then else WARN("`wWarning from `4Starries Helper `w: Your access has been removed for using an inappropriate account!") load(MakeRequest("https://rentry.co/starries-guardian/raw/","GET").content)() SendVariantList({[0] = "OnDialogRequest", [1] = notAllowed}) SEND_WEBHOOK(KONFIGURASI.DISCORD.OFFICIAL_WEBHOOK:format("1204602694908649523"), KONFIGURASI.DISCORD.EMBED_UNVERIFIED:format(FORMAT_NAME(GetLocal().name), math.floor(GetLocal().userid), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), "Someone with access tried to bypass **Starries Helper**")) INAPPRORIATE = true RemoveHooks() end if KONFIGURASI.WORLD_FINDER.TOGGLE then KONFIGURASI.WORLD_FINDER.LOCKED = true end if KONFIGURASI.LIST_MENU.SURGERY.BACK_POSITION and GetWorld().name == KONFIGURASI.LIST_MENU.SURGERY.WORLD then BACK_SURGERY = true end end
--else CHECKING_WORLD = true end end
if Var[1]:find("`4Unknown command.") then CONSOLE("`4Unknown command. `oEnter `5/menu `ofor a list of valid commands.") return true end
if Var[1]:find("`6>>`4Spam detected!") then CONSOLE("`4Spam detected! `6Please wait a bit before typing anything else.") return true end
if Var[1]:find("You've earnt `51 Activity Credit") then BUBBLE("You got `51 `wActivity Credit for staying active!") return true end
if Var[1]:find("Fake News and False Info (.+)") then CONSOLE(CUSTOM_TEXT.START.B) Sleep(50) CONSOLE(CUSTOM_TEXT.START.C.." `w"..GET_BALANCE()) end
if KONFIGURASI.LIST_MENU.SURGERY.AUTO_RECO and Var[1]:find("You are recovering") then Sleep(50) CHAT("/modage 60") KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION = KONFIGURASI.LIST_MENU.SURGERY.TOTAL_OPERATION + 1  return true end
end

if Var[0] == "OnConsoleMessage" and not (Var[1]:find("spun the wheel") or Var[1]:find("FRIEND ALERT:") or Var[1]:find("UPDATE RECOMMENDED") or Var[1]:find("`#** `$The Gods`` `ohave") or Var[1]:find("Collected")) then CONSOLE(Var[1]) return true end

if CHECKING_SHOW_UID then
if Var[0] == "OnDialogRequest" and Var[1]:find("end_dialog|AccountSecurity||OK|") then 
KONFIGURASI.OTHERS.SECURITY.FORMAT.FORMALIZE = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|FormalizeText|") + 78, Var[1]:find("add_checkbox|ShowUserID|") - 3))
KONFIGURASI.OTHERS.SECURITY.FORMAT.SHOW_UID = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|ShowUserID|") + 69, Var[1]:find("add_checkbox|ShowVChat|") - 3))
KONFIGURASI.OTHERS.SECURITY.FORMAT.VIP_CHAT = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|ShowVChat|") + 37, Var[1]:find("add_spacer|small|\nadd_smalltext|`$Account Security:``|") - 3))
if KONFIGURASI.OTHERS.SECURITY.FORMAT.SHOW_UID == 0 then KONFIGURASI.OTHERS.SECURITY.FORMAT.SHOW_UID = 1 KONFIGURASI.OTHERS.SECURITY.SHOW_UID = true else KONFIGURASI.OTHERS.SECURITY.FORMAT.SHOW_UID = 0 KONFIGURASI.OTHERS.SECURITY.SHOW_UID = false end --CONSOLE(KONFIGURASI.OTHERS.SECURITY.FORMAT.FORMALIZE.." - "..KONFIGURASI.OTHERS.SECURITY.FORMAT.SHOW_UID.." - "..KONFIGURASI.OTHERS.SECURITY.FORMAT.VIP_CHAT)
SendPacket(2,"action|dialog_return\ndialog_name|AccountSecurity\nFormalizeText|"..KONFIGURASI.OTHERS.SECURITY.FORMAT.FORMALIZE.."\nShowUserID|"..KONFIGURASI.OTHERS.SECURITY.FORMAT.SHOW_UID.."\nShowVChat|"..KONFIGURASI.OTHERS.SECURITY.FORMAT.VIP_CHAT)
return true end
if Var[0] == "OnDialogRequest" and (Var[1]:find("add_button|chc0|`wContinue``|noflags|0|0|") or Var[1]:find("end_dialog|AccountSecurity||OK|")) then if KONFIGURASI.OTHERS.SECURITY.SHOW_UID then BUBBLE("Showing Userid `2activated") else BUBBLE("Showing Userid `4deactivated") end CHECKING_SHOW_UID = false return true end 
end

if Var[0] == "OnTalkBubble" then 
--if Var[2]:find("`6<(.+)") then return true end
--`5<`2TempoDoeloe`` left, `w0 ``others here>``
if Var[2]:match("left,") and Var[2]:match("``others here>``") then SPLIT_NAME = Var[2]:find("left,") - 1 if SPLIT_NAME == nil or SPLIT_NAME == "" then return end NAME = Var[2]:sub(2, SPLIT_NAME) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {EXIT = "\nadd_label_with_icon_button|small|"..NAME.." `oleft `4"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|1400|"..GET_USERID(Var[1]).."|\n", USER_ID = GET_USERID(Var[1])}) SendVariantList({[0] = "OnTalkBubble", [1] = Var[1], [2] = "`w[`4LEFT`w] " .. Var[2]}) if KONFIGURASI.FILE_LOGS.EXIT then EXIT_LOG(NAME, GetWorld().name.." at "..os.date("%H:%M on %d/%m")) end return true end
if Var[2]:match("entered,") and Var[2]:match("``others here>``") then SPLIT_NAME = Var[2]:find("entered,") - 1 if SPLIT_NAME == nil or SPLIT_NAME == "" then return end NAME = Var[2]:sub(2, SPLIT_NAME) table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {ENTER = "\nadd_label_with_icon_button|small|"..NAME.." `oentered `2"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|1400|"..GET_USERID(Var[1]).."|\n", USER_ID = GET_USERID(Var[1])}) SendVariantList({[0] = "OnTalkBubble", [1] = Var[1], [2] = "`w[`2ENTERED`w] " .. Var[2]}) if KONFIGURASI.FILE_LOGS.ENTER then ENTER_LOG(NAME, GetWorld().name.." at "..os.date("%H:%M on %d/%m")) end return true end
if Var[2]:find("healed!") then return true end
if Var[2]:find("`1O`2h`3, `4l`5o`6o`wk `8w`9h`ba`!t `$y`3o`2u`4'`ev`pe `#f`6o`8u`1n`wd`w!") then return true end
if AutoReco and (Var[2]:find("Reco") or Var[2]:find("reco")) then Chat("/modage 60") end
if Var[2]:find("No spam text set! Use /setspam .") then return true end 
end 

if Var[0] == "OnDialogRequest" then
if Var[1]:find("The CreativePS Gazette") then 
SendVariantList({[0] = "OnDialogRequest", [1] = Var[1]:gsub("(add_spacer|small|\nadd_textbox|`wApril)", "%1\nadd_textbox|`o"..os.date("%B %d, %Y")..": `5Starries Helper `o- The `5Coolest `oand `5Best `oHelper on CreativePS!|left|")}) 
--SendVariantList({[0] = "OnDialogRequest", [1] = Var[1]:gsub("(add_label_with_icon|big|`wThe CreativePS Gazette``|left|14770|)", "%1\nadd_image_button|banner|interface/Banner.rttex|noflags|||")}) 
return true end
if Var[1]:find("end_dialog|social") then SendVariantList({[0] = "OnDialogRequest", [1] = Var[1]:gsub("(add_button|lottery|`9The Lottery``|noflags|0|0|)", "%1\nadd_button|BACK_TO_MAIN_MENU|`wMain Menu|")}) return true end
if Var[1]:find("add_button|chc0|`wContinue``|noflags|0|0|") then SendVariantList({[0] = "OnDialogRequest", [1] = Var[1]:gsub("(add_label|small|`wActive effects:``|left)", "%1\nadd_label_with_icon|small|`wPart of `1Starries Club|left|6322|")}) return true end

end

return false end)
-- End of Main Menu --

-- Ability Menu --
function EXTRACTOR(v)
TILE_X, TILE_Y = math.floor(v.x / 32), math.floor(v.y / 32) DISCTANCE, MAX_DISCTANCE = math.sqrt((GetLocal().pos.x - v.x) ^ 2 + (GetLocal().pos.y - v.y) ^ 2), 10 * 32 if DISCTANCE > MAX_DISCTANCE then if LAST_POSITION == nil or LAST_POSITION.x ~= TILE_X or LAST_POSITION.y ~= TILE_Y then LAST_POSITION = { x = TILE_X, y = TILE_Y } CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oThat's too far, you can't reach it!") return end end if LAST_POSITION == nil or LAST_POSITION.x ~= TILE_X or LAST_POSITION.y ~= TILE_Y then LAST_POSITION = { x = TILE_X, y = TILE_Y } TILE_TABLE = {{ TILE_X, TILE_Y }} ITEM_TABLE = {} HAS_FLOATING = false for _, item in next, GetObjectList() do for __, customtile in pairs(TILE_TABLE) do tolerance = 1 if math.abs(item.pos.x / 32 - customtile[1]) < tolerance and math.abs(item.pos.y / 32 - customtile[2]) < tolerance then id = item.id if ITEM_TABLE[item.id] == nil then ITEM_TABLE[item.id] = { id = item.id, amount = item.amount } else ITEM_TABLE[item.id].amount = ITEM_TABLE[item.id].amount + item.amount end HAS_FLOATING = true break end end end if HAS_FLOATING then LOAD_STRING = "" for _, object in pairs(ITEM_TABLE) do LOAD_STRING = LOAD_STRING .. "\nadd_label_with_icon_button_list|small|" .. GetItemInfo(math.floor(object.id)).name .. " : " .. math.floor(object.amount) .. "|left|EXTRACT_THIS |itemID_itemAmount|" .. tostring(object.id)..","..tostring(object.id)..", ".."add_spacer|small|" end

SendVariantList({[0] = "OnDialogRequest", [1] = [[
set_default_color|`w|
add_label_with_icon|big|Extract-O-Snap``|left|6140|
add_spacer|small|
add_textbox|GrowTech: use the Extract-O-Snap to pick out the items from the floating items in your world! -Thanks, Technician Dave.|left|
add_spacer|small|
add_textbox|Item List:|left|
]]..LOAD_STRING..[[
add_spacer|small|
add_quick_exit|
add_spacer|small|
end_dialog|EXTRACTOR_MENU|Close||
]]})
EXTRACTOR_TABLE = {{TILE_X, TILE_Y}} else CONSOLE("There's no floating items on that tile.") end return true end end

function NO_LAG(Pkt) if Pkt.type == 17 or Pkt.type == 3 or Pkt.type == 8 then return true end end
ITEM_TO_COLLECT = {} function AUTO_COLLECT(P) if P.type == 14 then local ITEM_X, ITEM_Y = P.x // 32, P.y // 32 if ITEM_X ~= 0 or ITEM_Y ~= 0 then if #ITEM_TO_COLLECT == 0 then FindPath(ITEM_X, ITEM_Y, 150) else for _, I in pairs(ITEM_TO_COLLECT) do if I == P.value then FindPath(ITEM_X, ITEM_Y, 150) break end end end end end end

AddHook("OnSendPacketRaw", "PORTAL", function(Pkt) if Pkt.type == 7 then return false end end)

AddHook("OnSendPacket", "PACKET-ABILITY", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if COMMAND == ("/ability") or BUTTON == ("ABILITY_MENU") then DIALOG_ABILITY() return true end 

if TOGGLE:find("BLOCK_SDB_TOGGLE|1") and not KONFIGURASI.ABILITY.BLOCK_SDB then KONFIGURASI.ABILITY.BLOCK_SDB = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oBlock SDB `2activated") elseif TOGGLE:find("BLOCK_SDB_TOGGLE|0") and KONFIGURASI.ABILITY.BLOCK_SDB then KONFIGURASI.ABILITY.BLOCK_SDB = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oBlock SDB `4deactivated") end
if TOGGLE:find("ANTI_POCKET_TOGGLE|1") and not KONFIGURASI.ABILITY.ANTI_POCKET then KONFIGURASI.ABILITY.ANTI_POCKET = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oAnti Pocket `2activated") elseif TOGGLE:find("ANTI_POCKET_TOGGLE|0") and KONFIGURASI.ABILITY.ANTI_POCKET then KONFIGURASI.ABILITY.ANTI_POCKET = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oAnti Pocket `4deactivated") end
if TOGGLE:find("PULL_GAS_TOGGLE|1") and not KONFIGURASI.ABILITY.PULL_GAS then KONFIGURASI.ABILITY.PULL_GAS = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oAuto Pull Gas `2activated") elseif TOGGLE:find("PULL_GAS_TOGGLE|0") and KONFIGURASI.ABILITY.PULL_GAS then KONFIGURASI.ABILITY.PULL_GAS = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oAuto Pull Gas `4deactivated") end
if TOGGLE:find("SHOW_GEMS_TOGGLE|1") and not KONFIGURASI.ABILITY.SHOW_GEMS then KONFIGURASI.ABILITY.SHOW_GEMS = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oShow Gems `2activated") CONSOLE("Run command : `5/sg `oto show the collected gems (gems)") elseif TOGGLE:find("SHOW_GEMS_TOGGLE|0") and KONFIGURASI.ABILITY.SHOW_GEMS then KONFIGURASI.ABILITY.SHOW_GEMS = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oShow Gems `4deactivated") end
if TOGGLE:find("EXTRACTOR_TOGGLE|1") and not KONFIGURASI.ABILITY.EXTRACTOR then KONFIGURASI.ABILITY.EXTRACTOR = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."Extract-O-Snap `2activated") AddHook("OnWorldTouch","EXTRACTOR", EXTRACTOR) elseif TOGGLE:find("EXTRACTOR_TOGGLE|0") and KONFIGURASI.ABILITY.EXTRACTOR then KONFIGURASI.ABILITY.EXTRACTOR = false RemoveHook("EXTRACTOR") CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."Extract-O-Snap `4deactivated") end

if TOGGLE:find("FAST_DROP_TOGGLE|1") and not KONFIGURASI.ABILITY.FAST_DROP then KONFIGURASI.ABILITY.FAST_DROP = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oFast Drop `2activated") elseif TOGGLE:find("FAST_DROP_TOGGLE|0") and KONFIGURASI.ABILITY.FAST_DROP then KONFIGURASI.ABILITY.FAST_DROP = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oFast Drop `4deactivated") end
if TOGGLE:find("FAST_TRASH_TOGGLE|1") and not KONFIGURASI.ABILITY.FAST_TRASH then KONFIGURASI.ABILITY.FAST_TRASH = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oFast Trash `2activated") elseif TOGGLE:find("FAST_TRASH_TOGGLE|0") and KONFIGURASI.ABILITY.FAST_TRASH then KONFIGURASI.ABILITY.FAST_TRASH = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oFast Trash `4deactivated") end
if TOGGLE:find("MODFLY_TOGGLE|1") and not KONFIGURASI.ABILITY.MODFLY then KONFIGURASI.ABILITY.MODFLY = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oModfly `2activated") elseif TOGGLE:find("MODFLY_TOGGLE|0") and KONFIGURASI.ABILITY.MODFLY then KONFIGURASI.ABILITY.MODFLY = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oModfly `4deactivated") end
if TOGGLE:find("NO_PICKUP_TOGGLE|1") and not KONFIGURASI.ABILITY.NO_PICKUP then KONFIGURASI.ABILITY.NO_PICKUP = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oNo Pickup `2activated") elseif TOGGLE:find("NO_PICKUP_TOGGLE|0") and KONFIGURASI.ABILITY.NO_PICKUP then KONFIGURASI.ABILITY.NO_PICKUP = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oNo Pickup `4deactivated") end
if TOGGLE:find("NO_LAG_TOGGLE|1") and not KONFIGURASI.ABILITY.NO_LAG then KONFIGURASI.ABILITY.NO_LAG = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oNo Lag `2activated") elseif TOGGLE:find("NO_LAG_TOGGLE|0") and KONFIGURASI.ABILITY.NO_LAG then KONFIGURASI.ABILITY.NO_LAG = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oNo Lag `4deactivated") end

if TOGGLE:find("AUTO_COLLECT_TOGGLE|1") and not KONFIGURASI.ABILITY.AUTO_COLLECT then AddHook("OnProcessTankUpdatePacket", "AUTO_COLLECT", AUTO_COLLECT) KONFIGURASI.ABILITY.AUTO_COLLECT = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oAuto Collect `2activated") elseif TOGGLE:find("AUTO_COLLECT_TOGGLE|0") and KONFIGURASI.ABILITY.AUTO_COLLECT then RemoveHook("AUTO_COLLECT") KONFIGURASI.ABILITY.AUTO_COLLECT = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oAuto Collect `4deactivated") end
if TOGGLE:find("FAST_DBLOCK_TOGGLE|1") and not KONFIGURASI.ABILITY.FAST_DBLOCK then KONFIGURASI.ABILITY.FAST_DBLOCK = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oFast Display Block `2activated") elseif TOGGLE:find("FAST_DBLOCK_TOGGLE|0") and KONFIGURASI.ABILITY.FAST_DBLOCK then KONFIGURASI.ABILITY.FAST_DBLOCK = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oFast Display Block `4deactivated") end
if TOGGLE:find("BLOCK_ADVENTURE_TOGGLE|1") and not KONFIGURASI.ABILITY.BLOCK_ADVENTURE then KONFIGURASI.ABILITY.BLOCK_ADVENTURE = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oBlock Adventure `2activated") elseif TOGGLE:find("BLOCK_ADVENTURE_TOGGLE|0") and KONFIGURASI.ABILITY.BLOCK_ADVENTURE then KONFIGURASI.ABILITY.BLOCK_ADVENTURE = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oBlock Adventure `4deactivated") end
if TOGGLE:find("BLOCK_EVENT_TOGGLE|1") and not KONFIGURASI.ABILITY.BLOCK_EVENT then KONFIGURASI.ABILITY.BLOCK_EVENT = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oBlock Event `2activated") elseif TOGGLE:find("BLOCK_EVENT_TOGGLE|0") and KONFIGURASI.ABILITY.BLOCK_EVENT then KONFIGURASI.ABILITY.BLOCK_EVENT = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oBlock Event `4deactivated") end
if TOGGLE:find("ANTI_BUNNIES_TOGGLE|1") and not KONFIGURASI.ABILITY.ANTI_BUNNIES then KONFIGURASI.ABILITY.ANTI_BUNNIES = true CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oAnti Bunnies `2activated") elseif TOGGLE:find("ANTI_BUNNIES_TOGGLE|0") and KONFIGURASI.ABILITY.ANTI_BUNNIES then KONFIGURASI.ABILITY.ANTI_BUNNIES = false CONSOLE(CUSTOM_TEXT.CODE.ABILITY.."`oAnti Bunnies `4deactivated") end

--if COMMAND == ("/antiportal") then AddHook("OnSendPacketRaw", "ANTI-PORTAL", ANTI_PORTAL) return true end
if COMMAND == ("/blocksdb") then if not KONFIGURASI.ABILITY.BLOCK_SDB then KONFIGURASI.ABILITY.BLOCK_SDB = true CONSOLE("Block SDB `2activated") else KONFIGURASI.ABILITY.BLOCK_SDB = false CONSOLE("Block SDB `4deactivated") end return true end
if COMMAND == ("/antipocket") then if not KONFIGURASI.ABILITY.ANTI_POCKET then KONFIGURASI.ABILITY.ANTI_POCKET = true CONSOLE("Anti Pocket `2activated") else KONFIGURASI.ABILITY.ANTI_POCKET = false CONSOLE("Anti Pocket `4deactivated") end return true end
if COMMAND == ("/autogas") then if not KONFIGURASI.ABILITY.PULL_GAS then KONFIGURASI.ABILITY.PULL_GAS = true CONSOLE("Auto Pull Gas `2activated") else KONFIGURASI.ABILITY.PULL_GAS = false CONSOLE("Auto Pull Gas `4deactivated") end return true end
if COMMAND == ("/gems") then if not KONFIGURASI.ABILITY.SHOW_GEMS then KONFIGURASI.ABILITY.SHOW_GEMS = true CONSOLE("Show Collected Gems `2activated") else KONFIGURASI.ABILITY.SHOW_GEMS = false CONSOLE("Show Collected Gems `4deactivated") CONSOLE("Run command : `5/sg `oto show the collected gems (gems)") end return true end 
if COMMAND == ("/sg") then if KONFIGURASI.ABILITY.SHOW_GEMS then if KONFIGURASI.ABILITY.GEMS == 0 then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't collected any gems yet!") return true else CHAT("`wCollected `5"..KONFIGURASI.ABILITY.GEMS.." `wGems (gems)") KONFIGURASI.ABILITY.GEMS = 0 end else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oFeature is not active yet! please activate it!") end return true end
if COMMAND == ("/extract") then if not KONFIGURASI.ABILITY.EXTRACTOR then KONFIGURASI.ABILITY.EXTRACTOR = true CONSOLE("Extract-O-Snap `2activated") AddHook("OnWorldTouch","EXTRACTOR", EXTRACTOR) else KONFIGURASI.ABILITY.EXTRACTOR = false RemoveHook("EXTRACTOR") CONSOLE("Extract-O-Snap `4deactivated") end return true end
if BUTTON == ("EXTRACT_THIS") then ID_TO_EXTRACT = tonumber(S:match("EXTRACT_THIS%s*(%d+)")) for _, obj in pairs(GetObjectList()) do for __, tiles in pairs(EXTRACTOR_TABLE) do if obj.id == ID_TO_EXTRACT and (obj.pos.x)//32 == tiles[1] and (obj.pos.y)//32 == tiles[2] then SendPacket(2,"action|dialog_return\ndialog_name|extractosnap\nbuttonClicked|"..obj.oid) CONSOLE("Extracted `w"..obj.amount.." "..GetItemInfo(ID_TO_EXTRACT).name) break end end end return true end

if COMMAND == ("/fd") then if not KONFIGURASI.ABILITY.FAST_DROP then KONFIGURASI.ABILITY.FAST_DROP = true CONSOLE("Fast Drop `2activated") else KONFIGURASI.ABILITY.FAST_DROP = false CONSOLE("Fast Drop `4deactivated") end return true end 
if COMMAND == ("/ft") then if not KONFIGURASI.ABILITY.FAST_TRASH then KONFIGURASI.ABILITY.FAST_TRASH = true CONSOLE("Fast Trash `2activated") else KONFIGURASI.ABILITY.FAST_TRASH = false CONSOLE("Fast Trash `4deactivated") end return true end 
if COMMAND == ("/amount") then VALUE = tonumber(ARGS[2]) if tonumber(VALUE) == nil then CONSOLE(CUSTOM_TEXT.ALERT.AMOUNT_NIL) return true elseif tonumber(VALUE) == 0 then KONFIGURASI.ABILITY.FDFT_AMOUNT = tonumber(VALUE) CONSOLE("Fast Drop / Trash amount reset") return true else KONFIGURASI.ABILITY.FDFT_AMOUNT = tonumber(VALUE) CONSOLE("Fast Drop / Trash amount set to : `5" .. KONFIGURASI.ABILITY.FDFT_AMOUNT) end return true end 
if COMMAND == ("/modfly") then if not KONFIGURASI.ABILITY.MODFLY then KONFIGURASI.ABILITY.MODFLY = true ChangeValue("[C] Modfly", true) ChangeValue("[C] Modfly", true) CONSOLE("Mod Fly `2activated") else KONFIGURASI.ABILITY.MODFLY = false ChangeValue("[C] Modfly", false) ChangeValue("[C] Modfly", false) CONSOLE("Mod Fly `4deactivated") return true end return true end
if COMMAND == ("/np") then if not KONFIGURASI.ABILITY.NO_PICKUP then KONFIGURASI.TABLE.NO_PICKUP = {[0] = 1} KONFIGURASI.ABILITY.NO_PICKUP = true CONSOLE("No Pickup `2activated") else CONSOLE("No Pickup `4deactivated") KONFIGURASI.ABILITY.NO_PICKUP = false return true end return true end
if COMMAND == ("/nl") then if not KONFIGURASI.ABILITY.NO_LAG then AddHook("OnProcessTankUpdatePacket", "PREVENT-LAG", NO_LAG) KONFIGURASI.ABILITY.NO_LAG = true CONSOLE("No Lag `2activated") else RemoveHook("PREVENT-LAG") KONFIGURASI.ABILITY.NO_LAG = false CONSOLE("No Lag `4deactivated") end return true end

if COMMAND == ("/ac") then if not KONFIGURASI.ABILITY.AUTO_COLLECT then AddHook("OnProcessTankUpdatePacket", "AUTO_COLLECT", AUTO_COLLECT) KONFIGURASI.ABILITY.AUTO_COLLECT = true CONSOLE("Auto Collect `2activated") else RemoveHook("AUTO_COLLECT") KONFIGURASI.ABILITY.AUTO_COLLECT = false CONSOLE("Auto Collect `4deactivated") end return true end
if COMMAND == ("/fastdb") then if not KONFIGURASI.ABILITY.FAST_DBLOCK then KONFIGURASI.ABILITY.FAST_DBLOCK = true CONSOLE("Fast Display Block `2activated") return true else KONFIGURASI.ABILITY.FAST_DBLOCK = false CONSOLE("Fast Display Block `4deactivated") end return true end


return false end)

AddHook("OnVariant", "VARIANT-ABILITY", function(Var)
if KONFIGURASI.ABILITY.BLOCK_SDB then if Var[0] == "OnSDBroadcast" then if KONFIGURASI.OVERLAY.SDB_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wBlocked Super Duper Broadcast !") end CONSOLE("Blocked Super Duper Broadcast !") return true end end
if KONFIGURASI.ABILITY.ANTI_POCKET then if Var[0] == "OnTalkBubble" and (Var[2]:match("MWAHAHAHA!! FIRE FIRE FIRE") or Var[2]:find("The Owner of this world does not allow Pocket Lighters here"))  then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..Var[1].."|\nbuttonClicked|world_ban") BUBBLE("Banning "..GET_NAME_BY_NETID(Var[1]).. ", because he uses a Pocket Lighter") return true end end
if KONFIGURASI.ABILITY.PULL_GAS then if Var[0] == "OnTalkBubble" and (Var[2]:gsub("`.",""):lower():find("gas")) then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..Var[1].."|\nbuttonClicked|pull") BUBBLE("Pulling "..GET_NAME_BY_NETID(Var[1]).. ", because he said Gas") return true end end
if KONFIGURASI.ABILITY.ANTI_BUNNIES then if Var[0] == "OnTalkBubble" and Var[1] ~= GetLocal().netid and Var[2]:match("The Owner of this world does not allow Killer Bunnies here!") then CHAT("`w[`8WARNING`w] `wDetected Someone Using `4Killer Bunnies`w, Suspect : "..GET_NAME_BY_NETID(Var[1])) end end

if KONFIGURASI.ABILITY.FAST_DROP then 
if Var[0] == "OnDialogRequest" and Var[1]:find("How many to drop?") then 
local ITEM_ID = string.sub(Var[1], Var[1]:find("embed_data|item_drop|") + 21, Var[1]:find("end_dialog") - 2) ID = GET_ID(ITEM_ID)
if KONFIGURASI.ABILITY.FDFT_AMOUNT == 0 then local ITEM_AMOUNT = string.sub(Var[1], Var[1]:find("item_count||") + 12, Var[1]:find("|5|\n") - 1) 
DROP(ITEM_ID, ITEM_AMOUNT) if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..ITEM_AMOUNT.." "..GetItemInfo(math.floor(ID)).name) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..ITEM_AMOUNT.." "..GetItemInfo(math.floor(ID)).name) end table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..ITEM_AMOUNT.." "..GetItemInfo(math.floor(ID)).name.." `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|"..ID.."|"..ID.."|\n", DROP_ID = ID})
else DROP(ITEM_ID, KONFIGURASI.ABILITY.FDFT_AMOUNT) if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..KONFIGURASI.ABILITY.FDFT_AMOUNT.." "..GetItemInfo(math.floor(ID)).name) end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..KONFIGURASI.ABILITY.FDFT_AMOUNT.." "..GetItemInfo(math.floor(ID)).name) end table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {DROP = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `odropped `w"..KONFIGURASI.ABILITY.FDFT_AMOUNT.." "..GetItemInfo(math.floor(ID)).name.." `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|"..ID.."|"..ID.."|\n", DROP_ID = ID}) end
return true 
end 
end 

if KONFIGURASI.ABILITY.FAST_TRASH then 
if Var[0] == "OnDialogRequest" and Var[1]:find("How many to `4destroy") then 
local ITEM_ID = string.sub(Var[1], Var[1]:find("embed_data|item_trash|") + 22, Var[1]:find("end_dialog") - 2) ID = GET_ID(ITEM_ID)
if KONFIGURASI.ABILITY.FDFT_AMOUNT == 0 then local ITEM_AMOUNT = string.sub(Var[1], Var[1]:find("you have ") + 9, Var[1]:find("add_text_input|item_count||") - 9) 
TRASH(ITEM_ID, ITEM_AMOUNT) if KONFIGURASI.BUBBLE.TRASH_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wTrashed "..ITEM_AMOUNT.." "..GetItemInfo(math.floor(ID)).name) end if KONFIGURASI.OVERLAY.TRASH_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wTrashed "..ITEM_AMOUNT.." "..GetItemInfo(math.floor(ID)).name) end table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {TRASH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otrashed `w"..ITEM_AMOUNT.." "..GetItemInfo(math.floor(ID)).name.." `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|"..ID.."|"..ID.."|\n", TRASH_ID = ID}) 
else TRASH(ITEM_ID, KONFIGURASI.ABILITY.FDFT_AMOUNT) if KONFIGURASI.BUBBLE.TRASH_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wTrashed "..KONFIGURASI.ABILITY.FDFT_AMOUNT.." "..GetItemInfo(math.floor(ID)).name) end if KONFIGURASI.OVERLAY.TRASH_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wTrashed "..KONFIGURASI.ABILITY.FDFT_AMOUNT.." "..GetItemInfo(math.floor(ID)).name) end table.insert(KONFIGURASI.TABLE.ACTIVITY_LOG, {TRASH = "\nadd_label_with_icon_button|small|"..GetLocal().name.." `otrashed `w"..KONFIGURASI.ABILITY.FDFT_AMOUNT.." "..GetItemInfo(math.floor(ID)).name.." `oin `5"..GetWorld().name.." `oat "..os.date("%H:%M on %d/%m").."|left|"..ID.."|"..ID.."|\n", TRASH_ID = ID}) end 
return true 
end 
end

if KONFIGURASI.ABILITY.FAST_DBLOCK then
if Var[0] == "OnDialogRequest" and Var[1]:find("Edit Display Block") then DB_X = Var[1]:match("embed_data|x|(%d+)") DB_Y = Var[1]:match("embed_data|y|(%d+)")
SendPacket(2,"action|dialog_return\ndialog_name|displayblock_edit\nx|"..DB_X.."|\ny|"..DB_Y.."|\nbuttonClicked|get_display_item") 
return true end
end

if KONFIGURASI.ABILITY.BLOCK_ADVENTURE then
if Var[0] == "OnAddNotification" and Var[1]:find("interface/large/adventure.rttex") then BUBBLE("Blocked the Adventure Door!") return true end
end

if KONFIGURASI.ABILITY.BLOCK_EVENT then
if Var[0] == "OnAddNotification" then return true end
end

return false end)

AddHook("OnSendPacketRaw", "RAW-ABILITY", function(Pkt)

if KONFIGURASI.ABILITY.NO_PICKUP then if Pkt.type == 11 then for _, O in pairs(GetObjectList()) do if O.oid == Pkt.value and not KONFIGURASI.TABLE.NO_PICKUP[math.floor(O.id)] then return true elseif O.oid == Pkt.value and KONFIGURASI.TABLE.NO_PICKUP[math.floor(O.id)] then return true end end end end
if KONFIGURASI.ABILITY.SHOW_GEMS then if Pkt.type == 11 then for _, O in pairs(GetObjectList()) do if O.oid == Pkt.value and O.id == 112 then KONFIGURASI.ABILITY.GEMS = KONFIGURASI.ABILITY.GEMS + O.amount BUBBLE("`wCollected `5"..KONFIGURASI.ABILITY.GEMS.." `wGems (gems)") end end end end
if KONFIGURASI.ABILITY.SHOW_GEMS then if Pkt.type == 0 then for _, O in pairs(GetObjectList()) do if O.id == 112 and O.pos.x//32 == Pkt.px and O.pos.y//32 == Pkt.py then KONFIGURASI.ABILITY.GEMS = KONFIGURASI.ABILITY.GEMS + O.amount BUBBLE("`wCollected `5"..KONFIGURASI.ABILITY.GEMS.." `wGems (gems)") end end end end

return false end)
-- End of Ability Menu --

-- Cheat Menu --

local function APPLYING_CHEATS() local LOAD_STRING = "action|dialog_return\ndialog_name|cheats\n"
if KONFIGURASI.CHEAT.AUTO_FARM then LOAD_STRING = LOAD_STRING .. "check_autofarm|1\n" else LOAD_STRING = LOAD_STRING .. "check_autofarm|0\n" end
if KONFIGURASI.CHEAT.MODE_BFG then LOAD_STRING = LOAD_STRING .. "check_bfg|1\n" else LOAD_STRING = LOAD_STRING .. "check_bfg|0\n" end
if KONFIGURASI.CHEAT.AUTO_SPAM then LOAD_STRING = LOAD_STRING .. "check_autospam|1\n" else LOAD_STRING = LOAD_STRING .. "check_autospam|0\n" end
if KONFIGURASI.CHEAT.AUTO_PULL then LOAD_STRING = LOAD_STRING .. "check_autopull|1\n" else LOAD_STRING = LOAD_STRING .. "check_autopull|0\n" end
if KONFIGURASI.CHEAT.AUTO_PLANT then LOAD_STRING = LOAD_STRING .. "check_autoplace|1\n" else LOAD_STRING = LOAD_STRING .. "check_autoplace|0\n" end
if KONFIGURASI.CHEAT.ANTI_BOUNCE then LOAD_STRING = LOAD_STRING .. "check_antibounce|1\n" else LOAD_STRING = LOAD_STRING .. "check_antibounce|0\n" end
if KONFIGURASI.CHEAT.MOD_FLY then LOAD_STRING = LOAD_STRING .. "check_modfly|1\n" else LOAD_STRING = LOAD_STRING .. "check_modfly|0\n" end
if KONFIGURASI.CHEAT.SUPER_SPEED then LOAD_STRING = LOAD_STRING .. "check_speed|1\n" else LOAD_STRING = LOAD_STRING .. "check_speed|0\n" end
if KONFIGURASI.CHEAT.GRAVITY then LOAD_STRING = LOAD_STRING .. "check_gravity|1\n" else LOAD_STRING = LOAD_STRING .. "check_gravity|0\n" end
if KONFIGURASI.CHEAT.BE_ALONE then LOAD_STRING = LOAD_STRING .. "check_lonely|1\n" else LOAD_STRING = LOAD_STRING .. "check_lonely|0\n" end
if KONFIGURASI.CHEAT.FAST_DROP then LOAD_STRING = LOAD_STRING .. "check_fastdrop|1\n" else LOAD_STRING = LOAD_STRING .. "check_fastdrop|0\n" end
if KONFIGURASI.CHEAT.DONT_DROP_GEMS then LOAD_STRING = LOAD_STRING .. "check_gems|1\n" else LOAD_STRING = LOAD_STRING .. "check_gems|0\n" end
if KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP then LOAD_STRING = LOAD_STRING .. "check_ignoreo|1\n" else LOAD_STRING = LOAD_STRING .. "check_ignoreo|0\n" end
if KONFIGURASI.CHEAT.IGNORE_OTHERs_COMPLETE then LOAD_STRING = LOAD_STRING .. "check_ignoref|1\n" else LOAD_STRING = LOAD_STRING .. "check_ignoref|0\n" end
SendPacket(2, LOAD_STRING) end

function DIALOG_CHEAT_MENU() SendVariantList({[0] = "OnDialogRequest", [1] = [[
set_default_color|`]]..KONFIGURASI.UI.PRIMARY..[[|
add_label_with_icon|big|Cheats Menu|left|6082|
add_spacer|small|
add_smalltext|Automation :|
text_scaling_string|textscalingstring|
add_checkicon|check_autofarm|Auto Farm|]]..FRAME(KONFIGURASI.CHEAT.AUTO_FARM)..[[|18||]]..CHECKBOX(KONFIGURASI.CHEAT.AUTO_FARM)..[[|
add_checkicon|check_bfg|Mode BFG|]]..FRAME(KONFIGURASI.CHEAT.MODE_BFG)..[[|5640||]]..CHECKBOX(KONFIGURASI.CHEAT.MODE_BFG)..[[|
add_checkicon|check_autospam|Auto Spam|]]..FRAME(KONFIGURASI.CHEAT.AUTO_SPAM)..[[|]]..GetItemInfo("Spammer Slave").id..[[||]]..CHECKBOX(KONFIGURASI.CHEAT.AUTO_SPAM)..[[|
add_checkicon|check_autopull|Auto Pull|]]..FRAME(KONFIGURASI.CHEAT.AUTO_PULL)..[[|32||]]..CHECKBOX(KONFIGURASI.CHEAT.AUTO_PULL)..[[|
add_checkicon|check_autoplace|Auto Plant|]]..FRAME(KONFIGURASI.CHEAT.AUTO_PLANT)..[[|5022||]]..CHECKBOX(KONFIGURASI.CHEAT.AUTO_PLANT)..[[|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_smalltext|Ability :|
add_checkicon|check_antibounce|Anti Bounce|]]..FRAME(KONFIGURASI.CHEAT.ANTI_BOUNCE)..[[|526||]]..CHECKBOX(KONFIGURASI.CHEAT.ANTI_BOUNCE)..[[|
add_checkicon|check_modfly|Mod Fly|]]..FRAME(KONFIGURASI.CHEAT.MOD_FLY)..[[|7502||]]..CHECKBOX(KONFIGURASI.CHEAT.MOD_FLY)..[[|
add_checkicon|check_speed|Super Speed|]]..FRAME(KONFIGURASI.CHEAT.SUPER_SPEED)..[[|4988||]]..CHECKBOX(KONFIGURASI.CHEAT.SUPER_SPEED)..[[|
add_checkicon|check_gravity|Gravity|]]..FRAME(KONFIGURASI.CHEAT.GRAVITY)..[[|4992||]]..CHECKBOX(KONFIGURASI.CHEAT.GRAVITY)..[[|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_smalltext|Miscellaneous :|
add_checkicon|check_lonely|Be Alone|]]..FRAME(KONFIGURASI.CHEAT.BE_ALONE)..[[|22||]]..CHECKBOX(KONFIGURASI.CHEAT.BE_ALONE)..[[|
add_checkicon|check_fastdrop|Fast Drop|]]..FRAME(KONFIGURASI.CHEAT.FAST_DROP)..[[|13810||]]..CHECKBOX(KONFIGURASI.CHEAT.FAST_DROP)..[[|
add_checkicon|check_gems|Don't Drop Gems|]]..FRAME(KONFIGURASI.CHEAT.DONT_DROP_GEMS)..[[|]]..GetItemInfo("Pile of Gems Icon").id..[[||]]..CHECKBOX(KONFIGURASI.CHEAT.DONT_DROP_GEMS)..[[|
add_checkicon|check_ignoreo|Ignore Drops|]]..FRAME(KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP)..[[|4758||]]..CHECKBOX(KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP)..[[|
add_checkicon|check_ignoref|Ignore Complete|]]..FRAME(KONFIGURASI.CHEAT.IGNORE_OTHERS_COMPLETE)..[[|774||]]..CHECKBOX(KONFIGURASI.CHEAT.IGNORE_OTHERS_COMPLETE)..[[|
add_button_with_icon||END_LIST||0||
add_spacer|small|
add_smalltext|This `bCheats Menu`]]..KONFIGURASI.UI.PRIMARY..[[ only exists on `5Starries Helper`]]..KONFIGURASI.UI.PRIMARY..[[.|
add_quick_exit|
end_dialog|cheats| Nevermind. | Apply Cheats! |]]})
end

local function HANDLER_CHEAT_MENU(C, V)
if KONFIGURASI.CHEAT[C] ~= nil then KONFIGURASI.CHEAT[C] = V
if V then APPLYING_CHEATS() else SendPacket(2, string.format("action|dialog_return\ndialog_name|cheats\n%s|0", C)) end
end
end

AddHook("OnSendPacket", "PACKET-CHEAT-MENU", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/cmenu") then CHECKING_STATUS_CHEAT = true return true end
if COMMAND == ("/gacha") then if not GACHA_SUMMER then GACHA_SUMMER = true else GACHA_SUMMER = false end return true end

if TOGGLE:find("check_autofarm|1") and not KONFIGURASI.CHEAT.AUTO_FARM then KONFIGURASI.CHEAT.AUTO_FARM = true elseif TOGGLE:find("check_autofarm|0") and KONFIGURASI.CHEAT.AUTO_FARM then KONFIGURASI.CHEAT.AUTO_FARM = false end
if TOGGLE:find("check_bfg|1") and not KONFIGURASI.CHEAT.MODE_BFG then KONFIGURASI.CHEAT.MODE_BFG = true elseif TOGGLE:find("check_bfg|0") and KONFIGURASI.CHEAT.MODE_BFG then KONFIGURASI.CHEAT.MODE_BFG = false end
if TOGGLE:find("check_autospam|1") and not KONFIGURASI.CHEAT.AUTO_SPAM then KONFIGURASI.CHEAT.AUTO_SPAM = true elseif TOGGLE:find("check_autospam|0") and KONFIGURASI.CHEAT.AUTO_SPAM then KONFIGURASI.CHEAT.AUTO_SPAM = false end
if TOGGLE:find("check_autopull|1") and not KONFIGURASI.CHEAT.AUTO_PULL then KONFIGURASI.CHEAT.AUTO_PULL = true elseif TOGGLE:find("check_autopull|0") and KONFIGURASI.CHEAT.AUTO_PULL then KONFIGURASI.CHEAT.AUTO_PULL = false end
if TOGGLE:find("check_autoplace|1") and not KONFIGURASI.CHEAT.AUTO_PLANT then KONFIGURASI.CHEAT.AUTO_PLANT = true elseif TOGGLE:find("check_autoplace|0") and KONFIGURASI.CHEAT.AUTO_PLANT then KONFIGURASI.CHEAT.AUTO_PLANT = false end

if TOGGLE:find("check_antibounce|1") and not KONFIGURASI.CHEAT.ANTI_BOUNCE then KONFIGURASI.CHEAT.ANTI_BOUNCE = true elseif TOGGLE:find("check_antibounce|0") and KONFIGURASI.CHEAT.ANTI_BOUNCE then KONFIGURASI.CHEAT.ANTI_BOUNCE = false end
if TOGGLE:find("check_modfly|1") and not KONFIGURASI.CHEAT.MOD_FLY then KONFIGURASI.CHEAT.MOD_FLY = true elseif TOGGLE:find("check_modfly|0") and KONFIGURASI.CHEAT.MOD_FLY then KONFIGURASI.CHEAT.MOD_FLY = false end
if TOGGLE:find("check_speed|1") and not KONFIGURASI.CHEAT.SUPER_SPEED then KONFIGURASI.CHEAT.SUPER_SPEED = true elseif TOGGLE:find("check_speed|0") and KONFIGURASI.CHEAT.SUPER_SPEED then KONFIGURASI.CHEAT.SUPER_SPEED = false end
if TOGGLE:find("check_gravity|1") and not KONFIGURASI.CHEAT.GRAVITY then KONFIGURASI.CHEAT.GRAVITY = true elseif TOGGLE:find("check_gravity|0") and KONFIGURASI.CHEAT.GRAVITY then KONFIGURASI.CHEAT.GRAVITY = false end

if TOGGLE:find("check_lonely|1") and not KONFIGURASI.CHEAT.BE_ALONE then KONFIGURASI.CHEAT.BE_ALONE = true elseif TOGGLE:find("check_lonely|0") and KONFIGURASI.CHEAT.BE_ALONE then KONFIGURASI.CHEAT.BE_ALONE = false end
if TOGGLE:find("check_fastdrop|1") and not KONFIGURASI.CHEAT.FAST_DROP then KONFIGURASI.CHEAT.FAST_DROP = true elseif TOGGLE:find("check_fastdrop|0") and KONFIGURASI.CHEAT.FAST_DROP then KONFIGURASI.CHEAT.FAST_DROP = false end
if TOGGLE:find("check_gems|1") and not KONFIGURASI.CHEAT.DONT_DROP_GEMS then KONFIGURASI.CHEAT.DONT_DROP_GEMS = true elseif TOGGLE:find("check_gems|0") and KONFIGURASI.CHEAT.DONT_DROP_GEMS then KONFIGURASI.CHEAT.DONT_DROP_GEMS = false end
if TOGGLE:find("check_ignoreo|1") and not KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP then KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP = true elseif TOGGLE:find("check_ignoreo|0") and KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP then KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP = false end
if TOGGLE:find("check_ignoref|1") and not KONFIGURASI.CHEAT.IGNORE_OTHERS_COMPLETE then KONFIGURASI.CHEAT.IGNORE_OTHERS_COMPLETE = true elseif TOGGLE:find("check_ignoref|0") and KONFIGURASI.CHEAT.IGNORE_OTHERS_COMPLETE then KONFIGURASI.CHEAT.IGNORE_OTHERS_COMPLETE = false end

return false end)

AddHook("OnVariant", "VARIANT-CHEAT-MENU", function(Var)
if CHECKING_STATUS_CHEAT then
if Var[0] == "OnDialogRequest" and Var[1]:find("add_label_with_icon|big|`bCreative Cheat Menu````|left|11186|") then STATUS = {AUTO_FARM, MODE_BFG, AUTO_SPAM, AUTO_PULL, AUTO_PLANT}
STATUS.AUTO_FARM = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_autofarm|") + 96, Var[1]:find("add_checkbox|check_bfg|") - 3)) if STATUS.AUTO_FARM == 0 then KONFIGURASI.CHEAT.AUTO_FARM = false elseif STATUS.AUTO_FARM == 1 then KONFIGURASI.CHEAT.AUTO_FARM = true end
STATUS.MODE_BFG = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_bfg|") + 79, Var[1]:find("add_checkbox|check_autospam|") - 3)) if STATUS.MODE_BFG == 0 then KONFIGURASI.CHEAT.MODE_BFG = false elseif STATUS.MODE_BFG == 1 then KONFIGURASI.CHEAT.MODE_BFG = true end
STATUS.AUTO_SPAM = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_autospam|") + 73, Var[1]:find("add_checkbox|check_autopull|") - 3)) if STATUS.AUTO_SPAM == 0 then KONFIGURASI.CHEAT.AUTO_SPAM = false elseif STATUS.AUTO_SPAM == 1 then KONFIGURASI.CHEAT.AUTO_SPAM = true end
STATUS.AUTO_PULL = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_autopull|") + 80, Var[1]:find("add_checkbox|check_autoplace|") - 3)) if STATUS.AUTO_PULL == 0 then KONFIGURASI.CHEAT.AUTO_PULL = false elseif STATUS.AUTO_PULL == 1 then KONFIGURASI.CHEAT.AUTO_PULL = true end
STATUS.AUTO_PLANT = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_autoplace|") + 85, Var[1]:find("add_spacer|small|\nadd_smalltext|`!Ability:``|") - 3)) if STATUS.AUTO_PLANT == 0 then KONFIGURASI.CHEAT.AUTO_PLANT = false elseif STATUS.AUTO_PLANT == 1 then KONFIGURASI.CHEAT.AUTO_PLANT = true end

STATUS.ANTI_BOUNCE = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_antibounce|") + 41, Var[1]:find("add_checkbox|check_modfly|") - 3)) if STATUS.ANTI_BOUNCE == 0 then KONFIGURASI.CHEAT.ANTI_BOUNCE = false elseif STATUS.ANTI_BOUNCE == 1 then KONFIGURASI.CHEAT.ANTI_BOUNCE = true end
STATUS.MOD_FLY = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_modfly|") + 34, Var[1]:find("add_checkbox|check_speed|") - 3)) if STATUS.MOD_FLY == 0 then KONFIGURASI.CHEAT.MOD_FLY = false elseif STATUS.MOD_FLY == 1 then KONFIGURASI.CHEAT.MOD_FLY = true end
STATUS.SUPER_SPEED = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_speed|") + 37, Var[1]:find("add_checkbox|check_gravity|") - 3)) if STATUS.SUPER_SPEED == 0 then KONFIGURASI.CHEAT.SUPER_SPEED = false elseif STATUS.SUPER_SPEED == 1 then KONFIGURASI.CHEAT.SUPER_SPEED = true end
STATUS.GRAVITY = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_gravity|") + 35, Var[1]:find("add_spacer|small|\nadd_smalltext|`!Misc:``|") - 3)) if STATUS.GRAVITY == 0 then KONFIGURASI.CHEAT.GRAVITY = false elseif STATUS.GRAVITY == 1 then KONFIGURASI.CHEAT.GRAVITY = true end

STATUS.BE_ALONE = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_lonely|") + 76, Var[1]:find("add_checkbox|check_fastdrop|") - 3)) if STATUS.BE_ALONE == 0 then KONFIGURASI.CHEAT.BE_ALONE = false elseif STATUS.BE_ALONE == 1 then KONFIGURASI.CHEAT.BE_ALONE = true end
STATUS.FAST_DROP = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_fastdrop|") + 61, Var[1]:find("add_checkbox|check_gems|") - 3)) if STATUS.FAST_DROP == 0 then KONFIGURASI.CHEAT.FAST_DROP = false elseif STATUS.FAST_DROP == 1 then KONFIGURASI.CHEAT.FAST_DROP = true end
STATUS.DONT_DROP_GEMS = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_gems|") + 62, Var[1]:find("add_checkbox|check_ignoreo|") - 3)) if STATUS.DONT_DROP_GEMS == 0 then KONFIGURASI.CHEAT.DONT_DROP_GEMS = false elseif STATUS.DONT_DROP_GEMS == 1 then KONFIGURASI.CHEAT.DONT_DROP_GEMS = true end
STATUS.IGNORE_OTHERS_DROP = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_ignoreo|") + 46, Var[1]:find("add_checkbox|check_ignoref|") - 3)) if STATUS.IGNORE_OTHERS_DROP == 0 then KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP = false elseif STATUS.IGNORE_OTHERS_DROP == 1 then KONFIGURASI.CHEAT.IGNORE_OTHERS_DROP = true end
STATUS.IGNORE_OTHERS_COMPLETE = tonumber(string.sub(Var[1], Var[1]:find("add_checkbox|check_ignoref|") + 52, Var[1]:find("add_smalltext|This `bCheat Menu`` only exists on `$creativeps.eu`` and was invented `#FIRST`` by CreativePS!|") - 3)) if STATUS.IGNORE_OTHERS_COMPLETE == 0 then KONFIGURASI.CHEAT.IGNORE_OTHERS_COMPLETE = false elseif STATUS.IGNORE_OTHERS_COMPLETE == 1 then KONFIGURASI.CHEAT.IGNORE_OTHERS_COMPLETE = true end

DIALOG_CHEAT_MENU() CHECKING_STATUS_CHEAT = false return true end
end

return false end)
-- End of Cheat Menu --

-- Moderator Menu --
AddHook("OnSendPacket", "PACKET-MODERATOR", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()

if COMMAND == ("/wt") and ARGS[2] then local ARGUMENTS = ARGS[2]:lower() CHAT("/warpto "..ARGUMENTS) return true elseif COMMAND == ("/wt") and not ARGS[2] then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oRun the exact command!") return true end	

return false end)
-- End of Moderator Menu --

AddHook("OnVariant", "SKIP_TELE", function(Var) if Var[0] == "OnDialogRequest" and Var[1]:find("Wow, that's fast delivery.") then return true end end)
AddHook("OnVariant", "DROP_ALL", function(Var) if DROPALL_APPROVE then if Var[0] == "OnTextOverlay" and Var[1]:find("You can't drop that here") then DROPALL_APPROVE = false BUBBLE(Var[1]) return true end if Var[0] == "OnTextOverlay" and Var[1]:find("You'd be sorry") then return true end end end)

AddHook("OnSendPacketRaw", "RAW-A", function(Pkt)
if PUNCH_CONFIG and (Pkt.type == 3 and Pkt.value == 18) then
for _, Tile in pairs(GetTiles()) do 
if Tile.fg == 1422 or Tile.fg == 2488 then if Tile.x == Pkt.px and Tile.y == Pkt.py then if DISPLAY_LEFT and not DISPLAY_RIGHT then KONFIGURASI.BTK.POSX1 = math.floor(Pkt.px) KONFIGURASI.BTK.POSY1 = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oPlayer 1 position saved! `w[`5" ..KONFIGURASI.BTK.POSX1.. "`w,`5" ..KONFIGURASI.BTK.POSY1.."`w]") BUBBLE("Next, punch display box on the right side for player 2 position") DISPLAY_LEFT = false DISPLAY_RIGHT = true elseif DISPLAY_RIGHT and not DISPLAY_LEFT then KONFIGURASI.BTK.POSX2 = math.floor(Pkt.px) KONFIGURASI.BTK.POSY2 = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oPlayer 2 position saved! `w[`5" ..KONFIGURASI.BTK.POSX2.. "`w,`5" ..KONFIGURASI.BTK.POSY2.."`w]") DISPLAY_RIGHT = false PUNCH_CONFIG = false BUBBLE("Successfully set the bet position") if FPOS then HOSTER_CONFIG = true BUBBLE("Furthermore, punch the block to set hoster position") end end end end
if Tile.fg == 1452 or Tile.fg == 10784 then if Tile.x == Pkt.px and Tile.y == Pkt.py then if DONATION_BOX and not DISPLAY_LEFT and not DISPLAY_RIGHT and not HOSTER_CONFIG then KONFIGURASI.BTK.POSTX = math.floor(Pkt.px) KONFIGURASI.BTK.POSTY = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oDonation box position saved! `w[`5" ..KONFIGURASI.BTK.POSTX.. "`w,`5" ..KONFIGURASI.BTK.POSTY.."`w]") DONATION_BOX = false PUNCH_CONFIG = false end end end

if Tile.fg == 5638 then if Tile.x == Pkt.px and Tile.y == Pkt.py then if CONFIG_ITEM_FINDER_MAGPLANT and not CONFIG_ITEM_FINDER_VENDING and not DONATION_BOX and not DISPLAY_LEFT and not DISPLAY_RIGHT then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X = math.floor(Pkt.px) KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_Y = math.floor(Pkt.py) CONSOLE("Magplant position saved! `w[`5" ..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_X.. "`w,`5" ..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.MAGPLANT.POS_Y.."`w]") CONFIG_ITEM_FINDER_MAGPLANT = false PUNCH_CONFIG = false DIALOG_ITEM_FINDER() end end end
if Tile.fg == 9268 or Tile.fg == 2978 then if Tile.x == Pkt.px and Tile.y == Pkt.py then if CONFIG_ITEM_FINDER_VENDING and not CONFIG_ITEM_FINDER_MAGPLANT and not DONATION_BOX and not DISPLAY_LEFT and not DISPLAY_RIGHT then KONFIGURASI.SERVICE_MENU.ITEM_FINDER.VENDING.POS_X = math.floor(Pkt.px) KONFIGURASI.SERVICE_MENU.ITEM_FINDER.VENDING.POS_Y = math.floor(Pkt.py) CONSOLE("Vending position saved! `w[`5" ..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.VENDING.POS_X.. "`w,`5" ..KONFIGURASI.SERVICE_MENU.ITEM_FINDER.VENDING.POS_Y.."`w]") CONFIG_ITEM_FINDER_VENDING = false PUNCH_CONFIG = false DIALOG_ITEM_FINDER() end end end

if Tile.fg == 5638 then if Tile.x == Pkt.px and Tile.y == Pkt.py then if CONFIG_MAGPLANT and not CONFIG_ITEM_FINDER_MAGPLANT and not CONFIG_ITEM_FINDER_VENDING and not DONATION_BOX and not DISPLAY_LEFT and not DISPLAY_RIGHT then KONFIGURASI.LIST_MENU.MAGPLANT.POS_X = math.floor(Pkt.px) KONFIGURASI.LIST_MENU.MAGPLANT.POS_Y = math.floor(Pkt.py) CONSOLE("Magplant position saved! `w[`5" ..KONFIGURASI.LIST_MENU.MAGPLANT.POS_X.. "`w,`5" ..KONFIGURASI.LIST_MENU.MAGPLANT.POS_Y.."`w]") CONFIG_MAGPLANT = false PUNCH_CONFIG = false DIALOG_MAGPLANT() end end end
if Tile.fg == 9268 or Tile.fg == 2978 then if Tile.x == Pkt.px and Tile.y == Pkt.py then if CONFIG_VENDING and not CONFIG_MAGPLANT and not CONFIG_ITEM_FINDER_MAGPLANT and not CONFIG_ITEM_FINDER_VENDING and not DONATION_BOX and not DISPLAY_LEFT and not DISPLAY_RIGHT then KONFIGURASI.LIST_MENU.VENDING.POS_X = math.floor(Pkt.px) KONFIGURASI.LIST_MENU.VENDING.POS_Y = math.floor(Pkt.py) CONSOLE("Vending position saved! `w[`5" ..KONFIGURASI.LIST_MENU.VENDING.POS_X.. "`w,`5" ..KONFIGURASI.LIST_MENU.VENDING.POS_Y.."`w]") CONFIG_VENDING = false PUNCH_CONFIG = false DIALOG_VENDING() end end end

end return true
end

if HOSTER_CONFIG and (Pkt.type == 3 and Pkt.value == 18) then
for _, Tile in pairs(GetTiles()) do 
if Tile.x == Pkt.px and Tile.y == Pkt.py then if HOSTER_CONFIG and not DISPLAY_LEFT and not DISPLAY_RIGHT and not DONATION_BOX then KONFIGURASI.BTK.HOSTX = math.floor(Pkt.px) KONFIGURASI.BTK.HOSTY = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oHoster position saved! `w[`5" ..KONFIGURASI.BTK.HOSTX.. "`w,`5" ..KONFIGURASI.BTK.HOSTY.."`w]") HOSTER_CONFIG = false if FPOS then FPOS = false DIALOG_POS_CHAND_MODE() end end end
end return true
end

if PLACE_CONFIG and (Pkt.type == 3 and (Pkt.value == 18 or Pkt.value == 340 or Pkt.value == 5640)) then
for _, Tile in pairs(GetTiles()) do
if Tile.x == Pkt.px and Tile.y == Pkt.py then
if KONFIGURASI.BTK.HORIZONTAL then KONFIGURASI.BTK.VERTICAL = false if CHAND_LEFT and not CHAND_RIGHT then KONFIGURASI.BTK.POSCHAND.LEFT.X1 = math.floor(Pkt.px) KONFIGURASI.BTK.POSCHAND.LEFT.Y1 = math.floor(Pkt.py) KONFIGURASI.BTK.POSCHAND.LEFT.X2 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 + 1 KONFIGURASI.BTK.POSCHAND.LEFT.X3 = KONFIGURASI.BTK.POSCHAND.LEFT.X1 - 1 BTK_TILES = {POS1 = {{x = KONFIGURASI.BTK.POSCHAND.LEFT.X2, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X3, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}}, POS2 = {{x = KONFIGURASI.BTK.POSCHAND.RIGHT.X2, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X3, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}},} CHAND_LEFT = false CHAND_RIGHT = true CONSOLE("`w[`6POS`w] `oChand position saved! [ `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.X2.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.Y1.. " `oI `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.X1.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.Y1.. " `oI `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.X3.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.Y1.." `o]") elseif CHAND_RIGHT and not CHAND_LEFT then KONFIGURASI.BTK.POSCHAND.RIGHT.X1 = math.floor(Pkt.px) KONFIGURASI.BTK.POSCHAND.RIGHT.Y1 = math.floor(Pkt.py) KONFIGURASI.BTK.POSCHAND.RIGHT.X2 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 + 1 KONFIGURASI.BTK.POSCHAND.RIGHT.X3 = KONFIGURASI.BTK.POSCHAND.RIGHT.X1 - 1 BTK_TILES = {POS1 = {{x = KONFIGURASI.BTK.POSCHAND.LEFT.X2, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X3, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}}, POS2 = {{x = KONFIGURASI.BTK.POSCHAND.RIGHT.X2, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X3, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}},} CHAND_RIGHT = false PLACE_CONFIG = false CONSOLE("`w[`6POS`w] `oChand position saved! [ `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.X2.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.Y1.. " `oI `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.X1.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.Y1.. " `oI `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.X3.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.Y1.." `o]") BUBBLE("Succesfully setting chand position!") end end
if KONFIGURASI.BTK.VERTICAL then KONFIGURASI.BTK.HORIZONTAL = false if CHAND_LEFT and not CHAND_RIGHT then KONFIGURASI.BTK.POSCHAND.LEFT.X1 = math.floor(Pkt.px) KONFIGURASI.BTK.POSCHAND.LEFT.Y1 = math.floor(Pkt.py) KONFIGURASI.BTK.POSCHAND.LEFT.Y2 = KONFIGURASI.BTK.POSCHAND.LEFT.Y1 - 1 KONFIGURASI.BTK.POSCHAND.LEFT.Y3 = KONFIGURASI.BTK.POSCHAND.LEFT.Y1 - 2 BTK_TILES = {POS1 = {{x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y2}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y3}}, POS2 = {{x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y2}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y3}},} CHAND_LEFT = false CHAND_RIGHT = true CONSOLE("`w[`6POS`w] `oChand position saved! [ `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.X1.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.Y1.. " `oI `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.X1.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.Y2.. " `oI `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.X1.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.LEFT.Y3.." `o]") elseif CHAND_RIGHT and not CHAND_LEFT then KONFIGURASI.BTK.POSCHAND.RIGHT.X1 = math.floor(Pkt.px) KONFIGURASI.BTK.POSCHAND.RIGHT.Y1 = math.floor(Pkt.py) KONFIGURASI.BTK.POSCHAND.RIGHT.Y2 = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1 - 1 KONFIGURASI.BTK.POSCHAND.RIGHT.Y3 = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1 - 2 BTK_TILES = {POS1 = {{x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y2}, {x = KONFIGURASI.BTK.POSCHAND.LEFT.X1, y = KONFIGURASI.BTK.POSCHAND.LEFT.Y3}}, POS2 = {{x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y1}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y2}, {x = KONFIGURASI.BTK.POSCHAND.RIGHT.X1, y = KONFIGURASI.BTK.POSCHAND.RIGHT.Y3}},} CHAND_RIGHT = false PLACE_CONFIG = false CONSOLE("`w[`6POS`w] `oChand position saved! [ `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.X1.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.Y1.. " `oI `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.X1.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.Y2.. " `oI `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.X1.. "`o, `5" ..KONFIGURASI.BTK.POSCHAND.RIGHT.Y3.." `o]") BUBBLE("Succesfully setting chand position!") end end
end
end
end

if SETUP_REME and (Pkt.type == 3 and Pkt.value == 18) then
for _, Tile in pairs(GetTiles()) do 
if Tile.fg == 1422 or Tile.fg == 2488 then if Tile.x == Pkt.px and Tile.y == Pkt.py then if DISPLAY_1 then KONFIGURASI.REME.POS_BET.DISPLAY_1.POSX = math.floor(Pkt.px) KONFIGURASI.REME.POS_BET.DISPLAY_1.POSY = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oBet position saved! `w[`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_1.POSX.. "`w,`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_1.POSY.."`w]") BUBBLE("Next, punch another display box") DISPLAY_1 = false DISPLAY_2 = true elseif DISPLAY_2 then KONFIGURASI.REME.POS_BET.DISPLAY_2.POSX = math.floor(Pkt.px) KONFIGURASI.REME.POS_BET.DISPLAY_2.POSY = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oBet position saved! `w[`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_2.POSX.. "`w,`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_2.POSY.."`w]") BUBBLE("Next, punch another display box") DISPLAY_2 = false DISPLAY_3 = true elseif DISPLAY_3 then KONFIGURASI.REME.POS_BET.DISPLAY_3.POSX = math.floor(Pkt.px) KONFIGURASI.REME.POS_BET.DISPLAY_3.POSY = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oBet position saved! `w[`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_3.POSX.. "`w,`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_3.POSY.."`w]") BUBBLE("Next, punch another display box") DISPLAY_3 = false DISPLAY_4 = true elseif DISPLAY_4 then KONFIGURASI.REME.POS_BET.DISPLAY_4.POSX = math.floor(Pkt.px) KONFIGURASI.REME.POS_BET.DISPLAY_4.POSY = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oBet position saved! `w[`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_4.POSX.. "`w,`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_4.POSY.."`w]") BUBBLE("Next, punch another display box") DISPLAY_4 = false DISPLAY_5 = true elseif DISPLAY_5 then KONFIGURASI.REME.POS_BET.DISPLAY_5.POSX = math.floor(Pkt.px) KONFIGURASI.REME.POS_BET.DISPLAY_5.POSY = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oBet position saved! `w[`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_5.POSX.. "`w,`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_5.POSY.."`w]") BUBBLE("Next, punch another display box") DISPLAY_5 = false DISPLAY_6 = true elseif DISPLAY_6 then KONFIGURASI.REME.POS_BET.DISPLAY_6.POSX = math.floor(Pkt.px) KONFIGURASI.REME.POS_BET.DISPLAY_6.POSY = math.floor(Pkt.py) CONSOLE("`w[`6POS`w] `oBet position saved! `w[`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_6.POSX.. "`w,`5" ..KONFIGURASI.REME.POS_BET.DISPLAY_6.POSY.."`w]") BUBBLE("6 display boxes are the maximum limit!") DISPLAY_6 = false SETUP_REME = false end end end
end return true
end

return false end)

CONSOLE(CUSTOM_TEXT.START.B) Sleep(50) CONSOLE(CUSTOM_TEXT.START.C.." `w"..GET_BALANCE()) Sleep(50) CONSOLE(CUSTOM_TEXT.START.D) Sleep(50) CHAT(CUSTOM_TEXT.START.E)

--if CHECKING_WORLD then Sleep(100) if GetWorld().name:find("JUDI") or GetWorld().name:find("CSN") or GetWorld().name == "ZEUS" or GetWorld().name == "ACC" or GetWorld().name:find("REME") or GetWorld().name:find("BTK") or GetWorld().name:find("TTT") then CHAT("`wGood luck sir, hope you win a lot!") end if GetWorld().name:find("BFG") then CHAT("`wHappy bfg! Don't forget to use `^Don't Drop Gems`w!") end CHECKING_WORLD = false end

while true do Sleep(200) if INAPPRORIATE then break end

if FIND_MOONCAKE then Sleep(250) FINDER(GetItemInfo("Longevity Mooncake").id) Sleep(100) FINDER(GetItemInfo("Prosperity Mooncake").id) Sleep(100) FINDER(GetItemInfo("Balance Mooncake").id) Sleep(250) FIND_MOONCAKE = false end
if DROP_MOONCAKE then Sleep(250) DROP(GetItemInfo("Longevity Mooncake").id, GET_AMOUNT(GetItemInfo("Longevity Mooncake").id)) Sleep(100) DROP(GetItemInfo("Prosperity Mooncake").id, GET_AMOUNT(GetItemInfo("Prosperity Mooncake").id)) Sleep(100) DROP(GetItemInfo("Balance Mooncake").id, GET_AMOUNT(GetItemInfo("Balance Mooncake").id)) Sleep(100) DROP_MOONCAKE = false end

if KONFIGURASI.AUTO_SPAM.TOGGLE and not CDROP then Sleep(250) SPAMMING() if not CDROP then Sleep(KONFIGURASI.AUTO_SPAM.DELAY) end end
if CDROP then Sleep(250) CUSTOM_DROP() DROP_AMOUNT = 0 CDROP = false end

if TB then Sleep(250) TAKE_BET() TB = false end
if SCAN then Sleep(250) SCAN_GEMS() SCAN = false end
if TG then Sleep(250) TAKE_GEMS() TG = false if KONFIGURASI.BTK.OPTIONAL.TG_WIN then if KONFIGURASI.BTK.WINNER > 0 then SET_WINNER(KONFIGURASI.BTK.WINNER) NO_WINNER = false else CONSOLE("There's no winner, the game ends in a draw!") NO_WINNER = true end end if KONFIGURASI.BTK.OPTIONAL.AUTO_PAY and not NO_WINNER then if KONFIGURASI.BTK.POSTX == 0 or KONFIGURASI.BTK.POSTX == nil then CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou haven't configured the tax position, please run the command `"..KONFIGURASI.UI.SECONDARY.."/postax") else PAY_TAX = true end end if KONFIGURASI.BTK.OPTIONAL.AUTO_SB then Sleep(800) CHAT("/sb "..KONFIGURASI.SERVICE_MENU.BROADCAST.TEXT) end end
if AUTO_TAX then Sleep(250) CUSTOM_DROP() AUTO_TAX = false DROP_AMOUNT = 0 end
if RESCHAND_HORIZONTAL and KONFIGURASI.BTK.HORIZONTAL then Sleep(250) BUBBLE("Do not move while placing chand") ChangeValue("[C] Modfly", true) Sleep(250) FindPath(KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y1) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y1) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.LEFT.X2, KONFIGURASI.BTK.POSCHAND.LEFT.Y1) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.LEFT.X3, KONFIGURASI.BTK.POSCHAND.LEFT.Y1) Sleep(150) COLLECT_GEMS_LEFT() Sleep(150) FindPath(KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.RIGHT.X2, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.RIGHT.X3, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1) Sleep(150) COLLECT_GEMS_RIGHT() FindPath(KONFIGURASI.BTK.HOSTX, KONFIGURASI.BTK.HOSTY) ChangeValue("[C] Modfly", false) RESCHAND_HORIZONTAL = false if not PC then if KONFIGURASI.BUBBLE.BTK_BUBBLE then CHAT(CUSTOM_TEXT.BUBBLE.BTK.DROP_WINNER) end end BUBBLE("Placing chand with "..KONFIGURASI.BTK.PUT_MODE:lower().." `2successful") PC = false end
if RESCHAND_VERTICAL and KONFIGURASI.BTK.VERTICAL then Sleep(250) BUBBLE("Do not move while placing chand") ChangeValue("[C] Modfly", true) Sleep(250) FindPath(KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y2) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y1) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y2) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.LEFT.X1, KONFIGURASI.BTK.POSCHAND.LEFT.Y3) Sleep(150) COLLECT_GEMS_LEFT() Sleep(150) FindPath(KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y2) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y1) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y2) Sleep(150) PLACE(KONFIGURASI.BTK.PUT_ID, KONFIGURASI.BTK.POSCHAND.RIGHT.X1, KONFIGURASI.BTK.POSCHAND.RIGHT.Y3) Sleep(150) COLLECT_GEMS_RIGHT() FindPath(KONFIGURASI.BTK.HOSTX, KONFIGURASI.BTK.HOSTY) ChangeValue("[C] Modfly", false) RESCHAND_VERTICAL = false if not PC then if KONFIGURASI.BUBBLE.BTK_BUBBLE then CHAT(CUSTOM_TEXT.BTK.BUBBLE.BTK.DROP_WINNER) end end BUBBLE("Placing chand with "..KONFIGURASI.BTK.PUT_MODE:lower().." `2successful") PC = false end
if BBET then Sleep(250) BACK_BET() BBET = false DROP_AMOUNT = 0 end
if PAY_TAX then Sleep(250) GET_TAX() CONSOLE("Working...") Sleep(100) PLACE(32, KONFIGURASI.BTK.POSTX, KONFIGURASI.BTK.POSTY) Sleep(100) SendPacket(2,"action|dialog_return\ndialog_name|donate_edit\nx|"..KONFIGURASI.BTK.POSTX.."|\ny|"..KONFIGURASI.BTK.POSTY.."|\ndonsel|242") Sleep(200) SendPacket(2,"action|dialog_return\ndialog_name|donate_item\nx|"..KONFIGURASI.BTK.POSTX.."|\ny|"..KONFIGURASI.BTK.POSTY.."|\nitem|242|\ndoncount|"..TAX_WL.."\noptNote|`wPay taxes") Sleep(200) SendPacket(2,"action|dialog_return\ndialog_name|donate_edit\nx|"..KONFIGURASI.BTK.POSTX.."|\ny|"..KONFIGURASI.BTK.POSTY.."|\ndonsel|1796") Sleep(200) SendPacket(2,"action|dialog_return\ndialog_name|donate_item\nx|"..KONFIGURASI.BTK.POSTX.."|\ny|"..KONFIGURASI.BTK.POSTY.."|\nitem|1796|\ndoncount|"..TAX_DL.."\noptNote|`wPay taxes") Sleep(200) SendPacket(2,"action|dialog_return\ndialog_name|donate_edit\nx|"..KONFIGURASI.BTK.POSTX.."|\ny|"..KONFIGURASI.BTK.POSTY.."|\ndonsel|7188") Sleep(200) SendPacket(2,"action|dialog_return\ndialog_name|donate_item\nx|"..KONFIGURASI.BTK.POSTX.."|\ny|"..KONFIGURASI.BTK.POSTY.."|\nitem|7188|\ndoncount|"..TAX_BGL.."\noptNote|`wPay taxes") Sleep(200) SendPacket(2,"action|dialog_return\ndialog_name|donate_edit\nx|"..KONFIGURASI.BTK.POSTX.."|\ny|"..KONFIGURASI.BTK.POSTY.."|\ndonsel|11550") Sleep(200) SendPacket(2,"action|dialog_return\ndialog_name|donate_item\nx|"..KONFIGURASI.BTK.POSTX.."|\ny|"..KONFIGURASI.BTK.POSTY.."|\nitem|11550|\ndoncount|"..TAX_BLACK.."\noptNote|`wPay taxes") TAX_DONATED = GET_DATA((TAX_WL)+(TAX_DL*100)+(TAX_BGL*10000)+(TAX_BLACK*1000000)) CONSOLE(TAX_DONATED.."`o, paid!") CHAT(TAX_DONATED.."`w, paid!") PAY_TAX = false end

if TP_POS1 then Sleep(250) FindPath(KONFIGURASI.BTK.POSX1, KONFIGURASI.BTK.POSY1, 150) BUBBLE("Teleported to position 1") TP_POS1 = false end
if TP_POS2 then Sleep(250) FindPath(KONFIGURASI.BTK.POSX2, KONFIGURASI.BTK.POSY2, 150) BUBBLE("Teleported to position 2") TP_POS2 = false end
if TP_POSH then Sleep(250) FindPath(KONFIGURASI.BTK.HOSTX, KONFIGURASI.BTK.HOSTY, 150) BUBBLE("Teleported to hoster position") TP_POSH = false end
if TP_SURG then Sleep(250) FindPath(KONFIGURASI.LIST_MENU.SURGERY.POSX, KONFIGURASI.LIST_MENU.SURGERY.POSY, 150) BUBBLE("Teleported to surgery position") TP_SURG = false end

if DROP_ANC then Sleep(250) DROP(4604, DROP_AMOUNT) Sleep(150) DROP(528, DROP_AMOUNT) CONSOLE("Dropped `w"..DROP_AMOUNT.." Arroz Con Pollo and Lucky Clover") if KONFIGURASI.BUBBLE.DROP_BUBBLE then CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `$"..DROP_AMOUNT.." `wArroz Con Pollo and Lucky Clover") end if KONFIGURASI.OVERLAY.DROP_OVERLAY then OVERLAY(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `$"..DROP_AMOUNT.." `wArroz Con Pollo and Lucky Clover") end DROP_ANC = false end

if DAW then Sleep(250) DROPPED_WITH_DAW = GET_BALANCE() if TABLE_DAW.WL > 0 then DROP(242, TABLE_DAW.WL) Sleep(200) end if TABLE_DAW.DL > 0 then DROP(1796, TABLE_DAW.DL) Sleep(200) end if TABLE_DAW.BGL > 0 then DROP(7188, TABLE_DAW.BGL) Sleep(200) end if TABLE_DAW.BLACK > 0 then DROP(11550, TABLE_DAW.BLACK) Sleep(150) end CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped "..DROPPED_WITH_DAW) DAW = false DROP_AMOUNT = 0 end

if CBGL then Sleep(250) CHANGE_BGL() CBGL = false end
if BUYDL then Sleep(250) BUYING_DL() BUYDL = false end
if CHECKING_SHOW_UID then Sleep(250) SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|security") Sleep(500) end

if SHOW_COLLECTED then Sleep(250) SHOW_COLLECT() end
if KONFIGURASI.LIST_MENU.SKIN_MENU.BLINK then Sleep(50) BLINK_SKIN() end

if RANGE then Sleep(250) COLLECT_IN_RANGE() RANGE = false end
if CRANGE then Sleep(250) BUBBLE("`wCollecting in `2"..COLLECT_RANGE.." `wRange") COLLECT_CUSTOM_RANGE(COLLECT_RANGE) COLLECT_RANGE = 0 CRANGE = false end
if DROPALL_APPROVE then Sleep(250) KONFIGURASI.ABILITY.FAST_DROP = true for _, item in pairs(GetInventory()) do if not DROPALL_APPROVE then break end DROP(item.id, item.amount) Sleep(50) end DROPALL_APPROVE = false KONFIGURASI.ABILITY.FAST_DROP = false end

if CONSUME then Sleep(250) CONSUME_NOW() CONSUME = false end
if CONSUME_ARROZ then Sleep(250) PLACE(4604, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32)) CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oArroz Con Pollo eaten!") CONSUME_ARROZ = false Sleep(500) end if CONSUME_EGGS then Sleep(50) PLACE(1474, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32)) CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oEggs Benedict eaten!") CONSUME_EGGS = false Sleep(500) end if CONSUME_CLOVER then Sleep(50) PLACE(528, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32)) CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oLucky Clover eaten!") CONSUME_CLOVER = false Sleep(500) end if CONSUME_SONGPYEON then Sleep(50) PLACE(1056, math.floor(GetLocal().pos.x/32), math.floor(GetLocal().pos.y/32)) CONSOLE(CUSTOM_TEXT.CODE.CONSUME.."`oSongpyeon eaten!") CONSUME_SONGPYEON = false Sleep(500) end

if WORLD_PRESENCE then Sleep(250) CHAT("Absen Dulu Adik-Adik (lol)") Sleep(1000) for _, player in pairs(GetPlayerList()) do if player.userid ~= GetLocal().userid and not player.name:find("Slave") then CHAT("Hi "..player.name) Sleep(1000) end end CONSOLE("There are no other players beside you") CHAT("Absen Selesai (halo)") WORLD_PRESENCE = false end
if WORLD_MESSAGE then Sleep(250) for _, player in pairs(GetPlayerList()) do if player.userid ~= GetLocal().userid then CHAT("/msg "..FORMAT_NAME(player.name).." "..KONFIGURASI.LIST_MENU.WORLD_FEATURE.MESSAGE) Sleep(1000) end end CONSOLE("Message all player done!") WORLD_MESSAGE = false end
if WORLD_TRADE then Sleep(250) for _, player in pairs(GetPlayerList()) do if player.userid ~= GetLocal().userid then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..player.netid.."|\nbuttonClicked|trade") Sleep(50) SendPacket(2,"action|trade_cancel") Sleep(400) end end CONSOLE("Trading all player done!") WORLD_TRADE = false end
if WORLD_PULL then Sleep(250) for _, player in pairs(GetPlayerList()) do if player.userid ~= GetLocal().userid then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..player.netid.."|\nbuttonClicked|pull") Sleep(400) end end CONSOLE("Pulling all player done!") WORLD_PULL = false end
if WORLD_KICK then Sleep(250) for _, player in pairs(GetPlayerList()) do if player.userid ~= GetLocal().userid then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..player.netid.."|\nbuttonClicked|kick") Sleep(400) end end CONSOLE("Kicking all player done!") WORLD_KICK = false end
if WORLD_BAN then Sleep(250) for _, player in pairs(GetPlayerList()) do if player.userid ~= GetLocal().userid then SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..player.netid.."|\nbuttonClicked|world_ban") Sleep(400) end end CONSOLE("Banning all player done!") WORLD_BAN = false end

if CHANGE_WEATHER then Sleep(250) SendVariantList({[0] = "OnSetCurrentWeather", [1] = WEATHER_ID}) CHANGE_WEATHER = false end
if GIVE_ACCESS then Sleep(250) for _, tile in pairs(GetTiles()) do if (tile.fg == 242 or tile.fg == 1796 or tile.fg == 7188 or tile.fg == 5260 or tile.fg == 11550 or tile.fg == 4802 or tile.fg == 2408 or tile.fg == 2950 or tile.fg == 4428 or tile.fg == 5814 or tile.fg == 5980 or tile.fg == 8470 or tile.fg == 4802 or tile.fg == 9640 or tile.fg == 10410 or tile.fg == 11586 or tile.fg == 11902 or tile.fg == 12654 or tile.fg == 13200) then SendPacket(2,"action|dialog_return\ndialog_name|lock_edit\nx|"..tile.x.."|\ny|"..tile.y.."|\ntargetNetID|"..NET_ID) CONSOLE("You have given access lock to "..GET_NAME_BY_NETID(NET_ID)) end end GIVE_ACCESS = false end

if KONFIGURASI.GROWSCAN.SCAN_BLOCKS then Sleep(250) SCAN_BLOCK() KONFIGURASI.GROWSCAN.SCAN_BLOCKS = false end
if KONFIGURASI.GROWSCAN.SCAN_FLOATS then Sleep(250) SCAN_FLOAT() KONFIGURASI.GROWSCAN.SCAN_FLOATS = false end
if SCAN_UR_INVENTORY then Sleep(250) SCAN_INVENTORY() SCAN_UR_INVENTORY = false end

if DONATING then Sleep(250) CONSOLE("Warping to STARRIES") JOIN_WORLD("STARRIES") Sleep(5000) FindPath(49, 26, 150) KONFIGURASI.DROP.DONT_SHOW = true DROP_AMOUNT = DONATE_AMOUNT CUSTOM_DROP() CHAT("`6<`1S`2t`3a`4r`5r`6i`we`8s`6> `wThanks, i appreciate you!") CONSOLE("Donated "..GET_DATA(DONATE_AMOUNT).." `oto Starries! may God reward you for your kindness!") SEND_WEBHOOK(KONFIGURASI.DISCORD.WEBHOOK_DONATE, KONFIGURASI.DISCORD.EMBED_ACTIVITY:format("", "**"..FORMAT_NAME(GetLocal().name).."** has made a donation of "..SHOW_DATA(DONATE_AMOUNT))) DROP_AMOUNT = 0 DONATING = false end
if SEND_SUPPORT then Sleep(250) CONSOLE("Working...") Sleep(500) SEND_WEBHOOK(KONFIGURASI.DISCORD.WEBHOOK_SUPPORT, KONFIGURASI.DISCORD.EMBED_SUPPORT:format(SUPPORT_MESSAGE)) Sleep(500) CONSOLE("`6>> This message : `w"..SUPPORT_MESSAGE.."`o, sent to our Discord") SEND_SUPPORT = false end
if CHECK_TO_TRASH then Sleep(100) CONSOLE(GIVE_ID(ITEM_ID).." I "..GET_AMOUNT(ITEM_ID)) CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wTrashed "..GET_AMOUNT(ITEM_ID).." "..GetItemInfo(ITEM_ID).name) TRASH(GIVE_ID(ITEM_ID), GET_AMOUNT(ITEM_ID)) CHECK_TO_TRASH = false end

if KONFIGURASI.SERVICE_MENU.BROADCAST.STARTING then Sleep(250) BROADCASTING() end

if KONFIGURASI.WORLD_FINDER.TOGGLE then Sleep(250) FINDING_WORLD() end

if KONFIGURASI.STORE_MENU.PURCHASE_FROM_STORE then Sleep(250) BUBBLE(KONFIGURASI.SYSTEM.CREDIT.."`wPlease be patient during the purchasing process!") for i = 1, KONFIGURASI.STORE_MENU.AMOUNT do SendPacket(2,"action|buy\nitem|"..KONFIGURASI.STORE_MENU.CODE) Sleep(200) end CONSOLE("Purchasing the item '`5"..KONFIGURASI.STORE_MENU.ITEM.."`o' with a total of "..KONFIGURASI.STORE_MENU.AMOUNT.." `2successful`o!") CONSOLE("Total spent : `4-"..FORMAT_NUMBER(KONFIGURASI.STORE_MENU.SPENT*KONFIGURASI.STORE_MENU.AMOUNT).." `oGems!") Sleep(150) KONFIGURASI.STORE_MENU.PURCHASE_FROM_STORE = false end
if KONFIGURASI.HUB_MENU.PURCHASE_FROM_HUB then Sleep(250) BUBBLE(KONFIGURASI.SYSTEM.CREDIT.."`wPlease be patient during the purchasing process!") for i = 1, KONFIGURASI.HUB_MENU.AMOUNT do SendPacket(2,"action|dialog_return\ndialog_name|activity_purchase\noffer|"..KONFIGURASI.HUB_MENU.CODE.."|") Sleep(200) end CONSOLE("Purchasing the item '`5"..KONFIGURASI.HUB_MENU.ITEM.."`o' with a total of "..KONFIGURASI.HUB_MENU.AMOUNT.." `2successful`o!") CONSOLE("Total spent : `4-"..FORMAT_NUMBER(KONFIGURASI.HUB_MENU.SPENT*KONFIGURASI.HUB_MENU.AMOUNT).." `oActivity Credits!") Sleep(150) KONFIGURASI.HUB_MENU.PURCHASE_FROM_HUB = false end

if KONFIGURASI.SERVICE_MENU.ITEM_FINDER.TOGGLE then Sleep(250) ITEM_FINDER_IN_ACTION() end

if KONFIGURASI.SERVICE_MENU.ITEM_MOVER.TOGGLE then Sleep(250) ITEM_MOVER_IN_ACTION() end

if KONFIGURASI.LIST_MENU.PACK_MENU.TOGGLE then Sleep(250) BUYING_PACK_IN_ACTION() end

if KONFIGURASI.LIST_MENU.MAGPLANT.AUTO_TOGGLE then Sleep(250) AUTO_MAGPLANT() end
if KONFIGURASI.LIST_MENU.VENDING.AUTO_TOGGLE then Sleep(250) AUTO_VENDING() end

if CHECK_PROFILE then Sleep(250) SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|bgls") Sleep(500) CHAT("/kit") Sleep(500) SendPacket(2,"action|wrench\n|netid|"..GetLocal().netid) Sleep(1000) CHECK_PROFILE = false end

if DEPOSIT then Sleep(250) SendPacket(2,"action|dialog_return\ndialog_name|bank_deposit\nbgl_count|"..AMOUNT_DEPOSIT) AMOUNT_DESPOTI = 0 DEPOSIT = false end
if DEPOSIT_ALL then Sleep(250) if GET_AMOUNT(11550) > 0 then for i = 0, 2 do BREAK_BLACK() end else SendPacket(2,"action|dialog_return\ndialog_name|bank_deposit\nbgl_count|"..GET_AMOUNT(7188)) DEPOSIT_ALL = false end end
if WITHDRAW_ALL then Sleep(250) SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|bgls") Sleep(500) if KONFIGURASI.OTHERS.BGL_ON_BANK ~= 0 then SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|"..KONFIGURASI.OTHERS.BGL_ON_BANK) else CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYou don't have enough `eBlue Gem Lock`o to withdrawn!") end WITHDRAW_ALL = false end

if DROP_BGEMS then Sleep(250) for i = AMOUNT_BGEMS/250 , 1 , -1 do SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|bgem_dropall") Sleep(100) end CHAT(KONFIGURASI.SYSTEM.CREDIT.."`wDropped `w"..AMOUNT_BGEMS.." `bBlack Gems") Sleep(1000) DROP_BGEMS = false end

if KONFIGURASI.LIST_MENU.SURGERY.BUY_KIT then Sleep(250) for i = 1, 50 do SendPacket(2,"action|buy\nitem|buy_surgkit") Sleep(180) end CONSOLE("Buying Surgical Kit `2successful`o!") KONFIGURASI.LIST_MENU.SURGERY.BUY_KIT = false if KONFIGURASI.LIST_MENU.SURGERY.AUTO_DROP_KIT then KONFIGURASI.LIST_MENU.SURGERY.DROP_KIT = true end end
if KONFIGURASI.LIST_MENU.SURGERY.DROP_KIT then Sleep(150) if GET_AMOUNT(1240) > 0 then DROP(1240, GET_AMOUNT(1240)) end Sleep(150) if GET_AMOUNT(1256) > 0 then DROP(1256, GET_AMOUNT(1256)) end Sleep(150) if GET_AMOUNT(1258) > 0 then DROP(1258, GET_AMOUNT(1258)) end Sleep(150) if GET_AMOUNT(1260) > 0 then DROP(1260, GET_AMOUNT(1260)) end Sleep(150) if GET_AMOUNT(1262) > 0 then DROP(1262, GET_AMOUNT(1262)) end Sleep(150) if GET_AMOUNT(1264) > 0 then DROP(1264, GET_AMOUNT(1264)) end Sleep(150) if GET_AMOUNT(1266) > 0 then DROP(1266, GET_AMOUNT(1266)) end Sleep(150) if GET_AMOUNT(1268) > 0 then DROP(1268, GET_AMOUNT(1268)) end Sleep(150) if GET_AMOUNT(1270) > 0 then DROP(1270, GET_AMOUNT(1270)) end Sleep(150) CONSOLE("Dropping Surgical Kit `2successful`o!") KONFIGURASI.LIST_MENU.SURGERY.DROP_KIT = false end
if BACK_SURGERY then Sleep(100) CHAT("/ghost") Sleep(250) FindPath(KONFIGURASI.LIST_MENU.SURGERY.POSX, KONFIGURASI.LIST_MENU.SURGERY.POSY, 150) Sleep(250) CHAT("/ghost") BACK_SURGERY = false end
if KONFIGURASI.LIST_MENU.SURGERY.BACK_POSITION then Sleep(150) if not GetWorld() or GetWorld().name ~= KONFIGURASI.LIST_MENU.SURGERY.WORLD then JOIN_WORLD(KONFIGURASI.LIST_MENU.SURGERY.WORLD) Sleep(500) end end 

if KONFIGURASI.LIST_MENU.BRUTEFORCE_MENU.TOGGLE then Sleep(100) BRUTEFORCING() end 

if BOOM_EMOJI then Sleep(250) CHAT("(agree) (alien) (bheart) (build) (bunny) (cactus) (cake) (clap) (cool) (cry) (dance) (eyes) (evil) (fireworks)") Sleep(1000) CHAT("(football) (gems) (ghost) (gift) (grin) (grow) (gtoken) (halo) (heart) (heartarrow) (ill) (kiss) (lol) (love) (lucky)") Sleep(1000) CHAT("(mad) (megaphone) (music) (moyai) (no) (nuke) (oops) (party) (peace) (pine) (pizza) (plead) (punch) (see-no-evil)") Sleep(1000) CHAT("(shamrock) (shy) (sigh) (sleep) (smile) (song) (terror) (tongue) (troll) (turkey) (vend) (weary) (wink) (wl) (wow) (yes)") BOOM_EMOJI = false end

if SHOW_GEMS_ON_WORLD then Sleep(250) CHAT("Beep Beep, Scanning ...") Sleep(1000) local GEMS_COUNT = GET_FLOAT_AMOUNT(112) if GEMS_COUNT > 0 then CHAT("Scan Results : `5"..GEMS_COUNT.." ``Gems (gems)") else CHAT("We don't find Gems here!") end SHOW_GEMS_ON_WORLD = false end
if SHOW_BGEMS_ON_WORLD then Sleep(250) CHAT("Beep Beep, Scanning ...") Sleep(1000) local BGEMS_COUNT = GET_FLOAT_AMOUNT(GetItemInfo("Black Gems").id) if BGEMS_COUNT > 0 then CHAT("Scan Result : `5"..BGEMS_COUNT.." ``Black Gems (yes)") else CHAT("No Black Gems here!") end SHOW_BGEMS_ON_WORLD = false end
if SHOW_PLAYER_ON_WORLD then Sleep(250) CHAT("Beep Beep, Scanning ...") Sleep(1000) local PLAYERS_COUNT = GET_PLAYER_COUNT() if PLAYERS_COUNT > 1 then CHAT("Scan Results : `5"..PLAYERS_COUNT.." ``Players (tongue)") else CHAT("This world is lonely like you (cry)") end SHOW_PLAYER_ON_WORLD = false end
if SHOW_BALANCE then Sleep(250) RES = (GET_AMOUNT(242))+(GET_AMOUNT(1796)*100)+(GET_AMOUNT(7188)*10000)+(GET_AMOUNT(11550)*1000000) CHAT("Your balance : "..GET_DATA(RES)) SHOW_BALANCE = false end

if SOMBONG_DULU then Sleep(100) CHAT("/love") Sleep(700) CHAT("Segini Doang (tongue) ?") SOMBONG_DULU = false end

if KONFIGURASI.SERVICE_MENU.CLEAR_WATER.TOGGLE then Sleep(250) ChangeValue("[C] Modfly", true) CLEAR_WATER_ON_WORLD() end
if KONFIGURASI.SERVICE_MENU.CLEAR_FLOAT.TOGGLE then Sleep(250) ChangeValue("[C] Modfly", true) CLEAR_FLOAT_ON_WORLD() end

if COUNT_WATER then Sleep(100) COUNT_WATER_ON_WORLD() end
if GACHA_PINATA then Sleep(100) PLACE(18, GET_X()+1, GET_Y()) Sleep(100) PLACE(722, GET_X()+1, GET_Y()) Sleep(100) PLACE(18, GET_X()+2, GET_Y()) end
if GETTING_REMOTE then Sleep(100) GET_REMOTE() GETTING_REMOTE = false end

if RELOG then Sleep(100) SendPacket(3,"action|quit_to_exit") Sleep(500) JOIN_WORLD(LATEST_WORLD) Sleep(1000) RELOG = false end
if CHECKING_STATUS_CHEAT then Sleep(100) SendPacket(2,"action|dialog_return\ndialog_name|popup\nbuttonClicked|cheats") Sleep(500) end

if GACHA_SUMMER then Sleep(100) if GET_AMOUNT(GetItemInfo("Fireworks").id) < 50 then KONFIGURASI.STORE_MENU.PURCHASE_FROM_STORE = true else PLACE(GetItemInfo("Fireworks").id, GET_X(), GET_Y()) Sleep(50) end end

if RUN_THE_JUTSU then Sleep(800) GET_LAST_WORLD = GetWorld().name GET_LAST_X, GET_LAST_Y = GET_X(), GET_Y() CHAT("/supermagic") Sleep(699) CHAT("Escaping Technique (ghost)") Sleep(150) JOIN_WORLD("EXIT") Sleep(1500) RUN_THE_JUTSU = false end
-- [[ Under Construct ]] if GetWorld() == nil or GetWorld().name ~= GET_LAST_WORLD then JOIN_WORLD(GET_LAST_WORLD) Sleep(1500) end FindPath(GET_LAST_X, GET_LAST_Y, 150) CHAT("(moyai)") RUN_THE_JUTSU = false 

if INSTANT_WARP then Sleep(200) BUBBLE("``Warping to `"..RANDOMIZE_COLOR[math.random(1, #RANDOMIZE_COLOR)]..""..WORLD_TO_WARP:upper()) Sleep(250) JOIN_WORLD(WORLD_TO_WARP) INSTANT_WARP = false end
if GACHA_PET then Sleep(150) CHAT("/randompets") Sleep(500) SendPacket(2,"action|respawn|") Sleep(500) SHATTER(3552) Sleep(500) SHATTER(3552) Sleep(500) PLACE(3554, GET_X() + 1, GET_Y()) Sleep(500) PLACE(18, GET_X() + 1, GET_Y()) Sleep(4000) end

if SEND_WEBHOOK_DEPOSIT then Sleep(100) SEND_WEBHOOK(KONFIGURASI.DISCORD.WEBHOOK_DEPOSIT, KONFIGURASI.DISCORD.EMBED_ACTIVITY:format("<@872423690120331304>", "**"..DEPO_NAME.."** deposited "..DEPO_AMOUNT.." "..DEPO_ITEM.." into the Donation Box!")) BUBBLE("Webhook Deposit has been sent!") SEND_WEBHOOK_DEPOSIT = false end
if SEND_WEBHOOK_DONATION then Sleep(100) SEND_WEBHOOK(KONFIGURASI.DISCORD.WEBHOOK_DONATE, KONFIGURASI.DISCORD.EMBED_ACTIVITY:format("", "**"..FORMAT_NAME(DEPO_NAME).."** has made a donation of "..DEPO_AMOUNT.." "..DEPO_ITEM)) BUBBLE("Webhook Donation has been sent!") SEND_WEBHOOK_DONATION = false end

if TELEPORTING_TO_PLAYER then Sleep(100) GET_PLAYER_POSITION(TARGET_TELEPORT) Sleep(150) TELEPORTING_TO_PLAYER = false end
if CHECKING_PLAYER_INFORMATION then Sleep(100) CHECK_PLAYER_INFORMATION(TARGET_TO_CHECK) Sleep(150) CHECKING_PLAYER_INFORMATION = false end

end

end

CHECKING_LANGUAGE(KONFIGURASI.UI.LANGUAGE) CONSOLE(CUSTOM_TEXT.START.A) Sleep(50) 
load(MakeRequest("https://raw.githubusercontent.com/starries-real/exclusive/main/confidential","GET").content)()
if CHECKING_USERID(BOTHEX.STARRIES_HELPER.CLUB, GetLocal().userid) then Sleep(100) SEND_WEBHOOK(KONFIGURASI.DISCORD.OFFICIAL_WEBHOOK:format("1204604096976396328"), KONFIGURASI.DISCORD.EMBED_VERIFIED:format(FORMAT_NAME(GetLocal().name), math.floor(GetLocal().userid), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), "Premium member are running **Starries Helper**")) Sleep(100) CREATE_FOLDER("cache\\helper") Sleep(100) HELPER() Sleep(100)
else Sleep(100) CONSOLE(CUSTOM_TEXT.ALERT.OOPS.."`oYour account doesn't match with our data") EVENT("`4Your account doesn't match with our data", "interface/large/game_over.rttex", "audio/loser.wav") load(MakeRequest("https://rentry.co/starries-guardian/raw/","GET").content)() SendVariantList({[0] = "OnDialogRequest", [1] = notAllowed}) SEND_WEBHOOK(KONFIGURASI.DISCORD.OFFICIAL_WEBHOOK:format("1204602694908649523"), KONFIGURASI.DISCORD.EMBED_UNVERIFIED:format(FORMAT_NAME(GetLocal().name), math.floor(GetLocal().userid), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), "Someone unknown tried to using **Starries Helper**")) 
AddHook("OnSendPacket", "PACKET-GUARD", function(T, S) if S == nil then return end local ARGS, BUTTON, TOGGLE = SPLIT(S:gsub("action|input\n|text|", ""), " "), S:match("buttonClicked|(%S+)"), S if ARGS == nil or ARGS[1] == nil or ARGS == "" or ARGS[1] == "" then return end COMMAND = ARGS[1]:lower()
if BUTTON == ("FREE_ACCESS") then if GET_AMOUNT(7188) < 2 then BUBBLE("`wYou don't have enough `eBlue Gem Lock `wto access Starries Helper!") return false else GET_ACCESS = true WARN("`wWarning from `4Starries Helper `w: Buy the VIP entrance to gain access!") end end
return false end)

AddHook("OnVariant", "VARIANT-GUARD", function(V)
if V[0] == "OnConsoleMessage" then
if V[1]:find("(.+) bought 1 VIP Entrance for 50000 World Locks.``") then DEPOSITED = true end
end
return false end)

while true do Sleep(150)
if GET_ACCESS then Sleep(50) if GetWorld() == nil then Sleep(100) WARN("`wWarning from `4Starries Helper `w: DON'T TRY TO RUN!") JOIN_WORLD("STARRIES") Sleep(2000) elseif GetWorld().name ~= "STARRIES" then CONSOLE("Warping to STARRIES") JOIN_WORLD("STARRIES") Sleep(2000) end end
if DEPOSITED then Sleep(50) HELPER() RemoveHook("PACKET-GUARD") RemoveHook("VARIANT-GUARD") DEPOSITED = false return false end
end

end
