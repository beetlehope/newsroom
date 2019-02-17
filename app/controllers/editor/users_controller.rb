class Editor::UsersController < Editor::ApplicationController
  load_and_authorize_resource

  before_action :find_user, except: %i[index new create]

  def index
    @users = User.not_archived.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Writer has been added."
      redirect_to editor_users_path
    else
      flash.now[:alert] = "Writer hasn't been added."
     end
  end

  def show; end

  def archive
    if @user == current_user
      flash[:alert] = "You can't archive yourself."
    else
      @user.archive
      flash[:notice] = "Writer has been archived."
    end

    redirect_to editor_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
