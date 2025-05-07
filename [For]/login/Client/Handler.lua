local loginUI

function onLoginClick()
    local username = guiGetText(loginUI.username.edit)
    local password = guiGetText(loginUI.password.edit)
	local remember = guiCheckBoxGetSelected(loginUI.rememberMe)
	
    if username == "" or password == "" then
        outputChatBox("Por favor, completa todos los campos.")
        return
    end
	
	CreateXMLCredentials(username,password,remember)

    triggerServerEvent("onPlayerRequestLogin", localPlayer, username, password)
end

function onRegisterClick()
	local username = guiGetText(loginUI.regUsername.edit)
	local password = guiGetText(loginUI.regPassword.edit)
	local confirmPassword = guiGetText(loginUI.regPassword2.edit)

	if username == "" or password == "" or confirmPassword == "" then
        outputChatBox("Por favor, completa todos los campos.")
        return
    end
	
	triggerServerEvent("onPlayerRequestRegister", localPlayer, username, password,confirmPassword)
end

function setupLogin()
    loginUI = LoginGUI.create()
	
	LoadXMLCredentials()
	
    addEventHandler("onClientGUIClick", loginUI.buttonLogin, onLoginClick, false)
	addEventHandler("onClientGUIClick", loginUI.buttonRegister,onRegisterClick,false)
    showCursor(true)
end

function LoadXMLCredentials()

    local xml = xmlLoadFile("remember.xml")
    if xml then
        local usernameNode = xmlFindChild(xml, "username", 0)
        local passwordNode = xmlFindChild(xml, "password", 0)
        if usernameNode and passwordNode then
            local username = xmlNodeGetValue(usernameNode) or ""
            local password = xmlNodeGetValue(passwordNode) or ""
            guiSetText(loginUI.username.edit, username)
            guiSetText(loginUI.password.edit, password)
            guiCheckBoxSetSelected(loginUI.rememberMe, true)
        end
        xmlUnloadFile(xml)
    end

end

function CreateXMLCredentials(username,password,remember)

	if remember then
        local xml = xmlCreateFile("remember.xml", "credentials")
        if xml then
            local userNode = xmlCreateChild(xml, "username")
            local passNode = xmlCreateChild(xml, "password")
            xmlNodeSetValue(userNode, username)
            xmlNodeSetValue(passNode, password)
            xmlSaveFile(xml)
            xmlUnloadFile(xml)
        end
    else
        fileDelete("remember.xml")
    end

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