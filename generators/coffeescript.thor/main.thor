class Coffeescript < Thor::Group
  include Thor::Actions
 
  desc "generate a new coffeescript project"

  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end
 
  def generate_folder
    directory "templates", "#{name}"
  end

  def chmod_on_scripts
    `chmod +x #{name}/scripts/compile_js`
    `chmod +x #{name}/scripts/create_js_lib`
    `chmod +x #{name}/scripts/watch_src`
    `chmod +x #{name}/scripts/watch_specs`
  end
  
end

