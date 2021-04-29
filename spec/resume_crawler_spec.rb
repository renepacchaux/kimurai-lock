require 'resume'

describe ResumeCrawler do
  it 'finds a primary heading' do
    resume_crawler = ResumeCrawler.new

    returned_string = resume_crawler.fetch_heading_and_save('resume')

    expect(returned_string).to eq 'resume'
  end
end
