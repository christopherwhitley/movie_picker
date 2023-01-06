class CustomListsController < ApplicationController
  before_action :authorized, only: %i[new show]
  before_action :set_custom_list, only: %i[show]

  def index
    @custom_list = CustomList.all
  end

  def show
    @custom_list.id
  end

  def new
    @custom_list = CustomList.new
    @films = Film.all
  end

  def create
    @custom_list = CustomList.new(custom_list_params)
    @custom_list.person_id = current_user.id
    respond_to do |format|
      if @custom_list.save!
        format.html { redirect_to(@custom_list, notice: 'Custom list was successfully created.') }
        flash.alert = 'Custom list updated'
        format.json { render(:show, status: :created, location: @custom_list) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @custom_list.errors, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    @custom_list = CustomList.find(params[:id])
    @custom_list.destroy
    respond_to do |format|
      format.html { redirect_to(custom_lists_path, notice: 'Custom list was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  def rand
    @custom_list = CustomList.find(params[:id])
    @film = @custom_list.films.order(Arel.sql('RANDOM()')).first
    respond_to do |format|
      format.html { redirect_to(@film) }
    end
  end

  private

  def set_custom_list
    @custom_list = CustomList.find(params[:id])
  end

  def custom_list_params
    params.require(:custom_list).permit(:name, :person_id, film_ids: [])
  end
end
