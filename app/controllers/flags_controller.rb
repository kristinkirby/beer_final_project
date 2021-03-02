class FlagsController < ApplicationController
  def index
    matching_flags = Flag.all

    @list_of_flags = matching_flags.order({ :created_at => :desc })

    render({ :template => "flags/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_flags = Flag.where({ :id => the_id })

    @the_flag = matching_flags.at(0)

    render({ :template => "flags/show.html.erb" })
  end

  def create
    session[:return_to] ||= request.referer
    the_flag = Flag.new
    the_flag.user_id = @current_user.id 
    the_flag.beer_id = params.fetch("query_beer_id")

    if the_flag.valid?
      the_flag.save
      redirect_to(session.delete(:return_to))
      #redirect_to("/flags", { :notice => "Flag created successfully." })
    else
      redirect_to("/flags", { :notice => "Flag failed to create successfully." })
    end
  end

  # def update
  #   the_id = params.fetch("path_id")
  #   the_flag = Flag.where({ :id => the_id }).at(0)

  #   the_flag.user_id = params.fetch("query_user_id")
  #   the_flag.beer_id = params.fetch("query_beer_id")

  #   if the_flag.valid?
  #     the_flag.save
  #     redirect_to("/flags/#{the_flag.id}", { :notice => "Flag updated successfully."} )
  #   else
  #     redirect_to("/flags/#{the_flag.id}", { :alert => "Flag failed to update successfully." })
  #   end
  # end

  def destroy
    session[:return_to] ||= request.referer
    the_id = params.fetch("path_id")
    the_flag = Flag.where({ :id => the_id }).at(0)

    the_flag.destroy

    redirect_to(session.delete(:return_to))
  end
end
