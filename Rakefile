# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "rtf_rails"
  gem.homepage = "http://github.com/monsterlabs/rtf_rails"
  gem.has_rdoc = false
  gem.extra_rdoc_files = ["README.rdoc"]
  gem.license = "MIT"
  gem.summary = %Q{Integrates RTF gem into Rails in a natural way}
  gem.description = %Q{Rtf::Rails provides a simple way of creating RTF views in Rails 3 using the rtf library.}
  gem.email = "alex@monsterlabs.com.mx"
  gem.authors = ["Alejandro Juarez Robles"]
  gem.add_dependency('rails', '>=3.0.0')
  gem.add_dependency('rtf', '~> 0.3.3')
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end


task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rtf_rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
