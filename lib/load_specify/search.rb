require 'find'
require 'pry'

module LoadSpecify
  class Search

    def initialize(file_path)
      @file_path = file_path
      @arr_file_path_split = @file_path.split("/")
      @str_absolute_path = Gem.path.last 
      @str_absolute_path += "/gems"
      find_absolute_path
    end

    private

    def find_gem_version
      Dir.chdir(@str_absolute_path)
      arr_list_specify = Dir.glob("#{@str_absolute_path}/#{@arr_file_path_split[0]}*") 
      arr_list_versions = [] 

      arr_list_specify.each do |gem|
        arr_list_versions << gem.split('-').last
      end

      return arr_list_versions.sort.last
    end

    public

    def find_absolute_path
      str_last_gem = find_gem_version
      str_file_absolute_path = ""

      unless str_last_gem.nil?
        @str_absolute_path += "/#{@arr_file_path_split[0]}-#{str_last_gem}"
        Find.find(@str_absolute_path) do |path|
          if path =~ /#{@arr_file_path_split.last}/
            str_file_absolute_path = path
          end
        end
        load str_file_absolute_path unless str_file_absolute_path.empty?
      else
        puts "Gem is not install"
      end
    end

  end
end
