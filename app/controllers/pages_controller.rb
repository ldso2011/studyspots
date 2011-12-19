class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home, :contact, :privacy, :about], :create_user_profile

  def home
  end
  
  def administration
  end

  def contact
  end

  def privacy
  end

  def about
  end
  
   private
  def create_user_profile
    if Profile.find_by_user_id(current_user.id) == nil
      redirect_to users_profile_index_path
    end
  end
end
