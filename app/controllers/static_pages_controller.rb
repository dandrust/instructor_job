class StaticPagesController < ApplicationController
  def home
  end

  def instructor
    @role = 'instructor'
    render 'static_pages/index'
  end

  def admin
    @role = 'admin'
    render 'static_pages/index'
  end

end
