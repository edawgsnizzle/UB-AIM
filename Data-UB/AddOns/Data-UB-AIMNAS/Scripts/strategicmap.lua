--[[

This script has two functions "HandleQuestCodeOnSectorEntry" and "HandleQuestCodeOnSectorExit".
First function is executed when merc enter to the sector and second function is executed 
when merc leave from the sector.

]]

Items = {
	MONEY = 219,
}

SectorY = {
	MAP_ROW_A = 1,
	MAP_ROW_B = 2,
	MAP_ROW_C = 3,
	MAP_ROW_D = 4,
	MAP_ROW_E = 5,
	MAP_ROW_F = 6,
	MAP_ROW_G = 7,
	MAP_ROW_H = 8,
	MAP_ROW_I = 9,
	MAP_ROW_J = 10,
	MAP_ROW_K = 11,
	MAP_ROW_L = 12,
	MAP_ROW_M = 13,
	MAP_ROW_N = 14,
	MAP_ROW_O = 15,
	MAP_ROW_P = 16,
}

EventTypes = {
	EVENT_SET_BY_NPC_SYSTEM = 27,
}

qStatus = {
	QUESTNOTSTARTED =0,
	QUESTINPROGRESS = 1,
	QUESTDONE = 2,
}

Quests = 
{
	-- Quests ID							-- BinaryData\QUESTS.EDT Record
	QUEST_DELIVER_LETTER = 0,				-- Start quest 0, End quest 1   - Deliver Letter
	QUEST_FOOD_ROUTE = 1,					-- Start quest 2, End quest 3   - Food Route
	QUEST_KILL_TERRORISTS = 2,				-- Start quest 4, End quest 5   - Terrorists
	QUEST_KINGPIN_IDOL = 3,					-- Start quest 6, End quest 7   - Kingpin Chalice
	QUEST_KINGPIN_MONEY = 4,				-- Start quest 8, End quest 9   - Kingpin Money
	QUEST_RUNAWAY_JOEY = 5,					-- Start quest 10, End quest 11 - Runaway Joey
	QUEST_RESCUE_MARIA = 6,					-- Start quest 12, End quest 13 - Rescue Maria
	QUEST_CHITZENA_IDOL = 7,				-- Start quest 14, End quest 15 - Chitzena Chalice
	QUEST_HELD_IN_ALMA = 8,					-- Start quest 16, End quest 17 - Held in Alma
	QUEST_INTERROGATION = 9,				-- Start quest 18, End quest 19 - Interogation
	QUEST_ARMY_FARM = 10,					-- Start quest 20, End quest 21 - Hillbilly Problem
	QUEST_FIND_SCIENTIST = 11,				-- Start quest 22, End quest 23 - Find Scientist
	QUEST_DELIVER_VIDEO_CAMERA = 12,		-- Start quest 24, End quest 25 - Deliver Video Camera
	QUEST_BLOODCATS = 13,					-- Start quest 26, End quest 27 - Blood Cats
	QUEST_FIND_HERMIT = 14,					-- Start quest 28, End quest 29 - Find Hermit
	QUEST_CREATURES = 15,					-- Start quest 30, End quest 31 - Creatures
	QUEST_CHOPPER_PILOT = 16,				-- Start quest 32, End quest 33 - Find Chopper Pilot
	QUEST_ESCORT_SKYRIDER = 17,				-- Start quest 34, End quest 35 - Escort SkyRider
	QUEST_FREE_DYNAMO = 18,					-- Start quest 36, End quest 37 - Free Dynamo
	QUEST_ESCORT_TOURISTS = 19,				-- Start quest 38, End quest 39 - Escort Tourists
	QUEST_FREE_CHILDREN = 20,				-- Start quest 40, End quest 41 - Doreen
	QUEST_LEATHER_SHOP_DREAM = 21,			-- Start quest 42, End quest 43 - Leather Shop Dream
	QUEST_ESCORT_SHANK = 22,				-- Start quest 44, End quest 45 - Escort Shank
	-- UB Quests
	QUEST_DESTROY_MISSLES = 23,				 -- Start quest 46, End quest 47
	QUEST_FIX_LAPTOP = 24,					 -- Start quest 48, End quest 49
	QUEST_GET_RID_BLOODCATS_AT_BETTYS = 25,  -- Start quest 50, End quest 51
	QUEST_FIND_ANTIQUE_MUSKET_FOR_RAUL = 26, -- Start quest 52, End quest 53
	
	-- max Quests 254
}

Facts = {
	FACT_MUSEUM_ALARM_WENT_OFF = 278,
	FACT_KINGPIN_KNOWS_MONEY_GONE = 103,
	FACT_KINGPIN_DEAD = 308,
	FACT_ALL_TERRORISTS_KILLED   =      156,
}

local NOBODY = 254

