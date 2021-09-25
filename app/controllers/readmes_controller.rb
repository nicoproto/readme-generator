class ReadmesController < ApplicationController
  def new
    @readme = Readme.new
    authorize @readme
  end
end
