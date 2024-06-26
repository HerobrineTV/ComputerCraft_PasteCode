import pyautogui
import time

import pyautogui
import time

import pyperclip
import pyautogui
import time


def type_lua_code(file_path):
    # Open the .lua file and read its contents
    with open(file_path, 'r') as file:
        lua_code = file.readlines()

    # Wait a moment to give you time to switch to Minecraft
    print("Switch to Minecraft within 5 seconds...")
    time.sleep(5)

    # Special characters that need to be replaced
    replacements = {
        "{...}": "{...}",
        "= ": "= ",
        " -= ": " ~= ",
        ",.": "<>",
        "\t": "    "  # Replace tabs with 4 spaces
    }

    # Type each line of the .lua code
    for line in lua_code:
        # Replace special characters
        for old, new in replacements.items():
            line = line.replace(old, new)

        # Copy the line with special characters to clipboard
        pyperclip.copy(line)

        # Paste the line into Minecraft
        pyautogui.hotkey('ctrl', 'v')

        # Press enter to go to the next line
        pyautogui.press('enter')

        # Press enter to go to the next line
        pyautogui.press('enter')
# Path to your .lua file
lua_file_path = 'lua_files/farmturtle.lua'

# Call the function to type the code into the turtle
type_lua_code(lua_file_path)
