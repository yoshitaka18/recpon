class AnsersController < ApplicationController
  def index
    @recruitment = Recruitment.find(params[:recruitment_id])
    @ansers = @recruitment.ansers
  end

  def new
    #@anser = Anser.new
    #@anser = @recruitment.ansers.build
#    @anser = current_user.ansers.build
    @recruitment = Recruitment.find(params[:recruitment_id])
    @anser = @recruitment.ansers.build
  end

  def create
#    @recruitment = Recruitment.find(params[:recruitment_id])
    @anser = current_user.ansers.build(anser_params)
#    @anser = @recruitment.ansers.build

    if @anser.save
      redirect_to recruitments_path, notice: "応募しました！"
    else
      render 'new'
    end
  end

  def edit
    @anser = Anser.find(params[:id])
    @recruitment = @anser.recruitment
  end
    
  def update
    @anser = Anser.find(params[:id])
    if @anser.update(anser_params)
      redirect_to recruitment_path(@anser.recruitment), notice: "応募内容を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @anser = Anser.find(params[:id])
    @anser.destroy
    redirect_to recruitment_path(@anser.recruitment), notice: "応募内容を削除しました"
  end

  private
    # ストロングパラメーター
    def anser_params
      params.require(:anser).permit(:recruitment_id, :anser, :comment)
    end

end
