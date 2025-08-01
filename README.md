
### Install 
```bash
curl -L -o Mdeclare.zip https://github.com/OUIsolutions/LuaMDeclare/releases/download/0.1.0/Mdeclare.zip && unzip Mdeclare.zip && rm Mdeclare.zip
```
these its a wrapper of the original [Mdeclare](https://github.com/OUIsolutions/MDeclare) C library

```lua
local mdeclare = require("Mdeclare/Mdeclare")

local amalgamated_out = mdeclare.transform_dir({
    dir="src",
    include_paths=false,
    startswith="fdefine",
    endswith=".c",
})
print(amalgamated_out)
local single_out = mdeclare.transform_file("src/one.c")
print(single_out)
```

### Build 
rlease build  
```bash
darwin run_blueprint darwinconf.lua  build_release --provider podman
```
createhs the tree 
release/
├── luamdeclare.c
├── Mdeclare
│   ├── Mdeclare.lua
│   └── Mdeclare.so
└── Mdeclare.zip

local build 
```bash
darwin run_blueprint darwinconf.lua  build_local --provider podman
```
createhs the tree
release/
├── luamdeclare.c
├── Mdeclare
│   ├── Mdeclare.lua
│   └── Mdeclare.so
└── Mdeclare.zip

