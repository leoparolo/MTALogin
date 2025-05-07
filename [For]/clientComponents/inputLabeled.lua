function createInputField(xLabel, y, labelText, parent)
    local label = guiCreateLabel(xLabel, y, 0.2, 0.1, labelText, true, parent)
    local edit = guiCreateEdit(xLabel + 0.25, y, 0.45, 0.1, "", true, parent)

    return {
        label = label,
        edit = edit,
        getText = function()
            return guiGetText(edit)
        end,
        setMasked = function(masked)
            guiEditSetMasked(edit, masked)
        end
    }
end