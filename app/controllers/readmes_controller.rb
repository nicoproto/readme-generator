class ReadmesController < ApplicationController
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
      params[:readme][:tools_names].each do |gem_name|
        next if gem_name.empty?
        tool = Tool.find_or_create_by(name: gem_name)
        ReadmeTool.create( readme: @readme, tool: tool)
      end

      redirect_to @readme
    else
      render :new
    end

  end

  private

  def readme_params
    params.require(:readme).permit(:staging_url, :production_url, :repository_url, :keys_required)
  end
end
