require 'byebug'

class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.create(
      description: params[:dose][:description],
      cocktail: @cocktail,
      ingredient_id: params[:dose][:ingredient_id]
    )
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
