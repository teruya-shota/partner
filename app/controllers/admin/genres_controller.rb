class Admin::GenresController < ApplicationController
  before_action :authenticate_admin

  def index
  @genres = Genre.all
  @genre = Genre.new
  end

  def edit
  @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
    # 一覧画面へリダイレクト
    redirect_to '/admin/genres'
    else
    @genres = Genre.all
    render :index
    end
  end

private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def current_admin
  Admin.find_by(params[:admin_id])
  end

  def login_required
   redirect_to top_plans_path unless current_admin
  end

end
