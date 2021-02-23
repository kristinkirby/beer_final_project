class StylesController < ApplicationController
  def index
    matching_styles = Style.all

    @list_of_styles = matching_styles.order({ :created_at => :desc })

    render({ :template => "styles/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_styles = Style.where({ :id => the_id })

    @the_style = matching_styles.at(0)

    render({ :template => "styles/show.html.erb" })
  end

  def create
    the_style = Style.new
    the_style.name = params.fetch("query_name")
    the_style.origin = params.fetch("query_origin")
    the_style.description = params.fetch("query_description")

    if the_style.valid?
      the_style.save
      redirect_to("/styles", { :notice => "Style created successfully." })
    else
      redirect_to("/styles", { :notice => "Style failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_style = Style.where({ :id => the_id }).at(0)

    the_style.name = params.fetch("query_name")
    the_style.origin = params.fetch("query_origin")
    the_style.description = params.fetch("query_description")

    if the_style.valid?
      the_style.save
      redirect_to("/styles/#{the_style.id}", { :notice => "Style updated successfully."} )
    else
      redirect_to("/styles/#{the_style.id}", { :alert => "Style failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_style = Style.where({ :id => the_id }).at(0)

    the_style.destroy

    redirect_to("/styles", { :notice => "Style deleted successfully."} )
  end
end
