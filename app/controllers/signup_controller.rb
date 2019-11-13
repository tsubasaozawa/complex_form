class SignupController < ApplicationController
  def step1
    @user = User.new
  end
  
  def step2
    @card = Card.new
    session[:user_params_after_step1] = user_params
  end

  def create
    @user = User.new(session[:user_params_after_step1])
    if @user.save
      card_info = card_params.merge({user_id: @user.id})
      @card = Card.new(card_info)
      if @card.save
        redirect_to cards_path
      else
        render '/signup/step1'
      end
    else
      render '/signup/step1'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name
    )
  end

  def card_params
    params.require(:card).permit(
      :user_id,
      :number
    )
  end
end