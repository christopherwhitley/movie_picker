class FilmsController < ApplicationController # rubocop:disable Metrics/ClassLength
  require 'i18n'
  require 'i18n_data'
  before_action :set_film, only: %i[show edit update destroy]
  before_action :authorized, only: %i[rand new show index]

  def rand
    @films = unwatched_films.where(genre_id: (params[:genre][:id])).order(Arel.sql('RANDOM()')).first
    respond_to do |format|
      if @films.nil?
        format.html { redirect_to(random_film_confirmation_path, notice: "Please select a genre containing films") }
      else
        format.html { redirect_to(@films) }
      end
    end
  end

  def wheel # rubocop:disable Metrics/AbcSize
    if params["custom_lists"]
      @films = CustomList.random_custom_list_films(params[:custom_lists][:id])
      respond_to do |format|
        if !@films.nil? && @films.length >= 8
          format.html { render('wheel.html.erb') }
        else
          format.html { redirect_to(random_film_confirmation_path, notice: "Please select a custom list containing at least 8 films") }
        end
      end
    else
      @films = unwatched_films.where(genre_id: (params[:genre][:id])).order(Arel.sql('RANDOM()'))
      respond_to do |format|
        if !@films.nil? && @films.length >= 8
          format.html { render('wheel.html.erb') }
        else
          format.html { redirect_to(random_film_confirmation_path, notice: "Please select a genre containing at least 8 films") }
        end
      end
    end
  end


  def randomconfirm
    respond_to do |format|
      format.html { render('random_film_confirmation.html.erb') }
    end
  end

  def unwatched_films
    Film.all.where.not(id: Watch.pluck(:film_id))
  end

  # GET /films or /films.json
  def index
    @films = Film.all
  end
  helper_method :index

  # GET /films/1 or /films/1.json
  def show
    @film_details = fetch_movie_details(@film.external_id)
    @film_presenter = FilmPresenter.new(@film_details)
    @filmname = @film.title
    @person = current_user
    @watched = @film.film_watched?(current_user.id)
    respond_to do |format|
      format.json { render @film }
      format.html { render :show }
    end
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit; end

  # POST /films or /films.json
  def create # rubocop:disable Metrics/AbcSize
    @film = Film.new(film_params)
    lang = I18nData.language_code(params[:film][:language])
    results = get_movie(params[:film_id], lang)
    @film.title = results[0]
    @film.poster_path = results[1]
    @film.description = results[2]
    @film.release_date = results[3]
    @film.language = lang
    @film.external_id = params[:film_id]
    respond_to do |format|
      if @film.save
        format.html { add_film_to_person(@film.id) }
        # format.json { render :show, status: :created, location: @film }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @film.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /films/1 or /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to(@film, notice: "Film was successfully updated.") }
        format.json { render(:show, status: :ok, location: @film) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @film.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /films/1 or /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      # format.html { remove_film_id_from_person(@film.id) }
      format.html { @film.destroy }
      format.html { render(:show) }
      format.json { head(:no_content) }
    end
  end

  def multiple_film_results
    # Add logic to process film form results
    respond_to do |format|
      @film_title = params[:film][:title]
      @film_language = params[:film][:language]
      @film_genre_id = params[:film][:genre_id]
      response = Film.get_film_confirmation(@film_title, @film_language)
      @film_confirmation_presenter = FilmConfirmationPresenter.new(response)
      format.html { render('confirmation') }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_film
    @film = Film.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def film_params
    params.require(:film).permit(:title, :description, :genre_id, :language, :external_id)
  end
end
