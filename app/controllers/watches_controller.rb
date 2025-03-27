class WatchesController < ApplicationController

  before_action :set_watch, only: %i[destroy]

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
      format.html { redirect_to request.referer || root_path }
      if @watch.save
        flash.alert = "Successfully marked as seen"
      else
        flash.alert = "Save Unsuccessful"

        @watch.errors.each do |error|
          puts(attribute = error.attribute)
          puts(message = error.message)
        end
      end
    end
  end

  def destroy
    @watch.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Successfully marked as unseen' }
      format.json { head :no_content }
    end
  end

private
  def watch_params
    params.require(:watch).permit(:film_id, :person_id)
  end

  def set_watch
    @watch = Watch.find_by(film_id: params[:film_id], person_id: params[:person_id])
  end
end
