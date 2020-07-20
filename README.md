# Lua Dojo

1. Download and install TDM (mingw) in C:\
    > [tdm64-gcc-9.2.0.exe](https://github.com/jmeubank/tdm-gcc/releases/download/v9.2.0-tdm64-1/tdm64-gcc-9.2.0.exe)
2. Add TDM to $PATH
    > C:\TDM-GCC-64\bin
3. Install hererocks
    > pip install git+https://github.com/luarocks/hererocks
4. Install Lua, LuaRocks and apply patches
    > hererocks C:\Lua -l5.3 -rlatest --patch
5. Add Lua dir to $PATH
    > C:\Lua\bin\activate.bat
6. Install lfs module
    > luarocks install luafilesystem
