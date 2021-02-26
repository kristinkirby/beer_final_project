class BreweriesController < ApplicationController
  def index
    matching_breweries = Brewery.all

    @list_of_breweries = matching_breweries.order({ :created_at => :desc })

    render({ :template => "breweries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_breweries = Brewery.where({ :id => the_id })

    @the_brewery = matching_breweries.at(0)
        
    
    render({ :template => "breweries/show.html.erb" })
  end

  def create
    the_brewery = Brewery.new
    the_brewery.name = params.fetch("query_name")
    the_brewery.location = params.fetch("query_location")
    the_brewery.phone_number = params.fetch("query_phone_number")
    the_brewery.website = params.fetch("query_website")
    the_brewery.logo_image = params.fetch("query_logo_image")
    the_brewery.description = params.fetch("query_description")
    the_brewery.beers_count = params.fetch("query_beers_count")

    if the_brewery.valid?
      the_brewery.save
      redirect_to("/breweries", { :notice => "Brewery created successfully." })
    else
      redirect_to("/breweries", { :notice => "Brewery failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_brewery = Brewery.where({ :id => the_id }).at(0)

    the_brewery.name = params.fetch("query_name")
    the_brewery.location = params.fetch("query_location")
    the_brewery.phone_number = params.fetch("query_phone_number")
    the_brewery.website = params.fetch("query_website")
    the_brewery.logo_image = params.fetch("query_logo_image")
    the_brewery.description = params.fetch("query_description")
    the_brewery.beers_count = params.fetch("query_beers_count")

    if the_brewery.valid?
      the_brewery.save
      redirect_to("/breweries/#{the_brewery.id}", { :notice => "Brewery updated successfully."} )
    else
      redirect_to("/breweries/#{the_brewery.id}", { :alert => "Brewery failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_brewery = Brewery.where({ :id => the_id }).at(0)

    the_brewery.destroy

    redirect_to("/breweries", { :notice => "Brewery deleted successfully."} )
  end
end
