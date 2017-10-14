class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: [:edit, :update, :destroy]

  def index
    @recruitments = Recruitment.all
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitments_params)
    if @recruitment.save
      redirect_to recruitments_path, notice: "募集しました"
    else
      render 'new'
    end
  end

  def edit
    #@recruitment = Recruitment.find(params[:id])
  end

  def update
    #@recruitment = Recruitment.find(params[:id])

    if @recruitment.update(recruitments_params)
      redirect_to recruitments_path, notice: "募集を更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    #@recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to recruitments_path, notice: "募集を削除しました！"
  end

  def confirm
    @recruitment = Recruitment.new(recruitments_params)
  end

  private
    def recruitments_params
      params.require(:recruitment).permit(:title, :content, :concept, :deadline, :image_url, :map_url)
    end

    def set_recruitment
      @recruitment = Recruitment.find(params[:id])
    end
end
