DEPS = {
    {url = "https://github.com/OUIsolutions/MDeclare/releases/download/0.1.0/MDeclareApiOne.c",save_as = "MDeclareApiOne.c"},
    {url = "https://github.com/OUIsolutions/LuaCEmbed/releases/download/0.9.1/LuaCEmbedOne.c", save_as = "LuaCEmbedOne.c"},
}


-- Downloads once, then reuses the result!
local cached_get_webpage = darwin.dtw.create_cache_function({
    expiration = darwin.dtw.INFINITY,  -- 5 minutes
    cache_dir = "./web_cache/",
    cache_name = "webpage",  -- Added cache_name
    callback = function(url)
        darwin.dtw.remove_any("temp")
        os.execute("curl -L " .. url .. " -o temp")
        local content =  darwin.dtw.load_file("temp")
        darwin.dtw.remove_any("temp")
        return content
    end
})

for i=1,#DEPS do
    local dep = DEPS[i]
    local content = cached_get_webpage(dep.url)
    darwin.dtw.write_file("dependencies/" .. dep.save_as, content)
end

local builded = false
if darwin.argv.one_of_args_exist("build_local") then
    darwin.dtw.copy_any_overwriting("starter.lua","release/Mdeclare/Mdeclare.lua")
    os.execute("gcc luamdeclare.c -shared  -fpic -o release/Mdeclare/Mdeclare.so")
    builded = true
end

if darwin.argv.one_of_args_exist("build_release") then
    darwin.dtw.copy_any_overwriting("starter.lua","release/Mdeclare/Mdeclare.lua")

    -- Create a new container machine
    local machine = darwin.ship.create_machine("debian:latest")
    -- Configure container runtime
    machine.provider = darwin.argv.get_flag_arg_by_index({ "provider"},1, "docker")
    -- Add build-time commands
    machine.add_comptime_command("apt update")
    machine.add_comptime_command("apt install -y gcc")
    
    machine.start({
        flags = {
            "--network=host"
        },
        volumes = {
            { ".", "/output" }
        },
        command = "gcc -shared -fpic /output/luamdeclare.c -o /output/release/Mdeclare/Mdeclare.so"
    })

    builded = true
end

if builded then
    local content = darwin.dtw.load_file("luamdeclare.c")
    content = "#define LUAMDECLARE_NOT_INCLUDE_DEPS\n"..content
    darwin.dtw.write_file("release/luamdeclare.c", content)
    os.execute("cd release && zip -r Mdeclare.zip Mdeclare")
end