class ExecutableGem < Thor::Group

  include Thor::Actions

  desc "generate an executable gem"

  argument :name

  attr_reader :author, :email, :description, :homepage

  def self.source_root
    File.dirname(__FILE__)
  end

  def get_details
    osuser = `whoami`.chomp
    @author = q("your name", osuser)
    @email = q("email", "#{@author}@gmail.com")
    @description = q("description", "#{name} description")
    @homepage = q("homepage", "http://github.com/#{@author}/#{name}")
  end

  def generate_folder
    directory "template", "#{name}"
  end

  def ruby_version
    "2.0.0"
  end

  def version
    "0.0.1"
  end

  def class_name
    name.split("-").map(&:capitalize).join("")
  end

  def chmod_on_scripts
    `chmod +x #{name}/bin/#{name}`
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
