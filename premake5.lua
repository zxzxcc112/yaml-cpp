project "yaml-cpp"
	kind "StaticLib"
	language "C"
	staticruntime "on"

	targetdir ("bin/" .. outputDir .. "%{prj.name}")
	objdir ("bin-int/" .. outputDir .. "%{prj.name}")

	files
	{
		"include/**",
		"src/**.h",
		"src/**.cpp"
	}

	includedirs
	{
		"include/"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"YAML_CPP_STATIC_DEFINE",
			"_CRT_SECURE_NO_WARNINGS"
		}

		disablewarnings
		{
			"4819"
		}
		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release or Distribution"
		runtime "Release"
		optimize "on"