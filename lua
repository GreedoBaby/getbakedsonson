loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()

local Players = game.Players
local Player = game.Players.LocalPlayer

local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Striker",
	Icon = "rocket",
	LoadingTitle = "Stereo Productions 🗼",
	LoadingSubtitle = "by @plagzel",
	Theme = "Default",

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,

	ConfigurationSaving = {
		Enabled = true,
		FolderName = "Striker",
		FileName = "Striker.txt"
	},

	KeySystem = false,
	KeySettings = {
		Title = "Anti-Breach 🔑",
		Subtitle = "Key Hardware",
		Note = "👾 Buy key from @plagzel on discord.",
		FileName = "StrikerKey.txt",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = {"jzid1$_1jk$f1$3123m1gbgrfdgn__(@(4-!~@($mYOOLO"}
	}
})

local ChatTab = Window:CreateTab("Chat", "bot-message-square")

local ARSection = ChatTab:CreateSection("Auto Reply")

local ARToggle = ChatTab:CreateToggle({
   Name = "Enabled",
   CurrentValue = false,
   Flag = "ARToggle",
   Callback = function(Value)
      ChatInfo.AutoReply.Enabled = Value
   end,
})

local ARTargetInput = ChatTab:CreateInput({
   Name = "Target",
   CurrentValue = "",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Flag = "ARTargetInput",
   Callback = function(Text)
      ChatInfo.AutoReply.Target = Text
   end,
})

local PharsesSection = ChatTab:CreateSection("Phrases")

local Phrase1Input = ChatTab:CreateInput({
   Name = "Phrase 1",
   CurrentValue = "",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Flag = "Phrase1Input",
   Callback = function(Text)
      ChatInfo.AutoReply.Phrase1 = Text
   end,
})

local Phrase2Input = ChatTab:CreateInput({
   Name = "Phrase 2",
   CurrentValue = "",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Flag = "Phrase2Input",
   Callback = function(Text)
      ChatInfo.AutoReply.Phrase2 = Text
   end,
})

local Phrase3Input = ChatTab:CreateInput({
   Name = "Phrase 3",
   CurrentValue = "",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Flag = "Phrase3Input",
   Callback = function(Text)
      ChatInfo.AutoReply.Phrase3 = Text
   end,
})

TextChatService.OnIncomingMessage = function(InComingMessage)
   if InComingMessage.TextSource.Name == ChatInfo.AutoReply.Target then
      ChatInfo.AutoReply.MessageCount += 1

      if ChatInfo.AutoReply.MessageCount == 1 then
         print("This nigger sent a message XD!")
         ChatInfo.AutoReply.MessagesSent += 1

         if ChatInfo.AutoReply.MessagesSent == 1 then
            TextChatService.TextChannels.RBXGeneral:SendAsync(ChatInfo.AutoReply.Phrase1)
         elseif ChatInfo.AutoReply.MessagesSent == 2 then
            TextChatService.TextChannels.RBXGeneral:SendAsync(ChatInfo.AutoReply.Phrase2)
         elseif ChatInfo.AutoReply.MessagesSent == 3 then
             ChatInfo.AutoReply.MessagesSent = 0
             TextChatService.TextChannels.RBXGeneral:SendAsync(ChatInfo.AutoReply.Phrase3)
         end
      elseif ChatInfo.AutoReply.MessageCount == 2 then
          print("This nigger sent a message XD!")
         ChatInfo.AutoReply.MessagesSent += 1

         if ChatInfo.AutoReply.MessagesSent == 1 then
            TextChatService.TextChannels.RBXGeneral:SendAsync(ChatInfo.AutoReply.Phrase1)
         elseif ChatInfo.AutoReply.MessagesSent == 2 then
            TextChatService.TextChannels.RBXGeneral:SendAsync(ChatInfo.AutoReply.Phrase2)
         elseif ChatInfo.AutoReply.MessagesSent == 3 then
             ChatInfo.AutoReply.MessagesSent = 0
             TextChatService.TextChannels.RBXGeneral:SendAsync(ChatInfo.AutoReply.Phrase3)
         end
         ChatInfo.AutoReply.MessageCount = 0
      end
   end
end

local KillTab = Window:CreateTab("Kill Tab", "skull")

local KillVars = {

	Latch = false,
	TargetPlayer = "",

}

local TargetInput = KillTab:CreateInput({
	Name = "Target",
	CurrentValue = "",
	PlaceholderText = "Enter targets name.",
	RemoveTextAfterFocusLost = false,
	Flag = "Target.flag",
	Callback = function(Text)
		KillVars.TargetPlayer = Text
	end,
})

local GhostModeButton = KillTab:CreateButton({
	Name = "Ghost Mode",
	Callback = function()
		local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")

		if Humanoid ~= nil then
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,false)
		end
	end,
})

local LatchToggle = KillTab:CreateToggle({
	Name = "Latch",
	CurrentValue = false,
	Flag = "Latch.flag", 
	Callback = function(Value)
		if Value ==
