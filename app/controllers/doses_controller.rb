class DosesController < ApplicationController

def new
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new
end

def create
  @cocktail = Cocktail.find(params[:cocktail_id])
  @ingredient = Ingredient.find(dose_params["ingredient"].to_i)
  @dose = Dose.new({description:dose_params['description'], ingredient:@ingredient, cocktail:@cocktail})
  @dose.cocktail = @cocktail
  if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render :new
  end
end

def destroy

@dose = Dose.find(params[:id])
@dose.delete

end

private
 def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
