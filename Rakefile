# frozen_string_literal: true

require 'rake/testtask'
require 'rspec/core/rake_task'

desc 'Run all RSpec tasks'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = './lab[5-7]/**/*_spec.rb' # './lab[5-7/]**/*_spec.rb'
end

Rake::TestTask.new(:test) do |t|
  t.pattern = './lab[5-7]/**/test_*.rb'
end

desc 'Run tests'

task default: %i[spec test]
