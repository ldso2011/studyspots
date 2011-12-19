class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home, :contact, :privacy, :about]
  before_filter :create_user_profile!

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
  
  protected
  def create_user_profile!
    if !!current_user
      if Profile.find_by_user_id(current_user.id) == nil
        redirect_to users_profile_index_path
      end
    end
  end
end
