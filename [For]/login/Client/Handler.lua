local loginUI

function onLoginClick()
    local username = loginUI.username.getText()
    local password = loginUI.password.getText()

    if username == "" or password == "" then
        outputChatBox("Por favor, completa todos los campos.")
        return
    end
	outputChatBox(chkRememberMe + " username:" + username + " password:" + password)
	rememberMe()

    triggerServerEvent("onPlayerRequestLogin", localPlayer, username, password)
end

function rememberMe()


	if guiCheckBoxGetSelected(chkRememberMe) then
		exports.clientstorage:saveClientStorage("remember.xml", "remember", username)
	end
end

function setupLogin()
    loginUI = LoginGUI.create()
	
	local user = exports.clientstorage:loadClientStorage("remember.xml") or ""
	guiSetText(txtUsername, user)
	
    addEventHandler("onClientGUIClick", loginUI.button, onLoginClick, false)
    showCursor(true)
end

addEvent("onLoginResult", true)
addEventHandler("onLoginResult", resourceRoot, function(success,message)
    outputChatBox(success and "Success: " .. message or "Error: " .. message)
	
    if success then
        destroyElement(loginUI.window)
        showCursor(false)
    end
end)

addEventHandler("onClientResourceStart", resourceRoot, setupLogin)