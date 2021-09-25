class Api::V1::GemsController < Api::V1::BaseController
  def index
    @gems = RubygemsInfoService.call(params[:query])
    authorize policy_scope(Tool)
  end

  def show
    @gem = RubygemsInfoService.call(params[:query]).first
    authorize Tool
  end
end