if SERVER then
	AddCSLuaFile("permajobs/cl_init.lua")
	include("permajobs/sv_init.lua")
elseif CLIENT then
	include("permajobs/cl_init.lua")
end