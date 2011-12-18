class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home, :contact, :privacy, :about]

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
end
