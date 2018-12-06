class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_movie


  def new
    @review = Review.new
  end


  def edit
  end

  #A method to create a review and taking the review params. It also associates the current review id to the
  #current user and movie.
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id

    respond_to do |format|
      #If the review is saved, it redirects to the movie page and shows the notice.
      if @review.save
        format.html { redirect_to @movie, notice: t('review.create') }
        format.json { render :show, status: :created, location: @review }
      #If the review is not saved, it refreshes the create review page.
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  #A method to update the review
  def update
    respond_to do |format|
      #If the params are filled in and valid, it redirects to the review page and shows the notice
      if @review.update(review_params)
        format.html { redirect_to @review, notice: t('review.update') }
        format.json { render :show, status: :ok, location: @review }
      #If it doesnt update then it refreshes the edit review page
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  #A method to destroy a review
  def destroy
    @review.destroy
    respond_to do |format|
      #If destroyed, it display the notice.
      format.html { redirect_to reviews_url, notice: t('review.destroy') }
      format.json { head :no_content }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    #Using strong params for the review
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
