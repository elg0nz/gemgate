module Gemgate
  class Repository
    attr_writer :realizer, :gem_files, :index

    def add_gem(path)
      gem = realizer.call(path)

      gem_files.add(gem)
      index.add(gem)
    end

    private

    def realizer
      @realizer || GemWrapper.public_method(:from_path)
    end

    def gem_files
      @gem_files ||= GemFiles.new.tap {|f| f.storage = storage }
    end

    def storage
      @storage ||= Storage::RiakCS.new
    end

    def index
      @index ||= Index.new.tap {|i| i.storage = storage }
    end
  end
end
