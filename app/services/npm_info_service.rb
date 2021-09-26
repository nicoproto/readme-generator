require 'open-uri'

class NpmInfoService < ApplicationService
  BASE_URL = 'https://api.npms.io/v2/search?q='

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def call
    return false if @name.empty?

    url = BASE_URL + @name
    data_serialized = URI.open(url).read
    data = JSON.parse(data_serialized)

    return false if data["results"].length == 0

    data["results"].map do |result|
      package_data = result["package"]
      {
        name: package_data["name"],
        website_url: package_data["links"]["homepage"],
        version: package_data["version"],
        repository_url: package_data["links"]["repository"],
        description: package_data["description"]
      }
    end
  end
end
