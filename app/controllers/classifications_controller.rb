class ClassificationsController < ApplicationController
  def index
    @classifications = Classification.all
  end

  def create
    classification = Classification.new classification_params
    classification.save

    flash[:notice] = "New classification saved."

    redirect_to classifications_path
  end

  def new
    @classification = Classification.new
  end

  def edit
    @classification = Classification.find params[:id]
  end

  def show
    @classification = Classification.find params[:id]
  end

  def update
    classification = Classification.find params[:id]
    classification.update classification_params

    flash[:notice] = "Classification details updated."
  end

private
  def classification_params
    params.require(:classification).permit(:title)
  end
end
