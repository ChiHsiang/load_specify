require 'find'

module LoadSpecify
  class Search

    def initialize(file_path)
      @file_path = file_path
      @arr_file_path_split = @file_path.split("/")
      find_absolute_path
    end

    private

    def find_gem_version
      arr_list_specify = Dir.glob("#{@arr_file_path_split[0]}*") 
      arr_list_versions = [] 

      arr_list_specify.each do |gem|
        arr_list_versions << gem.split('-').last
      end

      return arr_list_versions.sort.last
    end

    public

    def find_absolute_path
      str_last_gem = find_gem_version
      unless str_last_gem.empty?
        str_absolute_path = "#{ENV["HOME"]}/.rbenv/versions/"
        str_absolute_path += "#{ENV['RBENV_VERSION']}/lib/ruby/gems/#{RUBY_VERSION}/gems/"
        str_absolute_path += "#{@arr_file_path_split[0]}-#{str_last_gem}"

        Find.find(str_absolute_path) do |path|
          if path =~ /#{@arr_file_path_split.last}/
            str_file_absolute_path = path
          end
        end

        return str_file_absoulte_path
      else
        puts "Gem is not install"
      end
    end

  end
end
