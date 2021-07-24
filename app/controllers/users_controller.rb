class UsersController < ApplicationController
  def users_params
    params.require(:user).permit(:photo)
  end
end
