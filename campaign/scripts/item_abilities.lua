function onInit()
    onPenaltyChanged();
    DB.addHandler(DB.getPath(getDatabaseNode(), "penalties"), "onUpdate", onPenaltyChanged);
end

function onClose()
    DB.removeHandler(DB.getPath(getDatabaseNode(), "penalties"), "onUpdate", onPenaltyChanged);
end

function onPenaltyChanged()
    resetLabels();

    local sPenalties = DB.getValue(getDatabaseNode(), "penalties", "");
    if not sPenalties:match(",") then
        penalty1_label.setVisible(true);
        penalty1_label.setValue(sPenalties);
    end

    local tPenalties = StringManager.splitByPattern(sPenalties, ",", true);
    for index,penalty in ipairs(tPenalties) do
        self["penalty" .. index .. "_label"].setVisible(true);
        self["penalty" .. index .. "_label"].setValue(penalty);
    end
end

function resetLabels()
    for i = 1, 4, 1 do
        self["penalty" .. i .. "_label"].setVisible(false);
        self["penalty" .. i .. "_label"].setValue("");
    end
end
