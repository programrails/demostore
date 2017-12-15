class ResetController < ApplicationController

  include SeedData

  def regenerate
    if user_signed_in?
      sign_out
    end

    seed_data

      redirect_to root_url, notice: 'Восстановлено первоначальное наполнение сайта данными.' 
    
  end  
end
