:: Compile the main application.
bmk makeapp -r -h plugin_system.bmx

:: Compile both plugins.
bmk makelib -r downcase.bmx
bmk makelib -r reverse.bmx

:: Ensure plugin directory exists.
mkdir -p "plugins"

:: Copy compiled plugins to plugin directory.
cp "downcase.dll" "plugins/downcase.dll"
cp "reverse.dll" "plugins/reverse.dll"
