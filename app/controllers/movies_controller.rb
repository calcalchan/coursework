class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :request_contact]

  #For the index page, if the page for the specific category is
  #empty then it will just display all the movies that are created in
  #descending order(newest to oldest).
  def index

    if params[:category].blank?
      @movies = Movie.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @movies = Movie.where(:category_id => @category_id).order("created_at DESC")
    end

  end

  #For the show page, it will display all the reviews that are created in
  #descending order(newest to oldest). Also it will calculate the average
  #rating for the review to 2 d.p. If there isn't any review, then it will just
  #display 0 for the average.
  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2) #
    end

  end


  def new
    @movie = current_user.movies.build
    @categories = Category.order('name ASC').all.map{ |c| [c.name, c.id]}
  end


  def edit
    @categories = Category.order('name ASC').all.map{ |c| [c.name, c.id]}
  end

  #Method to create a movie.
  def create
    @movie = current_user.movies.build(movie_params)
    @movie.category_id = params[:category_id]

    respond_to do |format|

      if @movie.save
        format.html { redirect_to @movie, notice: t('movie.create') }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end

    end
  end


  def update
    @movie.category_id = params[:category_id]
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: t('movie.update') }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: t('movie.destroy') }
      format.json { head :no_content }
    end
  end


  #Matching the params in the search bar and display the corresponding movies.
  #Or else just display all the movies.
  def search

      if params[:search].present?
        @movies = Movie.search(params[:search])
      else
        @movies = Movie.all
      end
    end

  #This takes in 3 params and allows user to send email. If the email is blank,
  #it will flash an alert indicating it is unsucessful. Otherwise a notice will
  #be flashed to indicate the email was sent sucessfully.
  def request_contact
      name = params[:name]
      email = params[:email]
      message = params[:message]

      if email.blank?
        flash[:alert] = I18n.t('request_contact.no_email')

      else
        flash[:notice] = I18n.t('request_contact.email_sent')

    end
      redirect_to movies_path
  end


  private

    def set_movie
      @movie = Movie.find(params[:id])
    end


    def movie_params
      params.require(:movie).permit(:title, :category_id, :description, :movie_length, :director, :rating, :image)
    end
end
