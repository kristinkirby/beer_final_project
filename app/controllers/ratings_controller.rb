class RatingsController < ApplicationController
  def index
    matching_ratings = Rating.all

    @list_of_ratings = matching_ratings.order({ :created_at => :desc })

    render({ :template => "ratings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ratings = Rating.where({ :id => the_id })

    @the_rating = matching_ratings.at(0)

    render({ :template => "ratings/show.html.erb" })
  end

  def create
    session[:return_to] ||= request.referer
    the_rating = Rating.new
    the_rating.user_id = @current_user.id
    the_rating.beer_id = params.fetch("query_beer_id")
    the_rating.rating = params.fetch("query_rating")
    the_rating.rating_comments = params.fetch("query_rating_comments")

    if the_rating.valid?
      the_rating.save
      #redirect_to("/ratings", { :notice => "Rating created successfully." })
      redirect_to(session.delete(:return_to))
    else
      redirect_to("/ratings", { :notice => "Rating failed to create successfully." })
    end
  end

  def update
    session[:return_to] ||= request.referer
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.user_id = @current_user.id
    the_rating.beer_id = params.fetch("query_beer_id")
    the_rating.rating = params.fetch("query_rating")
    the_rating.rating_comments = params.fetch("query_rating_comments")

    if the_rating.valid?
      the_rating.save
      #redirect_to("/ratings/#{the_rating.id}", { :notice => "Rating updated successfully."} )
      redirect_to(session.delete(:return_to))
    else
      redirect_to("/ratings/#{the_rating.id}", { :alert => "Rating failed to update successfully." })
    end
  end

  def destroy
    session[:return_to] ||= request.referer
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.destroy

    #redirect_to("/ratings", { :notice => "Rating deleted successfully."} )
    redirect_to(session.delete(:return_to))
  end
end
