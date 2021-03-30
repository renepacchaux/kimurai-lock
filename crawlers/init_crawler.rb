class InitCrawler < ApplicationCrawler
  @name = "init_crawler"
  @start_urls = ["https://www.renepacchaux.com"]
  @driver = :selenium_chrome
  @config = {
    headless_mode: :virtual_display,


  }

  def parse(response, url:, data: {})
    item = {}

    target = "BODY[1]/DIV[2]/DIV[7]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/A[1]/H6[1]".downcase
    target_prefix = "//"

    # item[:owner] = response.xpath("//h1//a[@rel='resume']").text
    item[:main_heading] = response.xpath("//h1").text
    item[:secondary_heading] = response.xpath("//h2").text
    item[:h3] = response.xpath("//h3").each.map { |k,v| "> " + k.text }
    item[:h4] = response.xpath("//h4").each.map { |k,v| "> " + k.text }
    item[:h5] = response.xpath("//h5").each.map { |k,v| "> " + k.text }
    item[:h6] = response.xpath("//h6").each.map { |k,v| "> " + k.text }

    item[:missing_pdf] = response.xpath("//nav/a").each.map { |k,v| ".pdf >" + k.text + '@' + k.attr("href") }




    save_to "results.json", item, format: :pretty_json

  end
end