History = {
	HISTORY_ENTERED_HISTORY_MODE = 0,
	HISTORY_HIRED_MERC_FROM_AIM = 1,
	HISTORY_HIRED_MERC_FROM_MERC = 2,
	HISTORY_MERC_KILLED = 3,
	HISTORY_SETTLED_ACCOUNTS_AT_MERC = 4,
	HISTORY_ACCEPTED_ASSIGNMENT_FROM_ENRICO = 5,
	HISTORY_CHARACTER_GENERATED = 6,
	HISTORY_PURCHASED_INSURANCE = 7,
	HISTORY_CANCELLED_INSURANCE = 8,
	HISTORY_INSURANCE_CLAIM_PAYOUT = 9,
	HISTORY_EXTENDED_CONTRACT_1_DAY = 10,
	HISTORY_EXTENDED_CONTRACT_1_WEEK = 11,
	HISTORY_EXTENDED_CONTRACT_2_WEEK = 12,
	HISTORY_MERC_FIRED = 13,
	HISTORY_MERC_QUIT = 14,
	HISTORY_QUEST_STARTED = 15,
	HISTORY_QUEST_FINISHED = 16,
	HISTORY_TALKED_TO_MINER = 17,
	HISTORY_LIBERATED_TOWN = 18, 
	HISTORY_CHEAT_ENABLED = 19,
	HISTORY_TALKED_TO_FATHER_WALKER = 20,
	HISTORY_MERC_MARRIED_OFF = 21,
	HISTORY_MERC_CONTRACT_EXPIRED = 22,
	HISTORY_RPC_JOINED_TEAM = 23,
	HISTORY_ENRICO_COMPLAINED = 24,
	HISTORY_WONBATTLE = 25,
	HISTORY_MINE_RUNNING_OUT = 26,
	HISTORY_MINE_RAN_OUT = 27,
	HISTORY_MINE_SHUTDOWN = 28,
	HISTORY_MINE_REOPENED = 29,
	HISTORY_DISCOVERED_TIXA = 30,
	HISTORY_DISCOVERED_ORTA = 31,
	HISTORY_GOT_ROCKET_RIFLES = 32,
	HISTORY_DEIDRANNA_DEAD_BODIES = 33,
	HISTORY_BOXING_MATCHES = 34,
	HISTORY_SOMETHING_IN_MINES = 35,
	HISTORY_DEVIN = 36,
	HISTORY_MIKE = 37,
	HISTORY_TONY = 38,
	HISTORY_KROTT = 39,
	HISTORY_KYLE = 40,
	HISTORY_MADLAB = 41,
	HISTORY_GABBY = 42,
	HISTORY_KEITH_OUT_OF_BUSINESS = 43,
	HISTORY_HOWARD_CYANIDE = 44,
	HISTORY_KEITH = 45,
	HISTORY_HOWARD = 46,
	HISTORY_PERKO = 47,
	HISTORY_SAM = 48,
	HISTORY_FRANZ = 49,
	HISTORY_ARNOLD = 50,
	HISTORY_FREDO = 51,
	HISTORY_RICHGUY_BALIME = 52,
	HISTORY_JAKE = 53,
	HISTORY_BUM_KEYCARD = 54,
	HISTORY_WALTER = 55,
	HISTORY_DAVE = 56,
	HISTORY_PABLO = 57,
	HISTORY_KINGPIN_MONEY = 58,
	HISTORY_WON_BOXING = 59,
	HISTORY_LOST_BOXING = 60,
	HISTORY_DISQUALIFIED_BOXING = 61,
	HISTORY_FOUND_MONEY = 62,
	HISTORY_ASSASSIN = 63,
	HISTORY_LOSTTOWNSECTOR = 64,
	HISTORY_DEFENDEDTOWNSECTOR = 65,
	HISTORY_LOSTBATTLE = 66,
	HISTORY_FATALAMBUSH = 67,
	HISTORY_WIPEDOUTENEMYAMBUSH = 68,
	HISTORY_UNSUCCESSFULATTACK = 69,
	HISTORY_SUCCESSFULATTACK = 70,
	HISTORY_CREATURESATTACKED = 71,
	HISTORY_KILLEDBYBLOODCATS = 72,
	HISTORY_SLAUGHTEREDBLOODCATS = 73,
	HISTORY_NPC_KILLED = 74,
	HISTORY_GAVE_CARMEN_HEAD = 75,
	HISTORY_SLAY_MYSTERIOUSLY_LEFT = 76,
	HISTORY_MERC_KILLED_CHARACTER = 77,
}

Profil = 
{                   
    MARIA = 88,
	ANGEL = 89,
	ELLIOT = 135,
	CONRAD = 70,
	CARMEN = 78,
	MADLAB = 146,
	ROBOT = 62,
}

Flags1 = 
{
	PROFILE_MISC_FLAG_RECRUITED = 1,
	PROFILE_MISC_FLAG_HAVESEENCREATURE = 2,
	PROFILE_MISC_FLAG_FORCENPCQUOTE = 4,
	PROFILE_MISC_FLAG_WOUNDEDBYPLAYER = 8,
	PROFILE_MISC_FLAG_TEMP_NPC_QUOTE_DATA_EXISTS = 16,
	PROFILE_MISC_FLAG_SAID_HOSTILE_QUOTE = 32,
	PROFILE_MISC_FLAG_EPCACTIVE = 64,
	PROFILE_MISC_FLAG_ALREADY_USED_ITEMS = 128,
}

SoldierClass = 
{                   
    SOLDIER_CLASS_NONE = 0,
	SOLDIER_CLASS_ADMINISTRATOR = 1,
	SOLDIER_CLASS_ELITE = 2,
	SOLDIER_CLASS_ARMY = 3,
}

CivGroup =
{
	REBEL_CIV_GROUP = 1,
	KINGPIN_CIV_GROUP = 2,
	WARDEN_CIV_GROUP = 11,
	BOUNTYHUNTER_CIV_GROUP = 25,
	SCIENTIST_GROUP = 27,
	RADAR_TECHNICIAN_GROUP = 28,
	AIRPORT_STAFF_GROUP = 29,
	BARRACK_STAFF_GROUP = 30,
	FACTORY_GROUP = 31,
	ADMINISTRATIVE_STAFF_GROUP = 32,
	LOYAL_CIV_GROUP = 33,
	BLACKMARKET_GROUP = 34,
}

Bodytype = 
{
	REGMALE = 0,
	BIGMALE = 1,
	STOCKYMALE = 2,
	REGFEMALE = 3,
	FATCIV = 11,
	MANCIV = 12,
	MINICIV = 13,
	DRESSCIV = 14,
	HATKIDCIV = 15,
	KIDCIV = 16,
	CRIPPLECIV = 17,
}

Skin = 
{
	PINKSKIN = 0,
	TANSKIN = 1,
	DARKSKIN = 2,
	BLACKSKIN = 3,
}

Hair = 
{
	WHITEHEAD = 0,
	BLACKHEAD = 1,
	BROWNHEAD = 2,
	BLONDEHEAD = 3,
	REDHEAD = 4,
}

Vest = 
{
	WHITEVEST = 0,
	GYELLOWSHIRT = 1,
	YELLOWVEST = 2,
	GREYVEST = 3,
	BROWNVEST = 4,
	PURPLESHIRT = 5,
	BLUEVEST = 6,
	JEANVEST = 7,
	GREENVEST = 8,
	REDVEST = 9,
	BLACKSHIRT = 10,
}

Pants = 
{
	BLUEPANTS = 0,
	BLACKPANTS = 1,
	JEANPANTS = 2,
	TANPANTS = 3,
	BEIGEPANTS = 4,
	GREENPANTS = 5,
}

local gsRobotGridNo

