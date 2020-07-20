local lfs = require "lfs"
local path = lfs.currentdir()
local files_path = {}
local launch_menu = {}

local function files(path)
  for name in lfs.dir(path) do
    if not name:match("@") and name ~= "." and name ~= ".." then
      local file_path = path .. "\\" .. name
      local mode = lfs.attributes(file_path, "mode")

      if mode == "directory" and name ~= "node_modules" and name ~= "src-cordova" and name ~= "dist" then
        files(file_path)
      end

      if name == "package.json" then
        table.insert(files_path, file_path)
      end
    end
  end
end

local function menu(files_path)
  for _, file_path in pairs(files_path) do
    local file = io.open(file_path, "r")

    for line in file:lines() do
      if line:match('"dev"') or line:match('"start:dev"') then
        local label = file_path:sub(path:len() + 2, file_path:len() - 13):gsub("-", " "):upper()
        local args = {"powershell.exe", "npm run " .. line:match('"([^"]+)": "([^"]+)"')}
        local cwd = file_path:sub(1, file_path:len() - 13)

        if label:match("\\APP") or label:match("\\M") then
          label = label:gsub("\\(.*)", " [APP]")
        elseif label:match("\\PAINEL") or label:match("\\PAA") then
          label = label:gsub("\\(.*)", " [PAINEL]")
        elseif label:match("\\CLIENT") then
          label = label:gsub("\\(.*)", " [APP]")
        elseif label:match("\\CORONAVIRUS") then
          label = label:gsub("\\(.*)", " [CORONAVIRUS]")
        elseif label:match("\\API") then
          label = label:gsub("\\(.*)", " [API]")
        end

        table.insert(launch_menu, {label = label, args = args, cwd = cwd})
      end
    end

    file:close()
  end
end

files(path)
menu(files_path)

for _, lm in pairs(launch_menu) do
  print(lm.label)
  print(lm.args[2])
  print(lm.cwd)
  print()
end

return launch_menu
