class ReadmesController < ApplicationController
  def new
    @readme = Readme.new
    @readme.readme_tools.build
    authorize @readme
  end

  def create
    raise
  end
end
