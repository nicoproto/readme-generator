class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchensink ]

  def home; end

  def kitchensink
    @readme = Readme.new
  end
end
