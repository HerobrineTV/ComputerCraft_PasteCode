local bridge = peripheral.find("meBridge")
local manager = peripheral.find("inventoryManager")
local chat = peripheral.find("chatBox")

local amount
local amount2
local amount3

local tbl = {
    ["ae2"] = "ae2",
    ["mc"] = "minecraft"
}

function sendMessage(msg, sender, title, plrname)
    chat.sendToastToPlayer(msg, title, plrname, "&4&l"..sender, "()", "&c&l")
    --chat.sendMessage("Sent you " .. amount2 .. " "..item.."!", "ME System", "<>", "&b")
    --chat.sendMessage("I wasnt able to find any "..item.." in your ME System!", "ME System", "<>", "&b")
end

while true do
    local event, username, message, uuid, isHidden = os.pullEvent("chat")
    local words = {}
    if message then
        for word in message:gmatch("%S+") do
            table.insert(words, word)
        end
        if username == "q___o_O___p" and words[1] == "me" and words[2] == "get" then
            local mod = words[5]
            if not mod then
                mod = tbl["mc"]
            end
            amount = tonumber(words[4]) or 64
            local item = words[3]
            --manager.addItemToPlayer("south", {name="minecraft:"..item, toSlot=36, count=count})
            amount2 = bridge.exportItem({name=mod..":"..item, count=amount}, "up")
            sleep(.1)
            if amount2 > 0 then
                amount3 = manager.addItemToPlayer("north", {name=mod..":"..item, count=amount2})
                if amount3 > 0 then
                    if amount3 ~= amount2 then
                        bridge.importItem({name=mod..":"..item, count=(amount2-amount3)}, "up")
                    end
                    sendMessage("Sent you " .. amount3 .. " "..item.."!", "ME System", "Item", username)
                else
                    sendMessage("There was a error sending u the Items, so they get back to Storage!", "ME System", "Item", username)
                    bridge.importItem({name=mod..":"..item, count=amount2}, "up")
                end
            else
                sendMessage("I wasnt able to find any "..item.." in your ME System!", "ME System", "Item", username)
            end
        end

        if username == "q___o_O___p" and words[1] == "me" and (words[2] == "send" or words[2] == "store") then
            local mod = words[5]
            if not mod then
                mod = tbl["mc"]
            end
            amount = tonumber(words[4]) or 64
            local item = words[3]
            amount2 = manager.removeItemFromPlayer("north", {name=mod..":"..item, count=amount})
            sleep(.1)
            if amount2 > 0 then
                amount3 = bridge.importItem({name=mod..":"..item, count=amount2}, "up")
                --if amount3 > 0 then
                    sendMessage("Stored your " .. amount2 .. " "..item.." in the Storage!", "ME System", "Item", username)
                --else
                    --sendMessage("There was a error Storing the Items, so u get them back!", "ME System", "Item", username)
                    --manager.addItemToPlayer("north", {name=mod..":"..item, count=amount2})
                --end
            else
                sendMessage("I wasnt able to find any "..item.." in your ME System!", "ME System", "Item", username)
            end
        end
        print("1:"..amount)
        print("2:"..amount2)
        print("3:"..amount3)
    end
end