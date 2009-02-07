js_directory = nil

raise 'You must define where the javascripts directory lives' if js_directory.nil?

namespace :spec do
  desc 'Runs all the _spec.haml files under the spec/javascripts directory'
  task :js do
    `cd #{js_directory} && screen -d -m /opt/local/bin/serve`
    sleep 1
  
    specs = []
    Dir["#{js_directory}/**/*_spec.haml"].each do |spec|
      specs << "http://localhost:4000#{spec.sub(js_directory, '')}"
    end
    system "open -a Firefox #{specs * ' '}"
  end

  namespace :js do
    desc 'Kill the serve process'
    task :kill do
      list = `ps aux | grep '/opt/local/bin/serve' | grep ruby | grep -v grep`
      pid = list.split[1]
      `kill -9 #{pid}` if pid =~ /\d+/
    end
  end
end