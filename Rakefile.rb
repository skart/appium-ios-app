$LOAD_PATH << './ios_automation/lib'
require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

#defining the device information for rake to use
    $device = ENV['DEVICE'] || 'iphone_7'
    CONFIG = YAML::load(open(File.join(File.dirname(__FILE__),'lib/hardware.yml')))[$device]
    	$device_type = CONFIG["deviceType"]
    	$ios = CONFIG["ios"]

#get the current date
now = Time.now
$todays_date = now.strftime('%F')

##iPhone Rake Tasks
RSpec::Core::RakeTask.new(:iphone_gm) do |t|
  
  t.pattern = 'spec/iphone/**/*.rb'
  t.rspec_opts = "--tag iphone_gm_p1 --tag iphone_gm_p2 --tag iphone_gm_p3"
  t.rspec_opts << " --format html --out test_results/iphone_gm/#{$todays_date}_iphone#{$ios}_gm_full.html"
end

RSpec::Core::RakeTask.new(:iphone_gm_p1) do |t|
  
  t.pattern = 'spec/iphone/**/*.rb'
  t.rspec_opts = "--tag iphone_gm_p1"
  t.rspec_opts << " --format html --out test_results/iphone_gm/#{$todays_date}_iphone#{$ios}_gm_p1.html"
end

RSpec::Core::RakeTask.new(:iphone_gm_p2) do |t|
  
  t.pattern = 'spec/iphone/**/*.rb'
  t.rspec_opts = "--tag iphone_gm_p2"
  t.rspec_opts << " --format html --out test_results/iphone_gm/#{$todays_date}_iphone#{$ios}_gm_p2.html"
end

RSpec::Core::RakeTask.new(:iphone_gm_p3) do |t|
  
  t.pattern = 'spec/iphone/**/*.rb'
  t.rspec_opts = "--tag iphone_gm_p3"
  t.rspec_opts << " --format html --out test_results/iphone_gm/#{$todays_date}_iphone#{$ios}_gm_p3.html"
end

RSpec::Core::RakeTask.new(:iphone_smoke) do |t|
  
  t.pattern = 'spec/iphone/**/*.rb'
  t.rspec_opts = "--tag iphone_smoke"
  t.rspec_opts << " --format html --out test_results/iphone_smoke/#{$todays_date}_iphone#{$ios}_smoke.html"
end


