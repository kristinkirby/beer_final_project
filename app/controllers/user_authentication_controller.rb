class UserAuthenticationController < ApplicationController
  # Uncomment this if you want to force users to sign in before any other actions
  skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "user_authentication/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).first
    the_supplied_password = params.fetch("query_password")
    
    # if user exists
    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id
        session[:display_name] = user.display_name
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    # if user does not exist, redirect to sign up form. 
    else
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/user_sign_in", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_authentication/sign_up.html.erb" })
  end

  def create
    require "date"

    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.display_name = params.fetch("query_display_name")
    @user.name = params.fetch("query_name")
    @user.photo = params.fetch("query_photo")
    @user.dob = Date.strptime(params.fetch("query_dob"), '%m-%d-%Y')

    
    # make sure the user is old enough 
    year_diff = Date.today.year - @user.dob.year
    day_diff = Date.today.yday - @user.dob.yday
    if year_diff >= 22
      old_enough = true
    elsif year_diff == 21 && day_diff >= 0 
      old_enough = true 
    else
      old_enough = false  
    end
      
    if old_enough   
      save_status = @user.save
    else
      save_status = false   
    end

    if save_status == true
      session[:user_id] = @user.id
      redirect_to("/", { :notice => "Cheers! Account created successfully."})
    elsif old_enough == false 
      redirect_to("/user_sign_up", { :alert => "You must be 21 to make an account here. Come back on your 21st birthday!"})
    else 
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "user_authentication/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.display_name = params.fetch("query_display_name")
    @user.name = params.fetch("query_name")
    @user.photo = params.fetch("query_photo")
    @user.dob = params.fetch("query_dob")
    
    if @user.valid?
      @user.save

      redirect_to("/users/#{@current_user.id}", { :notice => "User account updated successfully."})
    else
      redirect_to("/edit_user_profile", { :alert => "Profile update failed."})
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/user_sign_in", { :notice => "User account cancelled" })
  end
 
end
