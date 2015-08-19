require "load_specify/version"
require "load_specify/search"

module LoadSpecify
  def self.loading(file_path)
    LoadSpecify::Search.new(file_path)
  end
end
