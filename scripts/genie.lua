AETHER_DIR = path.getabsolute("../module/aether")

dofile(path.join(AETHER_DIR, "scripts/util/util.lua"))

aetherConfig()

function imguiBackend()
	configuration { "backend-sdl" }
	files {
		"../module/imgui/backends/imgui_impl_sdl.h",
		"../module/imgui/backends/imgui_impl_sdl.cpp",
	}
	configuration { "backend-allegro" }
	files {
		"../module/imgui/backends/imgui_impl_allegro5.h",
		"../module/imgui/backends/imgui_impl_allegro5.cpp",
	}
end

solution "aether-editor"
	startproject("aether-editor-game")
	location "../build/"
	configurations { "debug", "release" }
	platforms { "x32", "x64" }
	language "C++"
	
	aetherBuild()

	aetherGameLib("aether-editor-game")
		debugdir ("..")
		targetdir ("../build")
		imguiBackend()
		files {
			"../src/**.h",
			"../src/**.cpp",
			"../module/imgui/*.h",
			"../module/imgui/*.cpp",
		}
		includedirs {
			"../module/imgui",
			"../module/imgui/backends/",			
		}

	aetherProject("aether-editor-game-bin")
		debugdir ("..")
		targetdir ("../build")
		imguiBackend()
		files {
			"../src/**.h",
			"../src/**.cpp",
			"../module/imgui/*.h",
			"../module/imgui/*.cpp",
		}

		includedirs {
			"../module/imgui",
			"../module/imgui/backends/",			
		}



