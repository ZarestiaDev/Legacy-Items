function update()
	if super and super.update then
        super.update();
    end

	local sSubType = subtype.getValue():lower();
	local bLegacy = sSubType:match("legacy");

	local nodeRecord = getDatabaseNode();
	local bReadOnly = WindowManager.getReadOnlyState(nodeRecord);
	local bID = LibraryData.getIDState("item", nodeRecord);

	updateControl("penalties", bReadOnly, bID and bLegacy);
	parentcontrol.window.controlframe.setVisible(bLegacy);
	parentcontrol.window.itemtype.setVisible(bLegacy);
end
