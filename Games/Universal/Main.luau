local Services = setmetatable({}, {
    __index = function(self, Name)
        if Abysall.Environment.cloneref then
            return Abysall.Environment.cloneref(game:GetService(Name))
        else
            return game:GetService(Name)
        end
    end
})


Services.StarterGui:SetCore("SendNotification", {
    Title = "Abysall Hub",
    Text = "Only DOORS is supported right now, sorry :)",
    Duration = 10,
})
