require "KanjiReader/version"
require 'rexml/document'
require 'nkf'
require 'uri'
require 'faraday'
require 'nokogiri'

module KanjiReader
  class Client
    attr_accessor :application_id, :input, :hiragana, :roman, :kanji

    def initialize(application_id)
      @application_id = application_id
    end

    def perform(input)
      @input = input

      xml = conn.get(uri).body
      base_path = '//Result//WordList//Word'

      xml_doc  = Nokogiri::XML(xml).remove_namespaces!

      @kanji     = xml_doc.xpath(base_path + '//Surface').text
      @roman     = xml_doc.xpath(base_path + '//Roman').text
      @hiragana  = xml_doc.xpath(base_path + '//Furigana').text
    end

    def conn
      Faraday::Connection.new(url: uri) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Logger
        builder.use Faraday::Adapter::NetHttp
      end
    end

    def uri
      URI.escape "https://jlp.yahooapis.jp/FuriganaService/V1/furigana?appid=#{application_id}&sentence=#{input}"
    end

    def katakana
      NKF.nkf('-w --katakana', self.hiragana)
    end
  end
end
