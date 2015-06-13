module HRecord
  module Uploader
    module Store
      include HRecord::Uploader::Configurations
      
      def filename
        @filename
      end

      def store_path(for_file=filename)
        File.join([store_dir, full_filename(for_file)].compact)
      end

      def store!(new_file=nil)
        cache!(new_file) if new_file && ((@cache_id != parent_cache_id) || @cache_id.nil?)
        if !cache_only and @file and @cache_id
          with_callbacks(:store, new_file) do
            new_file = storage.store!(@file)
            if delete_tmp_file_after_storage
              @file.delete unless move_to_store
              cache_storage.delete_dir!(cache_path(nil))
            end
            @file = new_file
            @cache_id = nil
          end
        end
      end

      def retrieve_from_store!(identifier)
        with_callbacks(:retrieve_from_store, identifier) do
          @file = storage.retrieve!(identifier)
        end
      end

    private

      def full_filename(for_file)
        for_file
      end

      def storage
        @storage ||= self.class.storage.new(self)
      end

    end
  end
end
