AddCSLuaFile("sh_init.lua")
include("sh_init.lua")

local PLAYER = FindMetaTable("Player")
local ENTITY = FindMetaTable("Entity")

-- Create the table if it doesn't exist
if !sql.TableExists("permajobs_data") then
	sql.Query("CREATE TABLE permajobs_data(SteamID TEXT, Job INTEGER)")
end

function PLAYER:GetPermaJob()
	return sql.QueryValue("SELECT Job FROM permajobs_data WHERE SteamID='"..self:SteamID()"'")
end

function PLAYER:SetPermaJob(Job)
	if(type(Job) ~= "number" || !team.Valid(Job) || self:GetPermaJob == Job) then return end
	
	sql.Query("UPDATE permajobs_data SET Job="..Job.." WHERE SteamID='"..self:SteamID().."'")
end
