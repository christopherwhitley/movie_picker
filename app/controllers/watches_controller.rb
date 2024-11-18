class WatchesController < ApplicationController

  before_action :set_film, only: %i[destroy]

  def index
    @watches = Watch.all
  end
  helper_method :index

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)

    respond_to do |format|
      if @watch.save
        format.html { redirect_to request.referer || root_path }
        flash.alert = "Save success"
      else
        format.html { redirect_to request.referer || root_path }
        flash.alert = "Save Unsuccessful"

        @watch.errors.each do |error|
          puts(attribute = error.attribute)
          puts(message = error.message)
        end
      end
    end
  end

  # DELETE /films/1 or /films/1.json
  def destroy
    @watch.destroy
    respond_to do |format|
      # format.html { remove_film_id_from_person(@film.id) }
      format.html { @watch.destroy }
      format.html { render(:show) }
      format.json { head(:no_content) }
    end
  end

private
  def watch_params
    params.require(:watch).permit(:film_id, :person_id)
  end

  def set_film
    @watch = Watch.find(params[:id])
  end
end
