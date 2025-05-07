ClientStorage = {}

function ClientStorage.saveValue(fileName, rootNodeName, value)
    local xml = xmlCreateFile(fileName, rootNodeName)
    if not xml then return false end

    xmlNodeSetValue(xml, value)
    xmlSaveFile(xml)
    xmlUnloadFile(xml)
    return true
end

function ClientStorage.loadValue(fileName)
    local xml = xmlLoadFile(fileName)
    if not xml then return nil end

    local value = xmlNodeGetValue(xml)
    xmlUnloadFile(xml)
    return value
end

function ClientStorage.clear(fileName)
    return fileDelete(fileName)
end

-- Exportar funciones para otros resources
function saveClientStorage(file, node, value)
    return ClientStorage.saveValue(file, node, value)
end

function loadClientStorage(file)
    return ClientStorage.loadValue(file)
end

function clearClientStorage(file)
    return ClientStorage.clear(file)
end