class ExpressJadeNodeApp < Thor::Group
  include Thor::Actions
 
  desc "generate a new express, jade node webapp with an angular skeleton"

  argument :name

  attr_reader :author 


  def self.source_root
    File.dirname(__FILE__)
  end

  def get_details
    osuser = `whoami`.chomp
    @author = q("your name", osuser)
  end
 
  def generate_folder
    directory "template", "#{name}"
  end

   def chmod_on_scripts
    `chmod +x #{name}/bin/run`
  end

  private
  def q(question, default)
    response = ask("#{question}? [#{default}]")

    if response.nil? || response.empty?
      default
    else
      response
    end
  end
  
end