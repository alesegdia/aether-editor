AETHER_DIR = path.getabsolute("../module/aether")

dofile(path.join(AETHER_DIR, "scripts/util/util.lua"))

aetherConfig()

solution "aether-editor"
	startproject("aether-editor-game")
	location "../build/"
	configurations { "debug", "release" }
	platforms { "x32", "x64" }
	language "C++"
	
	aetherBuild()

	aetherProject("aether-editor-game-bin")
		debugdir ("..")
		targetdir ("../build")
		files {
			"../src/**.h",
			"../src/**.cpp",
						path.join(AETHER_DIR, "src/main/main.cpp")
		}
		includedirs {
			"../src/",			
		}



