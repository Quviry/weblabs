# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'debug'
gem 'minitest'
gem 'minitest-rg'
gem 'rake'
gem 'rubocop'
gem 'ruby-lsp', '~> 0.3.2', group: :development
gem 'simplecov', require: false, group: :test
