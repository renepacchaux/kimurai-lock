class Resume < ApplicationCrawler
  @name = "resume"
  @start_urls = [
    "https://renepacchaux-com.webflow.io/",
    "https://renepacchaux-com.webflow.io/privacy",
    "https://renepacchaux-com.webflow.io/terms-and-conditions",
    "https://renepacchaux-com.webflow.io/search",
    "https://renepacchaux-com.webflow.io/resume",
    "https://renepacchaux-com.webflow.io/case-study",
    "https://renepacchaux-com.webflow.io/blog",
    "https://renepacchaux-com.webflow.io/designers/rene-m-paccha",

    # Util
    "https://renepacchaux-com.webflow.io/404",

    # project specific
    "https://renepacchaux-com.webflow.io/case-study/gudeeds-responsive-mobile-app",
    "https://renepacchaux-com.webflow.io/case-study/huntington-bank-pavilion",
    "https://renepacchaux-com.webflow.io/case-study/this-ux-design-portfolio",
    "https://renepacchaux-com.webflow.io/case-study/recipe-revolution",
    "https://renepacchaux-com.webflow.io/case-study/performing-arts-ux"

  ]
  @driver = :mechanize
  @config = {
    # headless_mode: :virtual_display,
  }

  def fetch_heading_and_save
    'resume'
  end


  def parse(response, url:, data: {})
    item = {}



    # item[:owner] = response.xpath("//h1//a[@rel='resume']").text
    item[:url] = url
    item[:main_heading] = response.xpath("//h1").text
    item[:secondary_heading] = response.xpath("//h2").text
    item[:page_title] = response.xpath("//title").text

    #item[:meta_description] = response.xpath("//meta[@name='description']/@content")

    # item[:h3] = response.xpath("//h3").each.map { |k,v| "> " + k.text }
    # item[:h4] = response.xpath("//h4").each.map { |k,v| "> " + k.text }
    # item[:h5] = response.xpath("//h5").each.map { |k,v| "> " + k.text }
    # item[:h6] = response.xpath("//h6").each.map { |k,v| "> " + k.text }

#    item[:pdf] = response.xpath("//nav/a").each.map { |k,v| ".pdf >" + k.text + '@' + k.attr("href") }


    save_to "results.json", item, format: :pretty_json

  end
end
