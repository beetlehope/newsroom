class Editor::UsersController < Editor::ApplicationController
 
 before_action :find_user, only: [:show, :edit, :update, :archive] 

  def index
  	@users = User.not_archived.order(:email)
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


  def show
  end

  def archive
    if @user == current_user
      flash[:message] = "You can't archive yourself."
    else 
      @user.archive
      flash[:notice] = "Writer has been archived."
    end 
    
    redirect_to editor_users_path
  end


  private
  def user_params
  	params.require(:user).permit(:email, :password, :editor)
  end	

  def find_user
      @user = User.find(params[:id])
  end

end
