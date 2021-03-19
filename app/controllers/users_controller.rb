class UsersController < ApplicationController

  def show_profile
    id = params.fetch("user_id")

    @user = User.where({:id => id}).first

    if @user == nil 
      render(:template => "users/user_not_found.html.erb")
    else 
      render({:template => "users/user_profile.html.erb"})
    end
  end 


  def show_favorites
    render({:template => "users/my_favorites.html.erb"})
  end

  def show_flags
    render({:template => "users/my_flags.html.erb"})
  end 

end
