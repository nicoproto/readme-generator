module MarkdownHelper
  def format_readme(readme)
    @markdown = []
    @headers_array = []
    @readme = readme

    build_banner
    build_status
    build_db_schema
    build_commands_to_run
    build_external_resources

    @markdown << build_header("Contribution Steps")
    @markdown << @readme.contribution_steps.body

    @markdown << build_header("Pre-requisites")
    @markdown << @readme.prerequisites.body

    build_acknowledgements

    @markdown.insert(3, build_index)

    @markdown.join("\n")
  end

  private

  def build_banner
    @markdown << build_img(@readme.banner.service_url)
    @markdown << build_header("Readme & Documentation", true)
    @markdown << @readme.project_description.body
  end

  def build_status
    @markdown << build_header("Build Status")

    @markdown << build_title_with_link("Staging Url", @readme.staging_url)
    @markdown << build_title_with_link("Production Url", @readme.production_url)
    @markdown << build_title_with_link("Repository Url", @readme.repository_url)
  end

  def build_db_schema
    @markdown << build_header("DB Schema")
    @markdown << build_img(@readme.db_schema.service_url, 650)
  end

  def build_commands_to_run
    @markdown << build_header("Commands to run")
    @markdown << "```\n" + @readme.commands_to_run + "\n```"
  end

  def build_external_resources
    @markdown << build_header("Gems")
    @readme.tools.gems.each do |gem|
      @markdown << build_link_with_desc(gem.name, gem.repository_url, gem.description)
    end

    @markdown << build_header("Packages")
    @readme.tools.packages.each do |gem|
      @markdown << build_link_with_desc(gem.name, gem.repository_url, gem.description)
    end
  end

  def build_acknowledgements
    @markdown << build_header("Acknowledgements")
    @markdown << "Readme generated with the help of [MangoTree Dev Agency](https://www.mangotree.dev/)"
  end

  def build_img(url, size = 400)
    "<p align='center'>
  <img width='#{size}' alt='image' src='#{url}'>
</p>
"
  end

  def build_link_with_desc(title, url, description = "")
    link = "- [#{title}](#{url})"
    desc = description.present? ? ": #{description}" : ""
    link + desc
  end

  def build_title_with_link(title, url)
    "- #{title}: [#{url}](#{url})"
  end

  def build_header(title, center = false)
    @headers_array << title
    id = title.downcase.gsub(' ', '-')
    if center
      "<h1 align='center' id=#{id}>
  #{title}
</h1>
"
    else
      "# #{title}"
    end
  end

  def build_index
    formatted_headers = @headers_array.each_with_index.map do |header, index|
      "#{index}. [#{header}](##{header.downcase.gsub(' ', '-')})"
    end

    formatted_headers.unshift('## Table of Contents
')
    formatted_headers.join("\n")
  end
end