require "spec_helper"
require "mp3info"

describe LitchiFm do
  it "say hi" do
    expect(LitchiFm.hi).to eql 'Hello world!'
  end
end


describe LitchiFm::Downloader do
  it 'can download mp3 files' do
    downloader = LitchiFm::Downloader.new(File.join('spec', 'test-data', 'download.yaml'))
    result = downloader.start

    expect(result[:failures]).to be_empty

    result[:successes].each do |_url, file_name|
      Mp3Info.open(file_name) do |mp3|
        expect(mp3.tag.title).to be_truthy
        expect(mp3.tag.artist).to be_truthy
        expect(mp3.tag.album).to be_truthy
      end
    end

  end
end
