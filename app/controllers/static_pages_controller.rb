class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @lessons = current_user.lessons.build
      @feed_items = current_user.feed.paginate page: params[:page], per_page: 10
    end
  end
  
  def about
  end
end
