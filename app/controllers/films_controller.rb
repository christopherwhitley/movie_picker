class FilmsController < ApplicationController
  before_action :set_film, only: %i[ show edit update destroy]
  before_action :authorized, only: %i[ new show index]

  def rand
    @film = Film.order(Arel.sql('RANDOM()')).first
    respond_to do |format|
      format.html { redirect_to @film }
    end
  end
  # GET /films or /films.json
  def index
    @films = Film.all
  end
  helper_method :index

  # GET /films/1 or /films/1.json
  def show
    @filmname = @film.title
    api_call(@film.title)
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end


  # POST /films or /films.json
  def create
    @film = Film.new(film_params)
    respond_to do |format|

      if @film.save
        format.html { add_film_to_person(@film.id) }
        #format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1 or /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: "Film was successfully updated." }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1 or /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { remove_film_id_from_person(@film.id) }
      format.html { render :show }
      format.json { head :no_content }
    end
  end

  def multiple_film_results
    #Add logic to process film form results
    respond_to do |format|
      @film_title = params[:film][:title]
      @film_description = params[:film][:description]
      @film_genre_id = params[:film][:genre_id]
      @response = Film.get_film_confirmation(@film_title)
      format.html { render 'confirmation.html' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def film_params
      params.require(:film).permit(:title, :description, :genre_id)
    end


end
