# frozen_string_literal: true

require 'rails_helper'
require 'mocha'

# Specs in this file have access to a helper object that includes
# the NewtonHelper. For example:
#
# describe NewtonHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe NewtonHelper do
  describe 'default xlst stylesheet' do
    it 'default value' do
      expect(helper.xlst_stylesheet).to eq 'some_transformer.xslt'
    end
  end

  describe 'add xhtml stylesheet' do
    it 'usual path' do
      expect(helper.add_xhtml_stylesheet('<?xml something="true"?>')).to match "href=\"#{helper.xlst_stylesheet}\""
    end

    it 'unusual path' do
      expect(helper.add_xhtml_stylesheet('<?xml something="true"?>',
                                         'lol.xslt')).to match 'href="lol.xslt"'
    end
  end

  describe 'get back path' do
    it 'just argument' do
      expect(helper.get_back_path('smth')).to eq 'http://localhost:3000/id.xml?square=smth'
    end
  end

  describe 'get back source' do
    it 'no connection' do
      allow(helper).to receive(:get_back_path).and_return('http://localhost:3002')
      expect(helper.get_back_source({ square: 'smth' })).to eq helper.default_back
    end
  end

  describe 'transform_to_html' do
    let(:offline_response) do
      "<html><body>\n" \
        "<p id=\"error\"> Error! Server not responding</p>\n" \
        "<a href=\"/\"> Back </a>\n" \
        "</body></html>\n"
    end

    it 'stubbing' do
      allow(helper).to receive(:get_back_path).and_return('http://localhost:3002')
      expect(helper.get_back_path('')).to eq 'http://localhost:3002'
    end

    it 'no connection transform' do
      allow(helper).to receive(:get_back_path).and_return('http://localhost:3002')
      expect(helper.transform_to_html(helper.default_back).to_html).to eq offline_response
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
