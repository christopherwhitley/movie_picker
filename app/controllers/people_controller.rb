# frozen_string_literal: true

class PeopleController < ApplicationController
  include Pagy::Backend

  before_action :set_person, only: %i[show edit update destroy watched_films render_unwatched_films]
  before_action :authorized, only: %i[show edit update destroy]
  before_action :authorize!, only: %i[show update edit destroy]
  # skip_before_action :authorized, only: [:new]

  def watched_films
    @linked_films = @person.get_watched_films
    respond_to do |format|
      format.html { render(:watched_films) }
    end
  end

  def render_unwatched_films
    @attributes = PersonPresenter.new(@person, search_params: params[:search]).attributes
    respond_to do |format|
      format.html { render(:show) }
    end
  end

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
    @person.id
    @attributes = PersonPresenter.new(@person).attributes

    @pagy, @films = pagy(@attributes[:unwatched_films], items: 32)
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit; end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html { redirect_to(@person, notice: 'Person was successfully created.') }
        flash.alert = 'Person updated'
        format.json { render(:show, status: :created, location: @person) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @person.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to(@person, notice: 'Person was successfully updated.') }
        format.json { render(:show, status: :ok, location: @person) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @person.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to(people_url, notice: 'Person was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  def authorize!
    @person = Person.find(params[:id])
    return unless @person != current_user

    flash[:error] = "You don't have access to this section."
    redirect_to('/')
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:username, :password, :salt, :encrypted_password, :email, :film_id, :search)
  end
end
