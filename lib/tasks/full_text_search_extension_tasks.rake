namespace :radiant do
  namespace :extensions do
    namespace :full_text_search do
      
      desc "Runs the migration of the Full Text Search extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          FullTextSearchExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          FullTextSearchExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Full Text Search to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from FullTextSearchExtension"
        Dir[FullTextSearchExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(FullTextSearchExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
