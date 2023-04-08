SuperStrict

Framework brl.basic

Import pub.win32
Import brl.filesystem

' Load all plugins.
Local plugins:Plugin[]
Local pluginFiles:String[] = LoadDir("plugins")

For Local fileName:String = EachIn pluginFiles
	' Load the plugin file.
	Local p:Plugin = Plugin.Load("plugins/" + fileName)

	' Expand the plugins array and add our instance to the end.
	plugins = plugins[..plugins.Length + 1]
	plugins[plugins.length - 1] = p
Next

' Create our initial string.
Local ourString:String = "Hello, World!"
Print "[initial] " + ourString

' Run each plugin on the string.
For local p:Plugin = EachIn plugins
	ourString = p.process(ourString)

	Print "[" + p.pluginName() + "] " + ourString
Next

Type Plugin
	Field path:String
	Field library:Int
	Field process:String(in:String)

	' Get just file name of the plugin.
	Method pluginName:String()
		Return StripDir(StripExt(Self.path))
	End Method

	Function Load:Plugin(path:String)
		Local this:Plugin = New Plugin

		this.path    = path
		this.library = LoadLibraryA(path)
		this.process = GetProcAddress(this.library, "process_string")

		Return this
	End Function
End Type
