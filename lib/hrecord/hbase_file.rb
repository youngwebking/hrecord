module HRecord
  class HBaseFile < HRecord::Base
  
    def initialize(uploaded_file, row_key=nil, cf='attr')
      if row_key.nil?
        row_key = SecureRandom.uuid
      end
      
      @hfile = HBaseFile.create({
        'row_key'          => row_key,
        cf+':data'         => uploaded_file.read,
        cf+':extension'    => File.extname(uploaded_file.open),
        cf+':content_type' => uploaded_file.content_type.chomp})
      return row_key
    end
    
  end
  
end
