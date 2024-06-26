local manager = peripheral.find("inventoryManager")
local chat = peripheral.find("chatBox")

while true do
    local event, username, message, uuid, isHidden = os.pullEvent("chat")
    local words = {}
    if message then
        for word in message:gmatch("%S+") do
            table.insert(words, word)
        end
        if username == "q___o_O___p" and words[1] == "get" then
            local count = tonumber(words[3]) or 64
            manager.addItemToPlayer("south", {name="minecraft:"..words[2], toSlot=36, count=count})
            chat.sendMessage("Sent you " .. count .. " "..words[2].."!", "Iron Farm", "<>", "&b")
        elseif words[1] == "get" then
            chat.sendMessage("Im sorry but " .. username .. " cant access me remotely!", "Iron Farm", "<>", "&b")
        end
    end
end