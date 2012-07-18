class AngularApp < Thor::Group
  include Thor::Actions
 
  desc "generate a really simple angular js app"

  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end
 
  def generate_folder
    directory "template", "#{name}"
  end
  
end

