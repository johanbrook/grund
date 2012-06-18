require 'open-uri'

module Grund
  class Generator
    
    PACKAGE_NAME = "grund.zip"
    BUNDLE_NAME = "grund"
  
    def initialize(args)
      @url = 'https://github.com/johanbrook/grund.css/zipball/master'
      @command = args.first
    end
  
    def run
      if @command == "install"  
        get_zip @url
      else
        help
      end
    end
    
    def help
      puts <<-h

  GRUND. A SCSS foundation for Compass. 
  I use this as a starting point for new projects.

  Usage:

    \x1B[0;1m grund install \x1B[0m

  Download the latest Grund files and put them in the current directory.

    \x1B[0;1m compass compile \x1B[0m

  Compiles the master file (master.scss) into CSS with Compass (http://compass-style.org).

  Explore the file structure and make it your own. Pure SCSS stuff like 
  variables and mixins should be put in '_settings.scss' and 'lib/_mixins.scss'.

  Main site styles go in '_main.scss' and in other imported files.
  Includes Necolas' Normalize reset (https://github.com/necolas/normalize.css)

  --
  Project:  https://github.com/johanbrook/grund
  Author:   Johan Brook (http://johanbrook.com)
  h
    end
    
    def clean
      system "rm -rf #{PACKAGE_NAME}"
      system "rm -rf johanbrook-grund*"
    end
    
    private 
    
    def status(msg)
      puts "\x1B[0;1m#{msg}\x1B[0m"
    end
    
    def log(msg)
      puts "\x1B[0;32m#{msg}\x1B[0m"
    end
    
    def directory_already_exist?
      File.directory?(BUNDLE_NAME)
    end
    
    def get_zip(url)
      
      open(PACKAGE_NAME, 'wb') do |fo|
        status "Downloading grund package from #{url}..."
        fo.print open(url).read
        status "Unpackaging ..."
        system "unzip -o -q #{PACKAGE_NAME}"

        system "cp -R johanbrook-grund*/ ."
        log "Done!\n\x1B[0mBegin with checking out the stylesheet structure and set things up.\nType 'grund help' for more info.\n"
        clean
      end
      
    end
  
  end
end