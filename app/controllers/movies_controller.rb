class MoviesController < ApplicationController
  def index
    @q = Movie.ransack(params[:q])
    @q.sorts = 'rate desc'
    @movies = @q.result
  end
end
