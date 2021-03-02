class BeersController < ApplicationController

  # def favorite
  #   @beer = Beer.all.find(params[:id])
  #   Favorite.create(user_id: @current_user.id, beer_id: @beer.id) 
  #   redirect_to post_path(@beer)
  # end 


  def index
    matching_beers = Beer.all
    @list_of_beers = matching_beers.order({ :created_at => :desc })
    render({ :template => "beers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_beers = Beer.where({ :id => the_id })
    @the_beer = matching_beers.at(0)

    # check to see if user has already rated the beer
    @curr_rating = Rating.exists?(@current_user.id, @the_beer.id)
    @flag = Flag.exists?(@current_user.id, @the_beer.id)
    @favorite = Favorite.exists?(@current_user.id, @the_beer.id)
    
    render({ :template => "beers/show.html.erb" })
  end

  def create
    the_beer = Beer.new
    the_beer.name = params.fetch("query_name")
    the_beer.brewery_id = params.fetch("query_brewery_id")
    the_beer.abv = params.fetch("query_abv")
    the_beer.ibu = params.fetch("query_ibu")
    the_beer.description = params.fetch("query_description")
    the_beer.image = params.fetch("query_image")
    the_beer.style_id = params.fetch("query_style_id")

    if the_beer.valid?
      the_beer.save
      redirect_to("/beers", { :notice => "Beer created successfully." })
    else
      redirect_to("/beers", { :notice => "Beer failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_beer = Beer.where({ :id => the_id }).at(0)

    the_beer.name = params.fetch("query_name")
    the_beer.brewery_id = params.fetch("query_brewery_id")
    the_beer.abv = params.fetch("query_abv")
    the_beer.ibu = params.fetch("query_ibu")
    the_beer.description = params.fetch("query_description")
    the_beer.image = params.fetch("query_image")
    the_beer.style_id = params.fetch("query_style_id")

    if the_beer.valid?
      the_beer.save
      redirect_to("/beers/#{the_beer.id}", { :notice => "Beer updated successfully."} )
    else
      redirect_to("/beers/#{the_beer.id}", { :alert => "Beer failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_beer = Beer.where({ :id => the_id }).at(0)

    the_beer.destroy

    redirect_to("/beers", { :notice => "Beer deleted successfully."} )
  end
end
