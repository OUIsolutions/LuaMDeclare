---@class MdeclareDirProps
---@field dir string
---@field include_paths string[]
---@field starts_with string[]
---@field ends_with string[]





---@class MdeclareModule
---@field transform_content fun(content:string):string
---@field transform_dir fun(dir:MdeclareDirProps):string

local lib_path = ''

if os.getenv("HOME") then
    lib_path = path.."Mdeclare.so"
else
    lib_path = path.."Mdeclare.dll"
end 

local load_lua = package.loadlib(lib_path, "load_Mdeclare")

---@type MdeclareModule
local lib = load_lua()

return lib