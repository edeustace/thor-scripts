class NodeApp < Thor::Group
  include Thor::Actions
 
  desc "generate a new node webapp directory ready to be pushed to heroku"

  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end
 
  def generate_folder
    directory "template", "#{name}"
  end
  
end

