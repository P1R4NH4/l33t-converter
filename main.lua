--[[ 
l33t Converter
This is a training code in lua language from P1R4NH4
The purpose is to convert from normal text to l33t based on a user input
]]

-- Defining function to determine the script path, everything will be local to this path.
function script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*[/\\])") or "."
end

Script_path = script_path()

-- pushing local path to package
package.path = package.path .. ";" .. Script_path .. "?.lua"


-- creating terminal clear function
local function term_clear()
    if not os.execute("clear") then
        os.execute("cls")
    end
end

-- Importing config file
require "config"

-- Defining the user choice variable from the menu. Setting it to nil
local usr_menu_var = nil

-- Definining check file function
function file_exists(file_name)
    local f = io.open(file_name,"r")
    if f ~= nil then io.close(f) return true else return false end
end


-- Defininig Conversion Function 
local function leet_conversion(usr_text_origin)
    -- Formatting the variable to all lowercase to apply the gsub
    local usr_text_origin_f = usr_text_origin:lower()
    local usr_text_origin_fs = tostring(usr_text_origin_f)

     -- Showing variable type and formatting outcome in debug mode
     if Debug == true then   -- Debug is a global variable and not local
         print ("\n" .. type(usr_text_origin))
 
         if usr_text_origin ~= usr_text_origin_f then
             print ("\nUser text has been formatted to all lowercase") 
         elseif usr_text_origin == usr_text_origin_f then
             print ("\nUser text was already formatted to all lowercase, nothing done")
         end
     end

    usr_text_conv_fs = usr_text_origin_fs:gsub(A0, A1):gsub(B0, B1):gsub(C0, C1):gsub(D0, D1):gsub(E0, E1):gsub(F0, F1):gsub(G0, G1):gsub(H0, H1):gsub(I0, I1):gsub(L0, L1):gsub(M0, M1)
    return usr_text_conv_fs

end

-- Defining file conversion function
local function file_conversion(usr_file, usr_file_wtxt)

        -- Check if user file actually can be opened
        local file_check = file_exists(usr_file)

        if file_check == true then      -- If the file can be opened proceding with the file conversion

            io.input(usr_file)
    
            local usr_file_text = io.read("*all")

            io.close()

            local usr_file_conv = usr_file_wtxt .. Conv_file_postfix .. ".txt"      -- Creating a new file name with the _conv postfix as the converted document

            local conv_usr_file_text = leet_conversion(usr_file_text)       -- Recalling the conversion function itself

            if file_exists(usr_file_conv) == false then

                io.output(usr_file_conv)

                io.write(conv_usr_file_text)        -- Outputting the result in the new file
   
                io.close()

                print("\n--------------------------------------------------------------------")
                print("\nThe text contained in the specified file has been converted and a new file has been created with name:\n\n" .. usr_file_conv)

                -- return conv_usr_file_text
            
            elseif file_exists(usr_file_conv) == true then

                print("\n--------------------------------------------------------------------")
                print("\nA file with the following path/name already exist, please rename it or remove it and try again:\n\n" .. usr_file_conv)

            else

                print ("\n--------------------------------------------------------------------")
                print ("\nAn unespected error has occourred")
    
            end

        elseif file_check == false then     -- If file cannot be opened returning an error 

            print ("\n--------------------------------------------------------------------")
            print ("\nThe file you have specified either does not exist or cannot be opened")

        else

            print ("\n--------------------------------------------------------------------")
            print ("\nAn unespected error has occourred")

        end
end


-- Checking script modules against configuration file
if Script_live == true and Script_file == true then     -- if both modules are enabled a menu is presented
    term_clear()
    print ("\nWelcome to the text to L33t conversion script, please make a choice between following options:\n")
    print ("    1 - Live text conversion")
    print ("    2 - Text conversion from file")
    print ("\nPlease make a choice and press enter:\n")

    -- requesting user input
    usr_menu_var = io.read()
    
    -- converting user input into a numeric value
    usr_menu_var = tonumber(usr_menu_var)

    if usr_menu_var ~= 1 and usr_menu_var ~= 2 then    -- checking user input for validity 
        usr_menu_var = nil       -- if the input is not valid the variable is forced to nil value and and error message is displayed

        print ("\n--------------------------------------------------------------------")
        print ("\nYour selection is not valid, exiting")

    elseif usr_menu_var == 1 or usr_menu_var == 2 then    -- if the user input is valid the terminal is cleared for the required module to be diplayed
        term_clear() 
    end

elseif Script_live == true and Script_file == false then

    usr_menu_var = 1     -- Setting User Choice to 1, as this is the only module enabled. Skipping menu
    term_clear()     -- Clearing terminal

elseif Script_live == false and Script_file == true then

    usr_menu_var = 2     -- Setting User Choice to 2, as this is the only module enabled. Skipping menu
    term_clear()     -- Clearing terminal

else 
    print ("\nAccording to configuration file no script module is enabled, exiting")
end

-- Checking if the user choice is set to 1 (live text module) according to the above processing
if usr_menu_var == 1 then 

    -- Welcome text and user promt
    print ("\nWelcome, please enter the text to be converted and press enter:\n")

    local usr_text = io.read()

    -- define local variable and apply gsub function to convert to l33t
    local conv_usr_text = nil  -- Accademically defining the local variable to a nil value. This step is redaundant and could be integrated in the next line

    conv_usr_text = leet_conversion(usr_text)

    -- print the user text and the converted function
    print ("\n--------------------------------------------------------------------\n")
    print ("Your Input: " .. usr_text .. "\n\nThe converted text: " .. conv_usr_text .. "\n")
end


if usr_menu_var == 2 then

    -- Welcome text and user promt
    print ("\nWelcome, please enter the name of the file to be converted and press enter:\n")

    -- getting user input for file name
    local usr_file = io.read()

    -- Check if specified user file format is a .txt and put the result in a variable
    local usr_txt_ck = string.find(usr_file, ".txt")
    local usr_txt_ck1 = string.find(usr_file, ".TXT")
    
    if usr_txt_ck ~= nil then       -- If file is .txt continue with the conversion process

        local usr_file_wtxt = usr_file:gsub(".txt", "")     -- Creating the file name without extention

        local usr_file_p = Script_path .. usr_file      -- Including path in file name
        local usr_file_wtxt_p = Script_path .. usr_file_wtxt         -- Including path in file name

        file_conversion(usr_file_p, usr_file_wtxt_p)        -- Recalling the conversion function for conversion

    elseif usr_txt_ck1 ~= nil then      -- If file is .TXT continue with the conversion process

        local usr_file_wtxt = usr_file:gsub(".TXT", "")     -- Creating the file name without extention

        local usr_file_p = Script_path .. usr_file       -- Including path in file name
        local usr_file_wtxt_p = Script_path .. usr_file_wtxt         -- Including path in file name

        file_conversion(usr_file_p, usr_file_wtxt_p)        -- Recalling the conversion function for conversion

    else

        print ("\n--------------------------------------------------------------------")
        print("\nThe file format you have specified is not a text document")

    end
    
end


------ Footer Section ------

-- Debug Mode Declaration in Footer Section
if Debug_mode == true then
    print ("\n--------------------------------------------------------------------")
    print ("Script Executed in Debug Mode at  " ..  os.date("%H:%M:%S") .. "  - Version: " .. Script_version .. "\n")
    do return end  -- exiting the script if this condition is reached
end
-- Footer Text for production mode
print ("\n--------------------------------------------------------------------")
print ("Script Executed in Production Mode at  " ..  os.date("%H:%M:%S") .. "  - Version: " .. Script_version .. "\n")
