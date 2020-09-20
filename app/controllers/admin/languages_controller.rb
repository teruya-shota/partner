class Admin::LanguagesController < ApplicationController
  before_action :authenticate_admin

  def index
  @languages = Language.all
  @language = Language.new
  end

  def edit
  @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(parmas[:id])
    if @language.update(language_params)
      redirect to admin_languages_path
    else
      render :edit
    end
  end

  def create
    @language = Language.new(language_params)
    if @language.save
    redirect to '/admin/languages'
	else
	@languages = Language.all
	render :index
	end

  private

  def language_params
    params.require(:genre).permit(:area, :usage)
  end

  def current_admin
  Admin.find_by(params[:admin_id])
  end

  def login_required
   redirect_to top_plans_path unless current_admin
  end

end
