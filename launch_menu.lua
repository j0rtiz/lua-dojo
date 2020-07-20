local lfs = require "lfs"
local path = "C:\\Dev\\Govbr"
local files_path = {}
local launch_menu = {}

local function files(path)
  for name in lfs.dir(path) do
    if name ~= "." and name ~= ".." then
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
  for _, cwd in pairs(files_path) do
    local file = io.open(cwd, "r")

    for line in file:lines() do
      if line:match('"dev"') or line:match('"start:dev"') then
        local _, args = line:match('"([^"]+)": "([^"]+)"')

        table.insert(launch_menu, {cwd = cwd, args = args})
      end
    end

    file:close()
  end
end

files(path)
menu(files_path)

return launch_menu
