require 'bundler'
require 'rake'
require 'rake/testtask'


Bundler::GemHelper.install_tasks

task :default => :test

task :test => %w(test:units)
namespace :test do
  desc "run unit tests"
  Rake::TestTask.new(:units) do |test|
    test.libs << 'lib' << 'test'
    test.test_files = FileList["test/unit/*_test.rb", "test/unit/*/*_test.rb"]
  end
end