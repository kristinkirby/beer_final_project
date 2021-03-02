Rails.application.routes.draw do
  
  
  # Routes for the Rating resource:

  # CREATE
  post("/insert_rating", { :controller => "ratings", :action => "create" })
          
  # READ
  get("/ratings", { :controller => "ratings", :action => "index" })
  get("/ratings/:path_id", { :controller => "ratings", :action => "show" })
  
  # UPDATE
  post("/modify_rating/:path_id", { :controller => "ratings", :action => "update" })
  
  # DELETE
  get("/delete_rating/:path_id", { :controller => "ratings", :action => "destroy" })

  #------------------------------

  # Routes for the Brewery resource:

  # CREATE
  post("/insert_brewery", { :controller => "breweries", :action => "create" })
          
  # READ
  get("/breweries", { :controller => "breweries", :action => "index" })
  get("/breweries/:path_id", { :controller => "breweries", :action => "show" })
  
  # UPDATE
  post("/modify_brewery/:path_id", { :controller => "breweries", :action => "update" })
  
  # DELETE
  get("/delete_brewery/:path_id", { :controller => "breweries", :action => "destroy" })

  #------------------------------

  # Routes for the Beer resource:

  # CREATE
  post("/insert_beer", { :controller => "beers", :action => "create" })
          
  # READ
  get("/beers", { :controller => "beers", :action => "index" })
  get("/beers/:path_id", { :controller => "beers", :action => "show" })
  
  # UPDATE
  post("/modify_beer/:path_id", { :controller => "beers", :action => "update" })
  
  # DELETE
  get("/delete_beer/:path_id", { :controller => "beers", :action => "destroy" })

  #------------------------------

  # Homepage
  get("/", {:controller => "application", :action => "testpage"})  

  # Routes for the User account:
  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
  #------------------------------
  
  # User profile
  get("/users/:user_id", {:controller => "users", :action => "show_profile"})











  # Routes for the Flag resource:
  # CREATE
  post("/insert_flag", { :controller => "flags", :action => "create" })
          
  # READ
  get("/flags", { :controller => "flags", :action => "index" })
  get("/flags/:path_id", { :controller => "flags", :action => "show" })
  
  # UPDATE
  post("/modify_flag/:path_id", { :controller => "flags", :action => "update" })
  
  # DELETE
  get("/delete_flag/:path_id", { :controller => "flags", :action => "destroy" })

  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  post("/insert_favorite", { :controller => "favorites", :action => "create" })

  put '/beer/:beer_id/favorite', to: 'beers#favorite', as: 'favorite'
          
  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  
  get("/favorites/:path_id", { :controller => "favorites", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite/:path_id", { :controller => "favorites", :action => "update" })
  
  # DELETE
  get("/delete_favorite/:path_id", { :controller => "favorites", :action => "destroy" })

  #------------------------------

  # Routes for the Style resource:

  # CREATE
  post("/insert_style", { :controller => "styles", :action => "create" })
          
  # READ
  get("/styles", { :controller => "styles", :action => "index" })
  
  get("/styles/:path_id", { :controller => "styles", :action => "show" })
  
  # UPDATE
  
  post("/modify_style/:path_id", { :controller => "styles", :action => "update" })
  
  # DELETE
  get("/delete_style/:path_id", { :controller => "styles", :action => "destroy" })

  #------------------------------


end
