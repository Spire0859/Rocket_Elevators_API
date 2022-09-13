class PagesController < ApplicationController
  def home
  end
  def back
  end
  def residential
  end
  def commercial
  end
  def quote
  end
  def interventions
    if  warden.user.emp == true
      pages_interventions_path
    else
      main_app.root_path
    end
  end
  # def admin
  # end
end
