class AnsersController < ApplicationController
  before_action :set_anser, only: [:edit, :update, :destroy]
  before_action :set_recruitment, only: [:index, :new]

  def index
    @ansers = @recruitment.ansers
  end

  def new
    @anser = @recruitment.ansers.build
  end

  def create
    @anser = current_user.ansers.build(anser_params)

    if @anser.save
      redirect_to recruitment_path(@anser.recruitment_id), notice: "応募しました！"
    else
      #redirect_to root_path
      render :new
    end
  end

  def edit
    @recruitment = @anser.recruitment
  end
    
  def update
    if @anser.update(anser_params)
      redirect_to recruitment_path(@anser.recruitment), notice: "応募内容を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @anser.destroy
    redirect_to recruitment_path(@anser.recruitment), notice: "応募内容を削除しました"
  end

  def adopt_on_off
    @anser = Anser.find(params[:anser][:anser_id])
    respond_to do |format|
      if  @anser.update(anser_on_off_params)
        @recruitment =Recruitment.find(@anser.recruitment_id)
        format.js { render :adopt_on_off }
      end
    end
  end


  private
    # ストロングパラメーター
    def anser_params
      params.require(:anser).permit(:recruitment_id, :anser, :comment)
    end
    def anser_on_off_params
      params.require(:anser).permit(:adopt)
    end

    def set_anser
      @anser = Anser.find(params[:id])
    end

    def set_recruitment
      @recruitment = Recruitment.find(params[:recruitment_id])
    end

end
