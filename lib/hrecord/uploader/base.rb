module HRecord
  module Uploader
    
    class Base
      def initialize
        
      end
      
      def self.storage_path(storage_path)
        $storage_path = storage_path
      end
    end
    
  end
end
