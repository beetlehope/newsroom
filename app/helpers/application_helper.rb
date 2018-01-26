module ApplicationHelper

	def editors_only(&block)
		block.call if current_user.try(:editor?)
	end

end
