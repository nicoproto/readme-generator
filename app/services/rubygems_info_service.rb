require 'open-uri'

class RubygemsInfoService < ApplicationService
  BASE_URL = 'https://rubygems.org/api/v1/search.json?query='

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def call
    return false if @name.empty?

    url = BASE_URL + @name
    data_serialized = URI.open(url).read
    data = JSON.parse(data_serialized)

    return false if data.length == 0

    return {
      name: data.first["name"],
      webesite: data.first["homepage_uri"],
      version: data.first["version"],
      repository_url: data.first["source_code_uri"],
      description: data.first["info"]
    }
  end
end
