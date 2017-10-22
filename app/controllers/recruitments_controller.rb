class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!

  def index
    @recruitments = Recruitment.all
  end

  def show
    if @recruitment.user_id != current_user.id
      @anser = Anser.anser_current_user(current_user.id, @recruitment.id)
    end
#binding.pry
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitments_params)
    @recruitment.user_id = current_user.id
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
    render :new if @recruitment.invalid?
  end

  private
    def recruitments_params
      params.require(:recruitment).permit(:title, :content, :concept, :deadline, :image_url, :map_url)
    end

    def set_recruitment
      @recruitment = Recruitment.find(params[:id])
    end
end
