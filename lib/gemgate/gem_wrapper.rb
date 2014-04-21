require 'rubygems/package'

module Gemgate
  class GemWrapper
    def self.from_path(path)
      new.tap do |gem_wrapper|
        gem_wrapper.spec = Gem::Package.new(File.open(path)).spec
        gem_wrapper.path = path
      end
    end

    attr_accessor :spec, :path

    def filename
      spec.file_name
    end

    def spec_filename
      spec.spec_name
    end

    def name
      spec.name
    end

    def version
      spec.version
    end

    def prerelease?
      spec.version.prerelease?
    end

    def platform
      platform = spec.original_platform
      platform = Gem::Platform::RUBY if platform.nil? or platform.empty?
      platform
    end

    def data
      File.open(path)
    end
  end
end
