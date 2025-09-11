class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    render layout: @user.template
  end

  def edit
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "User updated successfully." }
      end
    else
      flash.now[:alert] = "Failed to update user."
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :bio, :city, :username, :template)
  end
end
