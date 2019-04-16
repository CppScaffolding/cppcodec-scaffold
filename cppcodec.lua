-- scaffold geniefile for cppcodec

cppcodec_script = path.getabsolute(path.getdirectory(_SCRIPT))
cppcodec_root = path.join(cppcodec_script, "cppcodec")

cppcodec_includedirs = {
	path.join(cppcodec_script, "config"),
	cppcodec_root,
}

cppcodec_libdirs = {}
cppcodec_links = {}
cppcodec_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { cppcodec_includedirs }
	end,

	_add_defines = function()
		defines { cppcodec_defines }
	end,

	_add_libdirs = function()
		libdirs { cppcodec_libdirs }
	end,

	_add_external_links = function()
		links { cppcodec_links }
	end,

	_add_self_links = function()
		links { "cppcodec" }
	end,

	_create_projects = function()

project "cppcodec"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		cppcodec_includedirs,
	}

	defines {}

	files {
		path.join(cppcodec_script, "config", "**.h"),
		path.join(cppcodec_root, "**.h"),
		path.join(cppcodec_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
