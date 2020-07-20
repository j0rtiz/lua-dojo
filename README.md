# Lua Dojo
### [Reference](https://github.com/luarocks/hererocks)

1. Download and install TDM (mingw) in C:\
    > [tdm64-gcc-9.2.0.exe](https://github.com/jmeubank/tdm-gcc/releases/download/v9.2.0-tdm64-1/tdm64-gcc-9.2.0.exe)
1. Add TDM to $PATH
    > C:\TDM-GCC-64\bin
1. Install hererocks
    > pip install git+https://github.com/luarocks/hererocks
1. Install Lua, LuaRocks and apply patches
    > hererocks C:\Lua -l5.3 -rlatest --patch
1. Add Lua dir to $PATH
    > C:\Lua\bin
1. Install lfs module
    > luarocks install luafilesystem
