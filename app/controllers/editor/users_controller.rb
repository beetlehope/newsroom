class Editor::UsersController < Editor::ApplicationController
  def index
  	@users = User.order(:email)
  end

  def new
  	@user = User.new
  end

  def create
	@user = User.new(user_params)  	

	if @user.save
		flash[:notice]= "Writer has been added."
		redirect_to editor_users_path
	else 
		flash.now[:alert] = "Writer hasn't been added."
	end		
  end


  private
  def user_params
  	params.require(:user).permit(:email, :password, :editor)
  end	
end
