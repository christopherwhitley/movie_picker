class WatchesController < ApplicationController

  def new
    @watch = Watch.new
  end

  def create
  @watch = Watch.new(watch_params)

  respond_to do |format|
  if @watch.save
    format.html { redirect_to '/' }
    flash.alert = "Save success"
  else
    format.html { redirect_to current_user }
    flash.alert = "Save Unsuccessful"

    @watch.errors.each do |error|
      puts attribute = error.attribute
      puts message = error.message
end


  end
end


end

private
  def watch_params
    params.require(:watch).permit(:watched_film_id, :watched_person_id, :watched)
  end
end
