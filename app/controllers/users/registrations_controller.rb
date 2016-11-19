class Users::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.create(user_params)
    if user.save
      sign_in(:user, user)
      redirect_to users_homepage_path
    else
      flash[:notice] = "Error"
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
