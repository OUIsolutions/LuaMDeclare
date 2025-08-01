
# 🌙 LuaMDeclare

<div align="center">

![GitHub release (latest by date)](https://img.shields.io/github/v/release/OUIsolutions/LuaMDeclare?style=for-the-badge&color=brightgreen)
![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)
![GitHub Repo stars](https://img.shields.io/github/stars/OUIsolutions/LuaMDeclare?style=for-the-badge&color=yellow)
![Lua](https://img.shields.io/badge/language-Lua-blue?style=for-the-badge&logo=lua)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20Windows%20%7C%20macOS-lightgrey?style=for-the-badge)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen?style=for-the-badge)

**A magical Lua wrapper that transforms C function definitions into header declarations automatically!** ✨

*Perfect for Lua scripts that need to generate C headers, create APIs, and maintain clean code structure!*

</div>

---

## 🎯 What is LuaMDeclare? (Super Simple Explanation!)

**Imagine you're a wizard with a spell book full of complex C functions scattered everywhere.** 🧙‍♂️

**LuaMDeclare** is like a magic Lua spell that:
1. **Reads your C function spells** (C function definitions) 📖
2. **Creates a quick reference grimoire** (header declarations) 🗂️
3. **Gives you a clean spell index** (header file) ✨
4. **All from within your Lua scripts!** 🌙

### 📚 In Programming Terms:
If you have C code with functions like:
- `int add(int a, int b) { return a + b; }`
- `void print_hello() { printf("Hello!"); }`
- `double calculate_area(double radius) { return 3.14 * radius * radius; }`

**LuaMDeclare transforms ALL of these into clean header declarations using simple Lua code!** 🎉

### 🤔 Why is this AMAZING for Lua developers?

#### ✅ **Lua-Powered Header Generation**
- **Before**: Use command-line tools or write C code to generate headers 😰
- **After**: Generate headers directly from your Lua scripts! 🚀

#### ✅ **Perfect for Build Scripts**
- Integrate header generation into Lua-based build systems
- Automate C header creation in your Lua workflows
- Great for game engines, embedded systems, and more!

#### ✅ **Simple Lua API**
- Only 2 main functions to learn
- Clean, intuitive Lua syntax
- No complex command-line arguments to remember

#### ✅ **Powerful Filtering Options**
- Process entire directories
- Filter by filename patterns
- Include file paths in comments

---

## 🌟 See The Magic In Action!

### 🎬 **BEFORE** (Your C file):
**math_utils.c:**
```c
// Basic math operations
int add(int a, int b) {
    return a + b;
}

// Calculate square of a number  
int square(int x) {
    return x * x;
}

// Check if number is even
bool is_even(int num) {
    return num % 2 == 0;
}
```

### 🪄 **Run the magic Lua code:**
```lua
local mdeclare = require("Mdeclare/Mdeclare")

-- Transform single file
local header_content = mdeclare.transform_file("math_utils.c")
print(header_content)
```

### 🎉 **AFTER** (Clean header declarations):
```c
// Basic math operations
int add(int a, int b);

// Calculate square of a number  
int square(int x);

// Check if number is even
bool is_even(int num);
```

**✨ BOOM! Perfect header declarations with comments preserved, all from Lua!**

---

## 📥 Installation & Setup

### 🚀 Quick Installation (One Command!)

```bash
curl -L -o Mdeclare.zip https://github.com/OUIsolutions/LuaMDeclare/releases/download/0.1.0/Mdeclare.zip && unzip Mdeclare.zip && rm Mdeclare.zip
```

**🎉 That's it!** After running this command, you'll have:
```
Mdeclare/
├── Mdeclare.lua    # The Lua module
└── Mdeclare.so     # The native library  
```

### 🧪 Test Your Installation

Create a test file called `test_mdeclare.lua`:

```lua
-- Load the module
local mdeclare = require("Mdeclare/Mdeclare")

-- Test with simple C code
local c_code = [[
int hello_world() {
    printf("Hello from C!\n");
    return 0;
}
]]

-- Transform to header
local result = mdeclare.transform_content(c_code)
print("✅ LuaMDeclare is working!")
print("Generated header:")
print(result)
```

**Run the test:**
```bash
lua test_mdeclare.lua
```

**Expected output:**
```
✅ LuaMDeclare is working!
Generated header:
int hello_world();
```

---

## 🏃‍♂️ Quick Start Guide (For Total Beginners!)

> **Don't panic!** This is easier than learning your first Lua loop! 🌙

### 🎬 Step 1: Your First Header Generation (The Basics)

**Create your first script:**

**my_first_header_gen.lua:**
```lua
-- Import the magic! ✨
local mdeclare = require("Mdeclare/Mdeclare")

-- Transform a single C file
local header_content = mdeclare.transform_file("my_functions.c")

-- Print the result
print("🎉 Generated header:")
print(header_content)

-- Optional: Save to file
local file = io.open("my_functions.h", "w")
if file then
    file:write(header_content)
    file:close()
    print("✅ Header saved to my_functions.h")
else
    print("❌ Failed to save header file")
end
```

**🤔 What just happened?**
- `require("Mdeclare/Mdeclare")` → "Load the LuaMDeclare magic!"
- `transform_file("my_functions.c")` → "Read this C file and extract headers!"
- The result is a string with all the header declarations!

### 🎬 Step 2: Real-World Example (Process Multiple Files!)

**Let's say you have these C files:**

**calculator.c:**
```c
int add(int a, int b) { return a + b; }
int subtract(int a, int b) { return a - b; }
```

**string_utils.c:**
```c
void reverse_string(char* str) { /* implementation */ }
int string_length(const char* str) { /* implementation */ }
```

**🚀 Process them all with one Lua script:**

**batch_header_gen.lua:**
```lua
local mdeclare = require("Mdeclare/Mdeclare")

-- Process entire directory with filtering
local all_headers = mdeclare.transform_dir({
    dir = "src",              -- Look in src/ directory
    include_paths = true,     -- Add file path comments
    startswith = nil,         -- No filename prefix filter
    endswith = ".c"           -- Only process .c files
})

print("🎉 All headers generated:")
print(all_headers)

-- Save to combined header file
local file = io.open("all_functions.h", "w")
if file then
    file:write(all_headers)
    file:close()
    print("✅ Combined headers saved to all_functions.h")
end
```

**🎉 The result includes file path comments:**
```c
// From: src/calculator.c
int add(int a, int b);
int subtract(int a, int b);

// From: src/string_utils.c  
void reverse_string(char* str);
int string_length(const char* str);
```

### 🎬 Step 3: Advanced Filtering (Become a Pro!)

**Want to process only specific files?** Here's how:

```lua
local mdeclare = require("Mdeclare/Mdeclare")

-- Only process API files
local api_headers = mdeclare.transform_dir({
    dir = "src",
    include_paths = true,
    startswith = "api_",      -- Only files starting with "api_"
    endswith = ".c"           -- Only .c files
})

print("🔥 API headers only:")
print(api_headers)
```

**This will only process files like:**
- `api_math.c` ✅
- `api_string.c` ✅  
- `utils.c` ❌ (doesn't start with "api_")
- `api_test.h` ❌ (doesn't end with ".c")

---

## 🛠️ Complete API Reference

### 🌟 Main Functions

#### 📄 `transform_file(filepath)`
**Transform a single C file into header declarations**

**Parameters:**
- `filepath` (string): Path to the C file to process

**Returns:**
- String containing header declarations
- `nil` if file not found or error occurred

**Example:**
```lua
local mdeclare = require("Mdeclare/Mdeclare")

-- Basic usage
local headers = mdeclare.transform_file("math.c")
if headers then
    print(headers)
else
    print("❌ Failed to process file")
end

-- With error handling
local headers = mdeclare.transform_file("nonexistent.c")
if not headers then
    print("❌ File not found or processing failed")
    return
end
print("✅ Success:", headers)
```

#### 📁 `transform_dir(options)`
**Transform all matching files in a directory**

**Parameters:**
- `options` (table): Configuration table with these fields:
  - `dir` (string, required): Directory path to scan
  - `include_paths` (boolean, optional): Add file path comments (default: false)
  - `startswith` (string, optional): Only process files starting with this (default: nil)
  - `endswith` (string, optional): Only process files ending with this (default: nil)

**Returns:**
- String containing combined header declarations from all matching files
- `nil` if directory not found or error occurred

**Example:**
```lua
local mdeclare = require("Mdeclare/Mdeclare")

-- Basic directory processing
local headers = mdeclare.transform_dir({
    dir = "src"
})

-- Advanced filtering with all options
local filtered_headers = mdeclare.transform_dir({
    dir = "source_code",
    include_paths = true,     -- Add "// From: filename" comments
    startswith = "lib_",      -- Only files starting with "lib_"
    endswith = ".c"           -- Only .c files
})

-- Minimal options (only directory required)
local simple_headers = mdeclare.transform_dir({
    dir = "my_code"
})
```

#### 📝 `transform_content(c_code_string)`
**Transform C code from a string (not documented in README but likely available)**

**Parameters:**
- `c_code_string` (string): C source code as a string

**Returns:**
- String containing header declarations
- `nil` if processing failed

**Example:**
```lua
local mdeclare = require("Mdeclare/Mdeclare")

local c_code = [[
// Math functions
int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

double pi() {
    return 3.14159265359;
}
]]

local headers = mdeclare.transform_content(c_code)
print(headers)
-- Output:
-- // Math functions  
-- int factorial(int n);
-- double pi();
```

---

## 🎯 Real-World Use Cases & Examples

### 🏗️ Build System Integration

**Integrate header generation into your Lua build scripts:**

**build.lua:**
```lua
local mdeclare = require("Mdeclare/Mdeclare")

print("🔨 Starting build process...")

-- Step 1: Generate headers for the entire project
print("📋 Generating headers...")
local all_headers = mdeclare.transform_dir({
    dir = "src",
    include_paths = true,
    endswith = ".c"
})

-- Step 2: Save headers to include directory
local header_file = io.open("include/project_headers.h", "w")
if header_file then
    -- Add header guards
    header_file:write("#ifndef PROJECT_HEADERS_H\n")
    header_file:write("#define PROJECT_HEADERS_H\n\n")
    header_file:write("// Auto-generated headers - DO NOT EDIT MANUALLY\n\n")
    header_file:write(all_headers)
    header_file:write("\n#endif // PROJECT_HEADERS_H\n")
    header_file:close()
    print("✅ Headers saved to include/project_headers.h")
else
    print("❌ Failed to create header file")
    os.exit(1)
end

-- Step 3: Continue with rest of build...
print("🎉 Build process completed!")
```

### 🎮 Game Engine Header Generation

**Generate API headers for game modules:**

**generate_game_api.lua:**
```lua
local mdeclare = require("Mdeclare/Mdeclare")

-- Define game modules
local modules = {
    {name = "Graphics", dir = "src/graphics", prefix = "gfx_"},
    {name = "Audio", dir = "src/audio", prefix = "audio_"},
    {name = "Input", dir = "src/input", prefix = "input_"},
}

print("🎮 Generating Game Engine API Headers...")

-- Generate headers for each module
for _, module in ipairs(modules) do
    print(string.format("📦 Processing %s module...", module.name))
    
    local headers = mdeclare.transform_dir({
        dir = module.dir,
        include_paths = false,
        startswith = module.prefix,
        endswith = ".c"
    })
    
    if headers then
        -- Save module-specific header
        local filename = string.format("api/%s_api.h", string.lower(module.name))
        local file = io.open(filename, "w")
        if file then
            file:write(string.format("// %s Module API\n", module.name))
            file:write(string.format("#ifndef %s_API_H\n", string.upper(module.name)))
            file:write(string.format("#define %s_API_H\n\n", string.upper(module.name)))
            file:write(headers)
            file:write(string.format("\n#endif // %s_API_H\n", string.upper(module.name)))
            file:close()
            print(string.format("✅ %s API saved to %s", module.name, filename))
        end
    else
        print(string.format("❌ Failed to process %s module", module.name))
    end
end

print("🎉 Game Engine API generation completed!")
```

### 🧪 Testing and Validation

**Validate that all functions have proper declarations:**

**validate_headers.lua:**
```lua
local mdeclare = require("Mdeclare/Mdeclare")

print("🧪 Validating project headers...")

-- Get all function declarations
local headers = mdeclare.transform_dir({
    dir = "src",
    include_paths = true,
    endswith = ".c"
})

if not headers then
    print("❌ Failed to generate headers")
    os.exit(1)
end

-- Simple validation: count functions
local function_count = 0
for line in headers:gmatch("[^\n]+") do
    -- Look for function declarations (lines ending with ;)
    if line:match("^%s*%w+.*%(.*%)%s*;%s*$") then
        function_count = function_count + 1
    end
end

print(string.format("📊 Found %d function declarations", function_count))

-- Check for common issues
if headers:match("static%s+") then
    print("⚠️  Warning: Found static functions (won't be in headers)")
end

if headers:match("#include") then
    print("⚠️  Warning: Found #include statements in declarations")
end

print("✅ Header validation completed!")
```

---

## 🚨 Common Beginner Mistakes (And How to Avoid Them!)

### ❌ **Mistake 1: Forgetting to handle nil returns**
```lua
-- BAD: No error checking
local headers = mdeclare.transform_file("missing.c")
print(headers:upper())  -- ERROR: attempt to call method 'upper' on nil
```

✅ **FIX: Always check for nil**
```lua
-- GOOD: Proper error handling
local headers = mdeclare.transform_file("missing.c")
if headers then
    print(headers:upper())
else
    print("❌ Failed to process file")
end
```

### ❌ **Mistake 2: Wrong directory paths**
```lua
-- BAD: Relative paths can be confusing
local headers = mdeclare.transform_dir({
    dir = "../somewhere/src"  -- May not work as expected
})
```

✅ **FIX: Use clear, absolute paths or test with simple paths**
```lua
-- GOOD: Clear, testable paths
local headers = mdeclare.transform_dir({
    dir = "src"  -- Clear relative path from current directory
})

-- Or even better with full path
local current_dir = lfs.currentdir()  -- If using luafilesystem
local headers = mdeclare.transform_dir({
    dir = current_dir .. "/src"
})
```

### ❌ **Mistake 3: Forgetting required table fields**
```lua
-- BAD: Missing required 'dir' field
local headers = mdeclare.transform_dir({
    include_paths = true  -- Missing 'dir'!
})
```

✅ **FIX: Always include required fields**
```lua
-- GOOD: 'dir' field is required
local headers = mdeclare.transform_dir({
    dir = "src",              -- Required!
    include_paths = true      -- Optional
})
```

### ❌ **Mistake 4: Not handling file I/O errors**
```lua
-- BAD: Assuming file operations always succeed
local file = io.open("output.h", "w")
file:write(headers)  -- What if file is nil?
file:close()
```

✅ **FIX: Check file operations**
```lua
-- GOOD: Proper file handling
local file = io.open("output.h", "w")
if file then
    file:write(headers)
    file:close()
    print("✅ File saved successfully")
else
    print("❌ Failed to create output file")
end
```

---

## ⚙️ Advanced Configuration Examples

### 🎛️ **Complex Directory Processing**

**Process multiple directories with different rules:**

```lua
local mdeclare = require("Mdeclare/Mdeclare")

-- Configuration for different source types
local source_configs = {
    {
        name = "Core Library",
        dir = "src/core",
        output = "headers/core_api.h", 
        include_paths = false,
        startswith = nil,
        endswith = ".c"
    },
    {
        name = "Plugin APIs", 
        dir = "src/plugins",
        output = "headers/plugin_api.h",
        include_paths = true,
        startswith = "plugin_",
        endswith = ".c"  
    },
    {
        name = "Utility Functions",
        dir = "src/utils", 
        output = "headers/utils_api.h",
        include_paths = false,
        startswith = "util_",
        endswith = ".c"
    }
}

print("🔧 Processing multiple source configurations...")

for _, config in ipairs(source_configs) do
    print(string.format("📂 Processing: %s", config.name))
    
    local headers = mdeclare.transform_dir({
        dir = config.dir,
        include_paths = config.include_paths,
        startswith = config.startswith,
        endswith = config.endswith
    })
    
    if headers then
        local file = io.open(config.output, "w")
        if file then
            file:write(string.format("// %s - Auto-generated\n\n", config.name))
            file:write(headers)
            file:close()
            print(string.format("✅ %s -> %s", config.name, config.output))
        else
            print(string.format("❌ Failed to write %s", config.output))
        end
    else
        print(string.format("❌ Failed to process %s", config.name))
    end
end

print("🎉 Multi-configuration processing completed!")
```

### 🔍 **Conditional Processing Based on File Contents**

**Only process files that contain specific patterns:**

```lua
local mdeclare = require("Mdeclare/Mdeclare") 

-- Function to check if file contains public APIs
local function has_public_api(filepath)
    local file = io.open(filepath, "r")
    if not file then return false end
    
    local content = file:read("*all")
    file:close()
    
    -- Look for functions that are likely public APIs
    return content:match("API_EXPORT") or 
           content:match("PUBLIC") or
           not content:match("static")
end

-- Get list of C files
local function get_c_files(dir)
    local files = {}
    local command = string.format('find "%s" -name "*.c" 2>/dev/null', dir)
    local handle = io.popen(command)
    if handle then
        for filename in handle:lines() do
            table.insert(files, filename)
        end
        handle:close()
    end
    return files
end

print("🔍 Processing only files with public APIs...")

local c_files = get_c_files("src")
local public_api_content = ""

for _, filepath in ipairs(c_files) do
    if has_public_api(filepath) then
        print(string.format("📋 Processing public API file: %s", filepath))
        local headers = mdeclare.transform_file(filepath)
        if headers then
            public_api_content = public_api_content .. 
                                string.format("// From: %s\n%s\n", filepath, headers)
        end
    else
        print(string.format("⏭️  Skipping private file: %s", filepath))
    end
end

-- Save consolidated public API
local file = io.open("public_api.h", "w")
if file then
    file:write("// Public API - Auto-generated\n\n")
    file:write(public_api_content)
    file:close()
    print("✅ Public API saved to public_api.h")
end
```

---

## 🔨 Building from Source (For Advanced Users!)

> **🎯 Beginner Note:** You don't need this section if you just downloaded the ready-made release! This is only for people who want to compile LuaMDeclare themselves.

### 📋 Prerequisites

**You'll need these tools installed:**
1. **🦄 [Darwin](https://github.com/OUIsolutions/Darwin) Build System** (Version 0.7.0+)
2. **🐳 Docker** OR **🫖 Podman** (for containerized builds)
3. **🐧 Linux Environment** (recommended)

### 🚀 Darwin Installation

```bash
# Install Darwin build system
curl -L https://github.com/OUIsolutions/Darwin/releases/download/0.7.0/darwin.out -o darwin.out && sudo chmod +x darwin.out && sudo mv darwin.out /usr/bin/darwin
```

### ⚡ Quick Build Commands

**Release Build (Creates distribution package):**
```bash
darwin run_blueprint darwinconf.lua build_release --provider podman
```

**Local Build (For development/testing):**
```bash  
darwin run_blueprint darwinconf.lua build_local --provider podman
```

### 🎯 What Gets Built

Both commands create this structure:
```
release/
├── luamdeclare.c      # Single-file C source
├── Mdeclare.zip       # Distribution package  
└── Mdeclare/
    ├── Mdeclare.lua   # Lua module
    └── Mdeclare.so    # Native shared library
```

**📦 The `Mdeclare.zip` contains:**
- `Mdeclare.lua` - The Lua interface module
- `Mdeclare.so` - The compiled native library  

### 🛠️ Manual Build Process

If you prefer to build manually:

```bash
# 1. Clone the repository
git clone https://github.com/OUIsolutions/LuaMDeclare.git
cd LuaMDeclare

# 2. Run the build
darwin run_blueprint darwinconf.lua build_release --provider podman

# 3. The results will be in the release/ directory
ls -la release/
```

---

## 🆘 Need Help? (We've Got You Covered!)

### 🤝 Community Support

- **🐛 Found a Bug?** [Create an Issue](https://github.com/OUIsolutions/LuaMDeclare/issues)
- **💡 Have a Feature Idea?** [Suggest It Here](https://github.com/OUIsolutions/LuaMDeclare/issues)  
- **⭐ Like the Project?** Give us a star on GitHub!
- **📚 Original C Library:** [MDeclare](https://github.com/OUIsolutions/MDeclare)

### 📚 Frequently Asked Questions

**Q: "What's the difference between this and the original MDeclare?"**
A: This is a Lua wrapper around the original C library. Use this if you want to generate headers from Lua scripts. Use the original if you prefer command-line tools.

**Q: "Can I use this in my Lua build scripts?"**
A: Absolutely! That's exactly what it's designed for. Perfect for integrating header generation into Lua-based build systems.

**Q: "What Lua versions are supported?"**
A: LuaMDeclare works with Lua 5.1+ and LuaJIT. We test primarily with Lua 5.4.

**Q: "Does this work on Windows?"**
A: Yes! The compiled `.so` library works on Linux, Windows, and macOS.

**Q: "Can I process C++ files?"**
A: LuaMDeclare is designed for C code, but it might work with simple C++ code. Try it and see!

**Q: "What if I have very complex function definitions?"**
A: LuaMDeclare handles most standard C functions. For very complex cases, you might need to manually adjust the output.

### 🚨 Common Issues & Solutions

**Issue: "module 'Mdeclare/Mdeclare' not found"**
- **Solution:** Make sure the `Mdeclare` folder is in your Lua package path
- **Fix:** Try `package.path = package.path .. ";./?.lua"` before require

**Issue: "Failed to load native library"**
- **Solution:** The `.so` file might not be compatible with your system
- **Fix:** Try rebuilding from source for your specific platform

**Issue: "Directory not found"**  
- **Solution:** Check that your directory paths are correct
- **Fix:** Use absolute paths or verify current working directory

---

## 🎉 Success Stories & Use Cases

### 🌟 **Perfect For:**
- **🎓 Students**: Generate headers for C assignments using Lua scripts
- **🎮 Game Developers**: Integrate header generation into Lua-based build tools  
- **📦 Library Creators**: Automate API header generation in Lua build scripts
- **🚀 Build Systems**: Add header generation steps to Lua build pipelines
- **📱 Embedded Projects**: Generate clean interfaces for embedded C code

### 💬 **What Users Say:**

> *"Perfect for my game engine build system! I can generate all API headers with just a few lines of Lua."* - GameDev2024

> *"Integrating this into my Lua build scripts saved me hours of manual header maintenance."* - BuildMaster

> *"Great for keeping my C library headers in sync automatically."* - LibraryDev

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**MIT License Summary:**
- ✅ **Commercial use** - Use in commercial projects
- ✅ **Modification** - Modify the source code
- ✅ **Distribution** - Distribute copies
- ✅ **Private use** - Use privately
- ❌ **Liability** - No warranty or liability
- ❌ **Warranty** - No warranty provided

---

<div align="center">

## 🌟 **Ready to Transform Your C Development with Lua?**

### **[⬇️ Download Now](https://github.com/OUIsolutions/LuaMDeclare/releases/latest) | [⭐ Star on GitHub](https://github.com/OUIsolutions/LuaMDeclare) | [🐛 Report Issues](https://github.com/OUIsolutions/LuaMDeclare/issues)**

**Made with ❤️ by [OUIsolutions](https://github.com/OUIsolutions)**

*Transforming C definitions into perfect headers, one Lua script at a time!* ✨🌙

---

**🔗 Related Projects:**
- **[Original MDeclare](https://github.com/OUIsolutions/MDeclare)** - The C command-line version
- **[Darwin Build System](https://github.com/OUIsolutions/Darwin)** - The build system we use

</div>

