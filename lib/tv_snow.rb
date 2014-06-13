require "tv_snow/version"

module TvSnow
  class Compiler
    # Compile the site -- Heavily inspired by Jekyll and Octopress!
    def compile
      # Define directory names
      deploy_dir = "_deploy/"
      css_dir = "css"
      js_dir = "js"
      img_dir = "img"

      # Make sure all of our destinations exist!
      check_or_create(deploy_dir)
      check_or_create(deploy_dir + css_dir)
      check_or_create(deploy_dir + js_dir)
      check_or_create(deploy_dir + img_dir)

      # Copy all markup to be deployed, compile if necessary
      compile("slimrb", "slim", ".", deploy_dir)
      compile("haml", "haml", ".", deploy_dir)
      copy_files("html", "", deploy_dir)

      # Copy all stylesheets, compile if necessary
      compile("sass", "scss", css_dir, deploy_dir + css_dir)
      copy_files("css", css_dir, deploy_dir)

      # Copy Javascript, compile if necessary
      #compile("coffee -o ") TODO: Fix this
      copy_files("js", js_dir, deploy_dir)

      # Copy all images
      copy_files("*", img_dir, deploy_dir)
    end

    # A fairly trivial method that creates a directory if it does not already exist
    def check_or_create(dir)
      if not File.directory?(dir)
        puts "Creating #{ dir }..."
        Dir.mkdir(dir)
      end
    end

    # Runs a given command, compiling all of the given file types and outputting
    # the result into a given destination
    def compile(command, ext, source_dir, dest_dir)
      Dir.glob("#{ source_dir }/*.#{ ext }") do |file|
        new_file_name = File.basename(file)[0..-(ext.length + 2)]
        puts "Compiling #{ file } to #{ new_file_name }..."
        system "#{ command } #{ file } > #{ dest_dir }/#{ new_file_name }"
      end
    end

    # Simply runs 'cp'. It operates file-by-file instead of recursively because I 
    # like printing individual files (it looks cool)
    def copy_files(ext, source_dir, dest_dir)
      Dir.glob("#{ source_dir }/*.#{ ext }") do |file|
        puts "Copying #{ file }..."
        command = "cp #{ file } #{ dest_dir }/#{ file }"
        system command
      end
    end
  end
end
