class Api::V1::PackagesController < Api::V1::BaseController
  def index
    @packages = NpmInfoService.call(params[:query])
    authorize policy_scope(Tool)
  end

  def show
    @package = NpmInfoService.call(params[:query]).first
    authorize Tool
  end
end
