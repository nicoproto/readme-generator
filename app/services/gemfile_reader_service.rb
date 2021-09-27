require 'open-uri'

class GemfileReaderService < ApplicationService
  BASE_URL = 'https://api.github.com/repos/'
  END_URL = '/contents/Gemfile'
  FILTERED_GEMS = ['puma', 'sass-rails', 'webpacker', 'turbolinks', 'jbuilder', 'redis', 'bcrypt', 'image_processing', 'bootsnap', 'pry-byebug', 'pry-rails', 'web-console', 'listen', 'tzinfo-data', 'spring', 'byebug', 'rack-mini-profiler', 'autoprefixer-rails']

  attr_reader :repository_url

  def initialize(repository_url)
    @repository_url = repository_url
  end

  def call
    # TODO: Refactor this
    return false if @repository_url.empty?

    filtered_url = @repository_url.partition('github.com/').last.gsub('.git', '')

    begin
      url = BASE_URL + filtered_url + END_URL
      data_serialized = URI.open(url).read
      data = JSON.parse(data_serialized)
    rescue
      return { error: 404, message: "Repository not found" }
    end

    gemfile_content = Base64.decode64(data['content'])

    temp_gemfile = Tempfile.new("test_temp")
    temp_gemfile.write(gemfile_content)
    IO.read temp_gemfile.path
    temp_gemfile.rewind
    IO.read temp_gemfile.path

    bundled_gemfile = Bundler::Definition.build('Gemfile', temp_gemfile, nil)

    ruby_version = bundled_gemfile.locked_ruby_version.gem_version.to_s

    dependencies = bundled_gemfile.dependencies.map do |gem|
      {
        name: gem.name,
        version_requirements: gem.requirements_list,
      }
    end

    raise

    dependencies.reject {|gem| FILTERED_GEMS.include?(gem[:name]) }
  end
end
