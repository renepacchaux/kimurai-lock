class ResumeCrawler < ApplicationCrawler
  @name = "resume_crawler"
  @start_urls = ["https://renepacchaux-com.webflow.io/resume"]
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
    # item[:h3] = response.xpath("//h3").each.map { |k,v| "> " + k.text }
    # item[:h4] = response.xpath("//h4").each.map { |k,v| "> " + k.text }
    # item[:h5] = response.xpath("//h5").each.map { |k,v| "> " + k.text }
    # item[:h6] = response.xpath("//h6").each.map { |k,v| "> " + k.text }

#    item[:pdf] = response.xpath("//nav/a").each.map { |k,v| ".pdf >" + k.text + '@' + k.attr("href") }




    save_to "results.json", item, format: :pretty_json

  end
end
