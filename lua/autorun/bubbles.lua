
if (SERVER) then 
	AddCSLuaFile("bubbles.lua")
else
	local Bubble = nil
	local Up	 = Vector(0,0,20)

	hook.Add("PostPlayerDraw","DrawChatBubbles_UNIQUE",function(pl)
		if (!IsValid(Bubble)) then Bubble = ClientsideModel("models/extras/info_speech.mdl") Bubble:SetNoDraw(true) end
		
		if (pl:IsTyping()) then
			Bubble:SetRenderOrigin(pl:GetShootPos()+Up)
			Bubble:SetRenderAngles(Angle(0,UnPredictedCurTime()*50,0))
			Bubble:SetupBones()
			Bubble:DrawModel()
		end
	end)
end