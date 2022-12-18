# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'uri'
require 'net/http'

# helper for incapsulate logic
module NewtonHelper
  def default_back
    '<?xml version="1.0" encoding="UTF-8"?>' \
      '<hash><errors>Server not responding</errors></hash>'
  end

  def xlst_stylesheet
    'some_transformer.xslt'
  end

  def add_xhtml_stylesheet(xml, path = xlst_stylesheet)
    # p path, "\n<?xml-stylesheet xmlns=\"http://www.w3.org/1999/xhtml\" type=\"text/xsl\" href=\"#{path}\"?>"
    xml.sub(/<\?xml .*\?>/m) do |match|
      match + "\n<?xml-stylesheet xmlns=\"http://www.w3.org/1999/xhtml\" type=\"text/xsl\" href=\"#{path}\"?>"
    end
  end

  def get_back_path(argument)
    "http://localhost:3000/id.xml?square=#{argument}"
  end

  def get_back_source(params)
    begin
      res = Net::HTTP.try(:get_response, URI(get_back_path(params[:square])))
    rescue Errno::ECONNREFUSED
      return default_back
    end
    res.is_a?(Net::HTTPSuccess) ? res.body : default_back
  end

  def transform_to_html(xml_source = default_back, xslt_path = "public/#{xlst_stylesheet}")
    doc = Nokogiri::XML(xml_source)
    xslt = Nokogiri::XSLT(File.read(xslt_path))
    xslt.transform(doc)
  end
end
