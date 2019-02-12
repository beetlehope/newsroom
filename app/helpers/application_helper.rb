module ApplicationHelper
  def editors_only
    yield if current_user.try(:editor?)
  end
end
