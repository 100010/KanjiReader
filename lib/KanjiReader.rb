require "KanjiReader/version"
require 'rexml/document'
require 'nkf'
require 'uri'
require 'faraday'
require 'nokogiri'

module KanjiReader
  class Perform

    attr_accessor :application_id, :uri, :kanji, :hiragana, :grade, :roma

    def initialize(application_id, kanji, options={})
      @application_id = application_id

      @uri = URI.escape "https://jlp.yahooapis.jp/FuriganaService/V1/furigana?appid=#{application_id}&sentence=#{kanji}"

      conn = Faraday::Connection.new(:url => uri) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Logger
        builder.use Faraday::Adapter::NetHttp
      end

      xml = conn.get(uri).body
      base_path = '//Result//WordList//Word'

      xml_doc  = Nokogiri::XML(xml).remove_namespaces!

      @kanji     = xml_doc.xpath(base_path + '//Surface').text
      @hiragana  = xml_doc.xpath(base_path + '//Furigana').text
      @roma      = xml_doc.xpath(base_path + '//Roman').text
    end

    def katakana
      NKF.nkf('-w --katakana', self.hiragana)
    end
  end
end