function HandleQuestCodeOnSectorEntry( sNewSectorX, sNewSectorY, bNewSectorZ )

	if ( sNewSectorX == 13 and sNewSectorY == 6 and bNewSectorZ == 0 ) then
		SetKeyProfile (UB_GetTexID(),true)
		SetKeyProfile (UB_GetBettyID(),true)
	end

	if ( CheckFact( Facts.FACT_ALL_TERRORISTS_KILLED, 0 ) == true ) then
		SetCharacterSectorX(Profil.CARMEN, 0)
		SetCharacterSectorY(Profil.CARMEN, 0)
		SetCharacterSectorZ(Profil.CARMEN, 0)
	end

end

function HandleQuestCodeOnSectorExit( sOldSectorX, sOldSectorY, bOldSectorZ )

local pSoldier

-- JA2
--[[
	if ( sOldSectorX == iniKINGPIN_MONEY_SECTOR_X and sOldSectorY == iniKINGPIN_MONEY_SECTOR_Y and bOldSectorZ == iniKINGPIN_MONEY_SECTOR_Z ) then
		CheckForKingpinsMoneyMissing( true )
	end

	if ( sOldSectorX == 13 and sOldSectorY == SectorY.MAP_ROW_H and bOldSectorZ == 0 and CheckFact( Facts.FACT_CONRAD_SHOULD_GO,0 ) == true) then
		-- remove Conrad from the map
		SetCharacterSectorX(Profil.CONRAD, 0)
		SetCharacterSectorY(Profil.CONRAD, 0)
	end

	if ( sOldSectorX == iniHOSPITAL_SECTOR_X and sOldSectorY == iniHOSPITAL_SECTOR_Y and bOldSectorZ == iniHOSPITAL_SECTOR_Z ) then
		CheckForMissingHospitalSupplies()
	end

	-- reset the state of the museum alarm for Eldin's quotes
	SetFactFalse( Facts.FACT_MUSEUM_ALARM_WENT_OFF )
]]	
	
	-- UB
	
	if ( sOldSectorX == 7 and sOldSectorY == SectorY.MAP_ROW_H and bOldSectorZ == 0 ) then
		-- remove Jerry from the map
		SetCharacterSectorX( UB_GetJerryID(), 0)
		SetCharacterSectorY( UB_GetJerryID(), 0)
	end
	
	-- if the player is leaving a sector with  Tex in it
	if ( sOldSectorX == CheckCharacterSectorX(UB_GetTexID()) and sOldSectorY == CheckCharacterSectorY(UB_GetTexID()) and bOldSectorZ == 0 and CheckLastDateSpokenTot( UB_GetTexID() ) > 0 ) then
	
		pSoldier = FindSoldierByProfileID( UB_GetTexID() ) -- TEX

		-- if the npc isnt on the players team AND the player has never spoken to them
		if ( pSoldier == nil and CheckLastDateSpokenTot( UB_GetTexID() ) > 0 ) then
			
			--remove Tex from the map
			SetCharacterSectorX( UB_GetTexID(), 0)
			SetCharacterSectorY( UB_GetTexID(), 0)
		end
	end
	
	-- if the player is leaving a sector with  John kulba in it
	if ( sOldSectorX == CheckCharacterSectorX(UB_GetJohnID()) and sOldSectorY == CheckCharacterSectorY(UB_GetJohnID()) and bOldSectorZ == 0 and CheckLastDateSpokenTot( UB_GetJohnID() ) > 0 ) then
	
		pSoldier = FindSoldierByProfileID( UB_GetJohnID() ) -- John

		-- if the npc isnt on the players team AND the player has never spoken to them
		if ( pSoldier == nil and CheckLastDateSpokenTot( UB_GetJohnID() ) > 0 ) then
			
			--remove Tex from the map
			SetCharacterSectorX( UB_GetJohnID(), 0)
			SetCharacterSectorY( UB_GetJohnID(), 0)
		end
	end
	
	-- if the player is leaving a sector with  Manuel in it
	if ( sOldSectorX == CheckCharacterSectorX(UB_GetManuelID()) and sOldSectorY == CheckCharacterSectorY(UB_GetManuelID()) and bOldSectorZ == 0 and CheckLastDateSpokenTot( UB_GetManuelID() ) > 0 ) then
	
		pSoldier = FindSoldierByProfileID( UB_GetManuelID() ) -- Manuel

		-- if the npc isnt on the players team AND the player has never spoken to them
		if ( pSoldier == nil and CheckLastDateSpokenTot( UB_GetManuelID() ) > 0 ) then
			
			--remove Tex from the map
			SetCharacterSectorX( UB_GetManuelID(), 0)
			SetCharacterSectorY( UB_GetManuelID(), 0)
		end
	end

end

-- text colours
FontColour =
{
	FONT_MCOLOR_DKWHITE = 134,
	FONT_MCOLOR_LTYELLOW = 144,
	FONT_MCOLOR_RED = 163,
	FONT_MCOLOR_DKRED = 164,
	FONT_MCOLOR_LTGREEN = 184,
}

-- these numbers aren't used in the code - we only use them in LUA
Languages =
{
	LANGUAGE_ENGLISH = 0,
	LANGUAGE_GERMAN = 1,
	LANGUAGE_RUSSIAN = 2,
	LANGUAGE_DUTCH = 3,
	LANGUAGE_POLISH = 4,
	LANGUAGE_FRENCH = 5,
	LANGUAGE_ITALIAN = 6,
	LANGUAGE_CHINESE = 7,
}

-- We have an array of 1000 signed integers that a modder can use to set whatever data he wants.
-- We simply set up some enums here to make it easier for us to remember what is what
ModSpecificFacts =
{
	-- |||||||||||||||||||||||||||||||||| factories |||||||||||||||||||||||||||||||||||||
	-- |||||||||||||||||||||||||||||||||| factories |||||||||||||||||||||||||||||||||||||
}

FactorySpecialValues =
{
	FACTORY_PROGRESS_DRASSEN_TSHIRTFACTORY_UPGRADE = 6,
}

