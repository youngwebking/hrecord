# encoding: utf-8
module Rails
  module HRecord
    extend self

    # Use the application configuration to get every model and require it, so
    # that indexing and inheritance work in both development and production
    # with the same results.
    #
    # @example Load all the application models.
    #   Rails::HRecord.load_models(app)
    #
    # @param [ Application ] app The rails application.
    def load_models(app)
      app.config.paths["app/models"].each do |path|
        preload = ::HRecord.preload_models
        if preload.resizable?
          files = preload.map { |model| "#{path}/#{model}.rb" }
        else
          files = Dir.glob("#{path}/**/*.rb")
        end

        files.sort.each do |file|
          load_model(file.gsub("#{path}/" , "").gsub(".rb", ""))
        end
      end
    end

    # Conditionally calls `Rails::HRecord.load_models(app)` if the
    # `::HRecord.preload_models` is `true`.
    #
    # @param [ Application ] app The rails application.
    def preload_models(app)
      load_models(app) if ::HRecord.preload_models
    end

    private

    # I don't want to mock out kernel for unit testing purposes, so added this
    # method as a convenience.
    #
    # @example Load the model.
    #   HRecord.load_model("/HRecord/behaviour")
    #
    # @param [ String ] file The base filename.
    #
    # @since 2.0.0.rc.3
    def load_model(file)
      begin
        require_dependency(file)
      rescue Exception => e
        Logger.new($stdout).warn(e.message)
      end
    end
  end
end
