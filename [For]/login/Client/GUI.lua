LoginGUI = {}

function LoginGUI.create()
    local lWindow = guiCreateWindow(0.35, 0.35, 0.3, 0.25, "Iniciar Sesión", true)
    guiWindowSetSizable(lWindow, false)

	inputUsername = exports.clientComponents:createInputField(0.1,0.2,"Usuario:",lWindow)
	inputPassword = exports.clientComponents:createInputField(0.1,0.5,"Contraseña:",lWindow)
	--inputPassword.setMasked(true)
	
	chkRememberMe = guiCreateCheckBox(0.35, 0.7, 0.5, 0.1, "Recordarme", false, true, lWindow)

    btnLogin = guiCreateButton(0.3, 0.9, 0.4, 0.15, "Iniciar Sesión", true, lWindow)

    return {
        window = lWindow,
        username = inputUsername,
        password = inputPassword,
		rememberMe = chkRememberMe,
        button = btnLogin
    }
end