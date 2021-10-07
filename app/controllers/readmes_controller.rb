class ReadmesController < ApplicationController
  def show
    @readme = Readme.find(params[:id])
    authorize @readme

    tools = @readme.tools
    @gems = tools.select {|tool| tool.category == 'gem' }
    @packages = tools.select {|tool| tool.category == 'package' }
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

  def edit
    @readme = Readme.find(params[:id])
    authorize @readme
  end

  private

  def readme_params
    params.require(:readme).permit(
      :staging_url,
      :production_url,
      :repository_url,
      :keys_required,
      :project_description,
      :banner,
      :db_schema
    )
  end

  def create_readme_tools
    params[:readme][:gem_names].each do |gem_name|
      next if gem_name.empty?
      tool = Tool.find_or_create_by(name: gem_name) do |tool|
        tool.category = "gem"
      end
      ReadmeTool.create( readme: @readme, tool: tool)
    end

    params[:readme][:package_names].each do |gem_name|
      next if gem_name.empty?
      tool = Tool.find_or_create_by(name: gem_name) do |tool|
        tool.category = "package"
      end
      ReadmeTool.create( readme: @readme, tool: tool)
    end
  end
end
