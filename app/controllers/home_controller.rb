class HomeController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User created successfully."
    else
      flash.now[:alert] = "Failed to create user."
      render :index, status: :unprocessable_entity
    end
  end

  def hello_job
    respond_to do |format|
      format.turbo_stream { @message = "Carregando..." }
    end

    HelloJob.perform_later
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :bio, :city, :username, :template)
  end
end
