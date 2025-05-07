LoginGUI = {}

function LoginGUI.create()
    local lWindow = guiCreateWindow(0.35, 0.35, 0.3, 0.25, "Iniciar Sesión", true)
    guiWindowSetSizable(lWindow, false)

	local tabPanel = guiCreateTabPanel(0.05, 0.1, 0.9, 0.85, true, lWindow)

    local login = generateLoginTab(tabPanel)
    
	local register = generateRegisterTab(tabPanel)
	
    return {
        window = lWindow,
		tabLogin = login.tbLogin,
        username = login.iptUsername,
        password = login.iptPassword,
		rememberMe = login.ckRememberMe,
        buttonLogin = login.btLogin,
		tabRegister = register.tbRegister,
		regUsername = register.iptUsername,
        regPassword = register.iptPassword,
        regPassword2 = register.iptConfirmPassword,
        buttonRegister = register.btRegister
    }
end

function generateLoginTab(tabPanel)
	local tabLogin = guiCreateTab("Iniciar Sesión", tabPanel)
	
	local inputUsername = exports.clientComponents:createInputField(0.1,0.15,"Usuario:",tabLogin)
	local inputPassword = exports.clientComponents:createInputField(0.1,0.4,"Contraseña:",tabLogin)
	guiEditSetMasked(inputPassword.edit, true)
	
	chkRememberMe = guiCreateCheckBox(0.35, 0.55, 0.5, 0.1, "Recordarme", false, true, tabLogin)

    btnLogin = guiCreateButton(0.3, 0.7, 0.4, 0.15, "Iniciar Sesión", true, tabLogin)
	
	return {
		tbLogin = tabLogin,
		iptUsername = inputUsername,
		iptPassword = inputPassword,
		ckRememberMe = chkRememberMe,
		btLogin = btnLogin
	}
end

function generateRegisterTab(tabPanel)
	local tabRegister = guiCreateTab("Registrarse", tabPanel)

    local regUsername = exports.clientComponents:createInputField(0.1, 0.15, "Usuario:", tabRegister)
    local regPassword = exports.clientComponents:createInputField(0.1, 0.35, "Contraseña:", tabRegister)
    guiEditSetMasked(regPassword.edit, true)
    local regPassword2 = exports.clientComponents:createInputField(0.1, 0.55, "Confirmar contraseña:", tabRegister)
    guiEditSetMasked(regPassword2.edit, true)

    btnRegister = guiCreateButton(0.3, 0.8, 0.4, 0.15, "Registrarse", true, tabRegister)

	return {
		tbRegister = tabRegister,
		iptUsername = regUsername,
		iptPassword = regPassword,
		iptConfirmPassword = regPassword2,
		btRegister = btnRegister
	}
end