-- sSectorX, sSectorY and bSectorZ indicate the sector coordinates
-- usFacilityType is facility number from FacilitTypes.xml
-- usProductionNumber denotes which FACTORY of the facility this is for
-- sProgressLeft is the progress to be saved. 
--
-- As factories can be added or removed in the xml at will, we can't hardcode their progress in the savegame.
-- Therefore we let the modder store their progress in here via LUAFacts into the modder-administered part of the savefile.
-- We also want factories to be deactivated initially (so the player doesn't suddenly lose money if he takes their sector). Initially all values are 0.
-- In the code, values < 0 indicate a factory is offline, >= 0 online.
-- We thus add '1' to every value, so we store the progress as 1 + sProgressLeft, this means a luafact value of <= 0 is offline, > 0 is online
--
-- We also use the Getter to check for other conditions, like quest progress. For example, even if we control Drassen, we can only use the T-Shirt factory once Doreen is gone.
-- We achieve that by returning a value < -10 if these extra conditions are not satisfied.
-- The code checks that too and won't allow us to even turn a factory on in this case, so the player knows he has something else to do first.
function SetFactoryLeftoverProgress(sSectorX, sSectorY, bSectorZ, usFacilityType, usProductionNumber, sProgressLeft)
	
end

function GetFactoryLeftoverProgress(sSectorX, sSectorY, bSectorZ, usFacilityType, usProductionNumber, sProgressLeft)
	
	CANT_ACTIVATE_FACTORY = -20
	
	val = -1
	
	return val

end

-- this function is called whenever we liberate a sector. If fFirstTime is true, this is the first time we liberate this sector
function HandleSectorLiberation( sNewSectorX, sNewSectorY, bNewSectorZ, fFirstTime )
	
end

-- this function is called whenever we recruit a RPC
function RecruitRPCAdditionalHandling( usProfile )
	
end

-- this function is called whenever we enter a sector in tactical
function HandleSectorTacticalEntry( sSectorX, sSectorY, bSectorZ, fHasEverBeenPlayerControlled )
	
end

-- this function is called whenever we enter a sector in tactical
function HandleSectorTacticalEntry( sSectorX, sSectorY, bSectorZ, fHasEverBeenPlayerControlled )
	
	currenthour = GetWorldHour()
	
	if ( gubQuest( Quests.QUEST_KINGPIN_ANGEL_MARIA ) == qStatus.QUESTINPROGRESS ) then
	
		-- Flugente: if the bounty hunter quest is active, add bounty hunters to sectors (location determined on quest start)
		if ( (CheckFact( Facts.FACT_BOUNTYHUNTER_KILLED_1, 0 ) == false) or (CheckFact( Facts.FACT_BOUNTYHUNTER_KILLED_2, 0 ) == false) and (bSectorZ == 0) ) then
			
			sector 		   = SECTOR(sSectorX, sSectorY)
			sector_hunter1 = GetFact( Facts.FACT_BOUNTYHUNTER_SECTOR_1 )
			sector_hunter2 = GetFact( Facts.FACT_BOUNTYHUNTER_SECTOR_2 )
			
			if ( (sector == sector_hunter1) and (CheckFact( Facts.FACT_BOUNTYHUNTER_KILLED_1, 0 ) == false)  ) then
				
				hostile = 0
				if ( (CheckFact( Facts.FACT_BOUNTYHUNTER_KILLED_2, 0 ) == true)  ) then
					hostile = 1
				end
				
				CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ADMINISTRATOR, 	13000, hostile)
				CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ARMY, 			7447,  hostile)
				CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ARMY, 			13032, hostile)
				CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			19291, hostile)
				
				-- dont spawn in deep water (B14) 
				if (sSectorX == 14 and sSectorY == 2) then
					CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			16533, hostile)
				-- dont spawn in bush (B8) 
				elseif 	(sSectorX == 8 and sSectorY == 2) then
				    CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			13239, hostile)
				-- dont spawn in cornfield (B12)
				elseif 	(sSectorX == 12 and sSectorY == 2) then
				    CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			13860, hostile)
				-- spawn at common GridNo in all other possible sectors
				else
					CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			13557, hostile)
				end
			end
			
			if ( (sector == sector_hunter2) and (CheckFact( Facts.FACT_BOUNTYHUNTER_KILLED_2, 0 ) == false) ) then
				
				hostile = 0
				if ( (CheckFact( Facts.FACT_BOUNTYHUNTER_KILLED_1, 0 ) == true)  ) then
					hostile = 1
				end
				
				CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ADMINISTRATOR, 	13000, hostile)
				CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ARMY, 			7447,  hostile)
				CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ARMY, 			13032, hostile)
				CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			19291, hostile)
				
				-- dont spawn in deep water (B14) 
				if (sSectorX == 14 and sSectorY == 2) then
					CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			16533, hostile)
				-- dont spawn in bush (B8) 
				elseif 	(sSectorX == 8 and sSectorY == 2) then
				    CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			13239, hostile)
				-- dont spawn in cornfield (B12)
				elseif 	(sSectorX == 12 and sSectorY == 2) then
				    CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			13860, hostile)
				-- spawn at common GridNo in all other possible sectors		
				else
					CreateArmedCivilain(CivGroup.BOUNTYHUNTER_CIV_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 			13557, hostile)
				end
			end
		end
		
	end
	
	-- Flugente: if this sector has not yet been liberated by the player, there might be some civilian enemy personnel here
	-- the idea is that these people are government employed, and won't stay around once you take the sector
	-- parameters of CreateCivilian:
	-- - tile where person should be created on the map
	-- - civilian group they should belong to (see also CivGRoupNames.xml)
	-- - number of the merchant the civilian should be (-1 for no merchant)
	-- - bodytype
	-- - vest colour (-1 for random)
	-- - pants colour (-1 for random)
	-- - hair colour (-1 for random)
	-- - skin colour (-1 for random)
	-- - optional item 1 (-1 for nothing)
	-- - optional item 2 (-1 for nothing)
	-- - optional item 3 (-1 for nothing)
	-- - optional item 4 (-1 for nothing
	
	if ( fHasEverBeenPlayerControlled == false ) then
		-- surface sectors
		if ( bSectorZ == 0 ) then
			-- F10 Central SAM
			if ( sSectorX == 10 and sSectorY == SectorY.MAP_ROW_F ) then
				CreateCivilian(80103, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
				CreateCivilian(74020, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
				CreateCivilian(79045, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.REGMALE, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 8, -1, -1)
			-- K14 Rocket Facility SAM
			elseif ( sSectorX == 14 and sSectorY == SectorY.MAP_ROW_K ) then
				CreateCivilian(74658, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 8, -1, -1)
				CreateCivilian(65331, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.REGFEMALE, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
				CreateCivilian(64594, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.REGMALE, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 8, -1, -1)
			-- J13 Power Station
			elseif ( sSectorX == 13 and sSectorY == SectorY.MAP_ROW_J ) then
				CreateCivilian(64984, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.REGFEMALE, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
				CreateCivilian(74699, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 8, -1, -1)
				CreateCivilian(66771, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 8, -1, -1)
				CreateCivilian(65726, CivGroup.FACTORY_GROUP, -1, Bodytype.REGMALE, Vest.YELLOWVEST, Pants.TANPANTS, -1, -1, -1, -1, -1, -1)
			-- K15 Complex Surface
			elseif ( sSectorX == 15 and sSectorY == SectorY.MAP_ROW_K ) then
				CreateCivilian(56327, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
				CreateCivilian(67491, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.REGMALE, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
				CreateCivilian(68256, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 8, -1, -1)
				CreateCivilian(61782, CivGroup.SCIENTIST_GROUP, -1, Bodytype.MANCIV, Vest.WHITEVEST, Pants.BEIGEPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(65714, CivGroup.ADMINISTRATIVE_STAFF_GROUP, -1, Bodytype.DRESSCIV, Vest.PURPLESHIRT, Pants.BLUEPANTS, Hair.WHITEHEAD, -1, -1, -1, -1, -1)
			-- E13 Sardena Barracks
			elseif ( sSectorX == 13 and sSectorY == SectorY.MAP_ROW_E ) then
				CreateCivilian(54508, CivGroup.ADMINISTRATIVE_STAFF_GROUP, -1, Bodytype.MINICIV, Vest.GREENVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(73977, CivGroup.ADMINISTRATIVE_STAFF_GROUP, -1, Bodytype.DRESSCIV, Vest.GREENVEST, Pants.GREENPANTS, Hair.WHITEHEAD, -1, -1, -1, -1, -1)
				CreateCivilian(53108, CivGroup.BARRACK_STAFF_GROUP, -1, Bodytype.REGMALE, Vest.GREENVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(56645, CivGroup.BARRACK_STAFF_GROUP, -1, Bodytype.REGFEMALE, Vest.GREENVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(62434, CivGroup.BARRACK_STAFF_GROUP, -1, Bodytype.BIGMALE, Vest.GREENVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(51632, CivGroup.BARRACK_STAFF_GROUP, -1, Bodytype.REGMALE, Vest.GREENVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(72900, CivGroup.BARRACK_STAFF_GROUP, -1, Bodytype.MANCIV, Vest.GREENVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(47677, CivGroup.BARRACK_STAFF_GROUP, -1, Bodytype.REGMALE, Vest.GREENVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(44456, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
				CreateCivilian(45551, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
				CreateCivilian(60238, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 635, -1, -1)
			-- E14 Sardena Airport
			elseif ( sSectorX == 14 and sSectorY == SectorY.MAP_ROW_E ) then
				--CreateCivilian(71753, CivGroup.AIRPORT_STAFF_GROUP, -1, Bodytype.BIGMALE, Vest.BROWNVEST, Pants.JEANPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(36145, CivGroup.RADAR_TECHNICIAN_GROUP, -1, Bodytype.MANCIV, Vest.GREYVEST, Pants.GREENPANTS, -1, -1, 210, 8, -1, -1)
				--CreateCivilian(87243, CivGroup.AIRPORT_STAFF_GROUP, -1, Bodytype.REGFEMALE, Vest.BROWNVEST, Pants.JEANPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(88349, CivGroup.AIRPORT_STAFF_GROUP, -1, Bodytype.REGMALE, Vest.BROWNVEST, Pants.JEANPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(45197, CivGroup.AIRPORT_STAFF_GROUP, -1, Bodytype.REGFEMALE, Vest.BROWNVEST, Pants.JEANPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(53766, CivGroup.AIRPORT_STAFF_GROUP, -1, Bodytype.REGMALE, Vest.BROWNVEST, Pants.JEANPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(49512, CivGroup.AIRPORT_STAFF_GROUP, -1, Bodytype.FATCIV, Vest.BROWNVEST, Pants.JEANPANTS, Hair.WHITEHEAD, -1, -1, -1, -1, -1)
				--CreateCivilian(56717, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(56722, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(71877, CivGroup.LOYAL_CIV_GROUP, -1, Bodytype.BIGMALE, Vest.BROWNVEST, Pants.BLACKPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(62154, CivGroup.LOYAL_CIV_GROUP, -1, Bodytype.REGMALE, -1, -1, -1, -1, 195, -1, -1, -1)
				--CreateCivilian(65399, CivGroup.LOYAL_CIV_GROUP, -1, Bodytype.REGMALE, -1, -1, -1, -1, 195, -1, -1, -1)
			-- F13 Sardena Residential
			elseif ( sSectorX == 13 and sSectorY == SectorY.MAP_ROW_F ) then
				--CreateCivilian(49820, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(49453, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
				--CreateCivilian(53054, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(52334, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(26828, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
				--CreateCivilian(17109, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(13511, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(31565, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
			-- F14 Sardena Industrial
			elseif ( sSectorX == 14 and sSectorY == SectorY.MAP_ROW_F ) then
				--CreateCivilian(72512, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(63950, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
				--CreateCivilian(59284, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(50269, CivGroup.FACTORY_GROUP, -1, Bodytype.REGMALE, Vest.YELLOWVEST, Pants.TANPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(40436, CivGroup.FACTORY_GROUP, -1, Bodytype.REGFEMALE, Vest.YELLOWVEST, Pants.TANPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(40083, CivGroup.FACTORY_GROUP, -1, Bodytype.REGMALE, Vest.YELLOWVEST, Pants.TANPANTS, -1, -1, -1, -1, -1, -1)
			-- G14 Sardena Hospital
			elseif ( sSectorX == 14 and sSectorY == SectorY.MAP_ROW_G ) then
				--CreateCivilian(84076, CivGroup.ADMINISTRATIVE_STAFF_GROUP, -1, Bodytype.MINICIV, Vest.PURPLESHIRT, Pants.BLUEPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(85501, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(92702, CivGroup.LOYAL_CIV_GROUP, -1, Bodytype.FATCIV, -1, -1, -1, -1, 195, -1, -1, -1)
				--CreateCivilian(86235, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(75426, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(23230, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
				--CreateCivilian(27540, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(37977, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(42297, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
			-- I10 Varrez
			elseif ( sSectorX == 10 and sSectorY == SectorY.MAP_ROW_I ) then
				--CreateCivilian(49519, CivGroup.ADMINISTRATIVE_STAFF_GROUP, -1, Bodytype.MINICIV, Vest.PURPLESHIRT, Pants.BLUEPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(85438, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(66074, CivGroup.LOYAL_CIV_GROUP, -1, Bodytype.FATCIV, -1, -1, -1, -1, 195, -1, -1, -1)
				--CreateCivilian(70395, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(83374, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(63892, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
				--CreateCivilian(69678, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(75056, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(32286, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
			-- I11 Varrez
			elseif ( sSectorX == 11 and sSectorY == SectorY.MAP_ROW_I ) then
				--CreateCivilian(93720, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(86172, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(85823, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(76496, CivGroup.LOYAL_CIV_GROUP, -1, Bodytype.REGMALE, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(67512, CivGroup.LOYAL_CIV_GROUP, -1, Bodytype.BIGMALE, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(62464, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(34793, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
			-- H11 Varrez
			elseif ( sSectorX == 11 and sSectorY == SectorY.MAP_ROW_H ) then
				--CreateCivilian(49142, CivGroup.BARRACK_STAFF_GROUP, -1, Bodytype.REGMALE, Vest.GREENVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(75485, CivGroup.LOYAL_CIV_GROUP, -1, Bodytype.BIGMALE, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(71471, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(90596, CivGroup.LOYAL_CIV_GROUP, -1, -1, -1, -1, -1, -1, 195, -1, -1, -1)
			end
		-- sublevel 1
		elseif ( bSectorZ == 1 ) then
			-- Orta
			if ( sSectorX == 4 and sSectorY == SectorY.MAP_ROW_K ) then
				CreateCivilian(14494, CivGroup.ADMINISTRATIVE_STAFF_GROUP, -1, Bodytype.MINICIV, Vest.PURPLESHIRT, Pants.BLUEPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(13062, CivGroup.SCIENTIST_GROUP, -1, Bodytype.MANCIV, Vest.WHITEVEST, Pants.BEIGEPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(13167, CivGroup.SCIENTIST_GROUP, -1, Bodytype.FATCIV, Vest.WHITEVEST, Pants.BEIGEPANTS, Hair.WHITEHEAD, -1, -1, -1, -1, -1)
				CreateCivilian(12048, CivGroup.SCIENTIST_GROUP, -1, Bodytype.REGMALE, Vest.WHITEVEST, Pants.BEIGEPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(9827, CivGroup.FACTORY_GROUP, -1, Bodytype.BIGMALE, Vest.YELLOWVEST, Pants.TANPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(10007, CivGroup.FACTORY_GROUP, -1, Bodytype.REGMALE, Vest.YELLOWVEST, Pants.TANPANTS, -1, -1, -1, -1, -1, -1)
				CreateCivilian(17211, CivGroup.FACTORY_GROUP, -1, Bodytype.BIGMALE, Vest.YELLOWVEST, Pants.TANPANTS, -1, -1, -1, -1, -1, -1)
			-- Tixa
			elseif ( sSectorX == 9 and sSectorY == SectorY.MAP_ROW_J ) then
				CreateCivilian(12875, CivGroup.WARDEN_CIV_GROUP, -1, Bodytype.REGFEMALE, Vest.BROWNVEST, Pants.BLACKPANTS, -1, -1, 213, 298, 1625, -1)
				CreateCivilian(12096, CivGroup.WARDEN_CIV_GROUP, -1, Bodytype.BIGMALE, Vest.BROWNVEST, Pants.BLACKPANTS, -1, -1, 213, 298, 1625, -1)
				CreateCivilian(7287, CivGroup.WARDEN_CIV_GROUP, -1, Bodytype.REGMALE, Vest.BROWNVEST, Pants.BLACKPANTS, -1, -1, 213, 298, 1625, -1)
				CreateCivilian(5843, CivGroup.WARDEN_CIV_GROUP, -1, Bodytype.BIGMALE, Vest.BROWNVEST, Pants.BLACKPANTS, -1, -1, 213, 298, 1625, -1)
				CreateCivilian(5378, CivGroup.WARDEN_CIV_GROUP, -1, Bodytype.MANCIV, Vest.BROWNVEST, Pants.BLACKPANTS, -1, -1, 213, 298, 1625, -1)
			end
		end
	end
	
	-- add merchants
	if ( bSectorZ == 0 ) then
		-- I10 Varrez
		if ( sSectorX == 10 and sSectorY == SectorY.MAP_ROW_I) then
		
			if ( currenthour > 7 and currenthour < 20 ) then
			
				if ( GetTownLoyaltyRating(2) > 0 ) then
					-- wine store
				--CreateCivilian(85537, 0, 55, Bodytype.REGFEMALE, -1, -1, -1, -1, -1, -1, -1, -1)
				end
				
				-- general store
				CreateCivilian(85537, 0, 41, Bodytype.MANCIV, -1, -1, -1, -1, -1, -1, -1, -1)
					
			end
			
		-- I11 Varrez
		elseif ( sSectorX == 11 and sSectorY == SectorY.MAP_ROW_I) then
		
			if ( currenthour > 7 and currenthour < 20 ) then
			
				-- wine store
				-- general store - both traders use the same inventory
				CreateCivilian(84739, 0, 42, Bodytype.DRESSCIV, Vest.GREYVEST, -1, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(12878, 0, 42, Bodytype.DRESSCIV, Vest.YELLOWVEST, Pants.BLUEPANTS, -1, -1, -1, -1, -1, -1)
			
			end
			
		-- Sardena F14
		elseif ( sSectorX == 14 and sSectorY == SectorY.MAP_ROW_F) then
		
			if ( currenthour > 8 and currenthour < 20 ) then
			
				-- wine store
				CreateCivilian(63226, 0, 57, Bodytype.MANCIV, Vest.JEANVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				--CreateCivilian(16055, 0, 57, Bodytype.REGFEMALE, Vest.JEANVEST, Pants.GREENPANTS, -1, -1, -1, -1, -1, -1)
				-- armour store
				CreateCivilian(55323, 0, 67, Bodytype.MINICIV, Vest.WHITEVEST, -1, Hair.WHITEHEAD, -1, -1, -1, -1, -1)
				-- restaurant
				CreateCivilian(65004, 0, 49, Bodytype.MINICIV, Vest.GYELLOWSHIRT, Pants.BEIGEPANTS, -1, -1, -1, -1, -1, -1)
				-- Bar
				CreateCivilian(74701, 0, 59, Bodytype.MANCIV, Vest.GYELLOWSHIRT, Pants.BEIGEPANTS, -1, -1, -1, -1, -1, -1)
				-- general store
				CreateCivilian(71427, 0, 43, Bodytype.DRESSCIV, -1, -1, -1, -1, -1, -1, -1, -1)
				-- gas station
				CreateCivilian(33646, 0, 51, Bodytype.MANCIV, -1, -1, -1, -1, -1, -1, -1, -1)
			
			end
			
		-- Sardena F13
		elseif ( sSectorX == 13 and sSectorY == SectorY.MAP_ROW_F) then
		
			if ( currenthour > 7 and currenthour < 22 ) then
			
				-- general store
				--CreateCivilian(12430, 0, 44, Bodytype.BIGMALE, -1, -1, -1, -1, -1, -1, -1, -1)
				-- Cafe
				CreateCivilian(48377, 0, 53, Bodytype.MINICIV, -1, -1, -1, -1, -1, -1, -1, -1)
				-- tool shop
				--CreateCivilian(8362, 0, 61, Bodytype.REGFEMALE, -1, -1, -1, -1, -1, -1, -1, -1)
			
			end
			
		-- E14 Airport
		elseif ( sSectorX == 14 and sSectorY == SectorY.MAP_ROW_E) then
		
			if ( currenthour > 7 and currenthour < 19 ) then
			
				-- Bar cafe
				CreateCivilian(65037, 0, 53, Bodytype.MANCIV, Vest.GYELLOWSHIRT, Pants.BEIGEPANTS, -1, -1, -1, -1, -1, -1)
				
			end

		-- Hospital G14	
		elseif ( sSectorX == 14 and sSectorY == SectorY.MAP_ROW_G) then
		
			if ( currenthour > 7 and currenthour < 22 ) then
			
				-- cafe
				CreateCivilian(37972, 0, 52, Bodytype.MINICIV, -1, -1, -1, -1, -1, -1, -1, -1)
				-- hospital cafe
				CreateCivilian(90551, 0, 54, Bodytype.MINICIV, -1, -1, -1, -1, -1, -1, -1, -1)
				
			end
			
		-- Mountain pass	
		elseif ( sSectorX == 12 and sSectorY == SectorY.MAP_ROW_H) then
		
			if ( currenthour > 7 and currenthour < 19 ) then
			
				-- restaurant
				--CreateCivilian(63899, 0, 51, Bodytype.MINICIV, -1, -1, -1, -1, -1, -1, -1, -1)
				
			end
			
		-- San Mona
		elseif ( sSectorX == 6 and sSectorY == SectorY.MAP_ROW_C) then
			-- only add merchants if Kingpin is alive and not hostile towards us
			if ( (CheckFact( Facts.FACT_KINGPIN_DEAD, 0 ) == false) and
			(CheckFact( Facts.FACT_KINGPIN_IS_ENEMY, 0 ) == false) and 
			(CheckMercIsDead ( Profil.KINGPIN ) == false) ) then
			
				if ( currenthour > 7 and currenthour < 19 ) then
				
					-- restaurant
					--CreateCivilian(16351, CivGroup.KINGPIN_CIV_GROUP, 66, Bodytype.DRESSCIV, -1, -1, -1, -1, -1, -1, -1, -1)
					-- armour store (Skin Tight Fashions)
					--CreateCivilian(13010, CivGroup.KINGPIN_CIV_GROUP, 67, Bodytype.MINICIV, -1, -1, -1, -1, -1, -1, -1, -1)
					-- hunting store
					--CreateCivilian(11098, CivGroup.KINGPIN_CIV_GROUP, 62, Bodytype.REGMALE, Vest.BROWNVEST, Pants.GREENPANTS, -1, -1, 763, 135, 288, 284)
				
				end
				
			end
			
			-- if we haven't pissed of the black market, spawn dealer
			if ( CheckCivGroupHostile(CivGroup.BLACKMARKET_GROUP) == false ) then
				
				-- unlock the door so we can enter
				ACTION_ITEM_UNLOCK_DOOR(12834)
				
				-- black market dealer and bodyguards
				CreateCivilian(12992, CivGroup.BLACKMARKET_GROUP, 68, Bodytype.MANCIV, Vest.GREYVEST, Pants.JEANPANTS, Hair.WHITEHEAD, Skin.BLACKSKIN, 337, 264, -1, -1)
				CreateArmedCivilain(CivGroup.BLACKMARKET_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 12672, 0)
				CreateArmedCivilain(CivGroup.BLACKMARKET_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 13312, 0)
				CreateArmedCivilain(CivGroup.BLACKMARKET_GROUP, SoldierClass.SOLDIER_CLASS_ELITE, 12995, 0)
			end
			
		elseif ( sSectorX == 5 and sSectorY == SectorY.MAP_ROW_C) then
			-- only add merchants if Kingpin is alive and not hostile towards us
			if ( (CheckFact( Facts.FACT_KINGPIN_DEAD, 0 ) == false) and
			(CheckFact( Facts.FACT_KINGPIN_IS_ENEMY, 0 ) == false) and 
			(CheckMercIsDead ( Profil.KINGPIN ) == false) ) then
			
				if ( currenthour > 7 and currenthour < 19 ) then
				
					-- general store
					--CreateCivilian(6641, CivGroup.KINGPIN_CIV_GROUP, 45, Bodytype.REGMALE, -1, -1, -1, -1, 694, 107, 37, -1)
					-- construction materials store
					--CreateCivilian(20549, CivGroup.KINGPIN_CIV_GROUP, 63, Bodytype.STOCKYMALE, -1, -1, -1, -1, 13, 161, 302, 135)
					-- restaurant
					--CreateCivilian(16755, CivGroup.KINGPIN_CIV_GROUP, 52, Bodytype.MANCIV, -1, -1, -1, -1, 759, -1, -1, -1)
					-- wine store
					--CreateCivilian(10804, CivGroup.KINGPIN_CIV_GROUP, 59, Bodytype.REGFEMALE, -1, -1, -1, -1, 340, 107, 302, 284)
				
				end
				
			end
			
		-- Chitzena
		-- Meduna
		elseif ( sSectorX == 4 and sSectorY == SectorY.MAP_ROW_O) then
		
			if ( currenthour > 7 and currenthour < 19 ) then
			
				-- posh general store
				--CreateCivilian(10503, CivGroup.LOYAL_CIV_GROUP, 46, Bodytype.MINICIV, -1, -1, -1, -1, 212, -1, -1, -1)
				-- restaurant
				--CreateCivilian(18465, CivGroup.LOYAL_CIV_GROUP, 53, Bodytype.MANCIV, -1, -1, -1, -1, -1, -1, -1, -1)
				-- restaurant
				--CreateCivilian(9840, CivGroup.LOYAL_CIV_GROUP, 54, Bodytype.REGFEMALE, -1, -1, -1, -1, -1, -1, -1, -1)
				-- luxury store
				--CreateCivilian(10916, CivGroup.LOYAL_CIV_GROUP, 65, Bodytype.MANCIV, -1, -1, -1, -1, 264, -1, -1, -1)
				-- pharmacy
				--CreateCivilian(11579, CivGroup.LOYAL_CIV_GROUP, 48, Bodytype.FATCIV, -1, -1, -1, -1, -1, -1, -1, -1)
			
			end
			
		end
	elseif ( bSectorZ == 1 ) then
		-- We spawn a rebel 'quartermaster' in the rebel basement. He doesn't have much to offer, and it isn't exactly quality ware, but better than nothing
		if ( sSectorX == 10 and sSectorY == SectorY.MAP_ROW_A) then
			--CreateCivilian(11433, CivGroup.REBEL_CIV_GROUP, 40, Bodytype.CRIPPLECIV, Vest.BROWNVEST, Pants.GREENPANTS, Hair.WHITEHEAD, -1, 711, 545, 545, -1)
		end
	end
	
	
end

-- these colours can be used in the map
-- if you want to know how they look, test them on the map
-- if you want more colours, check whether you feel lucky and ask a coder
MapColour = {
	MAP_SHADE_BLACK = 0,
	
	MAP_SHADE_LT_GREEN = 1,
	MAP_SHADE_MD_GREEN = 2,
	MAP_SHADE_DK_GREEN = 3,
	
	MAP_SHADE_LT_RED = 4,
	MAP_SHADE_MD_RED = 5,
	MAP_SHADE_DK_RED = 6,
	
	MAP_SHADE_LT_YELLOW = 7,
	MAP_SHADE_MD_YELLOW = 8,
	MAP_SHADE_DK_YELLOW = 9,
	
	MAP_SHADE_LT_CYAN = 10,
	MAP_SHADE_MD_CYAN = 11,
	MAP_SHADE_DK_CYAN = 12,
	
	MAP_SHADE_LT_GREY = 13,
	MAP_SHADE_MD_GREY = 14,
	MAP_SHADE_DK_GREY = 15,
	
	MAP_SHADE_LT_BLUE = 16,
	MAP_SHADE_MD_BLUE = 17,
	MAP_SHADE_DK_BLUE = 18,
	
	MAP_SHADE_LT_PINK = 19,
	MAP_SHADE_ORANGE = 20,
	
	MAP_SHADE_MIX_RED = 21,
	MAP_SHADE_MIX_GREEN = 22,
	MAP_SHADE_MIX_BLUE = 23,
	MAP_SHADE_MIX_YELLOW = 24,
	
	MAP_SHADE_MIX_RED_GREEN = 25,
	MAP_SHADE_MIX_RED_BLUE = 26,
	MAP_SHADE_MIX_RED_YELLOW = 27,
	MAP_SHADE_MIX_GREEN_BLUE = 28,
	MAP_SHADE_MIX_GREEN_YELLOW = 29,
	MAP_SHADE_MIX_BLUE_YELLOW = 30,
	
	MAP_SHADE_MIX_RED_GREEN_BLUE = 31,
	MAP_SHADE_MIX_RED_GREEN_YELLOW = 32,
	MAP_SHADE_MIX_RED_BLUE_YELLOW = 33,
	
	MAP_SHADE_MIX_GREEN_BLUE_YELLOW = 34,
	MAP_SHADE_MIX_RED_GREEN_BLUE_YELLOW = 35,
}


-- These symbols are stored in Interface/IntelMapSymbols.sti
-- if you want more symbols, add them
MapSymbols = {
	BLOODCAT_ATTACK = 0,
	ZOMBIE_ATTACK = 1,
	BANDIT_ATTACK = 2,
	TERRORIST_LOCATION = 3,
	CHALICE = 4,
	ASSASSINATION_TARGET = 5,
	HELI = 6,
	PRISON = 7,
	CHURCH = 8,	
	RECRUITMENT = 9,
	FLAG = 10,
	QUESTIONMARK_BLUE = 11,		-- sector might be relevant for a quest
	EXCLAMATIONMARK_BLUE = 12,	-- sector is definetely relevant for a quest	
	QUESTIONMARK_GREEN = 13,	-- alternate colours for other uses
	EXCLAMATIONMARK_GREEN = 14,
	QUESTIONMARK_RED = 15,
	EXCLAMATIONMARK_RED = 16,
	QUESTIONMARK_YELLOW = 17,
	EXCLAMATIONMARK_YELLOW = 18,
	FACTORY_YELLOW = 19,
	FACTORY_GREEN = 20,
	FACTORY_RED = 21,
	FACTORY_NOCONTROL = 22,
}

-- this function allows us to data for the intel/quest map
-- aLevel is the world level (0: surface)
-- set data by using SetIntelAndQuestMapDataForSector(sectorx, sextory, MapColour, symbol, text for description window, short text for map)
function GetIntelAndQuestMapData( aLevel )
	
end
