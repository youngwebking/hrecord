module HRecord
  module Uploader
      
  end
  
  require File.join(File.dirname(__FILE__), "uploader", "base")
  require File.join(File.dirname(__FILE__), "uploader", "cache")
  require File.join(File.dirname(__FILE__), "uploader", "configurations")
  require File.join(File.dirname(__FILE__), "uploader", "store")
  require File.join(File.dirname(__FILE__), "uploader", "processing")
  require File.join(File.dirname(__FILE__), "uploader", "remove")
end
