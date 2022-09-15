function onInit()
    update();
    DB.addHandler(DB.getPath(getDatabaseNode(), "locked"), "onUpdate", update);
end

function onClose()
    DB.removeHandler(DB.getPath(getDatabaseNode(), "locked"), "onUpdate", update);
end

function update()
    local bReadOnly = WindowManager.getReadOnlyState(getDatabaseNode());
    
    dc_normal.update(bReadOnly);
    history_normal.update(bReadOnly);
    dc_least.update(bReadOnly);
    history_least.update(bReadOnly);
    ritual_least.update(bReadOnly);
    dc_lesser.update(bReadOnly);
    history_lesser.update(bReadOnly);
    ritual_lesser.update(bReadOnly);
    dc_greater.update(bReadOnly);
    history_greater.update(bReadOnly);
    ritual_greater.update(bReadOnly);

    onVisibilityChanged("normal");
    onVisibilityChanged("least");
    onVisibilityChanged("lesser");
    onVisibilityChanged("greater");
end

function onVisibilityChanged(name)
    local bVisible = false;
    local nValue = DB.getValue(getDatabaseNode(), "legacy." .. name .. ".visibility", 0);

    if nValue == 0 then
        bVisible = false;
    else
        bVisible = true;
    end

    if Session.IsHost then
        bVisible = true;
    end

    self["label_" .. name].setVisible(bVisible);
    self["dc_" .. name].setVisible(bVisible);
    self["lable_dc_" .. name].setVisible(bVisible);
    self["history_" .. name].setVisible(bVisible);
    if name ~= "normal" then
        self["ritual_" .. name].setVisible(bVisible);
    end
end
