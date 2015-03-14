class ArtsController < ApplicationController
  before_action :find_art, only: [:show, :edit, :update, :destroy, :upvote]
  def index
    @arts = Art.all.order("created_at DESC")
  end

  def new
    @art = current_user.arts.build
  end

  def create
    @art = current_user.arts.build art_params
    if @art.save
      redirect_to arts_path @art, notice: "successfully create new Art"
    else
      render 'new'
    end
  end

  def edit
  end

  def show

  end

  def update
    if @art.update art_params
      redirect_to @art, notice: "Art was successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @art.destroy
    redirect_to root_path
  end

  def upvote
    @art.upvote_by current_user
    redirect_to :back
  end

  private

  def art_params
    params.require(:art).permit(:title, :description, :image)
  end

  def find_art
    @art = Art.find params[:id]
  end
end
