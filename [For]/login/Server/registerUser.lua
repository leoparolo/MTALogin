addEvent("onPlayerRequestRegister", true)
addEventHandler("onPlayerRequestRegister", root, function(username, password,confirmPassword)
	local player = source

    local success, errorMessage = pcall(function()
        if not username or username == "" or not password or password == "" or not confirmPassword or confirmPassword == "" then
            triggerClientEvent(player, "onLoginResult", resourceRoot, false, "Usuario o contraseña vacíos.")
            return
        end
		
		if password ~= confirmPassword then
			triggerClientEvent(player, "onLoginResult", resourceRoot, false, "las contraseñas no son iguales.")
			return
		end
		
		local cuentaExistente = getAccount(username)
		if cuentaExistente then
			triggerClientEvent(player, "onLoginResult", resourceRoot, false, "El usuario ya existe.")
			return
		end
		
		local account = addAccount(username, password)
		if account then
			logIn(player, account, password)
			outputDebugString("Usuario registrado correctamente.")
			triggerClientEvent(player, "onLoginResult", resourceRoot, true, "Usuario registrado correctamente.")			
		else
			outputDebugString("No se pudo registrar el usuario.")
			triggerClientEvent(player, "onLoginResult", resourceRoot, false, "No se pudo registrar el usuario.")		
		end
		

    end)

    if not success then
        outputDebugString("Error en register: " .. tostring(errorMessage), 1)
        triggerClientEvent(player, "onLoginResult", resourceRoot, false, "Error interno en el servidor.")
    end
end)