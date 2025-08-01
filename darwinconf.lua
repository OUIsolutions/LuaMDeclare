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
