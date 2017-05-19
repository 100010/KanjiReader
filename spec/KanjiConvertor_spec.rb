require "spec_helper"

YOUR_APPLICATION_ID = ENV['YOUR_APPLICATION_ID']

RSpec.describe KanjiReader do
  it "has a version number" do
    expect(KanjiReader::VERSION).not_to be nil
  end

  it "README example works well" do
    str = KanjiReader::Perform.new(YOUR_APPLICATION_ID, "翻車魚")
    expect(str.kanji).to eq('翻車魚')
    expect(str.roman).to eq('manbou')
    expect(str.hiragana).to eq('まんぼう')
    expect(str.katakana).to eq('マンボウ')
  end
end
