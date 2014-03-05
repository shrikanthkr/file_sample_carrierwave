class Project < ActiveRecord::Base
	attr_accessor :pName,:pNum,:pLead,:pRAG,:pPass,:pFail,:pNoRun,:pNotComp,pTotalCase,pTower,pSpecType,pTargetDate
end
