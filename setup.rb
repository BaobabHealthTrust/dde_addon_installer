#!/usr/bin/env ruby
require "fileutils"

def usage
  puts "\nUsage:\n\t#{__FILE__} PATH ACTION\n\twhere:\n\t\tPATH: is a {valid folder}\n\t\tACTION: is either {install | uninstall}\n\n"
end

def install(root)

  print "Checking target destination folder structure if valid RAILS Application ..."
  
  if !File.exists?("#{root}/lib")
    puts "\nCreating folder '#{root}/lib' ..."
    
    Dir.mkdir("#{root}/lib")
  end
  
  if !File.exists?("#{root}/app")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  if !File.exists?("#{root}/config")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  if !File.exists?("#{root}/app/views")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  if !File.exists?("#{root}/app/models")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  if !File.exists?("#{root}/app/controllers")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  puts " OK"
  
  puts "Starting installation ..."
  
  copies = [
      "app/views/layouts/ts.html.erb",
      "app/views/dde/edit_demographics.html.erb",
      "app/views/dde/edit_patient.html.erb",
      "app/views/dde/index.html.erb",
      "app/views/dde/new_patient.html.erb",
      "app/views/dde/patient_not_found.html.erb",
      "app/views/dde/process_result.html.erb",
      "app/views/dde/process_scan_data.html.erb",
      "app/views/dde/search.html.erb",
      "app/controllers/dde_controller.rb",
      "config/dde_connection.yml.example",
      "lib/dde.rb"
    ]
  
  if !File.exists?("#{root}/app/views/dde")
    print "Creating folder #{root}/app/views/dde ..."
    
    Dir.mkdir("#{root}/app/views/dde")
    
    puts " OK"
  end
  
  copies.each do |file|
  
    if !File.exists?("#{root}/#{file}")
      print "Copying '#{file}' to '#{root}/#{file}' ..."
    
      FileUtils.copy("#{file}", "#{root}/#{file}")
    
      puts " OK"
    end
    
  end

  if (File.open("#{root}/app/models/encounter.rb", "r").read.match(/ajax\_log/).nil? rescue false)
  
    puts "Replacing encounter after_save event ..."
  
    update_encounters_model("app/models/encounter.rb", "#{root}/app/models/encounter.rb")
    
    puts "Replacement result ... OK"
    
  end

  modify_routes(root)

  puts "Installation DONE!"
  
end

def update_encounters_model(src, dst)
  
  g = false

  if File.exists?("#{src}") and File.exists?("#{dst}")
    
    pattern = (dst).match(/(.+)\.(.*)+$/)
    
    if pattern.nil?
      puts "Expected to find a file with an extension but found '#{dst}'"
      
      exit
    end
    
    destination = pattern[1] + ".backup." + pattern[2]

    File.rename(dst, destination)

    output = File.open(dst, "w")

    result = ""

    File.open("#{destination}", "r").each do |line| 
          
        if line.match(/def\safter_save/) 
          g = true 
          
          puts "Replacing ..."
        end
        
        puts line if g
        
        if !g
          result = result + line
        end
        
        if g and line.match(/end/)
          g = false 
          
          replacement = File.open("#{src}", "r").read
          
          result = result + replacement
          # break
        end
        
    end
    
    output.write(result)
    
    output.close
    
  end
end

def modify_routes(root)
  
  if !File.exists?("#{root}/config/routes.backup.rb") and File.exists?("config/routes.rb")
  
    puts "Renaming original routes file ..."
    
    File.rename("#{root}/config/routes.rb", "#{root}/config/routes.backup.rb")
    
    output = File.open("#{root}/config/routes.rb", "w")
    
    inserted = false
    
    filters = {
      "map.clinic" => true,
      "map.process_result" => true,
      "map.process_data" => true,
      "map.search" => true,
      "map.new_patient" => true,
      "map.ajax_process_data" => true,
      "map.process_confirmation" => true,
      "map.patient_not_found" => true,
      "map.ajax_search" => true
    }
    
    string = ""
    
    File.open("#{root}/config/routes.backup.rb", "r").each do |line|
  
      base = line.strip.match(/^([^\s]+)/)[1] rescue nil
    
      # puts "Checking line '#{line}' for '#{base}' ..."
    
      if base.nil? or (!base.nil? and !filters[base.strip]) 
      
        if !inserted and line.strip.match(/^end$/)
        
          puts "Inserting custom block ..."
        
          input = File.open("config/routes.rb", "r").read
          
          string = string + input
        
          inserted = true
        
        end
      
        string = string + line
      
      else
      
        if !inserted
        
          puts "Inserting custom block ..."
        
          input = File.open("config/routes.rb", "r").read
          
          string = string + input
        
          inserted = true
        
        end
      
        string = string + " # " + line
      
      end
    
    end
    
    output.write(string)
    
    output.close
  
  end
  
  return false
  
