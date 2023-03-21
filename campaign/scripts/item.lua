function onInit()
	typeChanged();
end

function typeChanged()
	local sType = DB.getValue(getDatabaseNode(), "itemtype", "");
	
	if sType == "Abilities" then
		content.setVisible(false);
		abilities.setVisible(true);
		history.setVisible(false);
	elseif sType == "History" then
		content.setVisible(false);
		abilities.setVisible(false);
		history.setVisible(true);
	else
		content.setVisible(true);
		abilities.setVisible(false);
		history.setVisible(false);
	end
end
