addEventHandler("onPlayerJoin", root,
    function()
        outputChatBox("¡Bienvenido al servidor, " .. getPlayerName(source) .. "!")
    end
)

addEvent("onPlayerRequestLogin", true)
addEventHandler("onPlayerRequestLogin", root, function(username, password)
	local player = source

    local success, errorMessage = pcall(function()
        if not username or username == "" or not password or password == "" then
            triggerClientEvent(player, "onLoginResult", resourceRoot, false, "Usuario o contraseña vacíos.")
            return
        end

        local account = getAccount(username, password)
        if account then
            logIn(player, account, password)
            triggerClientEvent(player, "onLoginResult", resourceRoot, true, "Login exitoso.")
        else
            triggerClientEvent(player, "onLoginResult", resourceRoot, false, "Usuario o contraseña incorrectos.")
        end
    end)

    if not success then
        outputDebugString("Error en el login: " .. tostring(errorMessage), 1)
        triggerClientEvent(player, "onLoginResult", resourceRoot, false, "Error interno en el servidor.")
    end
end)