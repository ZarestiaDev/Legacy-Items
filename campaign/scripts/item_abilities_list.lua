function onInit()
    onPenaltyChanged();
    DB.addHandler(DB.getPath(DB.getChild(getDatabaseNode(), "..."), "penalties"), "onUpdate", onPenaltyChanged);
end

function onClose()
    DB.removeHandler(DB.getPath(DB.getChild(getDatabaseNode(), "..."), "penalties"), "onUpdate", onPenaltyChanged);
end

function onPenaltyChanged()
    resetEntries();

	local sPenalties = DB.getValue(DB.getChild(getDatabaseNode(), "..."), "penalties", "");
    if not sPenalties:match(",") and sPenalties ~= "" then
        penalty1.setVisible(true);
    end

    local tPenalties = StringManager.splitByPattern(sPenalties, ",", true);

    for index,_ in ipairs(tPenalties) do
        self["penalty" .. index].setVisible(true);
    end
end

function resetEntries()
    for i = 1, 4, 1 do
        self["penalty" .. i].setVisible(false);
    end
end
