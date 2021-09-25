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


    data.map do |gem|
      {
        name: gem["name"],
        webesite: gem["homepage_uri"],
        version: gem["version"],
        repository_url: gem["source_code_uri"],
        description: gem["info"]
      }
    end
  end
end
