class Users::SessionsController < Devise::SessionsController
  def homepage
    users = User.all 
    @user = current_user
    render 'homepage'
  end
end
