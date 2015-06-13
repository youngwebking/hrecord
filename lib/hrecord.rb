module HRecord
  VERSION = File.read(File.join(File.dirname(__FILE__), "..", "VERSION")).chomp.freeze
end

require 'securerandom'

require File.join(File.dirname(__FILE__), "hrecord", "base")
require File.join(File.dirname(__FILE__), "hrecord", "formatter")
require File.join(File.dirname(__FILE__), "hrecord", "connection")
require File.join(File.dirname(__FILE__), "hrecord", "hbase_file")
