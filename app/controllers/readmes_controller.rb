class ReadmesController < ApplicationController
  def show
    @readme = Readme.find(params[:id])
    authorize @readme
  end

  def new
    @readme = Readme.new
    @readme.readme_tools.build
    authorize @readme
  end

  def create
    @readme = Readme.new(readme_params)
    @readme.user = current_user
    authorize @readme

    if @readme.save
      create_readme_tools
      redirect_to @readme
    else
      render :new
    end

  end

  private

  def readme_params
    params.require(:readme).permit(:staging_url, :production_url, :repository_url, :keys_required, :project_description)
  end

  def create_readme_tools
    params[:readme][:tools_names].each do |gem_name|
      next if gem_name.empty?
      tool = Tool.find_or_create_by(name: gem_name)
      ReadmeTool.create( readme: @readme, tool: tool)
    end
  end
end
