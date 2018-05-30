class PracticeController < ApplicationController
  def index
    @name = params[:name]
  end

  def about
    @color = params[:color]
  end
end
# one of the controllers jobs is to set up instance variables for the view to use.
# Now go to the about view (about.html) and set it up with the @color instance variable.
#
# This is how it shows up in brower path:
# /about?color=red
