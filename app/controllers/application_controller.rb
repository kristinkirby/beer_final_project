class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end


  def testpage
        
    #key = ENV.fetch("BEER_KEY")
    #url = "https://sandbox-api.brewerydb.com/v2/beer/xwYSL2/?key=" + key
    #url = "https://sandbox-api.brewerydb.com/v2/breweries/?key=" + key
    #conv_raw = open(url).read
    #@conv = JSON.parse(conv_raw).fetch("data")

    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first

    @beers = Beer.all 
    @breweries = Brewery.all
    @users = User.all

    @beers_of_the_day = Beer.all.sample(3)

    render(:template => "testpage.html.erb")
  end 


end
