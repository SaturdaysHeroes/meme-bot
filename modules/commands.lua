--[[----------------------------------------------

    Discord bot developed by SaturdaysHeroes.xyz

--]]----------------------------------------------
return function(client)
    client:on("messageCreate", function(message)
        if message.guild == nil then return end 
		if message.author.bot == true then return end

		local content = message.content:lower()
		local author = message.author
		local member = message.guild.members:get(message.author.id)
		local args = content:split(" ")
		local params = content:split("-")
		local channel = message.channel

		-- Command: Help
		if args[1] == config.prefix..languages[config.language]["commands"]["commandHelp"] then 
			message:reply(languages[config.language]["general"]["helpSent"])
			author:send(languages[config.language]["commands"]["commandHelpMSG"])
		end

		-- Command: Formats
		if args[1] == config.prefix..languages[config.language]["commands"]["commandFormats"] then 
			message:reply(languages[config.language]["general"]["formatsSent"])
			mbot.sendformats(author)
		end

		-- Command: Generate
		if args[1] == config.prefix..languages[config.language]["commands"]["commandGenerate"] then 
			if params[2] == nil then return end
			if params[3] == nil then return end
			if params[4] == nil then return end

			mbot.generatememe(message, params[2], params[3], params[4])
		end
    end)
end