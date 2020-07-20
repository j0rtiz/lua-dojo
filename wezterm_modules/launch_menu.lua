local wezterm = require "wezterm"
local path = "C:\\Dev\\Govbr"
local ignored = {["node_modules"] = true, ["src-cordova"] = true, ["dist"] = true}
local files_path = {}
local launch_menu = {}

local function files(path)
  for _, name in ipairs(wezterm.glob("*", path)) do
    if not name:match("@") then
      local file_path = path .. "\\" .. name

      if not ignored[name] then
        files(file_path)
      end

      if name == "package.json" then
        table.insert(files_path, file_path)
      end
    end
  end
end

local function project(file_path)
  local suffixes = {
    ["\\APP"] = file_path:gsub("\\(.*)", " [APP]"),
    ["\\M"] = file_path:gsub("\\(.*)", " [APP]"),
    ["\\PAINEL"] = file_path:gsub("\\(.*)", " [PAINEL]"),
    ["\\PAA"] = file_path:gsub("\\(.*)", " [PAINEL]"),
    ["\\CLIENT"] = file_path:gsub("\\(.*)", " [APP]"),
    ["\\CORONAVIRUS"] = file_path:gsub("\\(.*)", " [CORONAVIRUS]"),
    ["\\API"] = file_path:gsub("\\(.*)", " [API]"),
    ["default"] = file_path .. " [API]"
  }

  for suffix in pairs(suffixes) do
    if file_path:match(suffix) then
      return suffixes[suffix]
    end
  end

  return suffixes.default
end

local function menu(files_path)
  for _, file_path in pairs(files_path) do
    local file = io.open(file_path, "r")

    for line in file:lines() do
      if line:match('"dev"') or line:match('"start:dev"') then
        local label = project(file_path:sub(path:len() + 2, file_path:len() - 13):gsub("-", " "):upper())
        local args = {"powershell.exe", "npm run " .. line:match('"([^"]+)": "([^"]+)"')}
        local cwd = file_path:sub(1, file_path:len() - 13)

        table.insert(launch_menu, {label = label, args = args, cwd = cwd})
      end
    end

    file:close()
  end
end

files(path)
menu(files_path)

return launch_menu