end

def restore_encounter_model(root)
  if File.exists?("#{root}/app/models/encounter.rb") and File.exists?("#{root}/app/models/encounter.backup.rb")
  
    FileUtils.rm_f("#{root}/app/models/encounter.rb")
    
    File.rename("#{root}/app/models/encounter.backup.rb", "#{root}/app/models/encounter.rb")
  
    return true
  else
    
    puts "Encounter.rb model or it's backup file does not exist!"
    
    return false
  end
end

def restore_routes(root)
  if File.exists?("#{root}/config/routes.rb") and File.exists?("#{root}/config/routes.backup.rb")
  
    FileUtils.rm_f("#{root}/config/routes.rb")
    
    File.rename("#{root}/config/routes.backup.rb", "#{root}/config/routes.rb")
  
    return true
  else
    
    puts "File #{root}/config/routes.rb or it's backup file does not exist!"
    
    return false
  end
end

def uninstall(root)

  print "Checking target destination folder structure if valid RAILS Application ..."
  
  if !File.exists?("#{root}/lib")
    puts "\nCreating folder '#{root}/lib' ..."
    
    Dir.mkdir("#{root}/lib")
  end
  
  if !File.exists?("#{root}/app")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  if !File.exists?("#{root}/config")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  if !File.exists?("#{root}/app/views")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  if !File.exists?("#{root}/app/models")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  if !File.exists?("#{root}/app/controllers")
    puts "\nTarget folder does not seem to be a valid RAILS Application Folder"
    
    exit
  end
  
  puts " OK"
  
  puts "Starting removal ..."
  
  copies = [
      "app/views/layouts/ts.html.erb",
      "app/views/dde/edit_demographics.html.erb",
      "app/views/dde/edit_patient.html.erb",
      "app/views/dde/index.html.erb",
      "app/views/dde/new_patient.html.erb",
      "app/views/dde/patient_not_found.html.erb",
      "app/views/dde/process_result.html.erb",
      "app/views/dde/process_scan_data.html.erb",
      "app/views/dde/search.html.erb",
      "app/controllers/dde_controller.rb",
      "config/dde_connection.yml.example",
      "lib/dde.rb"
    ]
  
  if File.exists?("#{root}/app/views/dde")
    print "Deleting folder #{root}/app/views/dde ..."
    
    FileUtils.rm_rf("#{root}/app/views/dde")
    
    puts " OK"
  end
  
  copies.each do |file|
  
    if File.exists?("#{root}/#{file}")
      print "Deleting '#{root}/#{file}' ..."
    
      FileUtils.rm_f("#{root}/#{file}")
    
      puts " OK"
    end
    
  end

  if File.exists?("#{root}/app/models/encounter.backup.rb")
    puts "Restoring encounter.rb model ..."
    
    result = restore_encounter_model(root)
    
    puts "Encounter restoration result is ... OK" if result
  end

  if File.exists?("#{root}/config/routes.backup.rb")
    puts "Restoring routes.rb file ..."
    
    restore_routes(root)

    puts "Routes restoration result is ... OK" if result
  end
  puts "Removal DONE!"
  
end

if ARGV.length < 2 or (ARGV[1].downcase != "install" and ARGV[1].downcase != "uninstall") or !File.exists?(ARGV[0])
  usage
  exit
end

case ARGV[1].downcase
  when "install"
    install(ARGV[0].strip.gsub(/\/$/, ""))
  when "uninstall"
    uninstall(ARGV[0].strip.gsub(/\/$/, ""))
end
