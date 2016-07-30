--[=====[ Bootloader

  This program is the OS startup. It loads the APIs and system programs.

--]=====]

local luaExt = ".lua"
local apiDir = "/apis/"

local function logSuccess(msg)
  print("[SUCCESS] "..msg)
end

local function logError(msg)
  print("[ ERROR ] "..msg)
end

local function loadAPI(file)
  if os.loadAPI(file) then
    logSuccess("API "..fs.getName(file).." loaded")
  else
    logError("API "..fs.getName(file).." not loaded")
  end  
end

-- Script run

print("Loading apis")
local apiFiles = fs.list(apiDir)
for _, file in ipairs(apiFiles) do
  loadAPI(file)
end