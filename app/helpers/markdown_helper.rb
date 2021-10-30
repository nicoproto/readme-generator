module MarkdownHelper
  def format_readme(readme)
    markdown = []
      markdown << build_header("Readme & Documentation")
      markdown << build_img(readme.banner.service_url)

      markdown << build_title_with_link("Staging Url", readme.staging_url)
      markdown << build_title_with_link("Production Url", readme.production_url)
      markdown << build_title_with_link("Repository Url", readme.repository_url)

      markdown << build_header("DB Schema")
      markdown << build_img(readme.db_schema.service_url, 650)

      markdown << build_header("Gems")
      readme.tools.gems.each do |gem|
        markdown << build_link_with_desc(gem.name, gem.repository_url, gem.description)
      end

      markdown << build_header("Packages")
      readme.tools.packages.each do |gem|
        markdown << build_link_with_desc(gem.name, gem.repository_url, gem.description)
      end

      markdown.join("\n")
  end

  private

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

  def build_header(title)
    "# #{title}"
  end
end