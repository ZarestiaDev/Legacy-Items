-- function update()
-- 	if super and super.update then
--         super.update();
--     end

-- 	local nodeRecord = getDatabaseNode();
-- 	local sSubType = DB.getValue(nodeRecord, "subtype"):lower();
-- 	local bLegacy = sSubType:match("legacy");

-- 	local bReadOnly = WindowManager.getReadOnlyState(nodeRecord);
-- 	local bID = LibraryData.getIDState("item", nodeRecord);

-- 	WindowManager.callSafeControlUpdate(self, "penalties", bReadOnly, not (bID and bLegacy));
-- 	parentcontrol.window.controlframe.setVisible(bLegacy);
-- 	parentcontrol.window.itemtype.setVisible(bLegacy);
-- end
